use alloc::collections::BTreeMap;
use alloc::format;
use alloc::string::String;
use alloc::vec;
use alloc::vec::Vec;

use crate::{Attribute, Const, Error, NamedAttr, OpInfos, Operation, Scalar, Trait, Type};

use super::emit::{Emitter, Section};
use super::entity::{Enc, Entities, Kind, Piece};
use super::{MAGIC, Mask, Prop, PropKind, VERSION};
use crate::{BlockId, Ir, OpId, RegionId, ValueId};

/// Where an op's properties come from
enum Props<'o, 'a> {
    /// The op stores none: its inherent attributes sit with the others
    None,
    /// A registered op's, in its bytecode order, by name
    Native(&'static [Prop], BTreeMap<&'o str, &'o NamedAttr<'a>>),
    /// An unregistered op's: one attribute, if the text gave `<{...}>`
    Opaque(Option<usize>),
}

/// The strings section: each string once, numbered as first written
#[derive(Default)]
struct Strings {
    list: Vec<String>,
    index: BTreeMap<String, usize>,
}

impl Strings {
    fn insert(&mut self, s: &str) -> u64 {
        if let Some(i) = self.index.get(s) {
            return *i as u64;
        }
        self.list.push(String::from(s));
        self.index.insert(String::from(s), self.list.len() - 1);
        self.list.len() as u64 - 1
    }

    fn write(&self, e: &mut Emitter) {
        e.var(self.list.len() as u64);
        for s in self.list.iter().rev() {
            e.var(s.len() as u64 + 1);
        }
        for s in &self.list {
            e.cstr(s.as_bytes());
        }
    }
}

struct OpName {
    name: String,
    dialect: usize,
    registered: bool,
    refs: u32,
}

/// An op on the isolation stack of `computeGlobalNumberingState`
struct Open {
    op: OpId,
    unresolved: bool,
}

/// Numbers everything a module refers to the way `IRNumberingState` does, then writes it the way
/// `BytecodeWriter` does
pub struct Writer<'o, 'a> {
    ir: Ir<'o, 'a>,
    ents: Entities,
    // Per op
    pre: Vec<u64>,
    isolated: Vec<Option<bool>>,
    parent_region: Vec<Option<RegionId>>,
    name: Vec<usize>,
    loc: Vec<usize>,
    dict: Vec<Option<usize>>,
    props: Vec<Props<'o, 'a>>,
    /// The attributes among the properties, in bytecode order
    prop_ents: Vec<Vec<usize>>,
    known: Vec<bool>,
    // Per value
    ty: Vec<usize>,
    value_region: Vec<Option<RegionId>>,
    value_id: Vec<u64>,
    arg_loc: Vec<usize>,
    uses: Vec<Vec<u64>>,
    // Per block and region
    block_index: Vec<u64>,
    region_counts: Vec<(u64, u64)>,
    // Numbering
    dialects: Vec<String>,
    names: Vec<OpName>,
    name_order: Vec<usize>,
    name_number: Vec<u64>,
    seen: Vec<bool>,
    refs: Vec<u32>,
    ent_dialect: Vec<usize>,
    attrs: Vec<usize>,
    types: Vec<usize>,
    number: Vec<u64>,
    next_value: u64,
    unknown: usize,
    // Writing
    strings: Strings,
    props_table: Vec<Vec<u8>>,
    props_index: BTreeMap<Vec<u8>, usize>,
}

impl<'o, 'a> Writer<'o, 'a> {
    /// A use's id: its owner's pre-order number above its operand number
    const USE_OWNER_SHIFT: u32 = 32;
    /// `groupByDialectPerByte` sorts within the indices of each varint length, up to nine bytes
    const VARINT_LENGTHS: u32 = 9;
    const VARINT_BITS: u32 = 7;
    /// `writeSparseArray` writes densely past this last index
    const SPARSE_LAST: usize = 256;
    const UNKNOWN: &'static str = "unknown";

