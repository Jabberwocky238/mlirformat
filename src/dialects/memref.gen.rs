#![allow(non_camel_case_types, unused_imports, clippy::all, rustdoc::all)]

use mlirformat::{mlir, Attribute, Region, Str, Type, Value, __Vec as Vec};

#[derive(Debug, Clone, Copy, PartialEq, Eq, mlirformat::__serde::Serialize, mlirformat::__serde::Deserialize, mlir::Cases)]
#[serde(crate = "mlirformat::__serde")]
pub enum AtomicRMWKind {
    #[serde(rename = "addf")]
    Addf,
    #[serde(rename = "addi")]
    Addi,
    #[serde(rename = "andi")]
    Andi,
    #[serde(rename = "assign")]
    Assign,
    #[serde(rename = "maximumf")]
    Maximumf,
    #[serde(rename = "maxnumf")]
    Maxnumf,
    #[serde(rename = "maxs")]
    Maxs,
    #[serde(rename = "maxu")]
    Maxu,
    #[serde(rename = "minimumf")]
    Minimumf,
    #[serde(rename = "minnumf")]
    Minnumf,
    #[serde(rename = "mins")]
    Mins,
    #[serde(rename = "minu")]
    Minu,
    #[serde(rename = "mulf")]
    Mulf,
    #[serde(rename = "muli")]
    Muli,
    #[serde(rename = "ori")]
    Ori,
    #[serde(rename = "xori")]
    Xori,
}

#[mlir::op("memref.assume_alignment", format = "$memref `,` $alignment attr-dict `:` type($memref)", results(result))]
pub struct AssumeAlignmentOp<'a> {
    #[slot(result)]
    pub memref: Value<'a>,
    #[attr(int = "i32")]
    pub alignment: Attribute<'a>,
    pub result: Type<'a>,
}

#[mlir::op("memref.atomic_rmw", format = "$kind $value `,` $memref `[` $indices `]` attr-dict `:` `(` type($value) `,` type($memref) `)` `->` type($result)", results(result))]
pub struct AtomicRMWOp<'a> {
    #[slot(result)]
    pub value: Value<'a>,
    #[slot(memref_ty)]
    pub memref: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    #[attr(int = "i64")]
    pub kind: AtomicRMWKind,
    pub memref_ty: Type<'a>,
    #[dtype(is = index)]
    pub indices_ty: Type<'a>,
    #[dtype(el = memref_ty)]
    pub result: Type<'a>,
}

#[mlir::op("memref.atomic_yield", format = "$result attr-dict `:` type($result)")]
pub struct AtomicYieldOp<'a> {
    #[slot(result_ty)]
    pub result: Value<'a>,
    pub result_ty: Type<'a>,
}

#[mlir::op("memref.copy", format = "$source `,` $target attr-dict `:` type($source) `to` type($target)")]
pub struct CopyOp<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    #[slot(target_ty)]
    pub target: Value<'a>,
    pub source_ty: Type<'a>,
    pub target_ty: Type<'a>,
}

#[mlir::op("memref.distinct_objects", results(results))]
pub struct DistinctObjectsOp<'a> {
    #[slot(operands_ty)]
    pub operands: Vec<Value<'a>>,
    pub operands_ty: Vec<Type<'a>>,
    pub results: Vec<Type<'a>>,
}

#[mlir::op("memref.generic_atomic_rmw", results(result))]
pub struct GenericAtomicRMWOp<'a> {
    #[slot(memref_ty)]
    pub memref: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    pub atomic_body: Region<'a>,
    pub memref_ty: Type<'a>,
    #[dtype(is = index)]
    pub indices_ty: Type<'a>,
    #[dtype(el = memref_ty)]
    pub result: Type<'a>,
}

#[mlir::op("memref.load", format = "$memref `[` $indices `]` attr-dict `:` type($memref)", results(result))]
pub struct LoadOp<'a> {
    #[slot(memref_ty)]
    pub memref: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    #[attr(default = "false", optional)]
    pub nontemporal: Option<Attribute<'a>>,
    #[attr(int = "i64")]
    pub alignment: Option<Attribute<'a>>,
    #[attr(default = "false", optional)]
    pub invariant: Option<Attribute<'a>>,
    pub memref_ty: Type<'a>,
    #[dtype(is = index)]
    pub indices_ty: Type<'a>,
    #[dtype(el = memref_ty)]
    pub result: Type<'a>,
}

