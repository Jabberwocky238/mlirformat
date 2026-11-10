//! SPIR-V types as `mlir-opt` reads them: `SPIRVDialect::parseType` (`SPIRV/IR/SPIRVDialect.cpp`).

use alloc::string::{String, ToString};
use alloc::vec::Vec;

use super::{DialectRules, Invalid, Verifier};
use crate::{Attribute, FloatKind, MlirOpt, Parser, R, ShapedKind, Type};

keywords! {
    /// The SPIR-V types.
    enum Kind {
        Array = "array",
        CoopMatrix = "coopmatrix",
        Image = "image",
        Ptr = "ptr",
        RtArray = "rtarray",
        SampledImage = "sampled_image",
        Struct = "struct",
        Matrix = "matrix",
        TensorArm = "arm.tensor",
        Sampler = "sampler",
        NamedBarrier = "named_barrier",
    }
}

#[path = "spirv.gen.rs"]
mod enums;

/// ⭐ A SPIR-V enum attribute (`SPIRV_I32EnumAttr` / `SPIRV_BitEnumAttr` in `SPIRVBase.td`).
pub(super) struct SpirvEnum {
    /// `#spirv.scope<..>`'s `scope`.
    mnemonic: &'static str,
    /// The C++ enum (`Scope`).
    name: &'static str,
    /// A bit enum: `A|B` (`symbolizeEnum` of a `|` list).
    bits: bool,
    cases: &'static [(&'static str, u32)],
}

impl SpirvEnum {
    /// The enum `mnemonic` names (`storage_class`).
    fn named(mnemonic: &str) -> Option<&'static SpirvEnum> {
        enums::ENUMS.binary_search_by(|e| e.mnemonic.cmp(mnemonic)).ok().map(|i| &enums::ENUMS[i])
    }

    /// The enum by its C++ name (`ExecutionModel`).
    fn of(name: &str) -> Option<&'static SpirvEnum> {
        enums::ENUMS.iter().find(|e| e.name == name)
    }

    /// `symbolizeEnum`: the value `text` spells (`Volatile|Aligned` for a bit enum).
    fn value(&self, text: &str) -> Option<u32> {
        let one = |w: &str| self.cases.iter().find(|(c, _)| *c == w.trim()).map(|(_, v)| *v);
        match self.bits {
            true => text.split('|').try_fold(0, |acc, w| Some(acc | one(w)?)),
            false => one(text),
        }
    }

    /// `, `-joined case names, as an ODS enum parser lists them.
    fn listed(&self) -> String {
        self.cases.iter().map(|(c, _)| *c).collect::<Vec<_>>().join(", ")
    }
}

/// A cursor over one SPIR-V type's body; `enclosing`: the identified structs being read
/// (`tryStartCyclicParse`), shared with the types nested in it.
struct SpirvText<'a, 'd, 'e> {
    p: Parser<'a, 'd>,
    enclosing: &'e mut Vec<String>,
}

