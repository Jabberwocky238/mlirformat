#![allow(non_camel_case_types, unused_imports, clippy::all, rustdoc::all)]

use mlirformat::{mlir, Attribute, Region, Str, Type, Value, __Vec as Vec};

#[mlir::op("affine.apply", results(result))]
pub struct AffineApplyOp<'a> {
    #[slot(map_operands_ty, name = "mapOperands")]
    pub map_operands: Vec<Value<'a>>,
    pub map: Attribute<'a>,
    #[dtype(is = index)]
    pub map_operands_ty: Type<'a>,
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::op("affine.delinearize_index", results(multi_index))]
pub struct AffineDelinearizeIndexOp<'a> {
    #[slot(linear_index_ty)]
    pub linear_index: Value<'a>,
    #[slot(dynamic_basis_ty)]
    pub dynamic_basis: Vec<Value<'a>>,
    #[attr(dense = "i64")]
    pub static_basis: Attribute<'a>,
    pub linear_index_ty: Type<'a>,
    #[dtype(is = index)]
    pub dynamic_basis_ty: Type<'a>,
    pub multi_index: Vec<Type<'a>>,
}

#[mlir::op("affine.dma_start")]
pub struct AffineDmaStartOp<'a> {
    #[slot(operand_ty)]
    pub operand: Vec<Value<'a>>,
    pub src_map: Attribute<'a>,
    pub dst_map: Attribute<'a>,
    pub tag_map: Attribute<'a>,
    pub operand_ty: Vec<Type<'a>>,
}

#[mlir::op("affine.dma_wait")]
pub struct AffineDmaWaitOp<'a> {
    #[slot(operand_ty)]
    pub operand: Vec<Value<'a>>,
    pub tag_map: Attribute<'a>,
    pub operand_ty: Vec<Type<'a>>,
}

#[mlir::op("affine.for", results(results))]
pub struct AffineForOp<'a> {
    #[slot(lower_bound_operands_ty, name = "lowerBoundOperands")]
    pub lower_bound_operands: Vec<Value<'a>>,
    #[slot(upper_bound_operands_ty, name = "upperBoundOperands")]
    pub upper_bound_operands: Vec<Value<'a>>,
    #[slot(inits_ty)]
    pub inits: Vec<Value<'a>>,
    #[attr(name = "lowerBoundMap")]
    pub lower_bound_map: Attribute<'a>,
    #[attr(name = "upperBoundMap")]
    pub upper_bound_map: Attribute<'a>,
    #[attr(int = "index")]
    pub step: Attribute<'a>,
    pub region: Region<'a>,
    #[dtype(is = index)]
    pub lower_bound_operands_ty: Type<'a>,
    #[dtype(is = index)]
    pub upper_bound_operands_ty: Type<'a>,
    pub inits_ty: Vec<Type<'a>>,
    pub results: Vec<Type<'a>>,
}

#[mlir::op("affine.if", results(results))]
pub struct AffineIfOp<'a> {
    #[slot(operand_ty)]
    pub operand: Vec<Value<'a>>,
    pub condition: Attribute<'a>,
    #[region(name = "thenRegion")]
    pub then_region: Region<'a>,
    #[region(name = "elseRegion")]
    pub else_region: Region<'a>,
    pub operand_ty: Vec<Type<'a>>,
    pub results: Vec<Type<'a>>,
}

#[mlir::op("affine.linearize_index", results(linear_index))]
pub struct AffineLinearizeIndexOp<'a> {
    #[slot(linear_index)]
    pub multi_index: Vec<Value<'a>>,
    #[slot(dynamic_basis_ty)]
    pub dynamic_basis: Vec<Value<'a>>,
    #[attr(dense = "i64")]
    pub static_basis: Attribute<'a>,
    pub disjoint: bool,
    #[dtype(is = index)]
    pub dynamic_basis_ty: Type<'a>,
    pub linear_index: Type<'a>,
}

