//! SPIR-V dialect types (`!spirv.ptr<T, StorageClass>`, `!spirv.array<N x T>`,
//! `!spirv.struct<(...)>`, `!spirv.image<...>`, ...) as values (`SPIRVTypes.cpp`,
//! `SPIRVDialect.cpp`).
//!
//! A dialect type's body stays text in [`Extended`]; [`SpirvType`] reads and writes that text
//! exactly as `mlir-opt` prints it. Nested types print as themselves (`!spirv.` prefix
//! included); enum operands (storage classes, decorations, image dims, ...) keep their
//! `stringify*` names.

use alloc::borrow::Cow;
use alloc::boxed::Box;
use alloc::format;
use alloc::string::String;
use alloc::vec::Vec;

use crate::common::{Content, Extended, Type};
use crate::mliropt::MlirOpt;
use crate::parser::Parser;

/// A decoration with its value, if any: `NonWritable`, `Offset=4`.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct SpirvDecoration {
    pub name: String,
    /// The value as printed (`printAttributeWithoutType`).
    pub value: Option<String>,
}

/// One member of a `!spirv.struct`.
#[derive(Debug, Clone, PartialEq)]
pub struct SpirvMember<'a> {
    pub ty: Type<'a>,
    pub offset: Option<u32>,
    /// Sorted by decoration value, as `StructType` stores them.
    pub decorations: Vec<SpirvDecoration>,
}

