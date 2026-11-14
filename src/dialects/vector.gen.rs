#![allow(non_camel_case_types, unused_imports, clippy::all, rustdoc::all)]

use mlirformat::{mlir, Attribute, Region, Str, Type, Value, __Vec as Vec};

#[mlir::op("vector.vscale", format = "attr-dict", results(res))]
pub struct VectorScaleOp<'a> {
    #[dtype(is = index)]
    pub res: Type<'a>,
}

#[mlir::op("vector.bitcast", format = "$source attr-dict `:` type($source) `to` type($result)", results(result))]
pub struct BitCastOp<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    pub source_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("vector.broadcast", format = "$source attr-dict `:` type($source) `to` type($vector)", results(vector))]
pub struct BroadcastOp<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    pub source_ty: Type<'a>,
    pub vector: Type<'a>,
}

#[mlir::op("vector.compressstore", format = "$base `[` $indices `]` `,` $mask `,` $valueToStore attr-dict `:` type($base) `,` type($mask) `,` type($valueToStore)")]
pub struct CompressStoreOp<'a> {
    #[slot(base_ty)]
    pub base: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(value_to_store_ty, name = "valueToStore")]
    pub value_to_store: Value<'a>,
    #[attr(int = "i64")]
    pub alignment: Option<Attribute<'a>>,
    pub base_ty: Type<'a>,
    #[dtype(is = index)]
    pub indices_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    pub value_to_store_ty: Type<'a>,
}

#[mlir::op("vector.constant_mask", format = "$mask_dim_sizes attr-dict `:` qualified(type($result))", results(result))]
pub struct ConstantMaskOp<'a> {
    #[attr(dense = "i64")]
    pub mask_dim_sizes: Attribute<'a>,
    pub result: Type<'a>,
}

#[mlir::op("vector.contract", results(result))]
pub struct ContractionOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[slot(acc_ty)]
    pub acc: Value<'a>,
    pub indexing_maps: Attribute<'a>,
    pub iterator_types: Attribute<'a>,
    #[attr(dialect = "vector.kind", default = "<add>")]
    pub kind: Option<Attribute<'a>>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub lhs_ty: Type<'a>,
    pub rhs_ty: Type<'a>,
    pub acc_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("vector.create_mask", format = "$mask_dim_sizes attr-dict `:` qualified(type($result))", results(result))]
pub struct CreateMaskOp<'a> {
    #[slot(mask_dim_sizes_ty)]
    pub mask_dim_sizes: Vec<Value<'a>>,
    #[dtype(is = index)]
    pub mask_dim_sizes_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("vector.deinterleave", format = "$source attr-dict `:` type($source) `->` type($res1)", results(res1, res2))]
pub struct DeinterleaveOp<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    pub source_ty: Type<'a>,
    pub res1: Type<'a>,
    #[dtype(eq = res1)]
    pub res2: Type<'a>,
}

#[mlir::op("vector.expandload", format = "$base `[` $indices `]` `,` $mask `,` $pass_thru attr-dict `:` type($base) `,` type($mask) `,` type($pass_thru) `into` type($result)", results(result))]
pub struct ExpandLoadOp<'a> {
    #[slot(base_ty)]
    pub base: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(pass_thru_ty)]
    pub pass_thru: Value<'a>,
    #[attr(int = "i64")]
    pub alignment: Option<Attribute<'a>>,
    pub base_ty: Type<'a>,
    #[dtype(is = index)]
    pub indices_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    pub pass_thru_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("vector.extract", format = "$source `` custom<DynamicIndexList>($dynamic_position, $static_position) attr-dict `:` type($result) `from` type($source)", results(result))]
pub struct ExtractOp<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    #[slot(dynamic_position_ty)]
    pub dynamic_position: Vec<Value<'a>>,
    #[attr(dense = "i64")]
    pub static_position: Attribute<'a>,
    pub source_ty: Type<'a>,
    #[dtype(is = index)]
    pub dynamic_position_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("vector.extract_strided_slice", format = "$source attr-dict `:` type($source) `to` qualified(type($result))", results(result))]
pub struct ExtractStridedSliceOp<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    pub offsets: Attribute<'a>,
    pub sizes: Attribute<'a>,
    pub strides: Attribute<'a>,
    pub source_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("vector.fma", format = "$lhs `,` $rhs `,` $acc attr-dict `:` type($lhs)", results(result))]
pub struct FMAOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    #[slot(result)]
    pub acc: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("vector.from_elements", format = "$elements attr-dict `:` type($dest)", results(dest))]
