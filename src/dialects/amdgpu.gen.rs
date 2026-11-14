#![allow(non_camel_case_types, unused_imports, clippy::all, rustdoc::all)]

use mlirformat::{mlir, Attribute, Region, Str, Type, Value, __Vec as Vec};

#[mlir::op("amdgpu.dpp", format = "$old $src $kind (`(` $permArgument^ `)`)? attr-dict `:` type($result)", results(result))]
pub struct DPPOp<'a> {
    #[slot(result)]
    pub old: Value<'a>,
    #[slot(result)]
    pub src: Value<'a>,
    #[attr(dialect = "amdgpu<dpp_perm")]
    pub kind: Attribute<'a>,
    #[attr(name = "permArgument")]
    pub perm_argument: Option<Attribute<'a>>,
    #[attr(int = "i32", default = "15")]
    pub row_mask: Option<Attribute<'a>>,
    #[attr(int = "i32", default = "15")]
    pub bank_mask: Option<Attribute<'a>>,
    #[attr(default = "false")]
    pub bound_ctrl: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("amdgpu.dot", format = "$sourceA `*` $sourceB `+` $destC attr-dict `:` type($sourceA) `,` type($sourceB) `,` type($destC)", results(dest_d))]
pub struct DotOp<'a> {
    #[slot(source_a_ty, name = "sourceA")]
    pub source_a: Value<'a>,
    #[slot(source_b_ty, name = "sourceB")]
    pub source_b: Value<'a>,
    #[slot(dest_d, name = "destC")]
    pub dest_c: Value<'a>,
    #[attr(name = "unsignedA")]
    pub unsigned_a: bool,
    #[attr(name = "unsignedB")]
    pub unsigned_b: bool,
    pub clamp: bool,
    pub source_a_ty: Type<'a>,
    pub source_b_ty: Type<'a>,
    pub dest_d: Type<'a>,
}

#[mlir::op("amdgpu.ds_async_barrier_arrive", format = "$base `[` $indices `]` attr-dict `:` type($base)")]
pub struct DsAsyncBarrierArriveOp<'a> {
    #[slot(base_ty)]
    pub base: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    pub base_ty: Type<'a>,
    #[dtype(is = index)]
    pub indices_ty: Type<'a>,
}

#[mlir::op("amdgpu.ds_barrier_arrive", format = "$base `[` $indices `]` `,` $count attr-dict `:` type($base) `,` type($count) `->` type($out)", results(out))]
pub struct DsBarrierArriveOp<'a> {
    #[slot(base_ty)]
    pub base: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    #[slot(count_ty)]
    pub count: Value<'a>,
    pub base_ty: Type<'a>,
    #[dtype(is = index)]
    pub indices_ty: Type<'a>,
    #[dtype(is = i64)]
    pub count_ty: Type<'a>,
    #[dtype(is = "!amdgpu.ds_barrier_state")]
    pub out: Type<'a>,
}

#[mlir::op("amdgpu.ds_barrier_init", format = "$base `[` $indices `]` `,` $participants attr-dict `:` type($base) `,` type($participants)")]
pub struct DsBarrierInitOp<'a> {
    #[slot(base_ty)]
    pub base: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    #[slot(participants_ty)]
    pub participants: Value<'a>,
    pub base_ty: Type<'a>,
    #[dtype(is = index)]
    pub indices_ty: Type<'a>,
    #[dtype(is = i32)]
    pub participants_ty: Type<'a>,
}

#[mlir::op("amdgpu.ds_barrier_poll_state", format = "$base `[` $indices `]` attr-dict `:` type($base) `->` type($out)", results(out))]
pub struct DsBarrierPollStateOp<'a> {
    #[slot(base_ty)]
    pub base: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    pub base_ty: Type<'a>,
    #[dtype(is = index)]
    pub indices_ty: Type<'a>,
    #[dtype(is = "!amdgpu.ds_barrier_state")]
    pub out: Type<'a>,
}

#[mlir::op("amdgpu.ds_barrier_state_init_count", format = "$state attr-dict `:` type($state) `->` type($res)", results(res))]
pub struct DsBarrierStateInitCountOp<'a> {
    #[slot(state_ty)]
    pub state: Value<'a>,
    #[dtype(is = "!amdgpu.ds_barrier_state")]
    pub state_ty: Type<'a>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("amdgpu.ds_barrier_state_pending_count", format = "$state attr-dict `:` type($state) `->` type($res)", results(res))]
pub struct DsBarrierStatePendingCountOp<'a> {
    #[slot(state_ty)]
    pub state: Value<'a>,
    #[dtype(is = "!amdgpu.ds_barrier_state")]
    pub state_ty: Type<'a>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("amdgpu.ds_barrier_state_phase", format = "$state attr-dict `:` type($state) `->` type($res)", results(res))]
pub struct DsBarrierStatePhaseOp<'a> {
    #[slot(state_ty)]
    pub state: Value<'a>,
    #[dtype(is = "!amdgpu.ds_barrier_state")]
    pub state_ty: Type<'a>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("amdgpu.ds_barrier_state_phase_parity", format = "$state attr-dict `:` type($state) `->` type($res)", results(res))]
