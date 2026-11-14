#![allow(non_camel_case_types, unused_imports, clippy::all, rustdoc::all)]

use mlirformat::{mlir, Attribute, Region, Str, Type, Value, __Vec as Vec};

#[mlir::op("xevm.blockload2d", results(res))]
pub struct BlockLoad2dOp<'a> {
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    #[slot(base_width_ty)]
    pub base_width: Value<'a>,
    #[slot(base_height_ty)]
    pub base_height: Value<'a>,
    #[slot(base_pitch_ty)]
    pub base_pitch: Value<'a>,
    #[slot(x_ty)]
    pub x: Value<'a>,
    #[slot(y_ty)]
    pub y: Value<'a>,
    #[attr(int = "i32")]
    pub elem_size_in_bits: Attribute<'a>,
    #[attr(int = "i32")]
    pub tile_width: Attribute<'a>,
    #[attr(int = "i32")]
    pub tile_height: Attribute<'a>,
    #[attr(int = "i32")]
    pub v_blocks: Attribute<'a>,
    #[attr(int = "i1")]
    pub transpose: Attribute<'a>,
    #[attr(int = "i1")]
    pub pack_register: Attribute<'a>,
    #[attr(dialect = "xevm.load_cache_control")]
    pub cache_control: Option<Attribute<'a>>,
    #[dtype(strip = "llvm.ptr")]
    pub ptr_ty: Type<'a>,
    #[dtype(is = i32)]
    pub base_width_ty: Type<'a>,
    #[dtype(is = i32)]
    pub base_height_ty: Type<'a>,
    #[dtype(is = i32)]
    pub base_pitch_ty: Type<'a>,
    #[dtype(is = i32)]
    pub x_ty: Type<'a>,
    #[dtype(is = i32)]
    pub y_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("xevm.blockload", results(res))]
pub struct BlockLoadOp<'a> {
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    #[attr(dialect = "xevm.load_cache_control")]
    pub cache_control: Option<Attribute<'a>>,
    #[dtype(strip = "llvm.ptr")]
    pub ptr_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("xevm.blockprefetch2d")]
pub struct BlockPrefetch2dOp<'a> {
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    #[slot(base_width_ty)]
    pub base_width: Value<'a>,
    #[slot(base_height_ty)]
    pub base_height: Value<'a>,
    #[slot(base_pitch_ty)]
    pub base_pitch: Value<'a>,
    #[slot(x_ty)]
    pub x: Value<'a>,
    #[slot(y_ty)]
    pub y: Value<'a>,
    #[attr(int = "i32")]
    pub elem_size_in_bits: Attribute<'a>,
    #[attr(int = "i32")]
    pub tile_width: Attribute<'a>,
    #[attr(int = "i32")]
    pub tile_height: Attribute<'a>,
    #[attr(int = "i32")]
    pub v_blocks: Attribute<'a>,
    #[attr(dialect = "xevm.load_cache_control")]
    pub cache_control: Option<Attribute<'a>>,
    #[dtype(strip = "llvm.ptr")]
    pub ptr_ty: Type<'a>,
    #[dtype(is = i32)]
    pub base_width_ty: Type<'a>,
    #[dtype(is = i32)]
    pub base_height_ty: Type<'a>,
    #[dtype(is = i32)]
    pub base_pitch_ty: Type<'a>,
    #[dtype(is = i32)]
    pub x_ty: Type<'a>,
    #[dtype(is = i32)]
    pub y_ty: Type<'a>,
}

#[mlir::op("xevm.blockstore2d")]
pub struct BlockStore2dOp<'a> {
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    #[slot(base_width_ty)]
    pub base_width: Value<'a>,
    #[slot(base_height_ty)]
    pub base_height: Value<'a>,
    #[slot(base_pitch_ty)]
    pub base_pitch: Value<'a>,
    #[slot(x_ty)]
    pub x: Value<'a>,
    #[slot(y_ty)]
    pub y: Value<'a>,
    #[slot(stored_val_ty)]
    pub stored_val: Value<'a>,
    #[attr(int = "i32")]
    pub elem_size_in_bits: Attribute<'a>,
    #[attr(int = "i32")]
    pub tile_width: Attribute<'a>,
    #[attr(int = "i32")]
    pub tile_height: Attribute<'a>,
    #[attr(dialect = "xevm.store_cache_control")]
    pub cache_control: Option<Attribute<'a>>,
    #[dtype(strip = "llvm.ptr")]
    pub ptr_ty: Type<'a>,
    #[dtype(is = i32)]
    pub base_width_ty: Type<'a>,
    #[dtype(is = i32)]
    pub base_height_ty: Type<'a>,
    #[dtype(is = i32)]
    pub base_pitch_ty: Type<'a>,
    #[dtype(is = i32)]
    pub x_ty: Type<'a>,
    #[dtype(is = i32)]
    pub y_ty: Type<'a>,
    pub stored_val_ty: Type<'a>,
}