impl<'a, 'd> SpirvText<'a, 'd, '_> {
    /// A keyword that is one of `cases` (`symbolizeEnum`).
    fn keyword(&mut self, e: &str, what: &str) -> R<&'a str> {
        let w = self.p.ident().or_else(|_| self.p.err(alloc::format!("expected {what}")))?;
        match SpirvEnum::of(e).and_then(|e| e.value(w)) {
            Some(_) if !w.contains('|') => Ok(w),
            _ => self.p.err(alloc::format!("unknown {what}: {w}")),
        }
    }

    /// `parseDimensionList`: `N x ...` before the element type; `?` too when `dynamic`.
    fn dims(&mut self, dynamic: bool) -> R<Vec<i64>> {
        let mut out = Vec::new();
        loop {
            self.p.ws();
            let n = match self.p.rest().as_bytes().first() {
                Some(b'?') if dynamic => {
                    self.p.skip(1);
                    -1
                }
                Some(c) if c.is_ascii_digit() => self.p.number()?,
                _ => return Ok(out),
            };
            out.push(n);
            self.p.ws();
            if !self.p.rest().starts_with('x') {
                return self.p.err("expected 'x' in dimension list");
            }
            self.p.skip(1);
        }
    }

    /// A type, a nested SPIR-V one read by these rules too.
    fn ty(&mut self) -> R<Type<'a>> {
        let t = self.p.ty()?;
        if let Type::Extended(e) = &t
            && let Some(m) = e.name.strip_prefix("spirv.")
            && let Err(why) = Spirv::why(self.p.opt(), m, e.body.as_deref(), self.enclosing)
        {
            return self.p.err(why);
        }
        Ok(t)
    }

    /// `parseAndVerifyType`: a SPIR-V type, a float, a 1/8/16/32/64-bit integer, a 1-D vector
    /// of at most 4.
    fn element(&mut self) -> R<Type<'a>> {
        let t = self.ty()?;
        match &t {
            Type::Extended(e) if e.name.starts_with("spirv.") => {}
            // An alias (`!f32_binding`): what it names is checked where it is defined.
            Type::Extended(e) if !e.name.contains('.') && e.body.is_none() => {}
            Type::Float(_) if Self::scalar(&t) => {}
            Type::Float(_) => return self.p.err(alloc::format!("only 8/16/32/64-bit float type allowed but found '{t}'")),
            Type::Integer { width, .. } if [1, 8, 16, 32, 64].contains(width) => {}
            Type::Integer { .. } => return self.p.err(alloc::format!("only 1/8/16/32/64-bit integer type allowed but found '{t}'")),
            Type::Shaped(s) if s.kind == ShapedKind::Vector => match s.shape.as_deref() {
                Some([d]) if t.element_count().is_some_and(|n| n <= 4) => {
                    let _ = d;
                }
                Some([_]) => return self.p.err("vector length has to be less than or equal to 4"),
                _ => return self.p.err(alloc::format!("only 1-D vector allowed but found '{t}'")),
            },
            _ => return self.p.err(alloc::format!("cannot use '{t}' to compose SPIR-V types")),
        }
        Ok(t)
    }

    /// `ScalarType::classof`: an integer of 1, 8, 16, 32 or 64 bits, a float of 16, 32 or 64
    /// bits or `f8E4M3FN` / `f8E5M2`.
    fn scalar(t: &Type<'_>) -> bool {
        match t {
            Type::Float(FloatKind::F8E4M3FN | FloatKind::F8E5M2) => true,
            Type::Float(_) => matches!(t.bit_width(), Some(16 | 32 | 64)),
            Type::Integer { width, .. } => [1, 8, 16, 32, 64].contains(width),
            _ => false,
        }
    }

    /// `SPIRVType::classof`: a SPIR-V dialect type (or an alias), a scalar, or a 1-D vector of
    /// 2, 3, 4, 8 or 16 scalars (or pointers).
    fn spirv_type(t: &Type<'_>) -> bool {
        match t {
            Type::Extended(e) => e.name.starts_with("spirv.") || (!e.name.contains('.') && e.body.is_none()),
            Type::Shaped(s) if s.kind == ShapedKind::Vector => {
                matches!(s.shape.as_deref(), Some([_])) && t.element_count().is_some_and(|n| [2, 3, 4, 8, 16].contains(&n)) && (Self::scalar(&s.elem) || matches!(&*s.elem, Type::Extended(e) if e.name == "spirv.ptr"))
            }
            t => Self::scalar(t),
        }
    }

    /// `, stride=N`, N > 0, before the closing `>`.
    fn stride(&mut self) -> R<()> {
        if self.p.eat(",") {
            self.p.expect("stride")?;
            self.p.expect("=")?;
            if self.p.number::<u32>()? == 0 {
                return self.p.err("ArrayStride must be greater than zero");
            }
        }
        Ok(())
    }

    /// `Decoration` or `Decoration = attr`.
    fn decoration(&mut self) -> R<()> {
        self.keyword("Decoration", "decoration")?;
        if self.p.eat("=") {
            self.p.attr()?;
        }
        Ok(())
    }

    /// An image's parameters after its `<`: the dim.
    fn image(&mut self) -> R<&'a str> {
        self.element()?;
        let mut dim = "";
        for (i, (cases, what)) in [("Dim", "Dim"), ("ImageDepthInfo", "ImageDepthInfo"), ("ImageArrayedInfo", "ImageArrayedInfo"), ("ImageSamplingInfo", "ImageSamplingInfo"), ("ImageSamplerUseInfo", "ImageSamplerUseInfo"), ("ImageFormat", "ImageFormat")].into_iter().enumerate() {
            self.p.expect(",")?;
            let w = self.keyword(cases, what)?;
            if i == 0 {
                dim = w;
            }
        }
        Ok(dim)
    }

    /// A struct's body after its `<`.
    fn structure(&mut self) -> R<()> {
        let mut named = None;
        if !self.p.at(b'(') {
            let id = self.p.ident()?;
            let enclosing = self.enclosing.iter().any(|n| n == id);
            if self.p.eat(">") {
                // A name alone refers to the struct being defined around it.
                return if enclosing { Ok(()) } else { self.p.err("recursive struct reference not nested in struct definition") };
            }
            self.p.expect(",")?;
            if enclosing {
                return self.p.err("identifier already used for an enclosing struct");
            }
            self.enclosing.push(id.into());
            named = Some(());
        }
        let r = self.members();
        if named.is_some() {
            self.enclosing.pop();
        }
        r
    }

    /// `(T [offset, Deco], ...)` then `, Deco` and `>`: offsets for every member or none.
    fn members(&mut self) -> R<()> {
        self.p.expect("(")?;
        if self.p.eat(")") {
            return self.p.expect(">");
        }
        let (mut members, mut offsets) = (0usize, 0usize);
        loop {
            if !Self::spirv_type(&self.ty()?) {
                return self.p.err("member type must be a valid SPIR-V type");
            }
            members += 1;
            if self.p.eat("[") {
                self.p.ws();
                let offset = self.p.rest().starts_with(|c: char| c.is_ascii_digit());
                if offset {
                    if offsets != members - 1 {
                        return self.p.err("offset specification must be given for all members");
                    }
                    self.p.number::<u32>()?;
                    offsets += 1;
                }
                if !self.p.eat("]") {
                    if offset {
                        self.p.expect(",")?;
                    }
                    loop {
                        self.decoration()?;
                        if !self.p.eat(",") {
                            break;
                        }
                    }
                    self.p.expect("]")?;
                }
            }
            if !self.p.eat(",") {
                break;
            }
        }
        if offsets != 0 && offsets != members {
            return self.p.err("offset specification must be given for all members");
        }
        self.p.expect(")")?;
        while self.p.eat(",") {
            self.decoration()?;
        }
        self.p.expect(">")
    }

    fn read(&mut self, kind: Kind) -> R<()> {
        self.p.expect("<")?;
        match kind {
            Kind::Array => {
                let dims = self.dims(false)?;
                match dims.as_slice() {
                    [0] => return self.p.err("expected array length greater than 0"),
                    [_] => {}
                    _ => return self.p.err("expected single integer for array element count"),
                }
                self.element()?;
                self.stride()?;
            }
            Kind::RtArray => {
                self.element()?;
                self.stride()?;
            }
            Kind::Ptr => {
                self.element()?;
                self.p.expect(",")?;
                self.keyword("StorageClass", "storage class")?;
            }
            Kind::Image => {
                self.image()?;
            }
            Kind::SampledImage => {
                self.p.ws();
                if !self.p.rest().starts_with("!spirv.image<") {
                    let t = self.p.ty()?;
                    return self.p.err(alloc::format!("sampled image must be composed using image type, got '{t}'"));
                }
                self.p.skip("!spirv.image<".len());
                let dim = self.image()?;
                self.p.expect(">")?;
                if ["SubpassData", "Buffer"].contains(&dim) {
                    return self.p.err(alloc::format!("sampled image Dim must not be SubpassData or Buffer, got {dim}"));
                }
            }
            Kind::CoopMatrix => {
                if self.dims(false)?.len() != 2 {
                    return self.p.err("expected row and column count");
                }
                self.element()?;
                self.p.expect(",")?;
                self.keyword("Scope", "scope <id>")?;
                self.p.expect(",")?;
                self.keyword("CooperativeMatrixUseKHR", "use <id>")?;
            }
            Kind::Matrix => {
                match self.dims(false)?.as_slice() {
                    [c] if (2..=4).contains(c) => {}
                    [_] => return self.p.err("matrix is expected to have 2, 3, or 4 columns"),
                    _ => return self.p.err("expected single unsigned integer for number of columns"),
                }
                let t = self.p.ty()?;
                match &t {
                    Type::Shaped(s) if s.kind == ShapedKind::Vector && s.shape.as_ref().is_some_and(|d| d.len() == 1) => {
                        if !t.element_count().is_some_and(|n| (2..=4).contains(&n)) {
                            return self.p.err("matrix columns size has to be less than or equal to 4 and greater than or equal 2");
                        }
                        if !matches!(*s.elem, Type::Float(_)) {
                            return self.p.err(alloc::format!("matrix columns' elements must be of Float type, got '{}'", s.elem));
                        }
                    }
                    Type::Shaped(s) if s.kind == ShapedKind::Vector => return self.p.err(alloc::format!("only 1-D vector allowed but found '{t}'")),
                    _ => return self.p.err(alloc::format!("matrix must be composed using vector type, got '{t}'")),
                }
            }
            // Settled in `Spirv::why`: no body.
            Kind::Sampler | Kind::NamedBarrier => {}
            Kind::TensorArm => {
                let dims = if self.p.eat("*") {
                    self.p.ws();
                    if !self.p.rest().starts_with('x') {
                        return self.p.err("expected 'x' in dimension list");
                    }
                    self.p.skip(1);
                    None
                } else {
                    Some(self.dims(true)?)
                };
                if let Some(d) = &dims {
                    if d.is_empty() {
                        return self.p.err("arm.tensors do not support rank zero");
                    }
                    if d.contains(&0) {
                        return self.p.err("arm.tensors do not support zero dimensions");
                    }
                    if d.iter().any(|x| *x < 0) && d.iter().any(|x| *x > 0) {
                        return self.p.err("arm.tensor shape dimensions must be either fully dynamic or completed shaped");
                    }
                }
                self.element()?;
            }
            Kind::Struct => return self.structure(),
        }
        self.p.expect(">")
    }
}