pub struct FromElementsOp<'a> {
    #[slot(elements_ty)]
    pub elements: Vec<Value<'a>>,
    #[dtype(el = dest)]
    pub elements_ty: Vec<Type<'a>>,
    pub dest: Type<'a>,
}

#[mlir::op("vector.gather", format = "$base `[` $offsets `]` `[` $indices `]` `,` $mask `,` $pass_thru attr-dict `:` type($base) `,` type($indices) `,` type($mask) `,` type($pass_thru) `into` type($result)", results(result))]
pub struct GatherOp<'a> {
    #[slot(base_ty)]
    pub base: Value<'a>,
    #[slot(offsets_ty)]
    pub offsets: Vec<Value<'a>>,
    #[slot(indices_ty)]
    pub indices: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(pass_thru_ty)]
    pub pass_thru: Value<'a>,
    #[attr(int = "i64")]
    pub alignment: Option<Attribute<'a>>,
    pub base_ty: Type<'a>,
    #[dtype(is = index)]
    pub offsets_ty: Type<'a>,
    pub indices_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    pub pass_thru_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("vector.insert", format = "$valueToStore `,` $dest custom<DynamicIndexList>($dynamic_position, $static_position) attr-dict `:` type($valueToStore) `into` type($dest)", results(result))]
pub struct InsertOp<'a> {
    #[slot(value_to_store_ty, name = "valueToStore")]
    pub value_to_store: Value<'a>,
    #[slot(result)]
    pub dest: Value<'a>,
    #[slot(dynamic_position_ty)]
    pub dynamic_position: Vec<Value<'a>>,
    #[attr(dense = "i64")]
    pub static_position: Attribute<'a>,
    pub value_to_store_ty: Type<'a>,
    #[dtype(is = index)]
    pub dynamic_position_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("vector.insert_strided_slice", format = "$valueToStore `,` $dest attr-dict `:` type($valueToStore) `into` type($dest)", results(result))]
pub struct InsertStridedSliceOp<'a> {
    #[slot(value_to_store_ty, name = "valueToStore")]
    pub value_to_store: Value<'a>,
    #[slot(result)]
    pub dest: Value<'a>,
    pub offsets: Attribute<'a>,
    pub strides: Attribute<'a>,
    pub value_to_store_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("vector.interleave", format = "$lhs `,` $rhs attr-dict `:` type($lhs) `->` type($result)", results(result))]
pub struct InterleaveOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(lhs_ty)]
    pub rhs: Value<'a>,
    pub lhs_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("vector.load", format = "$base `[` $indices `]` attr-dict `:` type($base) `,` type($result)", results(result))]
pub struct LoadOp<'a> {
    #[slot(base_ty)]
    pub base: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    #[attr(default = "false", optional)]
    pub nontemporal: Option<Attribute<'a>>,
    #[attr(int = "i64")]
    pub alignment: Option<Attribute<'a>>,
    pub base_ty: Type<'a>,
    #[dtype(is = index)]
    pub indices_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("vector.mask", results(results))]
pub struct MaskOp<'a> {
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(passthru_ty)]
    pub passthru: Vec<Value<'a>>,
    #[region(name = "maskRegion")]
    pub mask_region: Region<'a>,
    pub mask_ty: Type<'a>,
    pub passthru_ty: Vec<Type<'a>>,
    pub results: Vec<Type<'a>>,
}

#[mlir::op("vector.maskedload", format = "$base `[` $indices `]` `,` $mask `,` $pass_thru attr-dict `:` type($base) `,` type($mask) `,` type($pass_thru) `into` type($result)", results(result))]
pub struct MaskedLoadOp<'a> {
    #[slot(base_ty)]
    pub base: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(pass_thru_ty)]
    pub pass_thru: Value<'a>,
    #[attr(int = "i64")]
    pub alignment: Option<Attribute<'a>>,
    pub base_ty: Type<'a>,
    #[dtype(is = index)]
    pub indices_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    pub pass_thru_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("vector.maskedstore", format = "$base `[` $indices `]` `,` $mask `,` $valueToStore attr-dict `:` type($base) `,` type($mask) `,` type($valueToStore)")]
pub struct MaskedStoreOp<'a> {
    #[slot(base_ty)]
    pub base: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(value_to_store_ty, name = "valueToStore")]
    pub value_to_store: Value<'a>,
    #[attr(int = "i64")]
    pub alignment: Option<Attribute<'a>>,
    pub base_ty: Type<'a>,
    #[dtype(is = index)]
    pub indices_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    pub value_to_store_ty: Type<'a>,
}

