#![allow(non_camel_case_types, unused_imports, clippy::all, rustdoc::all)]

use mlirformat::{mlir, Attribute, Region, Str, Type, Value, __Vec as Vec};

#[mlir::op("cf.assert", format = "$arg `,` $msg attr-dict")]
pub struct AssertOp<'a> {
    #[slot(arg_ty)]
    pub arg: Value<'a>,
    pub msg: Attribute<'a>,
    #[dtype(is = i1)]
    pub arg_ty: Type<'a>,
}

#[mlir::op("cf.br", format = "$dest (`(` $destOperands^ `:` type($destOperands) `)`)? attr-dict")]
pub struct BranchOp<'a> {
    #[slot(dest_operands_ty, name = "destOperands")]
    pub dest_operands: Vec<Value<'a>>,
    #[successor]
    pub dest: Str<'a>,
    pub dest_operands_ty: Vec<Type<'a>>,
}

#[mlir::op("cf.cond_br", format = "$condition (`weights` `(` $branch_weights^ `)` )? `,` $trueDest (`(` $trueDestOperands^ `:` type($trueDestOperands) `)`)? `,` $falseDest (`(` $falseDestOperands^ `:` type($falseDestOperands) `)`)? attr-dict")]
pub struct CondBranchOp<'a> {
    #[slot(condition_ty)]
    pub condition: Value<'a>,
    #[slot(true_dest_operands_ty, name = "trueDestOperands")]
    pub true_dest_operands: Vec<Value<'a>>,
    #[slot(false_dest_operands_ty, name = "falseDestOperands")]
    pub false_dest_operands: Vec<Value<'a>>,
    #[attr(dense = "i32")]
    pub branch_weights: Option<Attribute<'a>>,
    #[successor(name = "trueDest")]
    pub true_dest: Str<'a>,
    #[successor(name = "falseDest")]
    pub false_dest: Str<'a>,
    #[dtype(is = i1)]
    pub condition_ty: Type<'a>,
    pub true_dest_operands_ty: Vec<Type<'a>>,
    pub false_dest_operands_ty: Vec<Type<'a>>,
}

#[mlir::op("cf.switch")]
pub struct SwitchOp<'a> {
    #[slot(flag_ty)]
    pub flag: Value<'a>,
    #[slot(default_operands_ty, name = "defaultOperands")]
    pub default_operands: Vec<Value<'a>>,
    #[slot(case_operands_ty, name = "caseOperands")]
    pub case_operands: Vec<Value<'a>>,
    pub case_values: Option<Attribute<'a>>,
    #[attr(dense = "i32")]
    pub case_operand_segments: Attribute<'a>,
    #[successor(name = "defaultDestination")]
    pub default_destination: Str<'a>,
    #[successor(name = "caseDestinations")]
    pub case_destinations: Vec<Str<'a>>,
    pub flag_ty: Type<'a>,
    pub default_operands_ty: Vec<Type<'a>>,
    pub case_operands_ty: Vec<Type<'a>>,
}

#[mlir::dialect(
    "cf",
    ops = [AssertOp, BranchOp, CondBranchOp, SwitchOp],
    dependents = ["arith"]
)]
pub struct CfDialect;
