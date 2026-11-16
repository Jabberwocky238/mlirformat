use crate::common::{Attribute, Dim, Op, Parse, Print, ShapedKind, Str, Type, Value};
use crate::generator::{Printer, Sep};
use crate::mlir;
use crate::parser::{Parser, R};
use alloc::boxed::Box;
use alloc::format;
use alloc::vec::Vec;
use core::fmt::{self, Write};

#[mlir::op("vector.shuffle", custom, results(vector))]
pub struct Shuffle<'a> {
    #[slot(v1_ty)]
    pub v1: Value<'a>,
    #[slot(v2_ty)]
    pub v2: Value<'a>,
    #[attr(dense = "i64")]
    pub mask: Attribute<'a>,
    pub v1_ty: Type<'a>,
    pub v2_ty: Type<'a>,
    pub vector: Type<'a>,
}

impl Shuffle<'_> {
    const MASK_BITS: u32 = 64;

    fn inferred<'a>(v1: &Type<'a>, mask: usize) -> Option<Type<'a>> {
        let Type::Shaped(s) = v1 else { return None };
        if s.kind != ShapedKind::Vector {
            return None;
        }
        let mut shape = Vec::from([Dim::Static(mask.max(1) as i64)]);
        shape.extend(s.shape.iter().flatten().skip(1).cloned());
        Some(Type::Shaped(Box::new(crate::common::Shaped { kind: ShapedKind::Vector, shape: Some(shape), elem: s.elem.clone(), extras: Vec::new() })))
    }
}

impl Print for Shuffle<'_> {
    fn print(&self, p: &mut Printer<'_, '_>) -> fmt::Result {
        let Attribute::DenseArray { values, .. } = &self.mask else { return self.print_generic(p) };
        if Self::inferred(&self.v1_ty, values.len()).as_ref() != Some(&self.vector) {
            return self.print_generic(p);
        }
        p.op_name(Self::NAME)?;
        write!(p, " {}, {} [{}]", self.v1, self.v2, Sep(values, ", "))?;
        p.attr_dict("", &self.attrs, &[])?;
        write!(p, " : {}, {}", self.v1_ty, self.v2_ty)
    }
}

impl Parse for Shuffle<'_> {
    fn parse(p: &mut Parser<'_, '_>) -> R<Self> {
        let v1 = p.value()?;
        p.expect(",")?;
        let v2 = p.value()?;
        p.expect("[")?;
        let values = p.list("]", |p| {
            let negative = p.eat("-");
            let n: i64 = p.number()?;
            Ok(Str::Owned(format!("{}", if negative { -n } else { n })))
        })?;
        let attrs = p.opt_dict()?;
        p.expect(":")?;
        let v1_ty = p.ty()?;
        p.expect(",")?;
        let v2_ty = p.ty()?;
        let Some(vector) = Self::inferred(&v1_ty, values.len()) else { return p.err(format!("vector.shuffle of {v1_ty}: expected a vector")) };
        let mask = Attribute::DenseArray { ty: Type::int(Self::MASK_BITS), values: values.into() };
        let op = Shuffle { v1, v2, mask, v1_ty, v2_ty, vector, attrs, loc: p.opt_loc()? };
        Self::owned(op, p)
    }
}
