#![allow(non_camel_case_types, unused_imports, clippy::all, rustdoc::all)]

use mlirformat::{mlir, Attribute, Region, Str, Type, Value, __Vec as Vec};

#[mlir::op("nvgpu.device_async_copy", format = "$src `[` $srcIndices `]` `,` $dst `[` $dstIndices `]` `,` $dstElements (`,` $srcElements^)? attr-dict `:` type($src) `to` type($dst)", results(async_token))]
pub struct DeviceAsyncCopyOp<'a> {
    #[slot(dst_ty)]
    pub dst: Value<'a>,
    #[slot(dst_indices_ty, name = "dstIndices")]
    pub dst_indices: Vec<Value<'a>>,
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(src_indices_ty, name = "srcIndices")]
    pub src_indices: Vec<Value<'a>>,
    #[slot(src_elements_ty, name = "srcElements")]
    pub src_elements: Vec<Value<'a>>,
    #[attr(name = "dstElements", int = "index")]
    pub dst_elements: Attribute<'a>,
    #[attr(name = "bypassL1")]
    pub bypass_l1: bool,
    pub dst_ty: Type<'a>,
    #[dtype(is = index)]
    pub dst_indices_ty: Type<'a>,
    pub src_ty: Type<'a>,
    #[dtype(is = index)]
    pub src_indices_ty: Type<'a>,
    #[dtype(is = index)]
    pub src_elements_ty: Type<'a>,
    #[dtype(is = "!nvgpu.device.async.token")]
    pub async_token: Type<'a>,
}

#[mlir::op("nvgpu.device_async_create_group", format = "$inputTokens attr-dict", results(async_token))]
pub struct DeviceAsyncCreateGroupOp<'a> {
    #[slot(input_tokens_ty, name = "inputTokens")]
    pub input_tokens: Vec<Value<'a>>,
    #[dtype(is = "!nvgpu.device.async.token")]
    pub input_tokens_ty: Type<'a>,
    #[dtype(is = "!nvgpu.device.async.token")]
    pub async_token: Type<'a>,
}

#[mlir::op("nvgpu.device_async_wait", format = "$asyncDependencies attr-dict")]
pub struct DeviceAsyncWaitOp<'a> {
    #[slot(async_dependencies_ty, name = "asyncDependencies")]
    pub async_dependencies: Value<'a>,
    #[attr(name = "numGroups", int = "i32")]
    pub num_groups: Option<Attribute<'a>>,
    #[dtype(is = "!nvgpu.device.async.token")]
    pub async_dependencies_ty: Type<'a>,
}

#[mlir::op("nvgpu.extf", format = "$in attr-dict `:` type($in) `to` type($out)", results(out))]
pub struct ExtfOp<'a> {
    #[slot(in_ty, name = "in")]
    pub in_: Value<'a>,
    #[attr(dialect = "nvvm.fp_rnd_mode", default = "<rn>")]
    pub rnd: Option<Attribute<'a>>,
    #[attr(default = "false")]
    pub relu: Option<Attribute<'a>>,
    pub in_ty: Type<'a>,
    pub out: Type<'a>,
}

#[mlir::op("nvgpu.ldmatrix", format = "$srcMemref`[` $indices `]` attr-dict `:` type($srcMemref) `->` type($res)", results(res))]
pub struct LdMatrixOp<'a> {
    #[slot(src_memref_ty, name = "srcMemref")]
    pub src_memref: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    pub transpose: Attribute<'a>,
    #[attr(name = "numTiles", int = "i32")]
    pub num_tiles: Attribute<'a>,
    pub src_memref_ty: Type<'a>,
    #[dtype(is = index)]
    pub indices_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("nvgpu.mbarrier.arrive.expect_tx", format = "$barriers `[` $mbarId `]` `,` $txcount (`,` `predicate` `=` $predicate^)? attr-dict `:` type($barriers)")]
pub struct MBarrierArriveExpectTxOp<'a> {
    #[slot(barriers_ty)]
    pub barriers: Value<'a>,
    #[slot(txcount_ty)]
    pub txcount: Value<'a>,
    #[slot(mbar_id_ty, name = "mbarId")]
    pub mbar_id: Value<'a>,
    #[slot(predicate_ty)]
    pub predicate: Vec<Value<'a>>,
    #[dtype(strip = "nvgpu.mbarrier.group")]
    pub barriers_ty: Type<'a>,
    #[dtype(is = index)]
    pub txcount_ty: Type<'a>,
    #[dtype(is = index)]
    pub mbar_id_ty: Type<'a>,
    #[dtype(is = i1)]
    pub predicate_ty: Type<'a>,
}