pub struct DsBarrierStatePhaseParity<'a> {
    #[slot(state_ty)]
    pub state: Value<'a>,
    #[dtype(is = "!amdgpu.ds_barrier_state")]
    pub state_ty: Type<'a>,
    #[dtype(is = i1)]
    pub res: Type<'a>,
}

#[mlir::op("amdgpu.ext_packed_fp8", format = "attr-dict $source `[` $index `]` `:` type($source) `to` type($res)", results(res))]
pub struct ExtPackedFp8Op<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    #[attr(int = "i32")]
    pub index: Attribute<'a>,
    pub source_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("amdgpu.fat_raw_buffer_cast", results(result))]
pub struct FatRawBufferCastOp<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    #[slot(valid_bytes_ty, name = "validBytes")]
    pub valid_bytes: Vec<Value<'a>>,
    #[slot(cache_swizzle_stride_ty, name = "cacheSwizzleStride")]
    pub cache_swizzle_stride: Vec<Value<'a>>,
    #[attr(name = "boundsCheck", default = "true")]
    pub bounds_check: Option<Attribute<'a>>,
    #[attr(name = "resetOffset")]
    pub reset_offset: bool,
    pub source_ty: Type<'a>,
    #[dtype(is = i64)]
    pub valid_bytes_ty: Type<'a>,
    #[dtype(is = i14)]
    pub cache_swizzle_stride_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("amdgpu.gather_to_lds", format = "(`async` $async^)? $src `[` $srcIndices `]` `,` $dst `[` $dstIndices `]` attr-dict `:` $transferType `,` type($src) `,` type($dst)")]
pub struct GatherToLDSOp<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(src_indices_ty, name = "srcIndices")]
    pub src_indices: Vec<Value<'a>>,
    #[slot(dst_ty)]
    pub dst: Value<'a>,
    #[slot(dst_indices_ty, name = "dstIndices")]
    pub dst_indices: Vec<Value<'a>>,
    #[attr(name = "transferType")]
    pub transfer_type: Attribute<'a>,
    #[attr(name = "async")]
    pub async_: bool,
    pub src_ty: Type<'a>,
    #[dtype(is = index)]
    pub src_indices_ty: Type<'a>,
    pub dst_ty: Type<'a>,
    #[dtype(is = index)]
    pub dst_indices_ty: Type<'a>,
}

#[mlir::op("amdgpu.global_load_async_to_lds", format = "$src `[` $srcIndices `]` `,` $dst `[` $dstIndices `]` (`,` $mask^)? attr-dict `:` $transferType `,` type($src) `,` type($dst)")]
pub struct GlobalLoadAsyncToLDSOp<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(src_indices_ty, name = "srcIndices")]
    pub src_indices: Vec<Value<'a>>,
    #[slot(dst_ty)]
    pub dst: Value<'a>,
    #[slot(dst_indices_ty, name = "dstIndices")]
    pub dst_indices: Vec<Value<'a>>,
    #[slot(mask_ty)]
    pub mask: Vec<Value<'a>>,
    #[attr(name = "transferType")]
    pub transfer_type: Attribute<'a>,
    pub src_ty: Type<'a>,
    #[dtype(is = index)]
    pub src_indices_ty: Type<'a>,
    pub dst_ty: Type<'a>,
    #[dtype(is = index)]
    pub dst_indices_ty: Type<'a>,
    #[dtype(is = i1)]
    pub mask_ty: Type<'a>,
}

#[mlir::op("amdgpu.global_prefetch", format = "$src `[` $indices `]` $temporalHint $cacheScope (`speculative` $speculative^)? attr-dict `:` qualified(type($src))")]
pub struct GlobalPrefetchOp<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    #[attr(name = "temporalHint", dialect = "amdgpu<load_temporal_hint")]
    pub temporal_hint: Attribute<'a>,
    #[attr(name = "cacheScope", dialect = "amdgpu<cache_scope")]
    pub cache_scope: Attribute<'a>,
    pub speculative: bool,
    pub src_ty: Type<'a>,
    #[dtype(is = i64)]
    pub indices_ty: Type<'a>,
}

#[mlir::op("amdgpu.global_transpose_load", format = "$src `[` $srcIndices `]` attr-dict `:` type($src) `->` type($result)", results(result))]
pub struct GlobalTransposeLoadOp<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(src_indices_ty, name = "srcIndices")]
    pub src_indices: Vec<Value<'a>>,
    pub src_ty: Type<'a>,
    #[dtype(is = index)]
    pub src_indices_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("amdgpu.lds_barrier", format = "attr-dict")]
pub struct LDSBarrierOp<'a> {
}

#[mlir::op("amdgpu.mfma", results(dest_d))]
pub struct MFMAOp<'a> {
    #[slot(source_a_ty, name = "sourceA")]
    pub source_a: Value<'a>,
    #[slot(source_b_ty, name = "sourceB")]
    pub source_b: Value<'a>,
    #[slot(dest_d, name = "destC")]
    pub dest_c: Value<'a>,
    #[attr(int = "i32")]
    pub m: Attribute<'a>,
    #[attr(int = "i32")]
    pub n: Attribute<'a>,
    #[attr(int = "i32")]
    pub k: Attribute<'a>,
    #[attr(int = "i32", default = "1")]
    pub blocks: Option<Attribute<'a>>,
    #[attr(int = "i32", default = "0")]
    pub cbsz: Option<Attribute<'a>>,
    #[attr(int = "i32", default = "0")]
    pub abid: Option<Attribute<'a>>,
    #[attr(dialect = "rocdl<mfma_perm_b", default = "none")]
    pub blgp: Option<Attribute<'a>>,
    #[attr(name = "reducePrecision")]
    pub reduce_precision: bool,
    #[attr(name = "negateA")]
    pub negate_a: bool,
    #[attr(name = "negateB")]
    pub negate_b: bool,
    #[attr(name = "negateC")]
    pub negate_c: bool,
    pub source_a_ty: Type<'a>,
    pub source_b_ty: Type<'a>,
    pub dest_d: Type<'a>,
}

