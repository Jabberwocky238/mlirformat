use alloc::collections::BTreeMap;
use alloc::format;
use alloc::string::String;
use alloc::vec::Vec;
use core::ops::{Index, Range};

use crate::{Attribute, Error, NamedAttr, Operation, Type};

/// An op of an `Ir`, by its place in the walk
#[derive(Clone, Copy, Debug, PartialEq, Eq, PartialOrd, Ord, Hash)]
pub struct OpId(pub u32);

/// An SSA value of an `Ir`: an op's result or a block's argument
#[derive(Clone, Copy, Debug, PartialEq, Eq, PartialOrd, Ord, Hash)]
pub struct ValueId(pub u32);

#[derive(Clone, Copy, Debug, PartialEq, Eq, PartialOrd, Ord, Hash)]
pub struct BlockId(pub u32);

#[derive(Clone, Copy, Debug, PartialEq, Eq, PartialOrd, Ord, Hash)]
pub struct RegionId(pub u32);

pub struct OpNode<'o, 'a> {
    pub op: &'o Operation<'a>,
    pub name: &'o str,
    pub operands: Vec<ValueId>,
    pub results: Vec<ValueId>,
    pub successors: Vec<BlockId>,
    pub regions: Vec<RegionId>,
    pub parent: Option<BlockId>,
    attrs: Vec<NamedAttr<'a>>,
}

impl<'a> OpNode<'_, 'a> {
    /// A property or attribute
    pub fn get(&self, name: &str) -> Option<&Attribute<'a>> {
        self.attrs.iter().find(|a| a.name == name).map(|a| a.value.as_ref().unwrap_or(&Attribute::Unit))
    }

    /// Properties and attributes together, by name
    pub fn all_attrs(&self) -> Vec<NamedAttr<'a>> {
        self.attrs.clone()
    }
}

pub struct ValueNode<'a> {
    pub ty: Type<'a>,
}

pub struct BlockNode {
    pub args: Vec<ValueId>,
    pub ops: Vec<OpId>,
    pub parent: Option<RegionId>,
}

pub struct RegionNode {
    pub blocks: Vec<BlockId>,
    pub parent: OpId,
}

/// A read-only index over an mlirformat op tree: every op, value, block and region numbered, the
/// operands and successors resolved by name (MLIR's scoping: a region sees the values of the
/// regions around it, a block label is its region's).
pub struct Ir<'o, 'a> {
    ops: Vec<OpNode<'o, 'a>>,
    values: Vec<ValueNode<'a>>,
    blocks: Vec<BlockNode>,
    regions: Vec<RegionNode>,
    pub root: OpId,
}

#[derive(Default)]
struct Scope {
    values: BTreeMap<String, ValueId>,
    blocks: BTreeMap<String, BlockId>,
}

impl<'o, 'a> Ir<'o, 'a> {
    const SEGMENTS: &'static str = "operandSegmentSizes";
    /// A switch's case operands, case by case, after its default's (`spirv.Switch`, `cf.switch`)
    const CASE_SEGMENTS: &'static str = "case_operand_segments";

    pub fn new(root: &'o Operation<'a>) -> Result<Self, Error> {
        let mut ir = Ir { ops: Vec::new(), values: Vec::new(), blocks: Vec::new(), regions: Vec::new(), root: OpId(0) };
        let mut scopes = alloc::vec![Scope::default()];
        ir.root = ir.declare(root, None, &mut scopes)?;
        ir.resolve(ir.root, &mut scopes)?;
        Ok(ir)
    }

    fn value(&mut self, ty: Type<'a>) -> ValueId {
        self.values.push(ValueNode { ty });
        ValueId(self.values.len() as u32 - 1)
    }

    fn result_names(op: &Operation<'_>) -> Vec<String> {
        let mut names = Vec::new();
        for r in &op.results {
            match r.count {
                Some(n) => names.extend((0..n).map(|i| format!("{}#{i}", r.name))),
                None => names.push(String::from(&*r.name)),
            }
        }
        names
    }

    fn operand_name(v: &crate::Value<'_>) -> String {
        match v.index {
            Some(i) => format!("{}#{i}", v.name),
            None => String::from(&*v.name),
        }
    }