#[mlir::op("memref.alloc", format = "`(`$dynamicSizes`)` (`` `[` $symbolOperands^ `]`)? attr-dict `:` type($memref)", results(memref))]
pub struct AllocOp<'a> {
    #[slot(dynamic_sizes_ty, name = "dynamicSizes")]
    pub dynamic_sizes: Vec<Value<'a>>,
    #[slot(symbol_operands_ty, name = "symbolOperands")]
    pub symbol_operands: Vec<Value<'a>>,
    #[attr(int = "i64")]
    pub alignment: Option<Attribute<'a>>,
    #[dtype(is = index)]
    pub dynamic_sizes_ty: Type<'a>,
    #[dtype(is = index)]
    pub symbol_operands_ty: Type<'a>,
    pub memref: Type<'a>,
}

#[mlir::op("memref.alloca", format = "`(`$dynamicSizes`)` (`` `[` $symbolOperands^ `]`)? attr-dict `:` type($memref)", results(memref))]
pub struct AllocaOp<'a> {
    #[slot(dynamic_sizes_ty, name = "dynamicSizes")]
    pub dynamic_sizes: Vec<Value<'a>>,
    #[slot(symbol_operands_ty, name = "symbolOperands")]
    pub symbol_operands: Vec<Value<'a>>,
    #[attr(int = "i64")]
    pub alignment: Option<Attribute<'a>>,
    #[dtype(is = index)]
    pub dynamic_sizes_ty: Type<'a>,
    #[dtype(is = index)]
    pub symbol_operands_ty: Type<'a>,
    pub memref: Type<'a>,
}

#[mlir::op("memref.alloca_scope", results(results))]
pub struct AllocaScopeOp<'a> {
    #[region(name = "bodyRegion")]
    pub body_region: Region<'a>,
    pub results: Vec<Type<'a>>,
}

#[mlir::op("memref.alloca_scope.return", format = "attr-dict ($results^ `:` type($results))?")]
pub struct AllocaScopeReturnOp<'a> {
    #[slot(results_ty)]
    pub results: Vec<Value<'a>>,
    pub results_ty: Vec<Type<'a>>,
}

#[mlir::op("memref.cast", format = "$source attr-dict `:` type($source) `to` type($dest)", results(dest))]
pub struct CastOp<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    pub source_ty: Type<'a>,
    pub dest: Type<'a>,
}

#[mlir::op("memref.collapse_shape", format = "$src $reassociation attr-dict `:` type($src) `into` type($result)", results(result))]
pub struct CollapseShapeOp<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    pub reassociation: Attribute<'a>,
    pub src_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("memref.dealloc", format = "$memref attr-dict `:` type($memref)")]
pub struct DeallocOp<'a> {
    #[slot(memref_ty)]
    pub memref: Value<'a>,
    pub memref_ty: Type<'a>,
}

#[mlir::op("memref.dim", format = "attr-dict $source `,` $index `:` type($source)", results(result))]
pub struct DimOp<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    pub source_ty: Type<'a>,
    #[dtype(is = index)]
    pub index_ty: Type<'a>,
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::op("memref.dma_start")]
pub struct DmaStartOp<'a> {
    #[slot(operands_ty)]
    pub operands: Vec<Value<'a>>,
    pub operands_ty: Vec<Type<'a>>,
}

#[mlir::op("memref.dma_wait", format = "$tagMemRef `[` $tagIndices `]` `,` $numElements attr-dict `:` type($tagMemRef)")]
pub struct DmaWaitOp<'a> {
    #[slot(tag_mem_ref_ty, name = "tagMemRef")]
    pub tag_mem_ref: Value<'a>,
    #[slot(tag_indices_ty, name = "tagIndices")]
    pub tag_indices: Vec<Value<'a>>,
    #[slot(num_elements_ty, name = "numElements")]
    pub num_elements: Value<'a>,
    pub tag_mem_ref_ty: Type<'a>,
    #[dtype(is = index)]
    pub tag_indices_ty: Type<'a>,
    #[dtype(is = index)]
    pub num_elements_ty: Type<'a>,
}

