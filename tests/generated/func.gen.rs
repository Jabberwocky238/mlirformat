#![allow(non_camel_case_types, unused_imports, clippy::all, rustdoc::all)]

use mlirformat::{mlir, Attribute, Region, Str, Type, Value, __Vec as Vec};

#[mlir::op("func.call_indirect", results(results))]
pub struct CallIndirectOp<'a> {
    #[slot(callee_ty)]
    pub callee: Value<'a>,
    #[slot(callee_operands_ty)]
    pub callee_operands: Vec<Value<'a>>,
    pub arg_attrs: Option<Attribute<'a>>,
    pub res_attrs: Option<Attribute<'a>>,
    pub callee_ty: Type<'a>,
    pub callee_operands_ty: Vec<Type<'a>>,
    pub results: Vec<Type<'a>>,
}

#[mlir::op("func.call", format = "$callee `(` $operands `)` attr-dict `:` functional-type($operands, $result)", results(result))]
pub struct CallOp<'a> {
    #[slot(operands_ty)]
    pub operands: Vec<Value<'a>>,
    pub callee: Attribute<'a>,
    pub arg_attrs: Option<Attribute<'a>>,
    pub res_attrs: Option<Attribute<'a>>,
    pub no_inline: bool,
    pub operands_ty: Vec<Type<'a>>,
    pub result: Vec<Type<'a>>,
}

#[mlir::op("func.constant", format = "attr-dict $value `:` qualified(type($result))", results(result))]
pub struct ConstantOp<'a> {
    pub value: Attribute<'a>,
    pub result: Type<'a>,
}

#[mlir::op("func.func")]
pub struct FuncOp<'a> {
    #[attr(symbol)]
    pub sym_name: Attribute<'a>,
    pub function_type: Attribute<'a>,
    pub sym_visibility: Option<Attribute<'a>>,
    pub arg_attrs: Option<Attribute<'a>>,
    pub res_attrs: Option<Attribute<'a>>,
    pub no_inline: bool,
    pub body: Region<'a>,
}

#[mlir::op("func.return", format = "attr-dict ($operands^ `:` type($operands))?")]
pub struct ReturnOp<'a> {
    #[slot(operands_ty)]
    pub operands: Vec<Value<'a>>,
    pub operands_ty: Vec<Type<'a>>,
}

#[mlir::dialect(
    "func",
    ops = [CallIndirectOp, CallOp, ConstantOp, FuncOp, ReturnOp],
    materializer
)]
pub struct FuncDialect;