#[mlir::op("amdgpu.make_dma_base", format = "$global `[` $global_indices `]` `,` $lds `[` $lds_indices `]` attr-dict `:` type($global) `,` type($lds) `->` qualified(type($base))", results(base))]
pub struct MakeDmaBaseOp<'a> {
    #[slot(global_ty)]
    pub global: Value<'a>,
    #[slot(global_indices_ty)]
    pub global_indices: Vec<Value<'a>>,
    #[slot(lds_ty)]
    pub lds: Value<'a>,
    #[slot(lds_indices_ty)]
    pub lds_indices: Vec<Value<'a>>,
    pub global_ty: Type<'a>,
    #[dtype(is = index)]
    pub global_indices_ty: Type<'a>,
    pub lds_ty: Type<'a>,
    #[dtype(is = index)]
    pub lds_indices_ty: Type<'a>,
    #[dtype(strip = "amdgpu.tdm_base")]
    pub base: Type<'a>,
}

#[mlir::op("amdgpu.make_dma_descriptor", format = "$base `globalSize` custom<DynamicIndexList>($global_dynamic_sizes, $global_static_sizes) `globalStride` custom<DynamicIndexList>($global_dynamic_strides, $global_static_strides) `sharedSize` custom<DynamicIndexList>($shared_dynamic_sizes, $shared_static_sizes) ( `padShared` `(` $pad_amount^ `every` $pad_interval `)` )? ( `workgroupMask` $workgroup_mask^ ( `earlyTimeout` $early_timeout^)?)? ( `atomicBarrier` `(` $atomic_barrier_address^ `[` $atomic_barrier_indices `]` `:` type($atomic_barrier_address) `)`)? ( `iterate` $global_increment^ `,` $lds_increment `,` $iteration_count )? attr-dict `:` qualified(type($base)) `->` qualified(type($desc))", results(desc))]
pub struct MakeDmaDescriptorOp<'a> {
    #[slot(base_ty)]
    pub base: Value<'a>,
    #[slot(global_dynamic_sizes_ty)]
    pub global_dynamic_sizes: Vec<Value<'a>>,
    #[slot(global_dynamic_strides_ty)]
    pub global_dynamic_strides: Vec<Value<'a>>,
    #[slot(shared_dynamic_sizes_ty)]
    pub shared_dynamic_sizes: Vec<Value<'a>>,
    #[slot(workgroup_mask_ty)]
    pub workgroup_mask: Vec<Value<'a>>,
    #[slot(early_timeout_ty)]
    pub early_timeout: Vec<Value<'a>>,
    #[slot(pad_amount_ty)]
    pub pad_amount: Vec<Value<'a>>,
    #[slot(pad_interval_ty)]
    pub pad_interval: Vec<Value<'a>>,
    #[slot(atomic_barrier_address_ty)]
    pub atomic_barrier_address: Vec<Value<'a>>,
    #[slot(atomic_barrier_indices_ty)]
    pub atomic_barrier_indices: Vec<Value<'a>>,
    #[slot(global_increment_ty)]
    pub global_increment: Vec<Value<'a>>,
    #[slot(lds_increment_ty)]
    pub lds_increment: Vec<Value<'a>>,
    #[slot(iteration_count_ty)]
    pub iteration_count: Vec<Value<'a>>,
    #[attr(dense = "i64")]
    pub global_static_sizes: Attribute<'a>,
    #[attr(dense = "i64")]
    pub global_static_strides: Attribute<'a>,
    #[attr(dense = "i64")]
    pub shared_static_sizes: Attribute<'a>,
    #[dtype(strip = "amdgpu.tdm_base")]
    pub base_ty: Type<'a>,
    #[dtype(is = index)]
    pub global_dynamic_sizes_ty: Type<'a>,
    #[dtype(is = index)]
    pub global_dynamic_strides_ty: Type<'a>,
    #[dtype(is = index)]
    pub shared_dynamic_sizes_ty: Type<'a>,
    #[dtype(is = "vector<16xi1>")]
    pub workgroup_mask_ty: Type<'a>,
    #[dtype(is = i1)]
    pub early_timeout_ty: Type<'a>,
    #[dtype(is = i32)]
    pub pad_amount_ty: Type<'a>,
    #[dtype(is = i32)]
    pub pad_interval_ty: Type<'a>,
    pub atomic_barrier_address_ty: Vec<Type<'a>>,
    #[dtype(is = index)]
    pub atomic_barrier_indices_ty: Type<'a>,
    #[dtype(is = index)]
    pub global_increment_ty: Type<'a>,
    #[dtype(is = i32)]
    pub lds_increment_ty: Type<'a>,
    #[dtype(is = index)]
    pub iteration_count_ty: Type<'a>,
    #[dtype(is = "!amdgpu.tdm_descriptor")]
    pub desc: Type<'a>,
}