keywords! {
    /// The SPIR-V ops with a C++ parser whose text is checked here.
    enum CxxOp {
        Load = "spirv.Load",
        Store = "spirv.Store",
        Variable = "spirv.Variable",
        GlobalVariable = "spirv.GlobalVariable",
        CompositeExtract = "spirv.CompositeExtract",
        EntryPoint = "spirv.EntryPoint",
        ExecutionMode = "spirv.ExecutionMode",
        ExecutionModeId = "spirv.ExecutionModeId",
        Func = "spirv.func",
        Module = "spirv.module",
        IAddCarry = "spirv.IAddCarry",
        ISubBorrow = "spirv.ISubBorrow",
        SMulExtended = "spirv.SMulExtended",
        UMulExtended = "spirv.UMulExtended",
        BranchConditional = "spirv.BranchConditional",
        Constant = "spirv.Constant",
        Switch = "spirv.Switch",
    }
}

/// A cursor over a raw SPIR-V op's text after its name, up to its first region; the ops' C++
/// `parse` functions (`SPIRVOps.cpp`, `MemoryOps.cpp`, `ControlFlowOps.cpp`) read over again.
struct OpText<'a, 'd, 'v, 'x> {
    p: Parser<'a, 'd>,
    v: &'v Verifier<'x>,
}