    pub fn new(root: &'o Operation<'a>, infos: &OpInfos) -> Result<Self, Error> {
        let ir = Ir::new(root)?;
        let (ops, values, blocks, regions) = ir.counts();
        let mut w = Writer {
            ir,
            ents: Entities::default(),
            pre: vec![0; ops],
            isolated: vec![None; ops],
            parent_region: vec![None; ops],
            name: vec![0; ops],
            loc: vec![0; ops],
            dict: vec![None; ops],
            props: (0..ops).map(|_| Props::None).collect(),
            prop_ents: vec![Vec::new(); ops],
            known: vec![false; ops],
            ty: vec![0; values],
            value_region: vec![None; values],
            value_id: vec![0; values],
            arg_loc: vec![0; values],
            uses: vec![Vec::new(); values],
            block_index: vec![0; blocks],
            region_counts: vec![(0, 0); regions],
            dialects: Vec::new(),
            names: Vec::new(),
            name_order: Vec::new(),
            name_number: Vec::new(),
            seen: Vec::new(),
            refs: Vec::new(),
            ent_dialect: Vec::new(),
            attrs: Vec::new(),
            types: Vec::new(),
            number: Vec::new(),
            next_value: 0,
            unknown: 0,
            strings: Strings::default(),
            props_table: Vec::new(),
            props_index: BTreeMap::new(),
        };
        w.unknown = w.ents.loc(Self::UNKNOWN)?;
        let root = w.ir.root;
        w.walk(root, None, infos, &mut Vec::new(), &mut 0)?;
        let mut placeholders = vec![Vec::new(); values];
        let mut defined = vec![false; values];
        w.parse(root, &mut placeholders, &mut defined);
        w.number_all(root)?;
        Ok(w)
    }

    // Pre-order numbers, isolation, and each op's attributes

    fn walk(&mut self, op: OpId, region: Option<RegionId>, infos: &OpInfos, stack: &mut Vec<Open>, next: &mut u64) -> Result<(), Error> {
        let i = op.0 as usize;
        self.pre[i] = *next;
        *next += 1;
        self.parent_region[i] = region;
        if stack.last().is_some_and(|t| t.unresolved) {
            for v in self.ir[op].operands.clone() {
                let r = self.value_region[v.0 as usize];
                if r == region {
                    continue;
                }
                let container = r.map(|r| self.ir[r].parent);
                let at = stack.iter().rposition(|s| !s.unresolved || Some(s.op) == container).ok_or_else(|| Error(String::from("bytecode: a value used outside the ops around it")))?;
                let unresolved = stack[at].unresolved;
                for s in &mut stack[at + 1..] {
                    s.unresolved = unresolved;
                    self.isolated[s.op.0 as usize] = Some(false);
                }
            }
        }
        let node = &self.ir[op];
        let (o, name) = (node.op, node.name);
        let info = infos.op_info(name);
        if info.is_some_and(|i| i.has(Trait::IsIsolatedFromAbove)) {
            self.isolated[i] = Some(true);
        }
        let dialect = name.split_once('.').map_or(name, |(d, _)| d);
        self.known[i] = Self::registered(name).is_some() && infos.knows_dialect(dialect);
        self.attributes(op, o)?;
        for r in self.ir[op].results.clone() {
            self.value_region[r.0 as usize] = region;
            self.ty[r.0 as usize] = self.ents.ty(&self.ir[r].ty)?;
        }
        let node = &self.ir[op];
        let regions = node.regions.clone();
        if !regions.is_empty() {
            stack.push(Open { op, unresolved: self.isolated[i].is_none() });
        }
        for r in regions {
            for (k, b) in self.ir[r].blocks.clone().into_iter().enumerate() {
                self.block_index[b.0 as usize] = k as u64;
                for (a, v) in self.ir[b].args.clone().into_iter().enumerate() {
                    self.value_region[v.0 as usize] = Some(r);
                    self.ty[v.0 as usize] = self.ents.ty(&self.ir[v].ty)?;
                    let loc = o.regions[self.region_position(op, r)].blocks[k].args[a].loc.as_deref().unwrap_or(Self::UNKNOWN);
                    self.arg_loc[v.0 as usize] = self.ents.loc(Self::loc_body(loc))?;
                }
                for c in self.ir[b].ops.clone() {
                    self.walk(c, Some(r), infos, stack, next)?;
                }
            }
        }
        if !self.ir[op].regions.is_empty() {
            stack.pop();
            self.isolated[i].get_or_insert(true);
        }
        Ok(())
    }

