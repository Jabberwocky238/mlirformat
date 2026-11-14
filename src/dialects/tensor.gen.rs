#![allow(non_camel_case_types, unused_imports, clippy::all, rustdoc::all)]

use mlirformat::{mlir, Attribute, Region, Str, Type, Value, __Vec as Vec};

#[mlir::op("tensor.bitcast", format = "$source attr-dict `:` type($source) `to` type($dest)", results(dest))]
pub struct BitcastOp<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    pub source_ty: Type<'a>,
    pub dest: Type<'a>,
}

#[mlir::op("tensor.cast", format = "$source attr-dict `:` type($source) `to` type($dest)", results(dest))]
pub struct CastOp<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    pub source_ty: Type<'a>,
    pub dest: Type<'a>,
}

#[mlir::op("tensor.collapse_shape", format = "$src $reassociation attr-dict `:` type($src) `into` type($result)", results(result))]
pub struct CollapseShapeOp<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    pub reassociation: Attribute<'a>,
    pub src_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("tensor.concat", format = "`dim` `(` $dim `)` $inputs attr-dict `:` functional-type($inputs, $result)", results(result))]
pub struct ConcatOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[attr(int = "i64")]
    pub dim: Attribute<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("tensor.dim", format = "attr-dict $source `,` $index `:` type($source)", results(result))]
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

#[mlir::op("tensor.empty", format = "`(`$dynamicSizes`)` attr-dict `:` type($result)", results(result))]
pub struct EmptyOp<'a> {
    #[slot(dynamic_sizes_ty, name = "dynamicSizes")]
    pub dynamic_sizes: Vec<Value<'a>>,
    #[dtype(is = index)]
    pub dynamic_sizes_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("tensor.expand_shape", format = "$src $reassociation `output_shape` custom<DynamicIndexList>($output_shape, $static_output_shape) attr-dict `:` type($src) `into` type($result)", results(result))]
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

#[mlir::op("tensor.extract", format = "$tensor `[` $indices `]` attr-dict `:` type($tensor)", results(result))]
pub struct ExtractOp<'a> {
    #[slot(tensor_ty)]
    pub tensor: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    pub tensor_ty: Type<'a>,
    #[dtype(is = index)]
    pub indices_ty: Type<'a>,
    #[dtype(el = tensor_ty)]
    pub result: Type<'a>,
}

#[mlir::op("tensor.extract_slice", format = "$source `` custom<DynamicIndexList>($offsets, $static_offsets) custom<DynamicIndexList>($sizes, $static_sizes) custom<DynamicIndexList>($strides, $static_strides) attr-dict `:` type($source) `to` type($result)", results(result))]
pub struct ExtractSliceOp<'a> {
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

#[mlir::op("tensor.from_elements", format = "$elements attr-dict `:` type($result)", results(result))]
pub struct FromElementsOp<'a> {
    #[slot(elements_ty)]
    pub elements: Vec<Value<'a>>,
    #[dtype(el = result)]
    pub elements_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("tensor.gather", format = "$source `[` $indices `]` `gather_dims` `(` $gather_dims `)` (`unique` $unique^)? attr-dict `:` functional-type($source $indices, $result)", results(result))]
pub struct GatherOp<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Value<'a>,
    #[attr(dense = "i64")]
    pub gather_dims: Attribute<'a>,
    pub unique: bool,
    pub source_ty: Type<'a>,
    pub indices_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("tensor.generate", format = "$dynamicExtents $body attr-dict `:` type($result)", results(result))]
pub struct GenerateOp<'a> {
    #[slot(dynamic_extents_ty, name = "dynamicExtents")]
    pub dynamic_extents: Vec<Value<'a>>,
    pub body: Region<'a>,
    #[dtype(is = index)]
    pub dynamic_extents_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("tensor.insert", format = "$scalar `into` $dest `[` $indices `]` attr-dict `:` type($dest)", results(result))]
pub struct InsertOp<'a> {
    #[slot(scalar_ty)]
    pub scalar: Value<'a>,
    #[slot(result)]
    pub dest: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    #[dtype(el = result)]
    pub scalar_ty: Type<'a>,
    #[dtype(is = index)]
    pub indices_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("tensor.insert_slice", format = "$source `into` $dest `` custom<DynamicIndexList>($offsets, $static_offsets) custom<DynamicIndexList>($sizes, $static_sizes) custom<DynamicIndexList>($strides, $static_strides) attr-dict `:` type($source) `into` type($dest)", results(result))]