#[mlir::op("memref.expand_shape", format = "$src $reassociation `output_shape` custom<DynamicIndexList>($output_shape, $static_output_shape) attr-dict `:` type($src) `into` type($result)", results(result))]
pub struct ExpandShapeOp<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(output_shape_ty)]
    pub output_shape: Vec<Value<'a>>,
    pub reassociation: Attribute<'a>,
    #[attr(dense = "i64")]
    pub static_output_shape: Attribute<'a>,
    pub src_ty: Type<'a>,
    #[dtype(is = index)]
    pub output_shape_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("memref.extract_aligned_pointer_as_index", format = "$source `:` type($source) `->` qualified(type($aligned_pointer)) attr-dict", results(aligned_pointer))]
pub struct ExtractAlignedPointerAsIndexOp<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    pub source_ty: Type<'a>,
    #[dtype(is = index)]
    pub aligned_pointer: Type<'a>,
}

#[mlir::op("memref.extract_strided_metadata", results(base_buffer, offset, sizes, strides))]
pub struct ExtractStridedMetadataOp<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    pub source_ty: Type<'a>,
    pub base_buffer: Type<'a>,
    #[dtype(is = index)]
    pub offset: Type<'a>,
    #[dtype(is = index)]
    pub sizes: Type<'a>,
    #[dtype(is = index)]
    pub strides: Type<'a>,
}

#[mlir::op("memref.get_global", format = "$name `:` type($result) attr-dict", results(result))]
pub struct GetGlobalOp<'a> {
    pub name: Attribute<'a>,
    pub result: Type<'a>,
}

#[mlir::op("memref.global")]
pub struct GlobalOp<'a> {
    #[attr(symbol)]
    pub sym_name: Attribute<'a>,
    pub sym_visibility: Option<Attribute<'a>>,
    #[attr(name = "type")]
    pub type_: Attribute<'a>,
    pub initial_value: Option<Attribute<'a>>,
    pub constant: bool,
    #[attr(int = "i64")]
    pub alignment: Option<Attribute<'a>>,
}

#[mlir::op("memref.memory_space_cast", format = "$source attr-dict `:` type($source) `to` type($dest)", results(dest))]
pub struct MemorySpaceCastOp<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    pub source_ty: Type<'a>,
    pub dest: Type<'a>,
}

#[mlir::op("memref.prefetch")]
pub struct PrefetchOp<'a> {
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
    pub memref_ty: Type<'a>,
    #[dtype(is = index)]
    pub indices_ty: Type<'a>,
}

#[mlir::op("memref.rank", format = "$memref attr-dict `:` type($memref)", results(result))]
pub struct RankOp<'a> {
    #[slot(memref_ty)]
    pub memref: Value<'a>,
    pub memref_ty: Type<'a>,
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::op("memref.realloc", format = "$source (`(` $dynamicResultSize^ `)`)? attr-dict `:` type($source) `to` qualified(type($result))", results(result))]
pub struct ReallocOp<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    #[slot(dynamic_result_size_ty, name = "dynamicResultSize")]
    pub dynamic_result_size: Vec<Value<'a>>,
    #[attr(int = "i64")]
    pub alignment: Option<Attribute<'a>>,
    pub source_ty: Type<'a>,
    #[dtype(is = index)]
    pub dynamic_result_size_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("memref.reinterpret_cast", format = "$source `to` `offset` `` `:` custom<DynamicIndexList>($offsets, $static_offsets) `` `,` `sizes` `` `:` custom<DynamicIndexList>($sizes, $static_sizes) `` `,` `strides` `` `:` custom<DynamicIndexList>($strides, $static_strides) attr-dict `:` type($source) `to` type($result)", results(result))]