#[mlir::op("nvgpu.mbarrier.arrive.nocomplete", format = "$barriers `[` $mbarId `]` `,` $count attr-dict `:` type($barriers) `->` type($token)", results(token))]
pub struct MBarrierArriveNoCompleteOp<'a> {
    #[slot(barriers_ty)]
    pub barriers: Value<'a>,
    #[slot(mbar_id_ty, name = "mbarId")]
    pub mbar_id: Value<'a>,
    #[slot(count_ty)]
    pub count: Value<'a>,
    #[dtype(strip = "nvgpu.mbarrier.group")]
    pub barriers_ty: Type<'a>,
    #[dtype(is = index)]
    pub mbar_id_ty: Type<'a>,
    #[dtype(is = index)]
    pub count_ty: Type<'a>,
    #[dtype(is = "!nvgpu.mbarrier.token")]
    pub token: Type<'a>,
}

#[mlir::op("nvgpu.mbarrier.arrive", format = "$barriers `[` $mbarId `]` attr-dict `:` type($barriers) `->` type($token)", results(token))]
pub struct MBarrierArriveOp<'a> {
    #[slot(barriers_ty)]
    pub barriers: Value<'a>,
    #[slot(mbar_id_ty, name = "mbarId")]
    pub mbar_id: Value<'a>,
    #[dtype(strip = "nvgpu.mbarrier.group")]
    pub barriers_ty: Type<'a>,
    #[dtype(is = index)]
    pub mbar_id_ty: Type<'a>,
    #[dtype(is = "!nvgpu.mbarrier.token")]
    pub token: Type<'a>,
}

#[mlir::op("nvgpu.mbarrier.create", format = "attr-dict `->` type($barriers)", results(barriers))]
pub struct MBarrierCreateOp<'a> {
    #[dtype(strip = "nvgpu.mbarrier.group")]
    pub barriers: Type<'a>,
}

#[mlir::op("nvgpu.mbarrier.get", format = "$barriers `[` $mbarId `]` attr-dict `:` type($barriers) `->` type($mbarrierPointer)", results(mbarrier_pointer))]
pub struct MBarrierGetOp<'a> {
    #[slot(barriers_ty)]
    pub barriers: Value<'a>,
    #[slot(mbar_id_ty, name = "mbarId")]
    pub mbar_id: Value<'a>,
    #[dtype(strip = "nvgpu.mbarrier.group")]
    pub barriers_ty: Type<'a>,
    #[dtype(is = index)]
    pub mbar_id_ty: Type<'a>,
    #[dtype(name = "mbarrierPointer")]
    pub mbarrier_pointer: Type<'a>,
}

#[mlir::op("nvgpu.mbarrier.init", format = "$barriers `[` $mbarId `]` `,` $count (`,` `predicate` `=` $predicate^)? attr-dict `:` type($barriers)")]
pub struct MBarrierInitOp<'a> {
    #[slot(barriers_ty)]
    pub barriers: Value<'a>,
    #[slot(count_ty)]
    pub count: Value<'a>,
    #[slot(mbar_id_ty, name = "mbarId")]
    pub mbar_id: Value<'a>,
    #[slot(predicate_ty)]
    pub predicate: Vec<Value<'a>>,
    #[dtype(strip = "nvgpu.mbarrier.group")]
    pub barriers_ty: Type<'a>,
    #[dtype(is = index)]
    pub count_ty: Type<'a>,
    #[dtype(is = index)]
    pub mbar_id_ty: Type<'a>,
    #[dtype(is = i1)]
    pub predicate_ty: Type<'a>,
}

#[mlir::op("nvgpu.mbarrier.test.wait", format = "$barriers `[` $mbarId `]` `,` $token attr-dict `:` type($barriers) `,` type($token)", results(wait_complete))]
pub struct MBarrierTestWaitOp<'a> {
    #[slot(barriers_ty)]
    pub barriers: Value<'a>,
    #[slot(token_ty)]
    pub token: Value<'a>,
    #[slot(mbar_id_ty, name = "mbarId")]
    pub mbar_id: Value<'a>,
    #[dtype(strip = "nvgpu.mbarrier.group")]
    pub barriers_ty: Type<'a>,
    #[dtype(is = "!nvgpu.mbarrier.token")]
    pub token_ty: Type<'a>,
    #[dtype(is = index)]
    pub mbar_id_ty: Type<'a>,
    #[dtype(is = i1)]
    pub wait_complete: Type<'a>,
}