#[mlir::op("amdgpu.make_gather_dma_base", format = "$global `[` $global_indices `]` `,` $lds `[` $lds_indices `]` attr-dict `:` type($global) `,` type($lds) `->` qualified(type($base))", results(base))]
pub struct MakeGatherDmaBaseOp<'a> {
    #[slot(global_ty)]
    pub global: Value<'a>,
    #[slot(global_indices_ty)]
    pub global_indices: Vec<Value<'a>>,
    #[slot(lds_ty)]
    pub lds: Value<'a>,
    #[slot(lds_indices_ty)]
    pub lds_indices: Vec<Value<'a>>,
    pub global_ty: Type<'a>,
    #[dtype(is = index)]
    pub global_indices_ty: Type<'a>,
    pub lds_ty: Type<'a>,
    #[dtype(is = index)]
    pub lds_indices_ty: Type<'a>,
    #[dtype(strip = "amdgpu.tdm_gather_base")]
    pub base: Type<'a>,
}

#[mlir::op("amdgpu.make_gather_dma_descriptor", format = "$base `[` $indices `]` `globalSize` custom<DynamicIndexList>($global_dynamic_sizes, $global_static_sizes) `globalStride` custom<DynamicIndexList>($global_dynamic_strides, $global_static_strides) `sharedSize` custom<DynamicIndexList>($shared_dynamic_sizes, $shared_static_sizes) ( `padShared` `(` $pad_amount^ `every` $pad_interval `)` )? ( `workgroupMask` $workgroup_mask^ ( `earlyTimeout` $early_timeout^)?)? ( `atomicBarrier` `(` $atomic_barrier_address^ `[` $atomic_barrier_indices `]` `:` type($atomic_barrier_address) `)`)? ( `iterate` $global_increment^ `,` $lds_increment `,` $iteration_count )? attr-dict `:` qualified(type($base)) `,` type($indices) `->` qualified(type($desc))", results(desc))]
pub struct MakeGatherDmaDescriptorOp<'a> {
    #[slot(base_ty)]
    pub base: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Value<'a>,
    #[slot(global_dynamic_sizes_ty)]
    pub global_dynamic_sizes: Vec<Value<'a>>,
    #[slot(global_dynamic_strides_ty)]
    pub global_dynamic_strides: Vec<Value<'a>>,
    #[slot(shared_dynamic_sizes_ty)]
    pub shared_dynamic_sizes: Vec<Value<'a>>,
    #[slot(workgroup_mask_ty)]
    pub workgroup_mask: Vec<Value<'a>>,
    #[slot(early_timeout_ty)]
    pub early_timeout: Vec<Value<'a>>,
    #[slot(pad_amount_ty)]
    pub pad_amount: Vec<Value<'a>>,
    #[slot(pad_interval_ty)]
    pub pad_interval: Vec<Value<'a>>,
    #[slot(atomic_barrier_address_ty)]
    pub atomic_barrier_address: Vec<Value<'a>>,
    #[slot(atomic_barrier_indices_ty)]
    pub atomic_barrier_indices: Vec<Value<'a>>,
    #[slot(global_increment_ty)]
    pub global_increment: Vec<Value<'a>>,
    #[slot(lds_increment_ty)]
    pub lds_increment: Vec<Value<'a>>,
    #[slot(iteration_count_ty)]
    pub iteration_count: Vec<Value<'a>>,
    #[attr(dense = "i64")]
    pub global_static_sizes: Attribute<'a>,
    #[attr(dense = "i64")]
    pub global_static_strides: Attribute<'a>,
    #[attr(dense = "i64")]
    pub shared_static_sizes: Attribute<'a>,
    #[dtype(strip = "amdgpu.tdm_gather_base")]
    pub base_ty: Type<'a>,
    pub indices_ty: Type<'a>,
    #[dtype(is = index)]
    pub global_dynamic_sizes_ty: Type<'a>,
    #[dtype(is = index)]
    pub global_dynamic_strides_ty: Type<'a>,
    #[dtype(is = index)]
    pub shared_dynamic_sizes_ty: Type<'a>,
    #[dtype(is = "vector<16xi1>")]
    pub workgroup_mask_ty: Type<'a>,
    #[dtype(is = i1)]
    pub early_timeout_ty: Type<'a>,
    #[dtype(is = i32)]
    pub pad_amount_ty: Type<'a>,
    #[dtype(is = i32)]
    pub pad_interval_ty: Type<'a>,
    pub atomic_barrier_address_ty: Vec<Type<'a>>,
    #[dtype(is = index)]
    pub atomic_barrier_indices_ty: Type<'a>,
    #[dtype(is = index)]
    pub global_increment_ty: Type<'a>,
    #[dtype(is = i32)]
    pub lds_increment_ty: Type<'a>,
    #[dtype(is = index)]
    pub iteration_count_ty: Type<'a>,
    #[dtype(is = "!amdgpu.tdm_descriptor")]
    pub desc: Type<'a>,
}