pub struct ReinterpretCastOp<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    #[slot(offsets_ty)]
    pub offsets: Vec<Value<'a>>,
    #[slot(sizes_ty)]
    pub sizes: Vec<Value<'a>>,
    #[slot(strides_ty)]
    pub strides: Vec<Value<'a>>,
    #[attr(dense = "i64")]
    pub static_offsets: Attribute<'a>,
    #[attr(dense = "i64")]
    pub static_sizes: Attribute<'a>,
    #[attr(dense = "i64")]
    pub static_strides: Attribute<'a>,
    pub source_ty: Type<'a>,
    #[dtype(is = index)]
    pub offsets_ty: Type<'a>,
    #[dtype(is = index)]
    pub sizes_ty: Type<'a>,
    #[dtype(is = index)]
    pub strides_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("memref.reshape", format = "$source `(` $shape `)` attr-dict `:` functional-type($source $shape, $result)", results(result))]
pub struct ReshapeOp<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    #[slot(shape_ty)]
    pub shape: Value<'a>,
    pub source_ty: Type<'a>,
    pub shape_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("memref.store", format = "$value `,` $memref `[` $indices `]` attr-dict `:` type($memref)")]
pub struct StoreOp<'a> {
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[slot(memref_ty)]
    pub memref: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    #[attr(default = "false", optional)]
    pub nontemporal: Option<Attribute<'a>>,
    #[attr(int = "i64")]
    pub alignment: Option<Attribute<'a>>,
    #[dtype(el = memref_ty)]
    pub value_ty: Type<'a>,
    pub memref_ty: Type<'a>,
    #[dtype(is = index)]
    pub indices_ty: Type<'a>,
}

#[mlir::op("memref.transpose", results(result))]
pub struct TransposeOp<'a> {
    #[slot(in_ty, name = "in")]
    pub in_: Value<'a>,
    pub permutation: Attribute<'a>,
    pub in_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("memref.view", format = "$source `[` $byte_shift `]` `` `[` $sizes `]` attr-dict `:` type($source) `to` qualified(type($result))", results(result))]
pub struct ViewOp<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    #[slot(byte_shift_ty)]
    pub byte_shift: Value<'a>,
    #[slot(sizes_ty)]
    pub sizes: Vec<Value<'a>>,
    pub source_ty: Type<'a>,
    #[dtype(is = index)]
    pub byte_shift_ty: Type<'a>,
    #[dtype(is = index)]
    pub sizes_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("memref.subview", format = "$source `` custom<DynamicIndexList>($offsets, $static_offsets) custom<DynamicIndexList>($sizes, $static_sizes) custom<DynamicIndexList>($strides, $static_strides) attr-dict `:` type($source) `to` type($result)", results(result))]
pub struct SubViewOp<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    #[slot(offsets_ty)]
    pub offsets: Vec<Value<'a>>,
    #[slot(sizes_ty)]
    pub sizes: Vec<Value<'a>>,
    #[slot(strides_ty)]
    pub strides: Vec<Value<'a>>,
    #[attr(dense = "i64")]
    pub static_offsets: Attribute<'a>,
    #[attr(dense = "i64")]
    pub static_sizes: Attribute<'a>,
    #[attr(dense = "i64")]
    pub static_strides: Attribute<'a>,
    pub source_ty: Type<'a>,
    #[dtype(is = index)]
    pub offsets_ty: Type<'a>,
    #[dtype(is = index)]
    pub sizes_ty: Type<'a>,
    #[dtype(is = index)]
    pub strides_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::dialect(
    "memref",
    ops = [AssumeAlignmentOp, AtomicRMWOp, AtomicYieldOp, CopyOp, DistinctObjectsOp, GenericAtomicRMWOp, LoadOp, AllocOp, AllocaOp, AllocaScopeOp, AllocaScopeReturnOp, CastOp, CollapseShapeOp, DeallocOp, DimOp, DmaStartOp, DmaWaitOp, ExpandShapeOp, ExtractAlignedPointerAsIndexOp, ExtractStridedMetadataOp, GetGlobalOp, GlobalOp, MemorySpaceCastOp, PrefetchOp, RankOp, ReallocOp, ReinterpretCastOp, ReshapeOp, StoreOp, TransposeOp, ViewOp, SubViewOp],
    dependents = ["arith", "ub"],
    materializer
)]
pub struct MemrefDialect;