#[mlir::op("nvgpu.mbarrier.try_wait.parity", format = "$barriers `[` $mbarId `]` `,` $phaseParity `,` $ticks attr-dict `:` type($barriers)")]
pub struct MBarrierTryWaitParityOp<'a> {
    #[slot(barriers_ty)]
    pub barriers: Value<'a>,
    #[slot(phase_parity_ty, name = "phaseParity")]
    pub phase_parity: Value<'a>,
    #[slot(ticks_ty)]
    pub ticks: Value<'a>,
    #[slot(mbar_id_ty, name = "mbarId")]
    pub mbar_id: Value<'a>,
    #[dtype(strip = "nvgpu.mbarrier.group")]
    pub barriers_ty: Type<'a>,
    #[dtype(is = i1)]
    pub phase_parity_ty: Type<'a>,
    #[dtype(is = index)]
    pub ticks_ty: Type<'a>,
    #[dtype(is = index)]
    pub mbar_id_ty: Type<'a>,
}

#[mlir::op("nvgpu.mma.sp.sync", format = "`(` $matrixA`,` $matrixB`,` $matrixC `)` `metadata` `(` $sparseMetadata `)` attr-dict `:` `(` type($matrixA) `,` type($matrixB) `,` type($matrixC) `)` `->` type($res)", results(res))]
pub struct MmaSparseSyncOp<'a> {
    #[slot(matrix_a_ty, name = "matrixA")]
    pub matrix_a: Value<'a>,
    #[slot(matrix_b_ty, name = "matrixB")]
    pub matrix_b: Value<'a>,
    #[slot(matrix_c_ty, name = "matrixC")]
    pub matrix_c: Value<'a>,
    #[slot(sparse_metadata_ty, name = "sparseMetadata")]
    pub sparse_metadata: Value<'a>,
    #[attr(name = "mmaShape")]
    pub mma_shape: Attribute<'a>,
    #[attr(name = "sparsitySelector", int = "i32", default = "0")]
    pub sparsity_selector: Option<Attribute<'a>>,
    #[attr(name = "tf32Enabled")]
    pub tf32_enabled: bool,
    pub matrix_a_ty: Type<'a>,
    pub matrix_b_ty: Type<'a>,
    pub matrix_c_ty: Type<'a>,
    #[dtype(is = "vector<2xi16>")]
    pub sparse_metadata_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("nvgpu.mma.sync", format = "`(` $matrixA`,` $matrixB`,` $matrixC `)` attr-dict `:` `(` type($matrixA) `,` type($matrixB) `,` type($matrixC) `)` `->` type($res)", results(res))]
pub struct MmaSyncOp<'a> {
    #[slot(matrix_a_ty, name = "matrixA")]
    pub matrix_a: Value<'a>,
    #[slot(matrix_b_ty, name = "matrixB")]
    pub matrix_b: Value<'a>,
    #[slot(matrix_c_ty, name = "matrixC")]
    pub matrix_c: Value<'a>,
    #[attr(name = "mmaShape")]
    pub mma_shape: Attribute<'a>,
    #[attr(name = "tf32Enabled")]
    pub tf32_enabled: bool,
    pub matrix_a_ty: Type<'a>,
    pub matrix_b_ty: Type<'a>,
    pub matrix_c_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("nvgpu.rcp", format = "$in attr-dict `:` type($out)", results(out))]
pub struct RcpOp<'a> {
    #[slot(out, name = "in")]
    pub in_: Value<'a>,
    #[attr(dialect = "nvvm.fp_rnd_mode", default = "<none>")]
    pub rounding: Option<Attribute<'a>>,
    #[attr(default = "false")]
    pub approx: Option<Attribute<'a>>,
    #[attr(default = "false")]
    pub ftz: Option<Attribute<'a>>,
    pub out: Type<'a>,
}