#[mlir::op("amdgpu.memory_counter_wait", format = "oilist( `load` `(` $load `)` | `store` `(` $store `)` | `ds` `(` $ds `)` | `exp` `(` $exp `)` | `tensor` `(` $tensor `)` ) attr-dict")]
pub struct MemoryCounterWaitOp<'a> {
    #[attr(int = "i32")]
    pub load: Option<Attribute<'a>>,
    #[attr(int = "i32")]
    pub store: Option<Attribute<'a>>,
    #[attr(int = "i32")]
    pub ds: Option<Attribute<'a>>,
    #[attr(int = "i32")]
    pub exp: Option<Attribute<'a>>,
    #[attr(int = "i32")]
    pub tensor: Option<Attribute<'a>>,
}

#[mlir::op("amdgpu.packed_scaled_trunc", results(res))]
pub struct PackedScaledTruncOp<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[slot(existing_ty)]
    pub existing: Vec<Value<'a>>,
    #[attr(int = "i32")]
    pub index: Attribute<'a>,
    pub source_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    pub existing_ty: Vec<Type<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("amdgpu.packed_stoch_round_fp8", results(res))]
pub struct PackedStochRoundFp8Op<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    #[slot(stochiastic_param_ty, name = "stochiasticParam")]
    pub stochiastic_param: Value<'a>,
    #[slot(existing_ty)]
    pub existing: Vec<Value<'a>>,
    #[attr(name = "storeIndex", int = "i32")]
    pub store_index: Attribute<'a>,
    #[dtype(is = f32)]
    pub source_ty: Type<'a>,
    #[dtype(is = i32)]
    pub stochiastic_param_ty: Type<'a>,
    pub existing_ty: Vec<Type<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("amdgpu.packed_trunc_2xfp8", results(res))]
pub struct PackedTrunc2xFp8Op<'a> {
    #[slot(source_a_ty, name = "sourceA")]
    pub source_a: Value<'a>,
    #[slot(source_b_ty, name = "sourceB")]
    pub source_b: Vec<Value<'a>>,
    #[slot(existing_ty)]
    pub existing: Vec<Value<'a>>,
    #[attr(name = "wordIndex", int = "i32")]
    pub word_index: Attribute<'a>,
    #[dtype(is = f32)]
    pub source_a_ty: Type<'a>,
    #[dtype(is = f32)]
    pub source_b_ty: Type<'a>,
    pub existing_ty: Vec<Type<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("amdgpu.permlane_swap", format = "$src $row_length attr-dict `:` type($result)", results(result))]
pub struct PermlaneSwapOp<'a> {
    #[slot(result)]
    pub src: Value<'a>,
    #[attr(int = "i32")]
    pub row_length: Attribute<'a>,
    #[attr(default = "false")]
    pub fetch_inactive: Option<Attribute<'a>>,
    #[attr(default = "false")]
    pub bound_ctrl: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("amdgpu.permlane_var", format = "$src `,` $selector attr-dict `:` type($result)", results(result))]
pub struct PermlaneVarOp<'a> {
    #[slot(result)]
    pub src: Value<'a>,
    #[slot(selector_ty)]
    pub selector: Value<'a>,
    #[attr(default = "false")]
    pub cross: Option<Attribute<'a>>,
    #[attr(default = "false")]
    pub fetch_inactive: Option<Attribute<'a>>,
    #[attr(default = "false")]
    pub bound_ctrl: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub selector_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("amdgpu.raw_buffer_atomic_cmpswap", format = "attr-dict $src `,` $cmp `->` $memref `[` $indices `]` (`sgprOffset` $sgprOffset^)? `:` type($value) `->` type($memref) `,` type($indices)", results(value))]
pub struct RawBufferAtomicCmpswapOp<'a> {
    #[slot(value)]
    pub src: Value<'a>,
    #[slot(value)]
    pub cmp: Value<'a>,
    #[slot(memref_ty)]
    pub memref: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    #[slot(sgpr_offset_ty, name = "sgprOffset")]
    pub sgpr_offset: Vec<Value<'a>>,
    #[attr(name = "boundsCheck", default = "true")]
    pub bounds_check: Option<Attribute<'a>>,
    #[attr(name = "indexOffset", int = "i32")]
    pub index_offset: Option<Attribute<'a>>,
    pub memref_ty: Type<'a>,
    #[dtype(is = i32)]
    pub indices_ty: Type<'a>,
    #[dtype(is = i32)]
    pub sgpr_offset_ty: Type<'a>,
    pub value: Type<'a>,
}

#[mlir::op("amdgpu.raw_buffer_atomic_fadd", format = "attr-dict $value `->` $memref `[` $indices `]` (`sgprOffset` $sgprOffset^)? `:` type($value) `->` type($memref) `,` type($indices)", results(old_value))]
pub struct RawBufferAtomicFaddOp<'a> {
    #[slot(old_value)]
    pub value: Value<'a>,
    #[slot(memref_ty)]
    pub memref: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    #[slot(sgpr_offset_ty, name = "sgprOffset")]
    pub sgpr_offset: Vec<Value<'a>>,
    #[attr(name = "boundsCheck", default = "true")]
    pub bounds_check: Option<Attribute<'a>>,
    #[attr(name = "indexOffset", int = "i32")]
    pub index_offset: Option<Attribute<'a>>,
    pub memref_ty: Type<'a>,
    #[dtype(is = i32)]
    pub indices_ty: Type<'a>,
    #[dtype(is = i32)]
    pub sgpr_offset_ty: Type<'a>,
    pub old_value: Type<'a>,
}