impl<'a> OpText<'a, '_, '_, '_> {
    /// `parseEnumStrAttr`: a string naming one of enum `e`'s cases (a bit enum: `A|B`).
    fn enum_str(&mut self, e: &str) -> R<u32> {
        let e = SpirvEnum::of(e).ok_or_else(|| crate::ParseError::unplaced(0, "unknown enum"))?;
        match self.p.bare_attr()? {
            Attribute::Str { lit, .. } => match e.value(&lit) {
                Some(v) => Ok(v),
                None => self.p.err(alloc::format!("invalid {} attribute specification: \"{lit}\"", e.mnemonic)),
            },
            _ => self.p.err(alloc::format!("expected {} attribute specified as string", e.mnemonic)),
        }
    }

    /// `parseEnumKeywordAttr`: a bare keyword naming one of enum `e`'s cases.
    fn enum_keyword(&mut self, e: &str) -> R<()> {
        let e = SpirvEnum::of(e).ok_or_else(|| crate::ParseError::unplaced(0, "unknown enum"))?;
        let w = self.p.ident().or_else(|_| self.p.err("expected valid keyword"))?;
        match e.value(w) {
            Some(_) => Ok(()),
            None => self.p.err(alloc::format!("invalid {} attribute specification: {w}", e.mnemonic)),
        }
    }

    /// `parseMemoryAccessAttributes`: `[ "Volatile" ]`, `[ "Aligned", 4 ]`.
    fn memory_access(&mut self) -> R<()> {
        if !self.p.eat("[") {
            return Ok(());
        }
        let v = self.enum_str("MemoryAccess")?;
        // `MemoryAccess::Aligned`.
        if v & 0x2 != 0 {
            self.p.expect(",")?;
            self.p.bare_attr()?;
        }
        self.p.expect("]")
    }

    /// An operand: `%x` / `%x#1`.
    fn operand(&mut self) -> R<String> {
        self.p.ws();
        if !self.p.rest().starts_with('%') {
            return self.p.err("expected SSA operand");
        }
        self.p.value().map(|v| v.name.to_string())
    }

    /// `: type`.
    fn colon_type(&mut self) -> R<Type<'a>> {
        self.p.expect(":")?;
        self.p.ty()
    }

    /// `%x` is of type `want`, when its definition says (`resolveOperand`).
    fn resolve(&self, name: &str, want: &Type<'_>) -> R<()> {
        match self.v.visible(name).and_then(|ts| ts.first()?.as_deref()) {
            Some(t) if !super::Verifier::same(t, want) => self.p.err(alloc::format!("use of value '%{name}' expects different type than prior uses: '{want}' vs '{t}'")),
            _ => Ok(()),
        }
    }

    /// `parseVariableDecorations`: `bind(set, binding)` or `built_in("..")`, then an attribute dict.
    fn decorations(&mut self) -> R<()> {
        if self.p.eat_kw("bind") {
            self.p.expect("(")?;
            self.p.bare_attr()?;
            self.p.expect(",")?;
            self.p.bare_attr()?;
            self.p.expect(")")?;
        } else if self.p.eat_kw("built_in") {
            self.p.expect("(")?;
            self.p.attr()?;
            self.p.expect(")")?;
        }
        self.p.opt_dict().map(drop)
    }

    /// A `!spirv.ptr<..>` type after `:`.
    fn pointer(&mut self) -> R<()> {
        let t = self.colon_type()?;
        match &t {
            Type::Extended(e) if e.name == "spirv.ptr" => Ok(()),
            // An alias: what it names is checked where it is defined.
            Type::Extended(e) if !e.name.contains('.') => Ok(()),
            _ => self.p.err("expected spirv.ptr type"),
        }
    }

    /// `parseFunctionSignatureWithArguments` with no variadic `...`: `(%a: T {..}, ..) -> R`, or
    /// types alone (an external function); named once named.
    fn signature(&mut self) -> R<()> {
        self.p.expect("(")?;
        if !self.p.eat(")") {
            self.p.ws();
            let named = self.p.rest().starts_with('%');
            loop {
                self.p.ws();
                match self.p.rest().starts_with('%') {
                    true if named => {
                        self.p.sigil('%')?;
                        self.colon_type()?;
                    }
                    false if !named => drop(self.p.ty()?),
                    _ => return self.p.err("expected SSA identifier"),
                }
                self.p.opt_dict()?;
                self.p.opt_loc()?;
                if !self.p.eat(",") {
                    break;
                }
            }
            self.p.expect(")")?;
        }
        if self.p.eat("->") {
            if self.p.at(b'(') {
                self.p.group()?;
            } else {
                self.p.ty()?;
            }
        }
        Ok(())
    }

    /// `^bb` or `^bb(%a, %b : T, T)`.
    fn successor(&mut self) -> R<()> {
        self.p.ws();
        if !self.p.rest().starts_with('^') {
            return self.p.err("expected block name");
        }
        self.p.sigil('^')?;
        if self.p.at(b'(') {
            self.p.group()?;
        }
        Ok(())
    }

    /// The walk down a composite type by `indices` (`getElementType`).
    fn extract(&self, ty: &Type<'_>, indices: &[i64]) -> R<()> {
        if indices.is_empty() {
            return self.p.err("expected at least one index for spirv.CompositeExtract");
        }
        let mut t: Type<'static> = ty.owned();
        for &i in indices {
            // Element count (`None`: not known at compile time) and the element at `i`.
            let (count, elem): (Option<i64>, Option<Type<'static>>) = match &t {
                Type::Shaped(s) if s.kind == ShapedKind::Vector => (t.element_count().map(|n| n as i64), Some(s.elem.owned())),
                Type::Extended(_) => match crate::dialects::spirv_types::SpirvType::try_from(&t) {
                    Ok(crate::dialects::spirv_types::SpirvType::Array { len, elem, .. }) => (Some(i64::from(len)), Some(elem.owned())),
                    Ok(crate::dialects::spirv_types::SpirvType::RuntimeArray { elem, .. }) => (None, Some(elem.owned())),
                    Ok(crate::dialects::spirv_types::SpirvType::Matrix { cols, column }) => (Some(i64::from(cols)), Some(column.owned())),
                    Ok(crate::dialects::spirv_types::SpirvType::CoopMatrix { elem, .. }) => (None, Some(elem.owned())),
                    Ok(crate::dialects::spirv_types::SpirvType::Struct { members: Some(ms), .. }) => {
                        (Some(ms.len() as i64), usize::try_from(i).ok().and_then(|i| ms.get(i)).map(|m| m.ty.owned()))
                    }
                    // Not a composite, or an alias: not walked further.
                    Ok(_) => (Some(-1), None),
                    Err(()) => return Ok(()),
                },
                _ => (Some(-1), None),
            };
            match (count, elem) {
                (Some(-1), _) => return self.p.err(alloc::format!("cannot extract from non-composite type '{t}' with index {i}")),
                (Some(n), _) if i < 0 || i >= n => return self.p.err(alloc::format!("index {i} out of bounds for '{t}'")),
                (_, Some(e)) => t = e,
                (_, None) => return Ok(()),
            }
        }
        Ok(())
    }

    /// The op's text as its C++ `parse` reads it; `region`: a region follows the text.
    fn read(&mut self, op: CxxOp, region: bool) -> R<()> {
        match op {
            CxxOp::Load => {
                self.enum_str("StorageClass")?;
                self.operand()?;
                self.memory_access()?;
                self.p.opt_dict()?;
                self.colon_type()?;
            }
            CxxOp::Store => {
                self.enum_str("StorageClass")?;
                self.p.ws();
                if !self.p.rest().starts_with('%') {
                    return self.p.err("expected operand");
                }
                self.operand()?;
                if !self.p.eat(",") {
                    return self.p.err("expected 2 operands");
                }
                self.operand()?;
                self.memory_access()?;
                self.colon_type()?;
                self.p.opt_dict()?;
            }
            CxxOp::Variable => {
                if self.p.eat_kw("init") {
                    self.p.expect("(")?;
                    self.operand()?;
                    self.p.expect(")")?;
                }
                self.decorations()?;
                self.pointer()?;
            }
            CxxOp::GlobalVariable => {
                self.p.symbol()?;
                if self.p.eat_kw("initializer") {
                    self.p.group()?;
                }
                self.decorations()?;
                self.pointer()?;
            }
            CxxOp::CompositeExtract => {
                self.operand()?;
                let indices = match self.p.attr()? {
                    Attribute::Array(xs) => xs,
                    _ => return self.p.err("expected a 32-bit integer array attribute for 'indices'"),
                };
                let mut is = Vec::new();
                for x in &indices {
                    match x {
                        Attribute::Int { lit, .. } => is.push(lit.parse::<i64>().or_else(|_| self.p.err("expected an 32-bit integer for index"))?),
                        _ => return self.p.err(alloc::format!("expected an 32-bit integer for index, but found '{x}'")),
                    }
                }
                let t = self.colon_type()?;
                self.extract(&t, &is)?;
            }
            CxxOp::EntryPoint => {
                self.enum_str("ExecutionModel")?;
                if !matches!(self.p.bare_attr()?, Attribute::SymbolRef(s) if s.len() == 1) {
                    return self.p.err("invalid kind of attribute specified");
                }
                while self.p.eat(",") {
                    self.p.symbol()?;
                }
            }
            CxxOp::ExecutionMode => {
                self.p.attr()?;
                self.enum_str("ExecutionMode")?;
                while self.p.eat(",") {
                    self.p.bare_attr()?;
                }
            }
            // `@fn "Mode" @a, @b`: symbols only (`ExecutionModeIdOp::parse`).
            CxxOp::ExecutionModeId => {
                self.p.attr()?;
                self.enum_str("ExecutionMode")?;
                loop {
                    if !matches!(self.p.attr()?, Attribute::SymbolRef(_)) {
                        return self.p.err("invalid kind of attribute specified");
                    }
                    if !self.p.eat(",") {
                        break;
                    }
                }
            }
            CxxOp::Func => {
                self.p.symbol()?;
                self.signature()?;
                self.p.ws();
                if region && self.p.rest().is_empty() {
                    return self.p.err("expected function_control attribute specified as string");
                }
                self.enum_str("FunctionControl")?;
                if self.p.eat_kw("attributes") {
                    self.p.dict()?;
                }
            }
            CxxOp::Module => {
                self.p.ws();
                if self.p.rest().starts_with('@') {
                    self.p.symbol()?;
                }
                self.enum_keyword("AddressingModel")?;
                self.enum_keyword("MemoryModel")?;
                if self.p.eat_kw("requires") {
                    self.p.attr()?;
                }
                if self.p.eat_kw("attributes") {
                    self.p.dict()?;
                }
            }
            CxxOp::IAddCarry | CxxOp::ISubBorrow | CxxOp::SMulExtended | CxxOp::UMulExtended => {
                self.p.opt_dict()?;
                self.operand()?;
                while self.p.eat(",") {
                    self.operand()?;
                }
                let t = self.colon_type()?;
                match crate::dialects::spirv_types::SpirvType::try_from(&t) {
                    Ok(crate::dialects::spirv_types::SpirvType::Struct { members: Some(ms), .. }) if ms.len() == 2 => {}
                    _ if matches!(&t, Type::Extended(e) if !e.name.contains('.')) => {}
                    _ => return self.p.err("expected spirv.struct type with two members"),
                }
            }
            CxxOp::BranchConditional => {
                let cond = self.operand()?;
                self.resolve(&cond, &Type::I1)?;
                if self.p.eat("[") {
                    self.p.bare_attr()?;
                    self.p.expect(",")?;
                    self.p.bare_attr()?;
                    self.p.expect("]")?;
                }
                self.p.expect(",")?;
                self.successor()?;
                self.p.expect(",")?;
                self.successor()?;
            }
            CxxOp::Constant => {
                let a = self.p.attr()?;
                super::builtin::Builtin.attr(self.v, &a).or_else(|e| self.p.err(e.to_string()))?;
            }
            CxxOp::Switch => {
                self.operand()?;
                let t = self.colon_type()?;
                if !matches!(&t, Type::Integer { .. }) && !matches!(&t, Type::Extended(e) if !e.name.contains('.')) {
                    return self.p.err(alloc::format!("invalid kind of type specified: expected builtin.integer, but found '{t}'"));
                }
                self.p.expect(",")?;
                self.p.expect("[")?;
                if !self.p.eat_kw("default") {
                    return self.p.err("expected 'default'");
                }
                self.p.expect(":")?;
                self.successor()?;
                while self.p.eat(",") {
                    self.p.eat("-");
                    self.p.number::<u64>()?;
                    self.p.expect(":")?;
                    self.successor()?;
                }
                self.p.expect("]")?;
            }
        }
        Ok(())
    }
}

