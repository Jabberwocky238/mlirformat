//! `bufferization` 里格式引擎写不出的 op，手写后注入（`MlirOpt::upstream`），`bufferization.gen.rs` 不动。
use crate::common::{Op, Parse, Print, Type, Value};
use crate::generator::{Printer, Sep};
use crate::mlir;
use crate::parser::{Parser, R};
use alloc::vec::Vec;
use core::fmt::{self, Write};

/// `bufferization.materialize_in_destination %src in restrict writable %dest : (T, U) -> R`。
///
/// ODS 的格式是 `$source `in` (`restrict` $restrict^)? (`writable` $writable^)? $dest attr-dict `:`
/// functional-type(operands, results)`；格式引擎不认 `functional-type(operands, results)`，手写。dest 是张量时有一个结果
/// （`-> tensor<…>`），是 memref 时没有（`-> ()`）。
#[mlir::op("bufferization.materialize_in_destination", custom, results(result))]
pub struct MaterializeInDestination<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    #[slot(dest_ty)]
    pub dest: Value<'a>,
    pub restrict: bool,
    pub writable: bool,
    pub source_ty: Type<'a>,
    pub dest_ty: Type<'a>,
    pub result: Vec<Type<'a>>,
}

impl Print for MaterializeInDestination<'_> {
    fn print(&self, p: &mut Printer<'_, '_>) -> fmt::Result {
        p.op_name(Self::NAME)?;
        write!(p, " {} in", self.source)?;
        if self.restrict {
            p.write_str(" restrict")?;
        }
        if self.writable {
            p.write_str(" writable")?;
        }
        write!(p, " {}", self.dest)?;
        p.attr_dict("", &self.attrs, &[])?;
        write!(p, " : ({}, {}) -> ", self.source_ty, self.dest_ty)?;
        match self.result.as_slice() {
            [one] if !matches!(one, Type::Function(_)) => write!(p, "{one}"),
            many => write!(p, "({})", Sep(many, ", ")),
        }
    }
}

impl Parse for MaterializeInDestination<'_> {
    fn parse(p: &mut Parser<'_, '_>) -> R<Self> {
        let source = p.value()?;
        p.expect_lit("in")?;
        let restrict = p.eat_kw("restrict");
        let writable = p.eat_kw("writable");
        let dest = p.value()?;
        let attrs = p.opt_dict()?;
        p.expect(":")?;
        let ft = p.fn_ty()?;
        let [source_ty, dest_ty]: [Type<'_>; 2] = ft.inputs.try_into().or_else(|_| p.err("materialize_in_destination 要两个操作数类型"))?;
        let op = MaterializeInDestination { source, dest, restrict, writable, source_ty, dest_ty, result: ft.results, attrs, loc: p.opt_loc()? };
        Self::owned(op, p)
    }
}