#[mlir::op("vector.multi_reduction", format = "$kind `,` $source `,` $acc attr-dict $reduction_dims `:` type($source) `to` type($dest)", results(dest))]
pub struct MultiDimReductionOp<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    #[slot(dest)]
    pub acc: Value<'a>,
    #[attr(dialect = "vector.kind")]
    pub kind: Attribute<'a>,
    #[attr(dense = "i64")]
    pub reduction_dims: Attribute<'a>,
    pub source_ty: Type<'a>,
    pub dest: Type<'a>,
}

#[mlir::op("vector.outerproduct", results(result))]
pub struct OuterProductOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[slot(acc_ty)]
    pub acc: Vec<Value<'a>>,
    #[attr(dialect = "vector.kind", default = "<add>")]
    pub kind: Option<Attribute<'a>>,
    pub lhs_ty: Type<'a>,
    pub rhs_ty: Type<'a>,
    pub acc_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("vector.print", format = "($source^ `:` type($source))? oilist( `str` $stringLiteral | `punctuation` $punctuation) attr-dict")]
pub struct PrintOp<'a> {
    #[slot(source_ty)]
    pub source: Vec<Value<'a>>,
    #[attr(dialect = "vector.punctuation", default = "<newline>")]
    pub punctuation: Option<Attribute<'a>>,
    #[attr(name = "stringLiteral")]
    pub string_literal: Option<Attribute<'a>>,
    pub source_ty: Vec<Type<'a>>,
}

#[mlir::op("vector.reduction", format = "$kind `,` $vector (`,` $acc^)? (`fastmath` `` $fastmath^)? attr-dict `:` type($vector) `into` type($dest)", results(dest))]
pub struct ReductionOp<'a> {
    #[slot(vector_ty)]
    pub vector: Value<'a>,
    #[slot(dest)]
    pub acc: Vec<Value<'a>>,
    #[attr(dialect = "vector.kind")]
    pub kind: Attribute<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub vector_ty: Type<'a>,
    pub dest: Type<'a>,
}

#[mlir::op("vector.scalable.extract", format = "$source `[` $pos `]` attr-dict `:` type($result) `from` type($source)", results(result))]
pub struct ScalableExtractOp<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    #[attr(int = "i64")]
    pub pos: Attribute<'a>,
    pub source_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("vector.scalable.insert", format = "$valueToStore `,` $dest `[` $pos `]` attr-dict `:` type($valueToStore) `into` type($dest)", results(result))]
pub struct ScalableInsertOp<'a> {
    #[slot(value_to_store_ty, name = "valueToStore")]
    pub value_to_store: Value<'a>,
    #[slot(result)]
    pub dest: Value<'a>,
    #[attr(int = "i64")]
    pub pos: Attribute<'a>,
    pub value_to_store_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("vector.scan", format = "$kind `,` $source `,` $initial_value attr-dict `:` type($source) `,` type($initial_value)", results(dest, accumulated_value))]
pub struct ScanOp<'a> {
    #[slot(dest)]
    pub source: Value<'a>,
    #[slot(accumulated_value)]
    pub initial_value: Value<'a>,
    #[attr(dialect = "vector.kind")]
    pub kind: Attribute<'a>,
    #[attr(int = "i64")]
    pub reduction_dim: Attribute<'a>,
    pub inclusive: Attribute<'a>,
    pub dest: Type<'a>,
    pub accumulated_value: Type<'a>,
}

#[mlir::op("vector.scatter", format = "$base `[` $offsets `]` `[` $indices `]` `,` $mask `,` $valueToStore attr-dict `:` type($base) `,` type($indices) `,` type($mask) `,` type($valueToStore) (`->` type($result)^)?", results(result))]
pub struct ScatterOp<'a> {
    #[slot(base_ty)]
    pub base: Value<'a>,
    #[slot(offsets_ty)]
    pub offsets: Vec<Value<'a>>,
    #[slot(indices_ty)]
    pub indices: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(value_to_store_ty, name = "valueToStore")]
    pub value_to_store: Value<'a>,
    #[attr(int = "i64")]
    pub alignment: Option<Attribute<'a>>,
    pub base_ty: Type<'a>,
    #[dtype(is = index)]
    pub offsets_ty: Type<'a>,
    pub indices_ty: Type<'a>,
    pub mask_ty: Type<'a>,
    pub value_to_store_ty: Type<'a>,
    pub result: Vec<Type<'a>>,
}