    /// Whether MLIR registers op `name`, and if so the properties it stores natively, if any
    pub fn registered(name: &str) -> Option<Option<&'static [Prop]>> {
        let table = super::props::PROPS;
        table.binary_search_by(|(n, _)| (*n).cmp(name)).ok().map(|k| table[k].1)
    }

    fn region_position(&self, op: OpId, r: RegionId) -> usize {
        self.ir[op].regions.iter().position(|x| *x == r).expect("a region of the op")
    }

    /// `loc(...)` or what is inside it
    fn loc_body(text: &str) -> &str {
        let t = text.trim();
        t.strip_prefix("loc(").and_then(|t| t.strip_suffix(')')).unwrap_or(t)
    }

    fn attributes(&mut self, op: OpId, o: &'o Operation<'a>) -> Result<(), Error> {
        let i = op.0 as usize;
        let table = if self.known[i] { Self::registered(&o.name).flatten() } else { None };
        let given: Vec<&'o NamedAttr<'a>> = match &o.properties {
            Some(Attribute::Dict(p)) => p.iter().collect(),
            _ => Vec::new(),
        };
        let mut discardable: Vec<&'o NamedAttr<'a>> = o.attributes.iter().collect();
        self.props[i] = match table {
            Some(t) => {
                let given: BTreeMap<&'o str, &'o NamedAttr<'a>> = given.into_iter().map(|n| (&*n.name, n)).collect();
                for p in t.iter().filter(|p| matches!(p.kind, PropKind::Attr | PropKind::OptAttr)) {
                    if let Some(n) = given.get(p.name) {
                        let e = self.ents.attr(n.value.as_ref().unwrap_or(&Attribute::Unit))?;
                        self.prop_ents[i].push(e);
                    }
                }
                Props::Native(t, given)
            }
            None if self.known[i] => {
                discardable.extend(given);
                Props::None
            }
            None => Props::Opaque(match &o.properties {
                Some(p) => Some(self.ents.attr(p)?),
                None => None,
            }),
        };
        if !discardable.is_empty() {
            let mut named = Vec::new();
            for n in discardable {
                named.push((Self::unquote(&n.name)?, n.value.as_ref()));
            }
            self.dict[i] = Some(self.ents.dict(named)?);
        }
        self.loc[i] = self.ents.loc(Self::loc_body(o.loc.as_deref().unwrap_or(Self::UNKNOWN)))?;
        Ok(())
    }

    fn unquote(s: &str) -> Result<String, Error> {
        match s.strip_prefix('"').and_then(|s| s.strip_suffix('"')) {
            Some(lit) => Attribute::Str { lit: lit.into(), ty: None }.text(),
            None => Ok(String::from(s)),
        }
    }

    // Use lists, as the parser leaves them

    /// Replays the parser: an op is made once its regions are parsed, each operand's use going to
    /// the front of its value's list; a use before its value is defined goes to a placeholder whose
    /// uses move over, one by one to the front, once the value is
    fn parse(&mut self, op: OpId, placeholders: &mut Vec<Vec<u64>>, defined: &mut Vec<bool>) {
        for r in self.ir[op].regions.clone() {
            for b in self.ir[r].blocks.clone() {
                for a in self.ir[b].args.clone() {
                    self.define(a, placeholders, defined);
                }
                for c in self.ir[b].ops.clone() {
                    self.parse(c, placeholders, defined);
                }
            }
        }
        let owner = self.pre[op.0 as usize] << Self::USE_OWNER_SHIFT;
        for (k, v) in self.ir[op].operands.clone().into_iter().enumerate() {
            let id = owner | k as u64;
            if defined[v.0 as usize] {
                self.uses[v.0 as usize].push(id);
            } else {
                placeholders[v.0 as usize].push(id);
            }
        }
        for r in self.ir[op].results.clone() {
            self.define(r, placeholders, defined);
        }
    }

    fn define(&mut self, v: ValueId, placeholders: &mut [Vec<u64>], defined: &mut [bool]) {
        let i = v.0 as usize;
        defined[i] = true;
        let moved: Vec<u64> = core::mem::take(&mut placeholders[i]).into_iter().rev().collect();
        let mut list = moved;
        list.extend(core::mem::take(&mut self.uses[i]));
        self.uses[i] = list;
    }

    // Numbering

    fn number_all(&mut self, root: OpId) -> Result<(), Error> {
        self.number_op(root);
        let mut work: Vec<(RegionId, u64)> = Vec::new();
        self.push_regions(root, &mut work);
        while let Some((r, start)) = work.pop() {
            self.next_value = start;
            self.number_region(r);
            for b in self.ir[r].blocks.clone() {
                for o in self.ir[b].ops.clone() {
                    self.push_regions(o, &mut work);
                }
            }
        }
        self.number = vec![0; self.ents.list.len()];
        for kind in [Kind::Attr, Kind::Type] {
            let mut list = core::mem::take(if kind == Kind::Attr { &mut self.attrs } else { &mut self.types });
            list.sort_by(|a, b| self.refs[*b].cmp(&self.refs[*a]));
            Self::group_by_dialect(&mut list, |e| self.ent_dialect[e]);
            for (k, e) in list.iter().enumerate() {
                self.number[*e] = k as u64;
            }
            *(if kind == Kind::Attr { &mut self.attrs } else { &mut self.types }) = list;
        }
        let mut order: Vec<usize> = (0..self.names.len()).collect();
        order.sort_by(|a, b| self.names[*b].refs.cmp(&self.names[*a].refs));
        Self::group_by_dialect(&mut order, |n| self.names[n].dialect);
        self.name_number = vec![0; self.names.len()];
        for (k, n) in order.iter().enumerate() {
            self.name_number[*n] = k as u64;
        }
        self.name_order = order;
        Ok(())
    }

    fn push_regions(&self, op: OpId, work: &mut Vec<(RegionId, u64)>) {
        let first = if self.isolated[op.0 as usize] == Some(true) { 0 } else { self.next_value };
        for r in &self.ir[op].regions {
            work.push((*r, first));
        }
    }

    fn number_region(&mut self, r: RegionId) {
        let blocks = self.ir[r].blocks.clone();
        if blocks.is_empty() {
            return;
        }
        let first = self.next_value;
        for b in &blocks {
            for a in self.ir[*b].args.clone() {
                self.value_id[a.0 as usize] = self.next_value;
                self.next_value += 1;
                self.number_ent(self.arg_loc[a.0 as usize]);
                self.number_ent(self.ty[a.0 as usize]);
            }
            for o in self.ir[*b].ops.clone() {
                self.number_op(o);
            }
        }
        self.region_counts[r.0 as usize] = (blocks.len() as u64, self.next_value - first);
    }

    fn number_op(&mut self, op: OpId) {
        let i = op.0 as usize;
        let name = self.ir[op].name;
        self.name[i] = self.number_name(name, self.known[i]);
        for r in self.ir[op].results.clone() {
            self.value_id[r.0 as usize] = self.next_value;
            self.next_value += 1;
            self.number_ent(self.ty[r.0 as usize]);
        }
        if let Some(d) = self.dict[i] {
            self.number_ent(d);
        }
        for e in self.prop_ents[i].clone() {
            self.number_ent(e);
        }
        if let Props::Opaque(Some(e)) = self.props[i] {
            self.number_ent(e);
        }
        self.number_ent(self.loc[i]);
    }

    fn number_dialect(&mut self, d: &str) -> usize {
        match self.dialects.iter().position(|x| x == d) {
            Some(k) => k,
            None => {
                self.dialects.push(String::from(d));
                self.dialects.len() - 1
            }
        }
    }

    fn number_name(&mut self, name: &str, known: bool) -> usize {
        if let Some(k) = self.names.iter().position(|n| n.name == name) {
            self.names[k].refs += 1;
            return k;
        }
        let dialect = self.number_dialect(name.split_once('.').map_or(name, |(d, _)| d));
        self.names.push(OpName { name: String::from(name), dialect, registered: known, refs: 1 });
        self.names.len() - 1
    }

    fn number_ent(&mut self, e: usize) {
        if self.seen.len() < self.ents.list.len() {
            let n = self.ents.list.len();
            self.seen.resize(n, false);
            self.refs.resize(n, 0);
            self.ent_dialect.resize(n, 0);
        }
        if self.seen[e] {
            self.refs[e] += 1;
            return;
        }
        self.seen[e] = true;
        self.refs[e] = 1;
        let dialect = self.ents.list[e].dialect.clone();
        self.ent_dialect[e] = self.number_dialect(&dialect);
        match self.ents.list[e].kind {
            Kind::Attr => self.attrs.push(e),
            Kind::Type => self.types.push(e),
        }
        let children: Vec<usize> = self.ents.list[e].children().collect();
        for c in children {
            self.number_ent(c);
        }
    }

    /// `groupByDialectPerByte`: within the indices of each varint length, one dialect's entries
    /// together, the dialect the previous length ended with first
    fn group_by_dialect(list: &mut [usize], dialect: impl Fn(usize) -> usize) {
        let mut first = 0;
        let mut in_group: u64 = 0;
        let mut from = 0;
        for i in 1..Self::VARINT_LENGTHS {
            in_group = (1u64 << (Self::VARINT_BITS * i)) - in_group;
            let to = (from + in_group as usize).min(list.len());
            let sub = &mut list[from..to];
            sub.sort_by_key(|e| (dialect(*e) != first, dialect(*e)));
            if let Some(last) = sub.last() {
                first = dialect(*last);
            }
            from = to;
            if from >= list.len() {
                break;
            }
        }
    }
}