#[mlir::op("amdgpu.raw_buffer_atomic_fmax", format = "attr-dict $value `->` $memref `[` $indices `]` (`sgprOffset` $sgprOffset^)? `:` type($value) `->` type($memref) `,` type($indices)", results(old_value))]
pub struct RawBufferAtomicFmaxOp<'a> {
    #[slot(old_value)]
    pub value: Value<'a>,
    #[slot(memref_ty)]
    pub memref: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    #[slot(sgpr_offset_ty, name = "sgprOffset")]
    pub sgpr_offset: Vec<Value<'a>>,
    #[attr(name = "boundsCheck", default = "true")]
    pub bounds_check: Option<Attribute<'a>>,
    #[attr(name = "indexOffset", int = "i32")]
    pub index_offset: Option<Attribute<'a>>,
    pub memref_ty: Type<'a>,
    #[dtype(is = i32)]
    pub indices_ty: Type<'a>,
    #[dtype(is = i32)]
    pub sgpr_offset_ty: Type<'a>,
    pub old_value: Type<'a>,
}

#[mlir::op("amdgpu.raw_buffer_atomic_smax", format = "attr-dict $value `->` $memref `[` $indices `]` (`sgprOffset` $sgprOffset^)? `:` type($value) `->` type($memref) `,` type($indices)", results(old_value))]
pub struct RawBufferAtomicSmaxOp<'a> {
    #[slot(old_value)]
    pub value: Value<'a>,
    #[slot(memref_ty)]
    pub memref: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    #[slot(sgpr_offset_ty, name = "sgprOffset")]
    pub sgpr_offset: Vec<Value<'a>>,
    #[attr(name = "boundsCheck", default = "true")]
    pub bounds_check: Option<Attribute<'a>>,
    #[attr(name = "indexOffset", int = "i32")]
    pub index_offset: Option<Attribute<'a>>,
    pub memref_ty: Type<'a>,
    #[dtype(is = i32)]
    pub indices_ty: Type<'a>,
    #[dtype(is = i32)]
    pub sgpr_offset_ty: Type<'a>,
    #[dtype(is = i32)]
    pub old_value: Type<'a>,
}

#[mlir::op("amdgpu.raw_buffer_atomic_umin", format = "attr-dict $value `->` $memref `[` $indices `]` (`sgprOffset` $sgprOffset^)? `:` type($value) `->` type($memref) `,` type($indices)", results(old_value))]
pub struct RawBufferAtomicUminOp<'a> {
    #[slot(old_value)]
    pub value: Value<'a>,
    #[slot(memref_ty)]
    pub memref: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    #[slot(sgpr_offset_ty, name = "sgprOffset")]
    pub sgpr_offset: Vec<Value<'a>>,
    #[attr(name = "boundsCheck", default = "true")]
    pub bounds_check: Option<Attribute<'a>>,
    #[attr(name = "indexOffset", int = "i32")]
    pub index_offset: Option<Attribute<'a>>,
    pub memref_ty: Type<'a>,
    #[dtype(is = i32)]
    pub indices_ty: Type<'a>,
    #[dtype(is = i32)]
    pub sgpr_offset_ty: Type<'a>,
    #[dtype(is = i32)]
    pub old_value: Type<'a>,
}

#[mlir::op("amdgpu.raw_buffer_load", format = "attr-dict $memref `[` $indices `]` (`sgprOffset` $sgprOffset^)? `:` type($memref) (`,` type($indices)^)? `->` type($value)", results(value))]
pub struct RawBufferLoadOp<'a> {
    #[slot(memref_ty)]
    pub memref: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    #[slot(sgpr_offset_ty, name = "sgprOffset")]
    pub sgpr_offset: Vec<Value<'a>>,
    #[attr(name = "boundsCheck", default = "true")]
    pub bounds_check: Option<Attribute<'a>>,
    #[attr(name = "indexOffset", int = "i32")]
    pub index_offset: Option<Attribute<'a>>,
    pub memref_ty: Type<'a>,
    #[dtype(is = i32)]
    pub indices_ty: Type<'a>,
    #[dtype(is = i32)]
    pub sgpr_offset_ty: Type<'a>,
    pub value: Type<'a>,
}

#[mlir::op("amdgpu.raw_buffer_store", format = "attr-dict $value `->` $memref `[` $indices `]` (`sgprOffset` $sgprOffset^)? `:` type($value) `->` type($memref) (`,` type($indices)^)?")]
pub struct RawBufferStoreOp<'a> {
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[slot(memref_ty)]
    pub memref: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    #[slot(sgpr_offset_ty, name = "sgprOffset")]
    pub sgpr_offset: Vec<Value<'a>>,
    #[attr(name = "boundsCheck", default = "true")]
    pub bounds_check: Option<Attribute<'a>>,
    #[attr(name = "indexOffset", int = "i32")]
    pub index_offset: Option<Attribute<'a>>,
    pub value_ty: Type<'a>,
    pub memref_ty: Type<'a>,
    #[dtype(is = i32)]
    pub indices_ty: Type<'a>,
    #[dtype(is = i32)]
    pub sgpr_offset_ty: Type<'a>,
}