pub struct InsertSliceOp<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    #[slot(result)]
    pub dest: Value<'a>,
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

#[mlir::op("tensor.pad", format = "$source (`nofold` $nofold^)? `low` `` custom<DynamicIndexList>($low, $static_low) `high` `` custom<DynamicIndexList>($high, $static_high) $region attr-dict `:` type($source) `to` type($result)", results(result))]
pub struct PadOp<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    #[slot(low_ty)]
    pub low: Vec<Value<'a>>,
    #[slot(high_ty)]
    pub high: Vec<Value<'a>>,
    #[attr(dense = "i64")]
    pub static_low: Attribute<'a>,
    #[attr(dense = "i64")]
    pub static_high: Attribute<'a>,
    pub nofold: bool,
    pub region: Region<'a>,
    pub source_ty: Type<'a>,
    #[dtype(is = index)]
    pub low_ty: Type<'a>,
    #[dtype(is = index)]
    pub high_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("tensor.parallel_insert_slice", format = "$source `into` $dest `` custom<DynamicIndexList>($offsets, $static_offsets) custom<DynamicIndexList>($sizes, $static_sizes) custom<DynamicIndexList>($strides, $static_strides) attr-dict `:` type($source) `into` type($dest)")]
pub struct ParallelInsertSliceOp<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    #[slot(dest_ty)]
    pub dest: Value<'a>,
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
    pub dest_ty: Type<'a>,
    #[dtype(is = index)]
    pub offsets_ty: Type<'a>,
    #[dtype(is = index)]
    pub sizes_ty: Type<'a>,
    #[dtype(is = index)]
    pub strides_ty: Type<'a>,
}

#[mlir::op("tensor.rank", format = "$tensor attr-dict `:` type($tensor)", results(result))]
pub struct RankOp<'a> {
    #[slot(tensor_ty)]
    pub tensor: Value<'a>,
    pub tensor_ty: Type<'a>,
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::op("tensor.reshape", format = "$source `(` $shape `)` attr-dict `:` functional-type($source $shape, $result)", results(result))]
pub struct ReshapeOp<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    #[slot(shape_ty)]
    pub shape: Value<'a>,
    pub source_ty: Type<'a>,
    pub shape_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("tensor.scatter", format = "$source `into` $dest `[` $indices `]` `scatter_dims` `(` $scatter_dims `)` (`unique` $unique^)? attr-dict `:` functional-type($source $dest $indices, $result)", results(result))]
pub struct ScatterOp<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    #[slot(dest_ty)]
    pub dest: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Value<'a>,
    #[attr(dense = "i64")]
    pub scatter_dims: Attribute<'a>,
    pub unique: bool,
    pub source_ty: Type<'a>,
    pub dest_ty: Type<'a>,
    pub indices_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("tensor.splat", format = "$input (`[` $dynamicSizes^ `]`)? attr-dict `:` type($aggregate)", results(aggregate))]
pub struct SplatOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    #[slot(dynamic_sizes_ty, name = "dynamicSizes")]
    pub dynamic_sizes: Vec<Value<'a>>,
    #[dtype(el = aggregate)]
    pub input_ty: Type<'a>,
    #[dtype(is = index)]
    pub dynamic_sizes_ty: Type<'a>,
    pub aggregate: Type<'a>,
}

#[mlir::op("tensor.yield", format = "$value attr-dict `:` type($value)")]
pub struct YieldOp<'a> {
    #[slot(value_ty)]
    pub value: Value<'a>,
    pub value_ty: Type<'a>,
}

#[mlir::dialect(
    "tensor",
    ops = [BitcastOp, CastOp, CollapseShapeOp, ConcatOp, DimOp, EmptyOp, ExpandShapeOp, ExtractOp, ExtractSliceOp, FromElementsOp, GatherOp, GenerateOp, InsertOp, InsertSliceOp, PadOp, ParallelInsertSliceOp, RankOp, ReshapeOp, ScatterOp, SplatOp, YieldOp],
    dependents = ["affine", "arith", "complex"],
    materializer,
    canonicalizer
)]
pub struct TensorDialect;