impl Writer<'_, '_> {
    // Writing

    pub fn write(mut self, producer: &str) -> Result<Vec<u8>, Error> {
        let mut out = Emitter::default();
        out.raw(MAGIC);
        out.var(VERSION);
        out.cstr(producer.as_bytes());
        let dialect = self.dialect_section();
        out.section(Section::Dialect, dialect);
        let (offsets, data) = self.attr_type_section();
        out.section(Section::AttrTypeOffset, offsets);
        out.section(Section::AttrType, data);
        let mut ir = Emitter::default();
        ir.var_flag(1, false);
        self.write_op(self.ir.root, &mut ir)?;
        out.section(Section::Ir, ir);
        let (offsets, data) = self.resource_section();
        out.section(Section::ResourceOffset, offsets);
        out.section(Section::Resource, data);
        let mut strings = Emitter::default();
        self.strings.write(&mut strings);
        out.section(Section::String, strings);
        let mut props = Emitter::default();
        props.var(self.props_table.len() as u64);
        for p in &self.props_table {
            props.raw(p);
        }
        out.section(Section::Properties, props);
        Ok(out.bytes)
    }

    /// Consecutive entries of one dialect: the dialect, how many, then each
    fn groups(order: &[usize], dialect: impl Fn(usize) -> usize) -> Vec<(usize, &[usize])> {
        let mut out = Vec::new();
        let mut from = 0;
        while from < order.len() {
            let d = dialect(order[from]);
            let to = order[from..].iter().position(|x| dialect(*x) != d).map_or(order.len(), |k| from + k);
            out.push((d, &order[from..to]));
            from = to;
        }
        out
    }