#[mlir::op("amdgpu.scaled_ext_packed_matrix", format = "attr-dict $source `scale` `(` $scale `)` `blockSize` `(` $blockSize `)` `firstScaleLane` `(` $firstScaleLane`)` `firstScaleByte` `(` $firstScaleByte `)` `:` type($source) `,` type($scale) `->` type($res)", results(res))]
pub struct ScaledExtPackedMatrixOp<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "blockSize", int = "i32")]
    pub block_size: Attribute<'a>,
    #[attr(name = "firstScaleLane", int = "i32")]
    pub first_scale_lane: Attribute<'a>,
    #[attr(name = "firstScaleByte", int = "i32")]
    pub first_scale_byte: Attribute<'a>,
    pub source_ty: Type<'a>,
    pub scale_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("amdgpu.scaled_ext_packed", format = "attr-dict $source `[` $index `]` `,` $scale `:` type($source) `to` type($res)", results(res))]
pub struct ScaledExtPackedOp<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(int = "i32")]
    pub index: Attribute<'a>,
    pub source_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("amdgpu.scaled_mfma", results(dest_d))]
pub struct ScaledMFMAOp<'a> {
    #[slot(source_a_ty, name = "sourceA")]
    pub source_a: Value<'a>,
    #[slot(source_b_ty, name = "sourceB")]
    pub source_b: Value<'a>,
    #[slot(dest_d, name = "destC")]
    pub dest_c: Value<'a>,
    #[slot(scales_a_ty, name = "scalesA")]
    pub scales_a: Value<'a>,
    #[slot(scales_b_ty, name = "scalesB")]
    pub scales_b: Value<'a>,
    #[attr(int = "i32")]
    pub m: Attribute<'a>,
    #[attr(int = "i32")]
    pub n: Attribute<'a>,
    #[attr(int = "i32")]
    pub k: Attribute<'a>,
    #[attr(name = "scalesIdxA", int = "i32")]
    pub scales_idx_a: Attribute<'a>,
    #[attr(name = "scalesIdxB", int = "i32")]
    pub scales_idx_b: Attribute<'a>,
    pub source_a_ty: Type<'a>,
    pub source_b_ty: Type<'a>,
    pub scales_a_ty: Type<'a>,
    pub scales_b_ty: Type<'a>,
    pub dest_d: Type<'a>,
}

#[mlir::op("amdgpu.scaled_wmma", results(dest_d))]
pub struct ScaledWMMAOp<'a> {
    #[slot(source_a_ty, name = "sourceA")]
    pub source_a: Value<'a>,
    #[slot(source_b_ty, name = "sourceB")]
    pub source_b: Value<'a>,
    #[slot(dest_d, name = "destC")]
    pub dest_c: Value<'a>,
    #[slot(scale_a_ty, name = "scaleA")]
    pub scale_a: Value<'a>,
    #[slot(scale_b_ty, name = "scaleB")]
    pub scale_b: Value<'a>,
    #[attr(int = "i32")]
    pub m: Attribute<'a>,
    #[attr(int = "i32")]
    pub n: Attribute<'a>,
    #[attr(int = "i32")]
    pub k: Attribute<'a>,
    #[attr(int = "i32")]
    pub a_first_scale_lane: Attribute<'a>,
    #[attr(int = "i32")]
    pub b_first_scale_lane: Attribute<'a>,
    pub source_a_ty: Type<'a>,
    pub source_b_ty: Type<'a>,
    pub scale_a_ty: Type<'a>,
    pub scale_b_ty: Type<'a>,
    pub dest_d: Type<'a>,
}

#[mlir::op("amdgpu.sched_barrier", format = "`allow` `=` $opts attr-dict")]
pub struct SchedBarrierOp<'a> {
    #[attr(dialect = "rocdl<sched_group_mask")]
    pub opts: Attribute<'a>,
}

#[mlir::op("amdgpu.sparse_mfma", results(dest_d))]
pub struct SparseMFMAOp<'a> {
    #[slot(source_a_ty, name = "sourceA")]
    pub source_a: Value<'a>,
    #[slot(source_b_ty, name = "sourceB")]
    pub source_b: Value<'a>,
    #[slot(dest_d, name = "destC")]
    pub dest_c: Value<'a>,
    #[slot(sparse_idx_ty, name = "sparseIdx")]
    pub sparse_idx: Value<'a>,
    #[attr(int = "i32")]
    pub m: Attribute<'a>,
    #[attr(int = "i32")]
    pub n: Attribute<'a>,
    #[attr(int = "i32")]
    pub k: Attribute<'a>,
    #[attr(int = "i32", default = "0")]
    pub cbsz: Option<Attribute<'a>>,
    #[attr(int = "i32", default = "0")]
    pub abid: Option<Attribute<'a>>,
    pub source_a_ty: Type<'a>,
    pub source_b_ty: Type<'a>,
    pub sparse_idx_ty: Type<'a>,
    pub dest_d: Type<'a>,
}