/// The SPIR-V dialect's rules.
pub(super) struct Spirv;

impl Spirv {
    /// `!spirv.<mnemonic><body>`: why `mlir-opt` would not read it.
    fn why(opt: &MlirOpt, mnemonic: &str, body: Option<&str>, enclosing: &mut Vec<String>) -> Result<(), String> {
        let kind = Kind::try_from(mnemonic).map_err(|()| alloc::format!("unknown SPIR-V type: {mnemonic}"))?;
        // A type with no parameters: nothing may follow its keyword.
        if matches!(kind, Kind::Sampler | Kind::NamedBarrier) {
            return body.map_or(Ok(()), |b| Err(alloc::format!("unexpected `{b}` after `spirv.{mnemonic}`")));
        }
        let body = body.ok_or_else(|| alloc::format!("`spirv.{mnemonic}` needs `<...>`"))?;
        let mut s = SpirvText { p: Parser::new(body, opt), enclosing };
        s.read(kind)
            .and_then(|()| {
                s.p.ws();
                if s.p.rest().is_empty() { Ok(()) } else { s.p.err("expected end of the type") }
            })
            .map_err(|e| e.placed(body).to_string())
    }
}

impl DialectRules for Spirv {
    #[inline]
    fn namespace(&self) -> &'static str {
        "spirv"
    }

    fn ty(&self, v: &Verifier<'_>, t: &Type<'_>) -> Result<(), Invalid> {
        let Type::Extended(e) = t else { return Ok(()) };
        Self::why(v.opt, e.mnemonic(), e.body.as_deref(), &mut Vec::new()).map_err(|why| Invalid::DialectType { ty: t.to_string(), why })
    }

    /// A raw op with a C++ parser: its text as that parser reads it. Its trailing attribute
    /// dict and location are the generic reader's.
    fn op(&self, v: &Verifier<'_>, op: &crate::Operation<'_>) -> Result<(), Invalid> {
        let (Some(raw), Ok(kind)) = (&op.raw, CxxOp::try_from(&*op.name)) else { return Ok(()) };
        let mut text = String::new();
        let mut region = false;
        for piece in raw {
            match piece {
                crate::Piece::Text(t) => text.push_str(t),
                _ => {
                    region = true;
                    break;
                }
            }
        }
        let mut o = OpText { p: Parser::new(&text, v.opt), v };
        o.read(kind, region).map_err(|e| Invalid::DialectOp { op: op.name.to_string(), why: e.placed(&text).to_string() })
    }

    /// `spirv.Constant`'s: its value's type, or the type after `:` (`ConstantOp::parse`).
    fn raw_results<'x>(&self, v: &Verifier<'x>, op: &'x crate::Operation<'x>) -> Option<Vec<Type<'x>>> {
        if op.name != "spirv.Constant" {
            return None;
        }
        let [crate::Piece::Text(text)] = op.raw.as_deref()? else { return None };
        let mut p = Parser::new(text, v.opt);
        let ty = match p.attr().ok()? {
            Attribute::Int { ty: Some(t), .. } | Attribute::Float { ty: Some(t), .. } | Attribute::Builtin { ty: Some(t), .. } if !matches!(&t, Type::Shaped(s) if s.kind == ShapedKind::Tensor) => t,
            Attribute::Bool(_) => Type::I1,
            _ => p.opt_ty().ok().flatten()?,
        };
        Some(alloc::vec![ty])
    }

    /// An enum attribute (`#spirv.scope<Device>`, an op's `<Device>`) names one of its cases
    /// (`FieldParser<Scope>`).
    fn attr(&self, _v: &Verifier<'_>, a: &Attribute<'_>) -> Result<(), Invalid> {
        let Attribute::Extended { ext, .. } = a else { return Ok(()) };
        let Some(e) = SpirvEnum::named(ext.mnemonic()) else { return Ok(()) };
        let body = ext.body.as_deref().unwrap_or("");
        let word = body.trim().strip_prefix('<').and_then(|b| b.strip_suffix('>')).unwrap_or(body).trim();
        match e.value(word) {
            Some(_) => Ok(()),
            None => Err(Invalid::DialectAttr { attr: a.to_string(), why: alloc::format!("expected ::mlir::spirv::{} to be one of: {}", e.name, e.listed()) }),
        }
    }
}