/// One SPIR-V dialect type.
#[derive(Debug, Clone, PartialEq)]
pub enum SpirvType<'a> {
    Array { len: u32, elem: Box<Type<'a>>, stride: u32 },
    RuntimeArray { elem: Box<Type<'a>>, stride: u32 },
    Ptr { pointee: Box<Type<'a>>, storage: String },
    /// The sampled type, then `Dim`, `ImageDepthInfo`, `ImageArrayedInfo`, `ImageSamplingInfo`,
    /// `ImageSamplerUseInfo`, `ImageFormat`.
    Image { elem: Box<Type<'a>>, params: [String; 6] },
    SampledImage(Box<Type<'a>>),
    /// `members: None` is a name-only reference to an enclosing identified struct.
    Struct { name: Option<String>, members: Option<Vec<SpirvMember<'a>>>, decorations: Vec<SpirvDecoration> },
    CoopMatrix { rows: u32, cols: u32, elem: Box<Type<'a>>, scope: String, usage: String },
    Matrix { cols: u32, column: Box<Type<'a>> },
    /// `shape: None` is unranked; `-1` a dynamic dim.
    TensorArm { shape: Option<Vec<i64>>, elem: Box<Type<'a>> },
}

/// A cursor over a type body.
struct Cursor<'s> {
    s: &'s str,
}

impl<'s> Cursor<'s> {
    #[inline]
    fn ws(&mut self) {
        self.s = self.s.trim_start();
    }

    fn eat(&mut self, tok: &str) -> bool {
        self.ws();
        match self.s.strip_prefix(tok) {
            Some(rest) => {
                self.s = rest;
                true
            }
            None => false,
        }
    }

    #[inline]
    fn expect(&mut self, tok: &str) -> Option<()> {
        self.eat(tok).then_some(())
    }

    /// A bare identifier (`StorageBuffer`, `Dim2D`, `struct_name`).
    fn word(&mut self) -> Option<&'s str> {
        self.ws();
        let end = self.s.find(|c: char| !c.is_ascii_alphanumeric() && c != '_' && c != '.' && c != '$' && c != '-').unwrap_or(self.s.len());
        (end > 0).then(|| {
            let (w, rest) = self.s.split_at(end);
            self.s = rest;
            w
        })
    }

    fn int(&mut self) -> Option<i64> {
        self.ws();
        let end = self.s.find(|c: char| !c.is_ascii_digit() && c != '-').unwrap_or(self.s.len());
        let (n, rest) = self.s.split_at(end);
        let v = n.parse().ok()?;
        self.s = rest;
        Some(v)
    }

    /// A type, read by mlirformat's own parser.
    fn ty(&mut self) -> Option<Type<'static>> {
        self.ws();
        let opt = MlirOpt::new();
        let mut p = Parser::new(self.s, &opt);
        let ty = p.ty().ok().and_then(|t| Content::convert(&t).ok())?;
        self.s = &self.s[p.pos()..];
        Some(ty)
    }

    /// An attribute value's text, up to the next `,` / `]` / `>` at depth 0.
    fn value(&mut self) -> Option<&'s str> {
        self.ws();
        let mut depth = 0i32;
        let mut quote = false;
        for (i, c) in self.s.char_indices() {
            match c {
                '"' => quote = !quote,
                _ if quote => {}
                '<' | '(' | '[' | '{' => depth += 1,
                ',' | ']' | '>' | ')' | '}' if depth == 0 => {
                    let (v, rest) = self.s.split_at(i);
                    self.s = rest;
                    return Some(v.trim_end());
                }
                '>' | ')' | ']' | '}' => depth -= 1,
                _ => {}
            }
        }
        None
    }

    /// `Name` or `Name=value`.
    #[inline]
    fn decoration(&mut self) -> Option<SpirvDecoration> {
        let name = String::from(self.word()?);
        let value = if self.eat("=") { Some(String::from(self.value()?)) } else { None };
        Some(SpirvDecoration { name, value })
    }

    /// `[offset]`, `[offset, Deco, ...]` or `[Deco, ...]` after a struct member.
    fn member_decorations(&mut self, m: &mut SpirvMember<'static>) -> Option<()> {
        if !self.eat("[") {
            return Some(());
        }
        self.ws();
        if self.s.starts_with(|c: char| c.is_ascii_digit()) {
            m.offset = Some(u32::try_from(self.int()?).ok()?);
            if self.eat("]") {
                return Some(());
            }
            self.expect(",")?;
        }
        loop {
            m.decorations.push(self.decoration()?);
            if self.eat("]") {
                return Some(());
            }
            self.expect(",")?;
        }
    }

    /// `, stride=N` before the closing `>`.
    fn stride(&mut self) -> Option<u32> {
        if !self.eat(",") {
            return Some(0);
        }
        self.expect("stride")?;
        self.expect("=")?;
        u32::try_from(self.int()?).ok()
    }

    fn parse(&mut self, mnemonic: &str) -> Option<SpirvType<'static>> {
        let ty = match mnemonic {
            "array" => {
                let len = u32::try_from(self.int()?).ok()?;
                self.expect("x")?;
                let elem = self.ty()?.into();
                SpirvType::Array { len, elem, stride: self.stride()? }
            }
            "rtarray" => {
                let elem = self.ty()?.into();
                SpirvType::RuntimeArray { elem, stride: self.stride()? }
            }
            "ptr" => {
                let pointee = self.ty()?.into();
                self.expect(",")?;
                SpirvType::Ptr { pointee, storage: String::from(self.word()?) }
            }
            "image" => {
                let elem = self.ty()?.into();
                let mut params: [String; 6] = Default::default();
                for p in &mut params {
                    self.expect(",")?;
                    *p = String::from(self.word()?);
                }
                SpirvType::Image { elem, params }
            }
            "sampled_image" => SpirvType::SampledImage(self.ty()?.into()),
            "struct" => {
                self.ws();
                let mut name = None;
                if !self.s.starts_with('(') {
                    name = Some(String::from(self.word()?));
                    if !self.eat(",") {
                        return Some(SpirvType::Struct { name, members: None, decorations: Vec::new() });
                    }
                }
                self.expect("(")?;
                let mut members = Vec::new();
                if !self.eat(")") {
                    loop {
                        let mut m = SpirvMember { ty: self.ty()?, offset: None, decorations: Vec::new() };
                        self.member_decorations(&mut m)?;
                        members.push(m);
                        if self.eat(")") {
                            break;
                        }
                        self.expect(",")?;
                    }
                }
                let mut decorations = Vec::new();
                while self.eat(",") {
                    decorations.push(self.decoration()?);
                }
                SpirvType::Struct { name, members: Some(members), decorations }
            }
            "coopmatrix" => {
                let rows = u32::try_from(self.int()?).ok()?;
                self.expect("x")?;
                let cols = u32::try_from(self.int()?).ok()?;
                self.expect("x")?;
                let elem = self.ty()?.into();
                self.expect(",")?;
                let scope = String::from(self.word()?);
                self.expect(",")?;
                SpirvType::CoopMatrix { rows, cols, elem, scope, usage: String::from(self.word()?) }
            }
            "matrix" => {
                let cols = u32::try_from(self.int()?).ok()?;
                self.expect("x")?;
                SpirvType::Matrix { cols, column: self.ty()?.into() }
            }
            "arm.tensor" => {
                let mut shape = Some(Vec::new());
                loop {
                    self.ws();
                    if self.eat("*") {
                        shape = None;
                    } else if self.eat("?") {
                        shape.as_mut()?.push(-1);
                    } else if self.s.starts_with(|c: char| c.is_ascii_digit()) {
                        shape.as_mut()?.push(self.int()?);
                    } else {
                        break;
                    }
                    self.expect("x")?;
                }
                SpirvType::TensorArm { shape, elem: self.ty()?.into() }
            }
            _ => return None,
        };
        self.expect(">")?;
        self.ws();
        self.s.is_empty().then_some(ty)
    }
}

impl<'a> SpirvType<'a> {
    #[inline]
    pub fn ptr(pointee: Type<'a>, storage: &str) -> Type<'a> {
        SpirvType::Ptr { pointee: pointee.into(), storage: String::from(storage) }.into()
    }

    #[inline]
    pub fn array(len: u32, elem: Type<'a>, stride: u32) -> Type<'a> {
        SpirvType::Array { len, elem: elem.into(), stride }.into()
    }

    #[inline]
    pub fn rtarray(elem: Type<'a>, stride: u32) -> Type<'a> {
        SpirvType::RuntimeArray { elem: elem.into(), stride }.into()
    }

    /// The mnemonic (`ptr`, `struct`, ...) and the body between `<` and `>`.
    fn parts(&self) -> (&'static str, String) {
        let decos = |ds: &[SpirvDecoration]| -> Vec<String> {
            ds.iter()
                .map(|d| match &d.value {
                    Some(v) => format!("{}={v}", d.name),
                    None => d.name.clone(),
                })
                .collect()
        };
        match self {
            SpirvType::Array { len, elem, stride: 0 } => ("array", format!("{len} x {elem}")),
            SpirvType::Array { len, elem, stride } => ("array", format!("{len} x {elem}, stride={stride}")),
            SpirvType::RuntimeArray { elem, stride: 0 } => ("rtarray", format!("{elem}")),
            SpirvType::RuntimeArray { elem, stride } => ("rtarray", format!("{elem}, stride={stride}")),
            SpirvType::Ptr { pointee, storage } => ("ptr", format!("{pointee}, {storage}")),
            SpirvType::Image { elem, params } => ("image", format!("{elem}, {}", params.join(", "))),
            SpirvType::SampledImage(t) => ("sampled_image", format!("{t}")),
            SpirvType::Struct { name, members, decorations } => {
                let mut s = String::new();
                if let Some(n) = name {
                    s.push_str(n);
                    let Some(_) = members else { return ("struct", s) };
                    s.push_str(", ");
                }
                let ms: Vec<String> = members
                    .as_deref()
                    .unwrap_or(&[])
                    .iter()
                    .map(|m| {
                        let mut parts: Vec<String> = m.offset.iter().map(|o| format!("{o}")).collect();
                        parts.extend(decos(&m.decorations));
                        if parts.is_empty() { format!("{}", m.ty) } else { format!("{} [{}]", m.ty, parts.join(", ")) }
                    })
                    .collect();
                s.push_str(&format!("({})", ms.join(", ")));
                for d in decos(decorations) {
                    s.push_str(&format!(", {d}"));
                }
                ("struct", s)
            }
            SpirvType::CoopMatrix { rows, cols, elem, scope, usage } => ("coopmatrix", format!("{rows}x{cols}x{elem}, {scope}, {usage}")),
            SpirvType::Matrix { cols, column } => ("matrix", format!("{cols} x {column}")),
            SpirvType::TensorArm { shape, elem } => {
                let dims: Vec<String> = shape.as_deref().unwrap_or(&[]).iter().map(|d| if *d < 0 { String::from("?") } else { format!("{d}") }).collect();
                let mut s = dims.join("x");
                if shape.is_none() {
                    s.push('*');
                }
                ("arm.tensor", format!("{s}x{elem}"))
            }
        }
    }

    /// The element type of a composite (`CompositeType::getElementType(0)`): an array's or a
    /// matrix's element, a struct's first member.
    pub fn element(&self) -> Option<&Type<'a>> {
        match self {
            SpirvType::Array { elem, .. } | SpirvType::RuntimeArray { elem, .. } | SpirvType::CoopMatrix { elem, .. } | SpirvType::TensorArm { elem, .. } => Some(elem),
            SpirvType::Matrix { column, .. } => Some(column),
            SpirvType::Struct { members: Some(ms), .. } => ms.first().map(|m| &m.ty),
            _ => None,
        }
    }
}

impl<'a> From<SpirvType<'a>> for Type<'a> {
    #[inline]
    fn from(t: SpirvType<'a>) -> Self {
        let (m, body) = t.parts();
        Type::Extended(Extended { name: Cow::Owned(format!("spirv.{m}")), body: Some(Cow::Owned(format!("<{body}>"))), params: Vec::new() })
    }
}

impl TryFrom<&Type<'_>> for SpirvType<'static> {
    type Error = ();

    /// Reads the body text into a type that owns everything.
    fn try_from(t: &Type<'_>) -> Result<Self, ()> {
        let Type::Extended(e) = t else { return Err(()) };
        let m = e.name.strip_prefix("spirv.").ok_or(())?;
        let body = e.body.as_deref().and_then(|b| b.strip_prefix('<')).ok_or(())?;
        Cursor { s: body }.parse(m).ok_or(())
    }
}