    fn dialect_section(&mut self) -> Emitter {
        let mut e = Emitter::default();
        e.var(self.dialects.len() as u64);
        for d in &self.dialects {
            let id = self.strings.insert(d);
            e.var_flag(id, false);
        }
        e.var(self.names.len() as u64);
        let order = self.name_order.clone();
        for (d, group) in Self::groups(&order, |n| self.names[n].dialect) {
            e.var(d as u64);
            e.var(group.len() as u64);
            for n in group {
                let name = &self.names[*n];
                let bare = name.name.split_once('.').map_or("", |(_, b)| b);
                let id = self.strings.insert(bare);
                e.var_flag(id, name.registered);
            }
        }
        e
    }

    fn attr_type_section(&mut self) -> (Emitter, Emitter) {
        let (mut offsets, mut data) = (Emitter::default(), Emitter::default());
        offsets.var(self.attrs.len() as u64);
        offsets.var(self.types.len() as u64);
        let mut prev = 0;
        for list in [self.attrs.clone(), self.types.clone()] {
            for (d, group) in Self::groups(&list, |e| self.ent_dialect[e]) {
                offsets.var(d as u64);
                offsets.var(group.len() as u64);
                for e in group {
                    let custom = self.entity(*e, &mut data);
                    offsets.var_flag((data.len() - prev) as u64, custom);
                    prev = data.len();
                }
            }
        }
        (offsets, data)
    }