#[mlir::op("affine.load", results(result))]
pub struct AffineLoadOp<'a> {
    #[slot(memref_ty)]
    pub memref: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    pub map: Attribute<'a>,
    pub memref_ty: Type<'a>,
    #[dtype(is = index)]
    pub indices_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("affine.max", results(result))]
pub struct AffineMaxOp<'a> {
    #[slot(operands_ty)]
    pub operands: Vec<Value<'a>>,
    pub map: Attribute<'a>,
    #[dtype(is = index)]
    pub operands_ty: Type<'a>,
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::op("affine.min", results(result))]
pub struct AffineMinOp<'a> {
    #[slot(operands_ty)]
    pub operands: Vec<Value<'a>>,
    pub map: Attribute<'a>,
    #[dtype(is = index)]
    pub operands_ty: Type<'a>,
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::op("affine.parallel", results(results))]
pub struct AffineParallelOp<'a> {
    #[slot(map_operands_ty, name = "mapOperands")]
    pub map_operands: Vec<Value<'a>>,
    pub reductions: Attribute<'a>,
    #[attr(name = "lowerBoundsMap")]
    pub lower_bounds_map: Attribute<'a>,
    #[attr(name = "lowerBoundsGroups")]
    pub lower_bounds_groups: Attribute<'a>,
    #[attr(name = "upperBoundsMap")]
    pub upper_bounds_map: Attribute<'a>,
    #[attr(name = "upperBoundsGroups")]
    pub upper_bounds_groups: Attribute<'a>,
    pub steps: Attribute<'a>,
    pub region: Region<'a>,
    #[dtype(is = index)]
    pub map_operands_ty: Type<'a>,
    pub results: Vec<Type<'a>>,
}

#[mlir::op("affine.prefetch")]
pub struct AffinePrefetchOp<'a> {
    #[slot(memref_ty)]
    pub memref: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    #[attr(name = "isWrite")]
    pub is_write: Attribute<'a>,
    #[attr(name = "localityHint", int = "i32")]
    pub locality_hint: Attribute<'a>,
    #[attr(name = "isDataCache")]
    pub is_data_cache: Attribute<'a>,
    pub map: Attribute<'a>,
    pub memref_ty: Type<'a>,
    #[dtype(is = index)]
    pub indices_ty: Type<'a>,
}

#[mlir::op("affine.store")]
pub struct AffineStoreOp<'a> {
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[slot(memref_ty)]
    pub memref: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    pub map: Attribute<'a>,
    pub value_ty: Type<'a>,
    pub memref_ty: Type<'a>,
    #[dtype(is = index)]
    pub indices_ty: Type<'a>,
}

#[mlir::op("affine.vector_load", results(result))]
pub struct AffineVectorLoadOp<'a> {
    #[slot(memref_ty)]
    pub memref: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    pub map: Attribute<'a>,
    pub memref_ty: Type<'a>,
    #[dtype(is = index)]
    pub indices_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("affine.vector_store")]
pub struct AffineVectorStoreOp<'a> {
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[slot(memref_ty)]
    pub memref: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    pub map: Attribute<'a>,
    pub value_ty: Type<'a>,
    pub memref_ty: Type<'a>,
    #[dtype(is = index)]
    pub indices_ty: Type<'a>,
}

#[mlir::op("affine.yield", format = "attr-dict ($operands^ `:` type($operands))?")]
pub struct AffineYieldOp<'a> {
    #[slot(operands_ty)]
    pub operands: Vec<Value<'a>>,
    pub operands_ty: Vec<Type<'a>>,
}

#[mlir::dialect(
    "affine",
    ops = [AffineApplyOp, AffineDelinearizeIndexOp, AffineDmaStartOp, AffineDmaWaitOp, AffineForOp, AffineIfOp, AffineLinearizeIndexOp, AffineLoadOp, AffineMaxOp, AffineMinOp, AffineParallelOp, AffinePrefetchOp, AffineStoreOp, AffineVectorLoadOp, AffineVectorStoreOp, AffineYieldOp],
    dependents = ["arith", "ub"],
    materializer
)]
pub struct AffineDialect;