#[mlir::op("nvgpu.tma.async.load", format = "$tensorMapDescriptor `[` $coordinates `]` `,` $barriers `[` $mbarId `]` `to` $dst (`multicast_mask` `=` $multicastMask^ )? (`,` `predicate` `=` $predicate^)? attr-dict `:` type($tensorMapDescriptor) `,` type($barriers) `->` type($dst)")]
pub struct TmaAsyncLoadOp<'a> {
    #[slot(dst_ty)]
    pub dst: Value<'a>,
    #[slot(barriers_ty)]
    pub barriers: Value<'a>,
    #[slot(tensor_map_descriptor_ty, name = "tensorMapDescriptor")]
    pub tensor_map_descriptor: Value<'a>,
    #[slot(coordinates_ty)]
    pub coordinates: Vec<Value<'a>>,
    #[slot(mbar_id_ty, name = "mbarId")]
    pub mbar_id: Value<'a>,
    #[slot(multicast_mask_ty, name = "multicastMask")]
    pub multicast_mask: Vec<Value<'a>>,
    #[slot(predicate_ty)]
    pub predicate: Vec<Value<'a>>,
    pub dst_ty: Type<'a>,
    #[dtype(strip = "nvgpu.mbarrier.group")]
    pub barriers_ty: Type<'a>,
    #[dtype(strip = "nvgpu.tensormap.descriptor")]
    pub tensor_map_descriptor_ty: Type<'a>,
    #[dtype(is = index)]
    pub coordinates_ty: Type<'a>,
    #[dtype(is = index)]
    pub mbar_id_ty: Type<'a>,
    #[dtype(is = i16)]
    pub multicast_mask_ty: Type<'a>,
    #[dtype(is = i1)]
    pub predicate_ty: Type<'a>,
}

#[mlir::op("nvgpu.tma.async.store", format = "$src `to` $tensorMapDescriptor `[` $coordinates `]` (`,` `predicate` `=` $predicate^)? attr-dict `:` type($src) `->` type($tensorMapDescriptor)")]
pub struct TmaAsyncStoreOp<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(tensor_map_descriptor_ty, name = "tensorMapDescriptor")]
    pub tensor_map_descriptor: Value<'a>,
    #[slot(coordinates_ty)]
    pub coordinates: Vec<Value<'a>>,
    #[slot(predicate_ty)]
    pub predicate: Vec<Value<'a>>,
    pub src_ty: Type<'a>,
    #[dtype(strip = "nvgpu.tensormap.descriptor")]
    pub tensor_map_descriptor_ty: Type<'a>,
    #[dtype(is = index)]
    pub coordinates_ty: Type<'a>,
    #[dtype(is = i1)]
    pub predicate_ty: Type<'a>,
}

#[mlir::op("nvgpu.tma.create.descriptor", format = "$tensor `box` `[` $boxDimensions `]` attr-dict `:` type($tensor) `->` type($tensorMap)", results(tensor_map))]
pub struct TmaCreateDescriptorOp<'a> {
    #[slot(tensor_ty)]
    pub tensor: Value<'a>,
    #[slot(box_dimensions_ty, name = "boxDimensions")]
    pub box_dimensions: Vec<Value<'a>>,
    pub tensor_ty: Type<'a>,
    #[dtype(is = index)]
    pub box_dimensions_ty: Type<'a>,
    #[dtype(name = "tensorMap", strip = "nvgpu.tensormap.descriptor")]
    pub tensor_map: Type<'a>,
}

#[mlir::op("nvgpu.tma.fence.descriptor", format = "$tensorMapDescriptor attr-dict `:` type($tensorMapDescriptor)")]
pub struct TmaFenceOp<'a> {
    #[slot(tensor_map_descriptor_ty, name = "tensorMapDescriptor")]
    pub tensor_map_descriptor: Value<'a>,
    #[dtype(strip = "nvgpu.tensormap.descriptor")]
    pub tensor_map_descriptor_ty: Type<'a>,
}

#[mlir::op("nvgpu.tma.prefetch.descriptor", format = "$tensorMapDescriptor (`,` `predicate` `=` $predicate^)? attr-dict `:` type($tensorMapDescriptor)")]
pub struct TmaPrefetchOp<'a> {
    #[slot(tensor_map_descriptor_ty, name = "tensorMapDescriptor")]
    pub tensor_map_descriptor: Value<'a>,
    #[slot(predicate_ty)]
    pub predicate: Vec<Value<'a>>,
    #[dtype(strip = "nvgpu.tensormap.descriptor")]
    pub tensor_map_descriptor_ty: Type<'a>,
    #[dtype(is = i1)]
    pub predicate_ty: Type<'a>,
}

#[mlir::op("nvgpu.truncf", format = "$in (`,` $random_bits^)? attr-dict `:` type($in) `to` type($out)", results(out))]
pub struct TruncfOp<'a> {
    #[slot(in_ty, name = "in")]
    pub in_: Value<'a>,
    #[slot(random_bits_ty)]
    pub random_bits: Vec<Value<'a>>,
    #[attr(dialect = "nvvm.fp_rnd_mode", default = "<rn>")]
    pub rnd: Option<Attribute<'a>>,
    #[attr(dialect = "nvvm.sat_mode", default = "<satfinite>")]
    pub sat: Option<Attribute<'a>>,
    #[attr(default = "false")]
    pub relu: Option<Attribute<'a>>,
    pub in_ty: Type<'a>,
    #[dtype(is = i32)]
    pub random_bits_ty: Type<'a>,
    pub out: Type<'a>,
}