    /// Writes entity `e`; whether by its dialect's encoding
    fn entity(&mut self, e: usize, out: &mut Emitter) -> bool {
        match &self.ents.list[e].enc {
            Enc::Text(t, _) => {
                out.cstr(t.as_bytes());
                false
            }
            Enc::Custom(pieces) => {
                for p in pieces {
                    match p {
                        Piece::Var(v) => out.var(*v),
                        Piece::SVar(v) => out.svar(*v),
                        Piece::Byte(b) => out.byte(*b),
                        Piece::Attr(i) | Piece::Type(i) => out.var(self.number[*i]),
                        Piece::Str(s) => out.var(self.strings.insert(s)),
                        Piece::Blob(b) => {
                            out.var(b.len() as u64);
                            out.raw(b);
                        }
                        Piece::Key(_) => {}
                    }
                }
                true
            }
        }
    }

    fn resource_section(&mut self) -> (Emitter, Emitter) {
        let mut offsets = Emitter::default();
        offsets.var(0);
        (offsets, Emitter::default())
    }

    fn write_op(&mut self, op: OpId, e: &mut Emitter) -> Result<(), Error> {
        let i = op.0 as usize;
        e.var(self.name_number[self.name[i]]);
        let mask_at = e.len();
        e.byte(0);
        e.var(self.number[self.loc[i]]);
        let mut mask = 0;
        if let Some(d) = self.dict[i] {
            mask |= Mask::ATTRS;
            e.var(self.number[d]);
        }
        if let Some(p) = self.properties(op)? {
            mask |= Mask::PROPERTIES;
            e.var(p as u64);
        }
        let node = &self.ir[op];
        let (results, operands, successors, regions) = (node.results.clone(), node.operands.clone(), node.successors.clone(), node.regions.clone());
        if !results.is_empty() {
            mask |= Mask::RESULTS;
            e.var(results.len() as u64);
            for r in &results {
                e.var(self.number[self.ty[r.0 as usize]]);
            }
        }
        if !operands.is_empty() {
            mask |= Mask::OPERANDS;
            e.var(operands.len() as u64);
            for v in &operands {
                e.var(self.value_id[v.0 as usize]);
            }
        }
        if !successors.is_empty() {
            mask |= Mask::SUCCESSORS;
            e.var(successors.len() as u64);
            for b in &successors {
                e.var(self.block_index[b.0 as usize]);
            }
        }
        if self.use_orders(&results, e) {
            mask |= Mask::USE_LIST_ORDERS;
        }
        if !regions.is_empty() {
            mask |= Mask::INLINE_REGIONS;
        }
        e.bytes[mask_at] = mask;
        if !regions.is_empty() {
            let isolated = self.isolated[i] == Some(true);
            e.var_flag(regions.len() as u64, isolated);
            if isolated {
                let mut inner = Emitter::default();
                for r in &regions {
                    self.write_region(*r, &mut inner)?;
                }
                e.section(Section::Ir, inner);
            } else {
                for r in &regions {
                    self.write_region(*r, e)?;
                }
            }
        }
        Ok(())
    }