#[mlir::op("amdgpu.sparse_wmma", results(dest_d))]
pub struct SparseWMMAOp<'a> {
    #[slot(source_a_ty, name = "sourceA")]
    pub source_a: Value<'a>,
    #[slot(source_b_ty, name = "sourceB")]
    pub source_b: Value<'a>,
    #[slot(dest_d, name = "destC")]
    pub dest_c: Value<'a>,
    #[slot(sparse_idx_ty, name = "sparseIdx")]
    pub sparse_idx: Value<'a>,
    #[attr(int = "i32")]
    pub m: Attribute<'a>,
    #[attr(int = "i32")]
    pub n: Attribute<'a>,
    #[attr(int = "i32")]
    pub k: Attribute<'a>,
    #[attr(name = "unsignedA")]
    pub unsigned_a: bool,
    #[attr(name = "unsignedB")]
    pub unsigned_b: bool,
    #[attr(name = "reuseA")]
    pub reuse_a: bool,
    #[attr(name = "reuseB")]
    pub reuse_b: bool,
    pub clamp: bool,
    pub wave64: bool,
    pub source_a_ty: Type<'a>,
    pub source_b_ty: Type<'a>,
    pub sparse_idx_ty: Type<'a>,
    pub dest_d: Type<'a>,
}

#[mlir::op("amdgpu.swizzle_bitmode", format = "$src $and_mask $or_mask $xor_mask attr-dict `:` type($result)", results(result))]
pub struct SwizzleBitModeOp<'a> {
    #[slot(result)]
    pub src: Value<'a>,
    #[attr(int = "i32")]
    pub and_mask: Attribute<'a>,
    #[attr(int = "i32")]
    pub or_mask: Attribute<'a>,
    #[attr(int = "i32")]
    pub xor_mask: Attribute<'a>,
    pub result: Type<'a>,
}

#[mlir::op("amdgpu.tensor_load_to_lds", format = "$desc attr-dict `:` qualified(type($desc))")]
pub struct TensorLoadToLDSOp<'a> {
    #[slot(desc_ty)]
    pub desc: Value<'a>,
    #[dtype(is = "!amdgpu.tdm_descriptor")]
    pub desc_ty: Type<'a>,
}

#[mlir::op("amdgpu.tensor_store_from_lds", format = "$desc attr-dict `:` qualified(type($desc))")]
pub struct TensorStoreFromLDSOp<'a> {
    #[slot(desc_ty)]
    pub desc: Value<'a>,
    #[dtype(is = "!amdgpu.tdm_descriptor")]
    pub desc_ty: Type<'a>,
}

#[mlir::op("amdgpu.transpose_load", format = "$src `[` $srcIndices `]` attr-dict `:` type($src) `->` type($result)", results(result))]
pub struct TransposeLoadOp<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(src_indices_ty, name = "srcIndices")]
    pub src_indices: Vec<Value<'a>>,
    pub src_ty: Type<'a>,
    #[dtype(is = index)]
    pub src_indices_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("amdgpu.wmma", results(dest_d))]
pub struct WMMAOp<'a> {
    #[slot(source_a_ty, name = "sourceA")]
    pub source_a: Value<'a>,
    #[slot(source_b_ty, name = "sourceB")]
    pub source_b: Value<'a>,
    #[slot(dest_d, name = "destC")]
    pub dest_c: Value<'a>,
    #[attr(int = "i32")]
    pub m: Attribute<'a>,
    #[attr(int = "i32")]
    pub n: Attribute<'a>,
    #[attr(int = "i32")]
    pub k: Attribute<'a>,
    #[attr(name = "subwordOffset", int = "i32", default = "0")]
    pub subword_offset: Option<Attribute<'a>>,
    #[attr(name = "unsignedA")]
    pub unsigned_a: bool,
    #[attr(name = "unsignedB")]
    pub unsigned_b: bool,
    pub clamp: bool,
    pub source_a_ty: Type<'a>,
    pub source_b_ty: Type<'a>,
    pub dest_d: Type<'a>,
}

#[mlir::dialect(
    "amdgpu",
    ops = [DPPOp, DotOp, DsAsyncBarrierArriveOp, DsBarrierArriveOp, DsBarrierInitOp, DsBarrierPollStateOp, DsBarrierStateInitCountOp, DsBarrierStatePendingCountOp, DsBarrierStatePhaseOp, DsBarrierStatePhaseParity, ExtPackedFp8Op, FatRawBufferCastOp, GatherToLDSOp, GlobalLoadAsyncToLDSOp, GlobalPrefetchOp, GlobalTransposeLoadOp, LDSBarrierOp, MFMAOp, MakeDmaBaseOp, MakeDmaDescriptorOp, MakeGatherDmaBaseOp, MakeGatherDmaDescriptorOp, MemoryCounterWaitOp, PackedScaledTruncOp, PackedStochRoundFp8Op, PackedTrunc2xFp8Op, PermlaneSwapOp, PermlaneVarOp, RawBufferAtomicCmpswapOp, RawBufferAtomicFaddOp, RawBufferAtomicFmaxOp, RawBufferAtomicSmaxOp, RawBufferAtomicUminOp, RawBufferLoadOp, RawBufferStoreOp, ScaledExtPackedMatrixOp, ScaledExtPackedOp, ScaledMFMAOp, ScaledWMMAOp, SchedBarrierOp, SparseMFMAOp, SparseWMMAOp, SwizzleBitModeOp, TensorLoadToLDSOp, TensorStoreFromLDSOp, TransposeLoadOp, WMMAOp],
    dependents = ["rocdl", "arith", "gpu"]
)]
pub struct AmdgpuDialect;