#[mlir::op("xevm.blockstore")]
pub struct BlockStoreOp<'a> {
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    #[slot(val_ty)]
    pub val: Value<'a>,
    #[attr(dialect = "xevm.store_cache_control")]
    pub cache_control: Option<Attribute<'a>>,
    #[dtype(strip = "llvm.ptr")]
    pub ptr_ty: Type<'a>,
    pub val_ty: Type<'a>,
}

#[mlir::op("xevm.extf", format = "$src ` ` `{` $src_etype `,` $dst_etype `}` attr-dict `:` functional-type($src, $dst)", results(dst))]
pub struct ExtfOp<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[attr(dialect = "xevm<ext_src_etype")]
    pub src_etype: Attribute<'a>,
    #[attr(dialect = "xevm<ext_dst_etype")]
    pub dst_etype: Attribute<'a>,
    pub src_ty: Type<'a>,
    pub dst: Type<'a>,
}

#[mlir::op("xevm.group_count.x", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct GridDimXOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("xevm.group_count.y", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct GridDimYOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("xevm.group_count.z", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct GridDimZOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("xevm.lane_id", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct LaneIdOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("xevm.mma_mx", format = "$a `,` $b `,` $scale_a `,` $scale_b (`,` $c^)? ` ` `{` `shape` `=` $shape `,` `types` `=` $types `}` attr-dict `:` functional-type($a $b $scale_a $scale_b $c, $d)", results(d))]
pub struct MMAMxOp<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(scale_a_ty)]
    pub scale_a: Value<'a>,
    #[slot(scale_b_ty)]
    pub scale_b: Value<'a>,
    #[slot(c_ty)]
    pub c: Vec<Value<'a>>,
    #[attr(dialect = "xevm.mma_shape")]
    pub shape: Attribute<'a>,
    #[attr(dialect = "xevm.mma_types")]
    pub types: Attribute<'a>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub scale_a_ty: Type<'a>,
    pub scale_b_ty: Type<'a>,
    pub c_ty: Vec<Type<'a>>,
    pub d: Type<'a>,
}

#[mlir::op("xevm.mma", format = "$a `,` $b (`,` $c^)? ` ` `{` `shape` `=` $shape `,` `types` `=` $types `}` attr-dict `:` functional-type($a $b $c, $d)", results(d))]
pub struct MMAOp<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Vec<Value<'a>>,
    #[attr(dialect = "xevm.mma_shape")]
    pub shape: Attribute<'a>,
    #[attr(dialect = "xevm.mma_types")]
    pub types: Attribute<'a>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Vec<Type<'a>>,
    pub d: Type<'a>,
}

#[mlir::op("xevm.memfence")]
pub struct MemfenceOp<'a> {
    #[attr(dialect = "xevm.mem_scope")]
    pub scope: Attribute<'a>,
    #[attr(dialect = "xevm.addr_space", default = "<generic>")]
    pub addrspace: Option<Attribute<'a>>,
}

#[mlir::op("xevm.prefetch")]
pub struct PrefetchOp<'a> {
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    #[attr(dialect = "xevm.load_cache_control")]
    pub cache_control: Option<Attribute<'a>>,
    pub ptr_ty: Type<'a>,
}

#[mlir::op("xevm.subgroup_id", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct SubgroupIdOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("xevm.subgroup_size", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct SubgroupSizeOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("xevm.truncf", format = "$src ` ` `{` $src_etype `,` $dst_etype `}` attr-dict `:` functional-type($src, $dst)", results(dst))]
pub struct TruncfOp<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[attr(dialect = "xevm<src_etype")]
    pub src_etype: Attribute<'a>,
    #[attr(dialect = "xevm<dst_etype")]
    pub dst_etype: Attribute<'a>,
    pub src_ty: Type<'a>,
    pub dst: Type<'a>,
}

#[mlir::op("xevm.local_size.x", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct WorkgroupDimXOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("xevm.local_size.y", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct WorkgroupDimYOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("xevm.local_size.z", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct WorkgroupDimZOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("xevm.group_id.x", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct WorkgroupIdXOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("xevm.group_id.y", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct WorkgroupIdYOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("xevm.group_id.z", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct WorkgroupIdZOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("xevm.local_id.x", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct WorkitemIdXOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("xevm.local_id.y", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct WorkitemIdYOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("xevm.local_id.z", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct WorkitemIdZOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::dialect(
    "xevm",
    ops = [BlockLoad2dOp, BlockLoadOp, BlockPrefetch2dOp, BlockStore2dOp, BlockStoreOp, ExtfOp, GridDimXOp, GridDimYOp, GridDimZOp, LaneIdOp, MMAMxOp, MMAOp, MemfenceOp, PrefetchOp, SubgroupIdOp, SubgroupSizeOp, TruncfOp, WorkgroupDimXOp, WorkgroupDimYOp, WorkgroupDimZOp, WorkgroupIdXOp, WorkgroupIdYOp, WorkgroupIdZOp, WorkitemIdXOp, WorkitemIdYOp, WorkitemIdZOp],
    dependents = ["llvm"]
)]
pub struct XevmDialect;