#[mlir::op("vector.shape_cast", format = "$source attr-dict `:` type($source) `to` type($result)", results(result))]
pub struct ShapeCastOp<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    pub source_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("vector.shuffle", results(vector))]
pub struct ShuffleOp<'a> {
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

#[mlir::op("vector.step", format = "attr-dict `:` type($result)", results(result))]
pub struct StepOp<'a> {
    pub result: Type<'a>,
}

#[mlir::op("vector.store", format = "$valueToStore `,` $base `[` $indices `]` attr-dict `:` type($base) `,` type($valueToStore)")]
pub struct StoreOp<'a> {
    #[slot(value_to_store_ty, name = "valueToStore")]
    pub value_to_store: Value<'a>,
    #[slot(base_ty)]
    pub base: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    #[attr(default = "false", optional)]
    pub nontemporal: Option<Attribute<'a>>,
    #[attr(int = "i64")]
    pub alignment: Option<Attribute<'a>>,
    pub value_to_store_ty: Type<'a>,
    pub base_ty: Type<'a>,
    #[dtype(is = index)]
    pub indices_ty: Type<'a>,
}

#[mlir::op("vector.to_elements", format = "$source attr-dict `:` type($source)", results(elements))]
pub struct ToElementsOp<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    pub source_ty: Type<'a>,
    #[dtype(el = source_ty)]
    pub elements: Vec<Type<'a>>,
}

#[mlir::op("vector.transfer_read", results(vector))]
pub struct TransferReadOp<'a> {
    #[slot(base_ty)]
    pub base: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    #[slot(padding_ty)]
    pub padding: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Vec<Value<'a>>,
    pub permutation_map: Attribute<'a>,
    pub in_bounds: Attribute<'a>,
    pub base_ty: Type<'a>,
    #[dtype(is = index)]
    pub indices_ty: Type<'a>,
    pub padding_ty: Type<'a>,
    pub mask_ty: Vec<Type<'a>>,
    pub vector: Type<'a>,
}

#[mlir::op("vector.transfer_write", results(result))]
pub struct TransferWriteOp<'a> {
    #[slot(value_to_store_ty, name = "valueToStore")]
    pub value_to_store: Value<'a>,
    #[slot(base_ty)]
    pub base: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    #[slot(mask_ty)]
    pub mask: Vec<Value<'a>>,
    pub permutation_map: Attribute<'a>,
    pub in_bounds: Attribute<'a>,
    pub value_to_store_ty: Type<'a>,
    pub base_ty: Type<'a>,
    #[dtype(is = index)]
    pub indices_ty: Type<'a>,
    pub mask_ty: Vec<Type<'a>>,
    pub result: Vec<Type<'a>>,
}

#[mlir::op("vector.transpose", format = "$vector `,` $permutation attr-dict `:` type($vector) `to` type($result)", results(result))]
pub struct TransposeOp<'a> {
    #[slot(vector_ty)]
    pub vector: Value<'a>,
    #[attr(dense = "i64")]
    pub permutation: Attribute<'a>,
    pub vector_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("vector.type_cast", format = "$memref attr-dict `:` type($memref) `to` type($result)", results(result))]
pub struct TypeCastOp<'a> {
    #[slot(memref_ty)]
    pub memref: Value<'a>,
    pub memref_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("vector.yield", format = "attr-dict ($operands^ `:` type($operands))?")]
pub struct YieldOp<'a> {
    #[slot(operands_ty)]
    pub operands: Vec<Value<'a>>,
    pub operands_ty: Vec<Type<'a>>,
}

#[mlir::dialect(
    "vector",
    ops = [VectorScaleOp, BitCastOp, BroadcastOp, CompressStoreOp, ConstantMaskOp, ContractionOp, CreateMaskOp, DeinterleaveOp, ExpandLoadOp, ExtractOp, ExtractStridedSliceOp, FMAOp, FromElementsOp, GatherOp, InsertOp, InsertStridedSliceOp, InterleaveOp, LoadOp, MaskOp, MaskedLoadOp, MaskedStoreOp, MultiDimReductionOp, OuterProductOp, PrintOp, ReductionOp, ScalableExtractOp, ScalableInsertOp, ScanOp, ScatterOp, ShapeCastOp, ShuffleOp, StepOp, StoreOp, ToElementsOp, TransferReadOp, TransferWriteOp, TransposeOp, TypeCastOp, YieldOp],
    dependents = ["arith", "ub"],
    materializer
)]
pub struct VectorDialect;