    /// Numbers `op` and its results in the innermost scope; its regions come later (`resolve`)
    fn declare(&mut self, op: &'o Operation<'a>, parent: Option<BlockId>, scopes: &mut [Scope]) -> Result<OpId, Error> {
        let names = Self::result_names(op);
        if names.len() != op.ty.results.len() {
            return Err(Error(format!("{}: {} results, {} result types", op.name, names.len(), op.ty.results.len())));
        }
        let mut results = Vec::new();
        for (n, t) in names.into_iter().zip(&op.ty.results) {
            let v = self.value(t.clone());
            scopes.last_mut().expect("a scope").values.insert(Self::bare(&n), v);
            results.push(v);
        }
        let mut attrs: Vec<NamedAttr<'a>> = match &op.properties {
            Some(Attribute::Dict(p)) => p.clone(),
            _ => Vec::new(),
        };
        attrs.extend(op.attributes.iter().cloned());
        attrs.sort_by(|a, b| a.name.cmp(&b.name));
        self.ops.push(OpNode { op, name: &op.name, operands: Vec::new(), results, successors: Vec::new(), regions: Vec::new(), parent, attrs });
        Ok(OpId(self.ops.len() as u32 - 1))
    }

    /// Declares each region's blocks and ops (so a use may come before its definition, as across
    /// the blocks of a CFG), then resolves the ops' operands and successors, region by region
    fn resolve(&mut self, id: OpId, scopes: &mut Vec<Scope>) -> Result<(), Error> {
        let op = self.ops[id.0 as usize].op;
        for r in &op.regions {
            scopes.push(Scope::default());
            self.regions.push(RegionNode { blocks: Vec::new(), parent: id });
            let region = RegionId(self.regions.len() as u32 - 1);
            self.ops[id.0 as usize].regions.push(region);
            let mut placed = Vec::new();
            for (k, b) in r.blocks.iter().enumerate() {
                let mut args = Vec::new();
                for a in &b.args {
                    let v = self.value(a.ty.clone());
                    scopes.last_mut().expect("a scope").values.insert(Self::bare(&a.name), v);
                    args.push(v);
                }
                self.blocks.push(BlockNode { args, ops: Vec::new(), parent: Some(region) });
                let block = BlockId(self.blocks.len() as u32 - 1);
                let label = b.label.as_deref().map_or_else(|| format!("^{k}"), String::from);
                scopes.last_mut().expect("a scope").blocks.insert(Self::bare(&label), block);
                self.regions[region.0 as usize].blocks.push(block);
                for o in &b.ops {
                    let at = self.declare(o, Some(block), scopes)?;
                    self.blocks[block.0 as usize].ops.push(at);
                    placed.push(at);
                }
            }
            for at in placed {
                let o = self.ops[at.0 as usize].op;
                let operands = o.operands.iter().map(|v| Self::lookup(scopes, &Self::operand_name(v), |s| &s.values).ok_or_else(|| Error(format!("{}: no value %{}", o.name, Self::operand_name(v))))).collect::<Result<Vec<_>, _>>()?;
                let successors = o.successors.iter().map(|s| Self::lookup(scopes, s, |sc| &sc.blocks).ok_or_else(|| Error(format!("{}: no block {s}", o.name)))).collect::<Result<Vec<_>, _>>()?;
                self.ops[at.0 as usize].operands = operands;
                self.ops[at.0 as usize].successors = successors;
                self.resolve(at, scopes)?;
            }
            scopes.pop();
        }
        Ok(())
    }

    fn bare(name: &str) -> String {
        String::from(name.trim_start_matches(['%', '^']))
    }

    fn lookup<T: Copy>(scopes: &[Scope], name: &str, of: impl Fn(&Scope) -> &BTreeMap<String, T>) -> Option<T> {
        let bare = Self::bare(name);
        scopes.iter().rev().find_map(|s| of(s).get(&bare).copied())
    }

    /// How many ops, values, blocks and regions there are; each id is below its count
    pub fn counts(&self) -> (usize, usize, usize, usize) {
        (self.ops.len(), self.values.len(), self.blocks.len(), self.regions.len())
    }

    pub fn block_ops(&self, b: BlockId) -> Vec<OpId> {
        self[b].ops.clone()
    }

    pub fn first_op(&self, b: BlockId) -> Option<OpId> {
        self[b].ops.first().copied()
    }

    pub fn last_op(&self, b: BlockId) -> Option<OpId> {
        self[b].ops.last().copied()
    }

    /// The first block of `op`'s first region
    pub fn top_block(&self, op: OpId) -> BlockId {
        self[self[op].regions[0]].blocks[0]
    }

    pub fn segments(&self, op: OpId, name: &str) -> Option<Vec<usize>> {
        match self[op].get(name)? {
            Attribute::DenseArray { values, .. } => Some(values.iter().map(|v| v.parse().unwrap_or(0)).collect()),
            _ => None,
        }
    }

    /// The operands `op` forwards to its `i`th successor: all of them; with operand segments, the
    /// `i`th group after the groups that go to no successor; for a switch, the default's group
    /// first and then the cases' group cut by `case_operand_segments`
    pub fn successor_operands(&self, op: OpId, i: usize) -> Option<Range<usize>> {
        let n = self[op].successors.len();
        if let (Some(sizes), Some(cases)) = (self.segments(op, Self::SEGMENTS), self.segments(op, Self::CASE_SEGMENTS)) {
            let [lead @ .., default, all] = &sizes[..] else { return None };
            let (default, all) = (*default, *all);
            let start: usize = lead.iter().sum();
            if i == 0 {
                return Some(start..start + default);
            }
            let first = start + default + cases[..i - 1].iter().sum::<usize>();
            let len = *cases.get(i - 1)?;
            return (cases.iter().sum::<usize>() == all).then_some(first..first + len);
        }
        match self.segments(op, Self::SEGMENTS) {
            None => (n == 1 && i == 0).then(|| 0..self[op].operands.len()),
            Some(sizes) => {
                let g = sizes.len().checked_sub(n)? + i;
                let start: usize = sizes[..g].iter().sum();
                Some(start..start + *sizes.get(g)?)
            }
        }
    }
}

impl<'o, 'a> Index<OpId> for Ir<'o, 'a> {
    type Output = OpNode<'o, 'a>;

    fn index(&self, i: OpId) -> &OpNode<'o, 'a> {
        &self.ops[i.0 as usize]
    }
}

impl<'a> Index<ValueId> for Ir<'_, 'a> {
    type Output = ValueNode<'a>;

    fn index(&self, i: ValueId) -> &ValueNode<'a> {
        &self.values[i.0 as usize]
    }
}

impl Index<BlockId> for Ir<'_, '_> {
    type Output = BlockNode;

    fn index(&self, i: BlockId) -> &BlockNode {
        &self.blocks[i.0 as usize]
    }
}

impl Index<RegionId> for Ir<'_, '_> {
    type Output = RegionNode;

    fn index(&self, i: RegionId) -> &RegionNode {
        &self.regions[i.0 as usize]
    }
}
