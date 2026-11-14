#![allow(non_camel_case_types, unused_imports, clippy::all, rustdoc::all)]

use mlirformat::{mlir, Attribute, Region, Str, Type, Value, __Vec as Vec};

#[mlir::op("scf.condition", format = "`(` $condition `)` attr-dict ($args^ `:` type($args))?")]
pub struct ConditionOp<'a> {
    #[slot(condition_ty)]
    pub condition: Value<'a>,
    #[slot(args_ty)]
    pub args: Vec<Value<'a>>,
    #[dtype(is = i1)]
    pub condition_ty: Type<'a>,
    pub args_ty: Vec<Type<'a>>,
}

#[mlir::op("scf.execute_region", results(result))]
pub struct ExecuteRegionOp<'a> {
    pub no_inline: bool,
    pub region: Region<'a>,
    pub result: Vec<Type<'a>>,
}

#[mlir::op("scf.for", results(results))]
pub struct ForOp<'a> {
    #[slot(lower_bound_ty, name = "lowerBound")]
    pub lower_bound: Value<'a>,
    #[slot(lower_bound_ty, name = "upperBound")]
    pub upper_bound: Value<'a>,
    #[slot(lower_bound_ty)]
    pub step: Value<'a>,
    #[slot(init_args_ty, name = "initArgs")]
    pub init_args: Vec<Value<'a>>,
    #[attr(name = "unsignedCmp")]
    pub unsigned_cmp: bool,
    pub region: Region<'a>,
    pub lower_bound_ty: Type<'a>,
    pub init_args_ty: Vec<Type<'a>>,
    pub results: Vec<Type<'a>>,
}

#[mlir::op("scf.forall", results(results))]
pub struct ForallOp<'a> {
    #[slot(dynamic_lower_bound_ty, name = "dynamicLowerBound")]
    pub dynamic_lower_bound: Vec<Value<'a>>,
    #[slot(dynamic_upper_bound_ty, name = "dynamicUpperBound")]
    pub dynamic_upper_bound: Vec<Value<'a>>,
    #[slot(dynamic_step_ty, name = "dynamicStep")]
    pub dynamic_step: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    #[attr(name = "staticLowerBound", dense = "i64")]
    pub static_lower_bound: Attribute<'a>,
    #[attr(name = "staticUpperBound", dense = "i64")]
    pub static_upper_bound: Attribute<'a>,
    #[attr(name = "staticStep", dense = "i64")]
    pub static_step: Attribute<'a>,
    pub mapping: Option<Attribute<'a>>,
    pub region: Region<'a>,
    #[dtype(is = index)]
    pub dynamic_lower_bound_ty: Type<'a>,
    #[dtype(is = index)]
    pub dynamic_upper_bound_ty: Type<'a>,
    #[dtype(is = index)]
    pub dynamic_step_ty: Type<'a>,
    pub outputs_ty: Vec<Type<'a>>,
    pub results: Vec<Type<'a>>,
}

#[mlir::op("scf.if", results(results))]
pub struct IfOp<'a> {
    #[slot(condition_ty)]
    pub condition: Value<'a>,
    #[region(name = "thenRegion")]
    pub then_region: Region<'a>,
    #[region(name = "elseRegion")]
    pub else_region: Region<'a>,
    #[dtype(is = i1)]
    pub condition_ty: Type<'a>,
    pub results: Vec<Type<'a>>,
}

#[mlir::op("scf.forall.in_parallel")]
pub struct InParallelOp<'a> {
    pub region: Region<'a>,
}

#[mlir::op("scf.index_switch", results(results))]
pub struct IndexSwitchOp<'a> {
    #[slot(arg_ty)]
    pub arg: Value<'a>,
    #[attr(dense = "i64")]
    pub cases: Attribute<'a>,
    #[region(name = "defaultRegion")]
    pub default_region: Region<'a>,
    #[region(name = "caseRegions")]
    pub case_regions: Vec<Region<'a>>,
    #[dtype(is = index)]
    pub arg_ty: Type<'a>,
    pub results: Vec<Type<'a>>,
}

#[mlir::op("scf.parallel", results(results))]
pub struct ParallelOp<'a> {
    #[slot(lower_bound_ty, name = "lowerBound")]
    pub lower_bound: Vec<Value<'a>>,
    #[slot(upper_bound_ty, name = "upperBound")]
    pub upper_bound: Vec<Value<'a>>,
    #[slot(step_ty)]
    pub step: Vec<Value<'a>>,
    #[slot(init_vals_ty, name = "initVals")]
    pub init_vals: Vec<Value<'a>>,
    pub region: Region<'a>,
    #[dtype(is = index)]
    pub lower_bound_ty: Type<'a>,
    #[dtype(is = index)]
    pub upper_bound_ty: Type<'a>,
    #[dtype(is = index)]
    pub step_ty: Type<'a>,
    pub init_vals_ty: Vec<Type<'a>>,
    pub results: Vec<Type<'a>>,
}

#[mlir::op("scf.reduce", format = "(`(` $operands^ `:` type($operands) `)`)? $reductions attr-dict")]
pub struct ReduceOp<'a> {
    #[slot(operands_ty)]
    pub operands: Vec<Value<'a>>,
    pub reductions: Vec<Region<'a>>,
    pub operands_ty: Vec<Type<'a>>,
}

#[mlir::op("scf.reduce.return", format = "$result attr-dict `:` type($result)")]
pub struct ReduceReturnOp<'a> {
    #[slot(result_ty)]
    pub result: Value<'a>,
    pub result_ty: Type<'a>,
}

#[mlir::op("scf.while", results(results))]
pub struct WhileOp<'a> {
    #[slot(inits_ty)]
    pub inits: Vec<Value<'a>>,
    pub before: Region<'a>,
    pub after: Region<'a>,
    pub inits_ty: Vec<Type<'a>>,
    pub results: Vec<Type<'a>>,
}

#[mlir::op("scf.yield", format = "attr-dict ($results^ `:` type($results))?")]
pub struct YieldOp<'a> {
    #[slot(results_ty)]
    pub results: Vec<Value<'a>>,
    pub results_ty: Vec<Type<'a>>,
}

#[mlir::dialect(
    "scf",
    ops = [ConditionOp, ExecuteRegionOp, ForOp, ForallOp, IfOp, InParallelOp, IndexSwitchOp, ParallelOp, ReduceOp, ReduceReturnOp, WhileOp, YieldOp],
    dependents = ["arith"]
)]
pub struct ScfDialect;