#[mlir::op("nvgpu.warpgroup.generate.descriptor", format = "$tensor `,` $tensorMap attr-dict `:` type($tensor) `,` type($tensorMap) `->` type($descriptor)", results(descriptor))]
pub struct WarpgroupGenerateDescriptorOp<'a> {
    #[slot(tensor_ty)]
    pub tensor: Value<'a>,
    #[slot(tensor_map_ty, name = "tensorMap")]
    pub tensor_map: Value<'a>,
    pub tensor_ty: Type<'a>,
    #[dtype(strip = "nvgpu.tensormap.descriptor")]
    pub tensor_map_ty: Type<'a>,
    #[dtype(strip = "nvgpu.warpgroup.descriptor")]
    pub descriptor: Type<'a>,
}

#[mlir::op("nvgpu.warpgroup.mma.init.accumulator", format = "attr-dict `->` type($matrixC)", results(matrix_c))]
pub struct WarpgroupMmaInitAccumulatorOp<'a> {
    #[dtype(name = "matrixC", strip = "nvgpu.warpgroup.accumulator")]
    pub matrix_c: Type<'a>,
}

#[mlir::op("nvgpu.warpgroup.mma", format = "$descriptorA`,` $descriptorB`,` $matrixC attr-dict `:` type($descriptorA) `,` type($descriptorB) `,` type($matrixC) `->` type($matrixD)", results(matrix_d))]
pub struct WarpgroupMmaOp<'a> {
    #[slot(descriptor_a_ty, name = "descriptorA")]
    pub descriptor_a: Value<'a>,
    #[slot(descriptor_b_ty, name = "descriptorB")]
    pub descriptor_b: Value<'a>,
    #[slot(matrix_c_ty, name = "matrixC")]
    pub matrix_c: Value<'a>,
    #[attr(name = "waitGroup", int = "i64", default = "1", optional)]
    pub wait_group: Option<Attribute<'a>>,
    #[attr(name = "transposeA")]
    pub transpose_a: bool,
    #[attr(name = "transposeB")]
    pub transpose_b: bool,
    #[dtype(strip = "nvgpu.warpgroup.descriptor")]
    pub descriptor_a_ty: Type<'a>,
    #[dtype(strip = "nvgpu.warpgroup.descriptor")]
    pub descriptor_b_ty: Type<'a>,
    #[dtype(strip = "nvgpu.warpgroup.accumulator")]
    pub matrix_c_ty: Type<'a>,
    #[dtype(name = "matrixD", strip = "nvgpu.warpgroup.accumulator")]
    pub matrix_d: Type<'a>,
}

#[mlir::op("nvgpu.warpgroup.mma.store", format = "$matrixD `,` $dstMemref attr-dict `:` type($matrixD) `to` type($dstMemref)")]
pub struct WarpgroupMmaStoreOp<'a> {
    #[slot(matrix_d_ty, name = "matrixD")]
    pub matrix_d: Value<'a>,
    #[slot(dst_memref_ty, name = "dstMemref")]
    pub dst_memref: Value<'a>,
    #[dtype(strip = "nvgpu.warpgroup.accumulator")]
    pub matrix_d_ty: Type<'a>,
    pub dst_memref_ty: Type<'a>,
}

#[mlir::dialect(
    "nvgpu",
    ops = [DeviceAsyncCopyOp, DeviceAsyncCreateGroupOp, DeviceAsyncWaitOp, ExtfOp, LdMatrixOp, MBarrierArriveExpectTxOp, MBarrierArriveNoCompleteOp, MBarrierArriveOp, MBarrierCreateOp, MBarrierGetOp, MBarrierInitOp, MBarrierTestWaitOp, MBarrierTryWaitParityOp, MmaSparseSyncOp, MmaSyncOp, RcpOp, TmaAsyncLoadOp, TmaAsyncStoreOp, TmaCreateDescriptorOp, TmaFenceOp, TmaPrefetchOp, TruncfOp, WarpgroupGenerateDescriptorOp, WarpgroupMmaInitAccumulatorOp, WarpgroupMmaOp, WarpgroupMmaStoreOp],
    dependents = ["nvvm"]
)]
pub struct NvgpuDialect;