    fn write_region(&mut self, r: RegionId, e: &mut Emitter) -> Result<(), Error> {
        let blocks = self.ir[r].blocks.clone();
        if blocks.is_empty() {
            e.var(0);
            return Ok(());
        }
        let (n, values) = self.region_counts[r.0 as usize];
        e.var(n);
        e.var(values);
        for b in blocks {
            self.write_block(b, e)?;
        }
        Ok(())
    }

    fn write_block(&mut self, b: BlockId, e: &mut Emitter) -> Result<(), Error> {
        let (args, ops) = (self.ir[b].args.clone(), self.ir[b].ops.clone());
        e.var_flag(ops.len() as u64, !args.is_empty());
        if !args.is_empty() {
            e.var(args.len() as u64);
            for a in &args {
                let loc = self.arg_loc[a.0 as usize];
                let known = loc != self.unknown;
                e.var_flag(self.number[self.ty[a.0 as usize]], known);
                if known {
                    e.var(self.number[loc]);
                }
            }
            let mask_at = e.len();
            e.byte(0);
            if self.use_orders(&args, e) {
                e.bytes[mask_at] = Mask::USE_LIST_ORDERS;
            }
        }
        for o in ops {
            self.write_op(o, e)?;
        }
        Ok(())
    }

    /// `writeUseListOrders`: for each value whose uses are not in reverse pre-order, the order
    /// that puts them back; whether any was written
    fn use_orders(&self, values: &[ValueId], e: &mut Emitter) -> bool {
        let mut map: Vec<(usize, Vec<u64>)> = Vec::new();
        for (k, v) in values.iter().enumerate() {
            let list: Vec<u64> = self.uses[v.0 as usize].iter().rev().copied().collect();
            if list.len() < 2 || list.windows(2).all(|w| w[0] > w[1]) {
                continue;
            }
            let mut pairs: Vec<(u64, u64)> = list.iter().enumerate().map(|(i, id)| (i as u64, *id)).collect();
            pairs.sort_by(|a, b| b.1.cmp(&a.1));
            map.push((k, pairs.into_iter().map(|p| p.0).collect()));
        }
        if map.is_empty() {
            return false;
        }
        if values.len() != 1 {
            e.var(map.len() as u64);
        }
        for (k, order) in map {
            let shuffled = order.iter().enumerate().filter(|(i, x)| *i as u64 != **x).count();
            let pairs = shuffled < order.len() / 2;
            if values.len() != 1 {
                e.var(k as u64);
            }
            if pairs {
                e.var_flag(shuffled as u64 * 2, true);
                for (i, x) in order.iter().enumerate() {
                    if i as u64 != *x {
                        e.var(*x);
                        e.var(i as u64);
                    }
                }
            } else {
                e.var_flag(order.len() as u64, false);
                for x in &order {
                    e.var(*x);
                }
            }
        }
        true
    }

    /// The index of `op`'s properties in the properties section, if it has any
    fn properties(&mut self, op: OpId) -> Result<Option<usize>, Error> {
        let i = op.0 as usize;
        let mut raw = Emitter::default();
        match &self.props[i] {
            Props::None | Props::Opaque(None) => return Ok(None),
            Props::Opaque(Some(p)) => raw.var(self.number[*p]),
            Props::Native(table, given) => {
                let mut attrs = self.prop_ents[i].iter();
                for p in table.iter() {
                    let value = given.get(p.name).map(|n| n.value.as_ref().unwrap_or(&Attribute::Unit));
                    let bad = || Error(format!("bytecode: {} property {} `{}`", self.ir[op].name, p.name, value.map(|v| alloc::string::ToString::to_string(v)).unwrap_or_default()));
                    match p.kind {
                        PropKind::Attr => match value {
                            Some(_) => raw.var(self.number[*attrs.next().expect("a numbered property")]),
                            None => return Err(bad()),
                        },
                        PropKind::OptAttr => match value {
                            Some(_) => raw.var_flag(self.number[*attrs.next().expect("a numbered property")], true),
                            None => raw.var(0),
                        },
                        PropKind::Segments(_) => {
                            let Some(Attribute::DenseArray { values, .. }) = value else { return Err(bad()) };
                            let sizes = values.iter().map(|v| v.parse::<u64>()).collect::<Result<Vec<_>, _>>().map_err(|_| bad())?;
                            Self::sparse(&sizes, &mut raw);
                        }
                        PropKind::VarInt(_) => raw.var(value.map_or(Some(0), Self::int).ok_or_else(bad)? as u64),
                        PropKind::SignedVarInt(_) => raw.svar(value.map_or(Some(0), Self::int).ok_or_else(bad)?),
                        PropKind::Bool => raw.byte(u8::from(!matches!(value, None | Some(Attribute::Bool(false))))),
                        PropKind::OptVarInt(_) => match value {
                            Some(Attribute::Array(xs)) if xs.is_empty() => raw.byte(0),
                            Some(Attribute::Array(xs)) => {
                                raw.byte(1);
                                raw.var(Self::int(&xs[0]).ok_or_else(bad)? as u64);
                            }
                            None => raw.byte(0),
                            Some(_) => return Err(bad()),
                        },
                        PropKind::VarInts(_) => {
                            let xs: Vec<i64> = match value {
                                Some(Attribute::Array(xs)) => xs.iter().map(Self::int).collect::<Option<_>>().ok_or_else(bad)?,
                                Some(Attribute::DenseArray { values, .. }) => values.iter().map(|v| v.parse().ok()).collect::<Option<_>>().ok_or_else(bad)?,
                                None => Vec::new(),
                                Some(_) => return Err(bad()),
                            };
                            raw.var(xs.len() as u64);
                            for x in xs {
                                raw.var(x as u64);
                            }
                        }
                        PropKind::String => {
                            let s = value.map(|v| v.text()).transpose()?.unwrap_or_default();
                            raw.var(self.strings.insert(&s));
                        }
                    }
                }
            }
        }
        let mut entry = Emitter::default();
        entry.var(raw.len() as u64);
        entry.raw(&raw.bytes);
        if let Some(k) = self.props_index.get(&entry.bytes) {
            return Ok(Some(*k));
        }
        self.props_table.push(entry.bytes.clone());
        self.props_index.insert(entry.bytes, self.props_table.len() - 1);
        Ok(Some(self.props_table.len() - 1))
    }

    fn int(a: &Attribute<'_>) -> Option<i64> {
        match a {
            Attribute::Bool(b) => Some(i64::from(*b)),
            Attribute::Int { lit, ty } => {
                let ty = ty.clone().unwrap_or(Type::Integer { signedness: crate::Signedness::Signless, width: 64 });
                match Const::try_from(&Attribute::Int { lit: lit.clone(), ty: Some(ty) }).ok()?.values[0] {
                    Scalar::Int(i) => Some(i.signed() as i64),
                    _ => None,
                }
            }
            _ => None,
        }
    }

    /// `writeSparseArray`
    fn sparse(xs: &[u64], e: &mut Emitter) {
        let nonzero = xs.iter().filter(|x| **x != 0).count();
        let last = xs.iter().rposition(|x| *x != 0).unwrap_or(0);
        if last > Self::SPARSE_LAST || nonzero > xs.len() / 2 {
            e.var_flag(xs.len() as u64, false);
            for x in xs {
                e.var(*x);
            }
            return;
        }
        e.var_flag(nonzero as u64, true);
        if nonzero == 0 {
            return;
        }
        let bits = usize::BITS - last.leading_zeros();
        e.var(u64::from(bits));
        for (k, x) in xs.iter().enumerate().take(last + 1) {
            if *x != 0 {
                e.var((x << bits) | k as u64);
            }
        }
    }
}
