#![allow(non_camel_case_types, unused_imports, clippy::all, rustdoc::all)]

use mlirformat::{mlir, Attribute, Region, Str, Type, Value, __Vec as Vec};

#[mlir::op("nvvm.addf", format = "$lhs `,` $rhs attr-dict `:` type($res)", results(res))]
pub struct AddFOp<'a> {
    #[slot(res)]
    pub lhs: Value<'a>,
    #[slot(res)]
    pub rhs: Value<'a>,
    #[attr(dialect = "nvvm.fp_rnd_mode", default = "<none>")]
    pub rnd: Option<Attribute<'a>>,
    #[attr(dialect = "nvvm.sat_mode", default = "<none>")]
    pub sat: Option<Attribute<'a>>,
    #[attr(default = "false")]
    pub ftz: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.aggr.smem.size", format = "attr-dict `:` type($res)", results(res))]
pub struct AggrSmemSize<'a> {
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.barrier.arrive", format = "(`id` `=` $barrierId^)? `number_of_threads` `=` $numberOfThreads attr-dict")]
pub struct BarrierArriveOp<'a> {
    #[slot(barrier_id_ty, name = "barrierId")]
    pub barrier_id: Vec<Value<'a>>,
    #[slot(number_of_threads_ty, name = "numberOfThreads")]
    pub number_of_threads: Value<'a>,
    #[attr(default = "true")]
    pub aligned: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub barrier_id_ty: Type<'a>,
    #[dtype(is = i32)]
    pub number_of_threads_ty: Type<'a>,
}

#[mlir::op("nvvm.barrier", format = "(`id` `=` $barrierId^)? (`number_of_threads` `=` $numberOfThreads^)? attr-dict")]
pub struct BarrierOp<'a> {
    #[slot(barrier_id_ty, name = "barrierId")]
    pub barrier_id: Vec<Value<'a>>,
    #[slot(number_of_threads_ty, name = "numberOfThreads")]
    pub number_of_threads: Vec<Value<'a>>,
    #[attr(default = "true")]
    pub aligned: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub barrier_id_ty: Type<'a>,
    #[dtype(is = i32)]
    pub number_of_threads_ty: Type<'a>,
}

#[mlir::op("nvvm.barrier.reduction", format = "qualified($reductionOp) $reductionPredicate (`id` `=` $barrierId^)? `->` type($res) attr-dict", results(res))]
pub struct BarrierReductionOp<'a> {
    #[slot(barrier_id_ty, name = "barrierId")]
    pub barrier_id: Vec<Value<'a>>,
    #[slot(reduction_predicate_ty, name = "reductionPredicate")]
    pub reduction_predicate: Value<'a>,
    #[attr(name = "reductionOp", dialect = "nvvm.reduction")]
    pub reduction_op: Attribute<'a>,
    #[attr(default = "true")]
    pub aligned: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub barrier_id_ty: Type<'a>,
    #[dtype(is = i32)]
    pub reduction_predicate_ty: Type<'a>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.ntid.x", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct BlockDimXOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.ntid.y", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct BlockDimYOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.ntid.z", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct BlockDimZOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.ctaid.x", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct BlockIdXOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.ctaid.y", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct BlockIdYOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.ctaid.z", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct BlockIdZOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.cluster.ctaid.x", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct BlockInClusterIdXOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.cluster.ctaid.y", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct BlockInClusterIdYOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.cluster.ctaid.z", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct BlockInClusterIdZOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.breakpoint", format = "attr-dict")]
pub struct Breakpoint<'a> {
}

#[mlir::op("nvvm.st.bulk", format = "$addr `,` `size` `=` $size (`,` `init` `=` $initVal^)? attr-dict `:` type($addr)")]
pub struct BulkStoreOp<'a> {
    #[slot(addr_ty)]
    pub addr: Value<'a>,
    #[slot(size_ty)]
    pub size: Value<'a>,
    #[attr(name = "initVal", int = "i64", default = "0")]
    pub init_val: Option<Attribute<'a>>,
    pub addr_ty: Type<'a>,
    #[dtype(is = i64)]
    pub size_ty: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.clock64", format = "attr-dict `:` type($res)", results(res))]
pub struct Clock64Op<'a> {
    #[dtype(is = i64)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.clock", format = "attr-dict `:` type($res)", results(res))]
pub struct ClockOp<'a> {
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.cluster.arrive", format = "attr-dict")]
pub struct ClusterArriveOp<'a> {
    pub aligned: bool,
}

#[mlir::op("nvvm.cluster.arrive.relaxed", format = "attr-dict")]
pub struct ClusterArriveRelaxedOp<'a> {
    pub aligned: bool,
}

#[mlir::op("nvvm.read.ptx.sreg.cluster.nctarank", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct ClusterDim<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.cluster.nctaid.x", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct ClusterDimBlocksXOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.cluster.nctaid.y", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct ClusterDimBlocksYOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.cluster.nctaid.z", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct ClusterDimBlocksZOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.nclusterid.x", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct ClusterDimXOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.nclusterid.y", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct ClusterDimYOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.nclusterid.z", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct ClusterDimZOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.cluster.ctarank", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct ClusterId<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.clusterid.x", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct ClusterIdXOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.clusterid.y", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct ClusterIdYOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.clusterid.z", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct ClusterIdZOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.clusterlaunchcontrol.query.cancel", format = "`query` `=` $query_type `,` $try_cancel_response attr-dict `:` type($res)", results(res))]
pub struct ClusterLaunchControlQueryCancelOp<'a> {
    #[slot(try_cancel_response_ty)]
    pub try_cancel_response: Value<'a>,
    #[attr(dialect = "nvvm<cluster_launch_control_query_type")]
    pub query_type: Attribute<'a>,
    #[dtype(is = i128)]
    pub try_cancel_response_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("nvvm.clusterlaunchcontrol.try.cancel", format = "(`multicast` $multicast^ `,`)? $smemAddress `,` $mbarrier attr-dict")]
pub struct ClusterLaunchControlTryCancelOp<'a> {
    #[slot(smem_address_ty, name = "smemAddress")]
    pub smem_address: Value<'a>,
    #[slot(mbarrier_ty)]
    pub mbarrier: Value<'a>,
    pub multicast: bool,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub smem_address_ty: Type<'a>,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub mbarrier_ty: Type<'a>,
}

#[mlir::op("nvvm.cluster.wait", format = "attr-dict")]
pub struct ClusterWaitOp<'a> {
    pub aligned: bool,
}

#[mlir::op("nvvm.convert.bf16x2.to.f4x2", format = "$src attr-dict `:` type($src) `->` type($dst) `(` $dstTy `)`", results(dst))]
pub struct ConvertBF16x2ToF4x2Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[attr(default = "false")]
    pub relu: Option<Attribute<'a>>,
    #[attr(name = "dstTy")]
    pub dst_ty: Attribute<'a>,
    pub src_ty: Type<'a>,
    #[dtype(is = i8)]
    pub dst: Type<'a>,
}

#[mlir::op("nvvm.convert.bf16x2.to.f6x2", format = "$src attr-dict `:` type($src) `->` type($dst) `(` $dstTy `)`", results(dst))]
pub struct ConvertBF16x2ToF6x2Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[attr(default = "false")]
    pub relu: Option<Attribute<'a>>,
    #[attr(name = "dstTy")]
    pub dst_ty: Attribute<'a>,
    pub src_ty: Type<'a>,
    pub dst: Type<'a>,
}

#[mlir::op("nvvm.convert.bf16x2.to.f8x2", format = "$src attr-dict `:` type($src) `->` type($dst) `(` $dstTy `)`", results(dst))]
pub struct ConvertBF16x2ToF8x2Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[attr(dialect = "nvvm.fp_rnd_mode", default = "<none>")]
    pub rnd: Option<Attribute<'a>>,
    #[attr(dialect = "nvvm.sat_mode", default = "<none>")]
    pub sat: Option<Attribute<'a>>,
    #[attr(default = "false")]
    pub relu: Option<Attribute<'a>>,
    #[attr(name = "dstTy")]
    pub dst_ty: Attribute<'a>,
    pub src_ty: Type<'a>,
    pub dst: Type<'a>,
}

#[mlir::op("nvvm.convert.bf16x2.to.s2f6x2", format = "$src (`,` $scaleFactor^)? attr-dict `:` type($src) `->` type($dst)", results(dst))]
pub struct ConvertBF16x2ToS2F6x2Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_factor_ty, name = "scaleFactor")]
    pub scale_factor: Vec<Value<'a>>,
    #[attr(default = "false")]
    pub relu: Option<Attribute<'a>>,
    pub src_ty: Type<'a>,
    #[dtype(is = i16)]
    pub scale_factor_ty: Type<'a>,
    pub dst: Type<'a>,
}

#[mlir::op("nvvm.convert.f16x2.to.f4x2", format = "$src attr-dict `:` type($src) `->` type($dst) `(` $dstTy `)`", results(dst))]
pub struct ConvertF16x2ToF4x2Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[attr(default = "false")]
    pub relu: Option<Attribute<'a>>,
    #[attr(name = "dstTy")]
    pub dst_ty: Attribute<'a>,
    pub src_ty: Type<'a>,
    #[dtype(is = i8)]
    pub dst: Type<'a>,
}

#[mlir::op("nvvm.convert.f16x2.to.f6x2", format = "$src attr-dict `:` type($src) `->` type($dst) `(` $dstTy `)`", results(dst))]
pub struct ConvertF16x2ToF6x2Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[attr(default = "false")]
    pub relu: Option<Attribute<'a>>,
    #[attr(name = "dstTy")]
    pub dst_ty: Attribute<'a>,
    pub src_ty: Type<'a>,
    pub dst: Type<'a>,
}

#[mlir::op("nvvm.convert.f16x2.to.f8x2", format = "$a attr-dict `:` type($a) `->` type($dst) `(` $dstTy `)`", results(dst))]
pub struct ConvertF16x2ToF8x2Op<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[attr(default = "false")]
    pub relu: Option<Attribute<'a>>,
    #[attr(name = "dstTy")]
    pub dst_ty: Attribute<'a>,
    pub a_ty: Type<'a>,
    pub dst: Type<'a>,
}

#[mlir::op("nvvm.convert.f32x2.to.bf16x2", format = "$src_hi `,` $src_lo (`,` $random_bits^)? attr-dict `:` type($dst)", results(dst))]
pub struct ConvertF32x2ToBF16x2Op<'a> {
    #[slot(src_hi_ty)]
    pub src_hi: Value<'a>,
    #[slot(src_lo_ty)]
    pub src_lo: Value<'a>,
    #[slot(random_bits_ty)]
    pub random_bits: Vec<Value<'a>>,
    #[attr(dialect = "nvvm.fp_rnd_mode", default = "<none>")]
    pub rnd: Option<Attribute<'a>>,
    #[attr(dialect = "nvvm.sat_mode", default = "<none>")]
    pub sat: Option<Attribute<'a>>,
    #[attr(default = "false")]
    pub relu: Option<Attribute<'a>>,
    #[dtype(is = f32)]
    pub src_hi_ty: Type<'a>,
    #[dtype(is = f32)]
    pub src_lo_ty: Type<'a>,
    #[dtype(is = i32)]
    pub random_bits_ty: Type<'a>,
    pub dst: Type<'a>,
}

#[mlir::op("nvvm.convert.f32x2.to.f16x2", format = "$src_hi `,` $src_lo (`,` $random_bits^)? attr-dict `:` type($dst)", results(dst))]
pub struct ConvertF32x2ToF16x2Op<'a> {
    #[slot(src_hi_ty)]
    pub src_hi: Value<'a>,
    #[slot(src_lo_ty)]
    pub src_lo: Value<'a>,
    #[slot(random_bits_ty)]
    pub random_bits: Vec<Value<'a>>,
    #[attr(dialect = "nvvm.fp_rnd_mode", default = "<none>")]
    pub rnd: Option<Attribute<'a>>,
    #[attr(dialect = "nvvm.sat_mode", default = "<none>")]
    pub sat: Option<Attribute<'a>>,
    #[attr(default = "false")]
    pub relu: Option<Attribute<'a>>,
    #[dtype(is = f32)]
    pub src_hi_ty: Type<'a>,
    #[dtype(is = f32)]
    pub src_lo_ty: Type<'a>,
    #[dtype(is = i32)]
    pub random_bits_ty: Type<'a>,
    pub dst: Type<'a>,
}

#[mlir::op("nvvm.convert.f32x2.to.f4x2", format = "$a `,` $b attr-dict `:` type($dst) `(` $dstTy `)`", results(dst))]
pub struct ConvertF32x2ToF4x2Op<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[attr(default = "false")]
    pub relu: Option<Attribute<'a>>,
    #[attr(name = "dstTy")]
    pub dst_ty: Attribute<'a>,
    #[dtype(is = f32)]
    pub a_ty: Type<'a>,
    #[dtype(is = f32)]
    pub b_ty: Type<'a>,
    #[dtype(is = i8)]
    pub dst: Type<'a>,
}

#[mlir::op("nvvm.convert.f32x2.to.f6x2", format = "$a `,` $b attr-dict `:` type($dst) `(` $dstTy `)`", results(dst))]
pub struct ConvertF32x2ToF6x2Op<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[attr(default = "false")]
    pub relu: Option<Attribute<'a>>,
    #[attr(name = "dstTy")]
    pub dst_ty: Attribute<'a>,
    #[dtype(is = f32)]
    pub a_ty: Type<'a>,
    #[dtype(is = f32)]
    pub b_ty: Type<'a>,
    pub dst: Type<'a>,
}

#[mlir::op("nvvm.convert.f32x2.to.f8x2", format = "$a `,` $b attr-dict `:` type($dst) `(` $dstTy `)`", results(dst))]
pub struct ConvertF32x2ToF8x2Op<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[attr(dialect = "nvvm.fp_rnd_mode", default = "<none>")]
    pub rnd: Option<Attribute<'a>>,
    #[attr(dialect = "nvvm.sat_mode", default = "<none>")]
    pub sat: Option<Attribute<'a>>,
    #[attr(default = "false")]
    pub relu: Option<Attribute<'a>>,
    #[attr(name = "dstTy")]
    pub dst_ty: Attribute<'a>,
    #[dtype(is = f32)]
    pub a_ty: Type<'a>,
    #[dtype(is = f32)]
    pub b_ty: Type<'a>,
    pub dst: Type<'a>,
}

#[mlir::op("nvvm.convert.f32x2.to.s2f6x2", format = "$a `,` $b (`,` $scaleFactor^)? attr-dict `:` type($dst)", results(dst))]
pub struct ConvertF32x2ToS2F6x2Op<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(scale_factor_ty, name = "scaleFactor")]
    pub scale_factor: Vec<Value<'a>>,
    #[attr(default = "false")]
    pub relu: Option<Attribute<'a>>,
    #[dtype(is = f32)]
    pub a_ty: Type<'a>,
    #[dtype(is = f32)]
    pub b_ty: Type<'a>,
    #[dtype(is = i16)]
    pub scale_factor_ty: Type<'a>,
    pub dst: Type<'a>,
}

#[mlir::op("nvvm.convert.f32x4.to.f4x4", format = "$src `,` $rbits attr-dict `:` type($src) `->` type($dst) `(` $dstTy `)`", results(dst))]
pub struct ConvertF32x4ToF4x4Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(rbits_ty)]
    pub rbits: Value<'a>,
    #[attr(default = "false")]
    pub relu: Option<Attribute<'a>>,
    #[attr(name = "dstTy")]
    pub dst_ty: Attribute<'a>,
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub rbits_ty: Type<'a>,
    #[dtype(is = i16)]
    pub dst: Type<'a>,
}

#[mlir::op("nvvm.convert.f32x4.to.f6x4", format = "$src `,` $rbits attr-dict `:` type($src) `->` type($dst) `(` $dstTy `)`", results(dst))]
pub struct ConvertF32x4ToF6x4Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(rbits_ty)]
    pub rbits: Value<'a>,
    #[attr(default = "false")]
    pub relu: Option<Attribute<'a>>,
    #[attr(name = "dstTy")]
    pub dst_ty: Attribute<'a>,
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub rbits_ty: Type<'a>,
    pub dst: Type<'a>,
}

#[mlir::op("nvvm.convert.f32x4.to.f8x4", format = "$src `,` $rbits attr-dict `:` type($src) `->` type($dst) `(` $dstTy `)`", results(dst))]
pub struct ConvertF32x4ToF8x4Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(rbits_ty)]
    pub rbits: Value<'a>,
    #[attr(default = "false")]
    pub relu: Option<Attribute<'a>>,
    #[attr(name = "dstTy")]
    pub dst_ty: Attribute<'a>,
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub rbits_ty: Type<'a>,
    pub dst: Type<'a>,
}

#[mlir::op("nvvm.convert.f4x2.to.bf16x2", format = "$src (`,` $scaleFactor^)? attr-dict `:` type($src) `(` $srcType `)` `->` type($dst)", results(dst))]
pub struct ConvertF4x2ToBF16x2Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_factor_ty, name = "scaleFactor")]
    pub scale_factor: Vec<Value<'a>>,
    #[attr(name = "srcType")]
    pub src_type: Attribute<'a>,
    #[attr(dialect = "nvvm.sat_mode", default = "<none>")]
    pub sat: Option<Attribute<'a>>,
    #[attr(default = "false")]
    pub relu: Option<Attribute<'a>>,
    #[dtype(is = i8)]
    pub src_ty: Type<'a>,
    #[dtype(is = i16)]
    pub scale_factor_ty: Type<'a>,
    pub dst: Type<'a>,
}

#[mlir::op("nvvm.convert.f4x2.to.f16x2", format = "$src attr-dict `:` type($src) `(` $srcType `)` `->` type($dst)", results(dst))]
pub struct ConvertF4x2ToF16x2Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[attr(name = "srcType")]
    pub src_type: Attribute<'a>,
    #[attr(default = "false")]
    pub relu: Option<Attribute<'a>>,
    #[dtype(is = i8)]
    pub src_ty: Type<'a>,
    pub dst: Type<'a>,
}

#[mlir::op("nvvm.convert.f6x2.to.bf16x2", format = "$src (`,` $scaleFactor^)? attr-dict `:` type($src) `(` $srcType `)` `->` type($dst)", results(dst))]
pub struct ConvertF6x2ToBF16x2Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_factor_ty, name = "scaleFactor")]
    pub scale_factor: Vec<Value<'a>>,
    #[attr(name = "srcType")]
    pub src_type: Attribute<'a>,
    #[attr(dialect = "nvvm.sat_mode", default = "<none>")]
    pub sat: Option<Attribute<'a>>,
    #[attr(default = "false")]
    pub relu: Option<Attribute<'a>>,
    pub src_ty: Type<'a>,
    #[dtype(is = i16)]
    pub scale_factor_ty: Type<'a>,
    pub dst: Type<'a>,
}

#[mlir::op("nvvm.convert.f6x2.to.f16x2", format = "$src attr-dict `:` type($src) `(` $srcType `)` `->` type($dst)", results(dst))]
pub struct ConvertF6x2ToF16x2Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[attr(name = "srcType")]
    pub src_type: Attribute<'a>,
    #[attr(default = "false")]
    pub relu: Option<Attribute<'a>>,
    pub src_ty: Type<'a>,
    pub dst: Type<'a>,
}

#[mlir::op("nvvm.convert.f8x2.to.bf16x2", format = "$src (`,` $scaleFactor^)? attr-dict `:` type($src) `(` $srcType `)` `->` type($dst)", results(dst))]
pub struct ConvertF8x2ToBF16x2Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_factor_ty, name = "scaleFactor")]
    pub scale_factor: Vec<Value<'a>>,
    #[attr(name = "srcType")]
    pub src_type: Attribute<'a>,
    #[attr(dialect = "nvvm.sat_mode", default = "<none>")]
    pub sat: Option<Attribute<'a>>,
    #[attr(default = "false")]
    pub relu: Option<Attribute<'a>>,
    pub src_ty: Type<'a>,
    #[dtype(is = i16)]
    pub scale_factor_ty: Type<'a>,
    pub dst: Type<'a>,
}

#[mlir::op("nvvm.convert.f8x2.to.f16x2", format = "$src attr-dict `:` type($src) `(` $srcType `)` `->` type($dst)", results(dst))]
pub struct ConvertF8x2ToF16x2Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[attr(name = "srcType")]
    pub src_type: Attribute<'a>,
    #[attr(default = "false")]
    pub relu: Option<Attribute<'a>>,
    pub src_ty: Type<'a>,
    pub dst: Type<'a>,
}

#[mlir::op("nvvm.convert.float.to.tf32", format = "$src attr-dict", results(res))]
pub struct ConvertFloatToTF32Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[attr(dialect = "nvvm.fp_rnd_mode", default = "<none>")]
    pub rnd: Option<Attribute<'a>>,
    #[attr(dialect = "nvvm.sat_mode", default = "<none>")]
    pub sat: Option<Attribute<'a>>,
    #[attr(default = "false")]
    pub relu: Option<Attribute<'a>>,
    #[dtype(is = f32)]
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.convert.s2f6x2.to.bf16x2", format = "$src (`,` $scaleFactor^)? attr-dict `:` type($src) `->` type($dst)", results(dst))]
pub struct ConvertS2F6x2ToBF16x2Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_factor_ty, name = "scaleFactor")]
    pub scale_factor: Vec<Value<'a>>,
    #[attr(dialect = "nvvm.sat_mode", default = "<none>")]
    pub sat: Option<Attribute<'a>>,
    #[attr(default = "false")]
    pub relu: Option<Attribute<'a>>,
    pub src_ty: Type<'a>,
    #[dtype(is = i16)]
    pub scale_factor_ty: Type<'a>,
    pub dst: Type<'a>,
}

#[mlir::op("nvvm.cos", format = "$src attr-dict `:` type($src)", results(res))]
pub struct CosOp<'a> {
    #[slot(res)]
    pub src: Value<'a>,
    #[attr(default = "false")]
    pub ftz: Option<Attribute<'a>>,
    #[dtype(is = f32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.cp.async.bulk.commit.group", format = "attr-dict")]
pub struct CpAsyncBulkCommitGroupOp<'a> {
}

#[mlir::op("nvvm.cp.async.bulk.shared.cluster.global", format = "$dstMem `,` $srcMem `,` $mbar `,` $size (`multicast_mask` `=` $multicastMask^ )? (`l2_cache_hint` `=` $l2CacheHint^ )? attr-dict `:` type($dstMem) `,` type($srcMem)")]
pub struct CpAsyncBulkGlobalToSharedClusterOp<'a> {
    #[slot(dst_mem_ty, name = "dstMem")]
    pub dst_mem: Value<'a>,
    #[slot(src_mem_ty, name = "srcMem")]
    pub src_mem: Value<'a>,
    #[slot(mbar_ty)]
    pub mbar: Value<'a>,
    #[slot(size_ty)]
    pub size: Value<'a>,
    #[slot(multicast_mask_ty, name = "multicastMask")]
    pub multicast_mask: Vec<Value<'a>>,
    #[slot(l2_cache_hint_ty, name = "l2CacheHint")]
    pub l2_cache_hint: Vec<Value<'a>>,
    pub dst_mem_ty: Type<'a>,
    #[dtype(is = "!llvm.ptr<1>", strip = "llvm.ptr")]
    pub src_mem_ty: Type<'a>,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub mbar_ty: Type<'a>,
    #[dtype(is = i32)]
    pub size_ty: Type<'a>,
    #[dtype(is = i16)]
    pub multicast_mask_ty: Type<'a>,
    #[dtype(is = i64)]
    pub l2_cache_hint_ty: Type<'a>,
}

#[mlir::op("nvvm.cp.async.bulk.prefetch", format = "$srcMem `,` $size (`l2_cache_hint` `=` $l2CacheHint^ )? attr-dict `:` type($srcMem)")]
pub struct CpAsyncBulkPrefetchOp<'a> {
    #[slot(src_mem_ty, name = "srcMem")]
    pub src_mem: Value<'a>,
    #[slot(size_ty)]
    pub size: Value<'a>,
    #[slot(l2_cache_hint_ty, name = "l2CacheHint")]
    pub l2_cache_hint: Vec<Value<'a>>,
    #[dtype(is = "!llvm.ptr<1>", strip = "llvm.ptr")]
    pub src_mem_ty: Type<'a>,
    #[dtype(is = i32)]
    pub size_ty: Type<'a>,
    #[dtype(is = i64)]
    pub l2_cache_hint_ty: Type<'a>,
}

#[mlir::op("nvvm.cp.async.bulk.global.shared.cta", format = "$dstMem `,` $srcMem `,` $size (`l2_cache_hint` `=` $l2CacheHint^ )? (`byte_mask` `=` $byteMask^ )? attr-dict `:` type($dstMem) `,` type($srcMem)")]
pub struct CpAsyncBulkSharedCTAToGlobalOp<'a> {
    #[slot(dst_mem_ty, name = "dstMem")]
    pub dst_mem: Value<'a>,
    #[slot(src_mem_ty, name = "srcMem")]
    pub src_mem: Value<'a>,
    #[slot(size_ty)]
    pub size: Value<'a>,
    #[slot(l2_cache_hint_ty, name = "l2CacheHint")]
    pub l2_cache_hint: Vec<Value<'a>>,
    #[slot(byte_mask_ty, name = "byteMask")]
    pub byte_mask: Vec<Value<'a>>,
    #[dtype(is = "!llvm.ptr<1>", strip = "llvm.ptr")]
    pub dst_mem_ty: Type<'a>,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub src_mem_ty: Type<'a>,
    #[dtype(is = i32)]
    pub size_ty: Type<'a>,
    #[dtype(is = i64)]
    pub l2_cache_hint_ty: Type<'a>,
    #[dtype(is = i16)]
    pub byte_mask_ty: Type<'a>,
}

#[mlir::op("nvvm.cp.async.bulk.shared.cluster.shared.cta", format = "$dstMem `,` $srcMem `,` $mbar `,` $size attr-dict `:` type($dstMem) `,` type($srcMem)")]
pub struct CpAsyncBulkSharedCTAToSharedClusterOp<'a> {
    #[slot(dst_mem_ty, name = "dstMem")]
    pub dst_mem: Value<'a>,
    #[slot(src_mem_ty, name = "srcMem")]
    pub src_mem: Value<'a>,
    #[slot(mbar_ty)]
    pub mbar: Value<'a>,
    #[slot(size_ty)]
    pub size: Value<'a>,
    #[dtype(is = "!llvm.ptr<7>", strip = "llvm.ptr")]
    pub dst_mem_ty: Type<'a>,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub src_mem_ty: Type<'a>,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub mbar_ty: Type<'a>,
    #[dtype(is = i32)]
    pub size_ty: Type<'a>,
}

#[mlir::op("nvvm.cp.async.bulk.tensor.shared.cluster.global", format = "$dstMem `,` $tmaDescriptor `,` $mbar `,` `box` `[`$coordinates `]` (`im2col` `[` $im2colOffsets^ `]` )? (`multicast_mask` `=` $multicastMask^ )? (`l2_cache_hint` `=` $l2CacheHint^ )? (`predicate` `=` $predicate^)? attr-dict `:` type($dstMem) `,` type($tmaDescriptor)")]
pub struct CpAsyncBulkTensorGlobalToSharedClusterOp<'a> {
    #[slot(dst_mem_ty, name = "dstMem")]
    pub dst_mem: Value<'a>,
    #[slot(tma_descriptor_ty, name = "tmaDescriptor")]
    pub tma_descriptor: Value<'a>,
    #[slot(coordinates_ty)]
    pub coordinates: Vec<Value<'a>>,
    #[slot(mbar_ty)]
    pub mbar: Value<'a>,
    #[slot(im2col_offsets_ty, name = "im2colOffsets")]
    pub im2col_offsets: Vec<Value<'a>>,
    #[slot(multicast_mask_ty, name = "multicastMask")]
    pub multicast_mask: Vec<Value<'a>>,
    #[slot(l2_cache_hint_ty, name = "l2CacheHint")]
    pub l2_cache_hint: Vec<Value<'a>>,
    #[slot(predicate_ty)]
    pub predicate: Vec<Value<'a>>,
    #[attr(dialect = "nvvm.tma_load_mode", default = "<tile>")]
    pub mode: Option<Attribute<'a>>,
    #[attr(name = "isCTAOnly", default = "false")]
    pub is_c_t_a_only: Option<Attribute<'a>>,
    #[attr(dialect = "nvvm.cta_group")]
    pub group: Option<Attribute<'a>>,
    pub dst_mem_ty: Type<'a>,
    #[dtype(is = "!llvm.ptr", strip = "llvm.ptr")]
    pub tma_descriptor_ty: Type<'a>,
    #[dtype(is = i32)]
    pub coordinates_ty: Type<'a>,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub mbar_ty: Type<'a>,
    #[dtype(is = i16)]
    pub im2col_offsets_ty: Type<'a>,
    #[dtype(is = i16)]
    pub multicast_mask_ty: Type<'a>,
    #[dtype(is = i64)]
    pub l2_cache_hint_ty: Type<'a>,
    #[dtype(is = i1)]
    pub predicate_ty: Type<'a>,
}

#[mlir::op("nvvm.cp.async.bulk.tensor.prefetch", format = "$tmaDescriptor `,` `box` `[`$coordinates `]` (`im2col` `[` $im2colOffsets^ `]` )? (`l2_cache_hint` `=` $l2CacheHint^ )? attr-dict `:` type($tmaDescriptor)")]
pub struct CpAsyncBulkTensorPrefetchOp<'a> {
    #[slot(tma_descriptor_ty, name = "tmaDescriptor")]
    pub tma_descriptor: Value<'a>,
    #[slot(coordinates_ty)]
    pub coordinates: Vec<Value<'a>>,
    #[slot(im2col_offsets_ty, name = "im2colOffsets")]
    pub im2col_offsets: Vec<Value<'a>>,
    #[slot(l2_cache_hint_ty, name = "l2CacheHint")]
    pub l2_cache_hint: Vec<Value<'a>>,
    #[attr(dialect = "nvvm.tma_load_mode", default = "<tile>")]
    pub mode: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr", strip = "llvm.ptr")]
    pub tma_descriptor_ty: Type<'a>,
    #[dtype(is = i32)]
    pub coordinates_ty: Type<'a>,
    #[dtype(is = i16)]
    pub im2col_offsets_ty: Type<'a>,
    #[dtype(is = i64)]
    pub l2_cache_hint_ty: Type<'a>,
}

#[mlir::op("nvvm.cp.async.bulk.tensor.reduce", format = "$tmaDescriptor `,` $srcMem `,` `box` `[`$coordinates `]` (`l2_cache_hint` `=` $l2CacheHint^ )? attr-dict `:` type($tmaDescriptor) `,` type($srcMem)")]
pub struct CpAsyncBulkTensorReduceOp<'a> {
    #[slot(tma_descriptor_ty, name = "tmaDescriptor")]
    pub tma_descriptor: Value<'a>,
    #[slot(src_mem_ty, name = "srcMem")]
    pub src_mem: Value<'a>,
    #[slot(coordinates_ty)]
    pub coordinates: Vec<Value<'a>>,
    #[slot(l2_cache_hint_ty, name = "l2CacheHint")]
    pub l2_cache_hint: Vec<Value<'a>>,
    #[attr(name = "redKind", dialect = "nvvm.tma_redux_kind")]
    pub red_kind: Attribute<'a>,
    #[attr(dialect = "nvvm.tma_store_mode", default = "<tile>")]
    pub mode: Option<Attribute<'a>>,
    #[dtype(strip = "llvm.ptr")]
    pub tma_descriptor_ty: Type<'a>,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub src_mem_ty: Type<'a>,
    #[dtype(is = i32)]
    pub coordinates_ty: Type<'a>,
    #[dtype(is = i64)]
    pub l2_cache_hint_ty: Type<'a>,
}

#[mlir::op("nvvm.cp.async.bulk.tensor.global.shared.cta", format = "$tmaDescriptor `,` $srcMem `,` `box` `[`$coordinates `]` (`l2_cache_hint` `=` $l2CacheHint^ )? (`,` `predicate` `=` $predicate^)? attr-dict `:` type($tmaDescriptor) `,` type($srcMem)")]
pub struct CpAsyncBulkTensorSharedCTAToGlobalOp<'a> {
    #[slot(tma_descriptor_ty, name = "tmaDescriptor")]
    pub tma_descriptor: Value<'a>,
    #[slot(src_mem_ty, name = "srcMem")]
    pub src_mem: Value<'a>,
    #[slot(coordinates_ty)]
    pub coordinates: Vec<Value<'a>>,
    #[slot(l2_cache_hint_ty, name = "l2CacheHint")]
    pub l2_cache_hint: Vec<Value<'a>>,
    #[slot(predicate_ty)]
    pub predicate: Vec<Value<'a>>,
    #[attr(dialect = "nvvm.tma_store_mode", default = "<tile>")]
    pub mode: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr", strip = "llvm.ptr")]
    pub tma_descriptor_ty: Type<'a>,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub src_mem_ty: Type<'a>,
    #[dtype(is = i32)]
    pub coordinates_ty: Type<'a>,
    #[dtype(is = i64)]
    pub l2_cache_hint_ty: Type<'a>,
    #[dtype(is = i1)]
    pub predicate_ty: Type<'a>,
}

#[mlir::op("nvvm.cp.async.bulk.wait_group", format = "$group attr-dict")]
pub struct CpAsyncBulkWaitGroupOp<'a> {
    #[attr(int = "i32")]
    pub group: Attribute<'a>,
    pub read: bool,
}

#[mlir::op("nvvm.cp.async.commit.group", format = "attr-dict")]
pub struct CpAsyncCommitGroupOp<'a> {
}

#[mlir::op("nvvm.cp.async.mbarrier.arrive", format = "$addr attr-dict `:` qualified(type($addr))")]
pub struct CpAsyncMBarrierArriveOp<'a> {
    #[slot(addr_ty)]
    pub addr: Value<'a>,
    #[attr(int = "i1", default = "0")]
    pub noinc: Option<Attribute<'a>>,
    pub addr_ty: Type<'a>,
}

#[mlir::op("nvvm.cp.async.shared.global")]
pub struct CpAsyncOp<'a> {
    #[slot(dst_ty)]
    pub dst: Value<'a>,
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(cp_size_ty, name = "cpSize")]
    pub cp_size: Vec<Value<'a>>,
    #[attr(int = "i32")]
    pub size: Attribute<'a>,
    #[attr(dialect = "nvvm<load_cache_modifier")]
    pub modifier: Attribute<'a>,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub dst_ty: Type<'a>,
    #[dtype(is = "!llvm.ptr<1>", strip = "llvm.ptr")]
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub cp_size_ty: Type<'a>,
}

#[mlir::op("nvvm.cp.async.wait.group", format = "$n attr-dict")]
pub struct CpAsyncWaitGroupOp<'a> {
    #[attr(int = "i32")]
    pub n: Attribute<'a>,
}

#[mlir::op("nvvm.divf", format = "$lhs `,` $rhs attr-dict `:` type($res)", results(res))]
pub struct DivFOp<'a> {
    #[slot(res)]
    pub lhs: Value<'a>,
    #[slot(res)]
    pub rhs: Value<'a>,
    #[attr(dialect = "nvvm.fp_rnd_mode", default = "<none>")]
    pub rnd: Option<Attribute<'a>>,
    #[attr(default = "false")]
    pub ftz: Option<Attribute<'a>>,
    #[attr(default = "false")]
    pub approx: Option<Attribute<'a>>,
    #[attr(default = "false")]
    pub full: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("nvvm.dot.accumulate.2way", format = "$a $a_type `,` $b $b_type `,` $c attr-dict `:` type($a) `,` type($b)", results(res))]
pub struct DotAccumulate2WayOp<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(dialect = "nvvm.dot_accumulate_type")]
    pub a_type: Attribute<'a>,
    #[attr(dialect = "nvvm.dot_accumulate_type")]
    pub b_type: Attribute<'a>,
    pub b_hi: Attribute<'a>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    #[dtype(is = i32)]
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.dot.accumulate.4way", format = "$a $a_type `,` $b $b_type `,` $c attr-dict `:` type($a) `,` type($b)", results(res))]
pub struct DotAccumulate4WayOp<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(dialect = "nvvm.dot_accumulate_type")]
    pub a_type: Attribute<'a>,
    #[attr(dialect = "nvvm.dot_accumulate_type")]
    pub b_type: Attribute<'a>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    #[dtype(is = i32)]
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.dynamic.smem.size", format = "attr-dict `:` type($res)", results(res))]
pub struct DynamicSmemSize<'a> {
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.elect.sync", format = "($membermask^)? attr-dict `->` qualified(type($pred))", results(pred))]
pub struct ElectSyncOp<'a> {
    #[slot(membermask_ty)]
    pub membermask: Vec<Value<'a>>,
    #[dtype(is = i32)]
    pub membermask_ty: Type<'a>,
    #[dtype(is = i1)]
    pub pred: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.envreg0", format = "attr-dict `:` type($res)", results(res))]
pub struct EnvReg0Op<'a> {
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.envreg10", format = "attr-dict `:` type($res)", results(res))]
pub struct EnvReg10Op<'a> {
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.envreg11", format = "attr-dict `:` type($res)", results(res))]
pub struct EnvReg11Op<'a> {
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.envreg12", format = "attr-dict `:` type($res)", results(res))]
pub struct EnvReg12Op<'a> {
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.envreg13", format = "attr-dict `:` type($res)", results(res))]
pub struct EnvReg13Op<'a> {
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.envreg14", format = "attr-dict `:` type($res)", results(res))]
pub struct EnvReg14Op<'a> {
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.envreg15", format = "attr-dict `:` type($res)", results(res))]
pub struct EnvReg15Op<'a> {
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.envreg16", format = "attr-dict `:` type($res)", results(res))]
pub struct EnvReg16Op<'a> {
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.envreg17", format = "attr-dict `:` type($res)", results(res))]
pub struct EnvReg17Op<'a> {
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.envreg18", format = "attr-dict `:` type($res)", results(res))]
pub struct EnvReg18Op<'a> {
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.envreg19", format = "attr-dict `:` type($res)", results(res))]
pub struct EnvReg19Op<'a> {
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.envreg1", format = "attr-dict `:` type($res)", results(res))]
pub struct EnvReg1Op<'a> {
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.envreg20", format = "attr-dict `:` type($res)", results(res))]
pub struct EnvReg20Op<'a> {
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.envreg21", format = "attr-dict `:` type($res)", results(res))]
pub struct EnvReg21Op<'a> {
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.envreg22", format = "attr-dict `:` type($res)", results(res))]
pub struct EnvReg22Op<'a> {
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.envreg23", format = "attr-dict `:` type($res)", results(res))]
pub struct EnvReg23Op<'a> {
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.envreg24", format = "attr-dict `:` type($res)", results(res))]
pub struct EnvReg24Op<'a> {
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.envreg25", format = "attr-dict `:` type($res)", results(res))]
pub struct EnvReg25Op<'a> {
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.envreg26", format = "attr-dict `:` type($res)", results(res))]
pub struct EnvReg26Op<'a> {
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.envreg27", format = "attr-dict `:` type($res)", results(res))]
pub struct EnvReg27Op<'a> {
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.envreg28", format = "attr-dict `:` type($res)", results(res))]
pub struct EnvReg28Op<'a> {
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.envreg29", format = "attr-dict `:` type($res)", results(res))]
pub struct EnvReg29Op<'a> {
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.envreg2", format = "attr-dict `:` type($res)", results(res))]
pub struct EnvReg2Op<'a> {
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.envreg30", format = "attr-dict `:` type($res)", results(res))]
pub struct EnvReg30Op<'a> {
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.envreg31", format = "attr-dict `:` type($res)", results(res))]
pub struct EnvReg31Op<'a> {
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.envreg3", format = "attr-dict `:` type($res)", results(res))]
pub struct EnvReg3Op<'a> {
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.envreg4", format = "attr-dict `:` type($res)", results(res))]
pub struct EnvReg4Op<'a> {
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.envreg5", format = "attr-dict `:` type($res)", results(res))]
pub struct EnvReg5Op<'a> {
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.envreg6", format = "attr-dict `:` type($res)", results(res))]
pub struct EnvReg6Op<'a> {
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.envreg7", format = "attr-dict `:` type($res)", results(res))]
pub struct EnvReg7Op<'a> {
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.envreg8", format = "attr-dict `:` type($res)", results(res))]
pub struct EnvReg8Op<'a> {
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.envreg9", format = "attr-dict `:` type($res)", results(res))]
pub struct EnvReg9Op<'a> {
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.ex2", format = "$src attr-dict `:` type($src)", results(res))]
pub struct Ex2Op<'a> {
    #[slot(res)]
    pub src: Value<'a>,
    #[attr(default = "false")]
    pub ftz: Option<Attribute<'a>>,
    #[dtype(is = f32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.exit", format = "attr-dict")]
pub struct Exit<'a> {
}

#[mlir::op("nvvm.fence.mbarrier.init", format = "attr-dict")]
pub struct FenceMbarrierInitOp<'a> {
}

#[mlir::op("nvvm.fence.proxy.acquire", format = "$scope $addr `,` $size (`from_proxy` `=` $fromProxy^)? (`to_proxy` `=` $toProxy^)? attr-dict")]
pub struct FenceProxyAcquireOp<'a> {
    #[slot(addr_ty)]
    pub addr: Value<'a>,
    #[slot(size_ty)]
    pub size: Value<'a>,
    #[attr(dialect = "nvvm.mem_scope")]
    pub scope: Attribute<'a>,
    #[attr(name = "fromProxy", dialect = "nvvm.proxy_kind", default = "<generic>")]
    pub from_proxy: Option<Attribute<'a>>,
    #[attr(name = "toProxy", dialect = "nvvm.proxy_kind", default = "<tensormap>")]
    pub to_proxy: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr", strip = "llvm.ptr")]
    pub addr_ty: Type<'a>,
    #[dtype(is = i32)]
    pub size_ty: Type<'a>,
}

#[mlir::op("nvvm.fence.proxy", format = "attr-dict")]
pub struct FenceProxyOp<'a> {
    #[attr(dialect = "nvvm.proxy_kind")]
    pub kind: Attribute<'a>,
    #[attr(dialect = "nvvm.shared_space")]
    pub space: Option<Attribute<'a>>,
}

#[mlir::op("nvvm.fence.proxy.release", format = "$scope (`from_proxy` `=` $fromProxy^)? (`to_proxy` `=` $toProxy^)? attr-dict")]
pub struct FenceProxyReleaseOp<'a> {
    #[attr(dialect = "nvvm.mem_scope")]
    pub scope: Attribute<'a>,
    #[attr(name = "fromProxy", dialect = "nvvm.proxy_kind", default = "<generic>")]
    pub from_proxy: Option<Attribute<'a>>,
    #[attr(name = "toProxy", dialect = "nvvm.proxy_kind", default = "<tensormap>")]
    pub to_proxy: Option<Attribute<'a>>,
}

#[mlir::op("nvvm.fence.proxy.sync_restrict", format = "attr-dict")]
pub struct FenceProxySyncRestrictOp<'a> {
    #[attr(dialect = "nvvm.mem_order")]
    pub order: Attribute<'a>,
    #[attr(name = "fromProxy", dialect = "nvvm.proxy_kind", default = "<generic>")]
    pub from_proxy: Option<Attribute<'a>>,
    #[attr(name = "toProxy", dialect = "nvvm.proxy_kind", default = "<async>")]
    pub to_proxy: Option<Attribute<'a>>,
}

#[mlir::op("nvvm.fence.sc.cluster", format = "attr-dict")]
pub struct FenceScClusterOp<'a> {
}

#[mlir::op("nvvm.fence.sync_restrict", format = "attr-dict")]
pub struct FenceSyncRestrictOp<'a> {
    #[attr(dialect = "nvvm.mem_order")]
    pub order: Attribute<'a>,
}

#[mlir::op("nvvm.fma", format = "$a `,` $b `,` $c attr-dict `:` type($a)", results(res))]
pub struct FmaOp<'a> {
    #[slot(res)]
    pub a: Value<'a>,
    #[slot(res)]
    pub b: Value<'a>,
    #[slot(res)]
    pub c: Value<'a>,
    #[attr(dialect = "nvvm.fp_rnd_mode")]
    pub rnd: Attribute<'a>,
    #[attr(dialect = "nvvm.sat_mode", default = "<none>")]
    pub sat: Option<Attribute<'a>>,
    #[attr(default = "false")]
    pub ftz: Option<Attribute<'a>>,
    #[attr(default = "false")]
    pub relu: Option<Attribute<'a>>,
    #[attr(default = "false")]
    pub oob: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.globaltimer.lo", format = "attr-dict `:` type($res)", results(res))]
pub struct GlobalTimerLoOp<'a> {
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.globaltimer", format = "attr-dict `:` type($res)", results(res))]
pub struct GlobalTimerOp<'a> {
    #[dtype(is = i64)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.nctaid.x", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct GridDimXOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.nctaid.y", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct GridDimYOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.nctaid.z", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct GridDimZOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.gridid", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct GridIdOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.griddepcontrol", format = "$kind attr-dict")]
pub struct GriddepcontrolOp<'a> {
    #[attr(dialect = "nvvm<grid_dep_action")]
    pub kind: Attribute<'a>,
}

#[mlir::op("nvvm.inline_ptx", format = "$ptxCode ( `ro` `(` $readOnlyArgs^ `:` type($readOnlyArgs) `)` )? ( `rw` `(` $readWriteArgs^ `:` type($readWriteArgs) `)` )? (`,` `predicate` `=` $predicate^)? attr-dict ( `->` type($writeOnlyArgs)^ )?", results(write_only_args))]
pub struct InlinePtxOp<'a> {
    #[slot(read_only_args_ty, name = "readOnlyArgs")]
    pub read_only_args: Vec<Value<'a>>,
    #[slot(read_write_args_ty, name = "readWriteArgs")]
    pub read_write_args: Vec<Value<'a>>,
    #[slot(predicate_ty)]
    pub predicate: Vec<Value<'a>>,
    #[attr(name = "ptxCode")]
    pub ptx_code: Attribute<'a>,
    pub read_only_args_ty: Vec<Type<'a>>,
    pub read_write_args_ty: Vec<Type<'a>>,
    #[dtype(is = i1)]
    pub predicate_ty: Type<'a>,
    #[dtype(name = "writeOnlyArgs")]
    pub write_only_args: Vec<Type<'a>>,
}

#[mlir::op("nvvm.read.ptx.sreg.laneid", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct LaneIdOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.lanemask.eq", format = "attr-dict `:` type($res)", results(res))]
pub struct LaneMaskEqOp<'a> {
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.lanemask.ge", format = "attr-dict `:` type($res)", results(res))]
pub struct LaneMaskGeOp<'a> {
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.lanemask.gt", format = "attr-dict `:` type($res)", results(res))]
pub struct LaneMaskGtOp<'a> {
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.lanemask.le", format = "attr-dict `:` type($res)", results(res))]
pub struct LaneMaskLeOp<'a> {
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.lanemask.lt", format = "attr-dict `:` type($res)", results(res))]
pub struct LaneMaskLtOp<'a> {
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.ldmatrix", format = "$ptr attr-dict `:` functional-type($ptr, $res)", results(res))]
pub struct LdMatrixOp<'a> {
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    #[attr(int = "i32")]
    pub num: Attribute<'a>,
    #[attr(dialect = "nvvm.mma_layout")]
    pub layout: Attribute<'a>,
    #[attr(dialect = "nvvm.ld_st_matrix_shape")]
    pub shape: Attribute<'a>,
    #[attr(name = "eltType", dialect = "nvvm.ld_st_matrix_elt_type")]
    pub elt_type: Attribute<'a>,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub ptr_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("nvvm.log2", format = "$src attr-dict `:` type($src)", results(res))]
pub struct Log2Op<'a> {
    #[slot(res)]
    pub src: Value<'a>,
    #[attr(default = "false")]
    pub ftz: Option<Attribute<'a>>,
    #[dtype(is = f32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.mbarrier.arrive_drop.expect_tx", format = "$addr `,` $txcount attr-dict `:` qualified(type($addr)) `,` qualified(type($txcount)) (`->` type($res)^)?", results(res))]
pub struct MBarrierArriveDropExpectTxOp<'a> {
    #[slot(addr_ty)]
    pub addr: Value<'a>,
    #[slot(txcount_ty)]
    pub txcount: Value<'a>,
    #[attr(dialect = "nvvm.mem_scope", default = "<cta>")]
    pub scope: Option<Attribute<'a>>,
    #[attr(default = "false")]
    pub relaxed: Option<Attribute<'a>>,
    pub addr_ty: Type<'a>,
    #[dtype(is = i32)]
    pub txcount_ty: Type<'a>,
    #[dtype(is = i64)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.mbarrier.arrive_drop.nocomplete", format = "$addr `,` $count attr-dict `:` qualified(type($addr)) `,` qualified(type($count)) `->` type($res)", results(res))]
pub struct MBarrierArriveDropNocompleteOp<'a> {
    #[slot(addr_ty)]
    pub addr: Value<'a>,
    #[slot(count_ty)]
    pub count: Value<'a>,
    pub addr_ty: Type<'a>,
    #[dtype(is = i32)]
    pub count_ty: Type<'a>,
    #[dtype(is = i64)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.mbarrier.arrive_drop", format = "$addr (`,` $count^)? attr-dict `:` type($addr) (`->` type($res)^)?", results(res))]
pub struct MBarrierArriveDropOp<'a> {
    #[slot(addr_ty)]
    pub addr: Value<'a>,
    #[slot(count_ty)]
    pub count: Vec<Value<'a>>,
    #[attr(dialect = "nvvm.mem_scope", default = "<cta>")]
    pub scope: Option<Attribute<'a>>,
    #[attr(default = "false")]
    pub relaxed: Option<Attribute<'a>>,
    pub addr_ty: Type<'a>,
    #[dtype(is = i32)]
    pub count_ty: Type<'a>,
    #[dtype(is = i64)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.mbarrier.arrive.expect_tx", results(res))]
pub struct MBarrierArriveExpectTxOp<'a> {
    #[slot(addr_ty)]
    pub addr: Value<'a>,
    #[slot(txcount_ty)]
    pub txcount: Value<'a>,
    #[slot(predicate_ty)]
    pub predicate: Vec<Value<'a>>,
    #[attr(dialect = "nvvm.mem_scope", default = "<cta>")]
    pub scope: Option<Attribute<'a>>,
    #[attr(default = "false")]
    pub relaxed: Option<Attribute<'a>>,
    pub addr_ty: Type<'a>,
    #[dtype(is = i32)]
    pub txcount_ty: Type<'a>,
    #[dtype(is = i1)]
    pub predicate_ty: Type<'a>,
    #[dtype(is = i64)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.mbarrier.arrive.nocomplete", format = "$addr `,` $count attr-dict `:` qualified(type($addr)) `,` qualified(type($count)) `->` type($res)", results(res))]
pub struct MBarrierArriveNocompleteOp<'a> {
    #[slot(addr_ty)]
    pub addr: Value<'a>,
    #[slot(count_ty)]
    pub count: Value<'a>,
    pub addr_ty: Type<'a>,
    #[dtype(is = i32)]
    pub count_ty: Type<'a>,
    #[dtype(is = i64)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.mbarrier.arrive", format = "$addr (`,` $count^)? attr-dict `:` type($addr) (`->` type($res)^)?", results(res))]
pub struct MBarrierArriveOp<'a> {
    #[slot(addr_ty)]
    pub addr: Value<'a>,
    #[slot(count_ty)]
    pub count: Vec<Value<'a>>,
    #[attr(dialect = "nvvm.mem_scope", default = "<cta>")]
    pub scope: Option<Attribute<'a>>,
    #[attr(default = "false")]
    pub relaxed: Option<Attribute<'a>>,
    pub addr_ty: Type<'a>,
    #[dtype(is = i32)]
    pub count_ty: Type<'a>,
    #[dtype(is = i64)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.mbarrier.complete_tx", format = "$addr `,` $txcount attr-dict `:` qualified(type($addr)) `,` qualified(type($txcount))")]
pub struct MBarrierCompleteTxOp<'a> {
    #[slot(addr_ty)]
    pub addr: Value<'a>,
    #[slot(txcount_ty)]
    pub txcount: Value<'a>,
    #[attr(dialect = "nvvm.mem_scope", default = "<cta>")]
    pub scope: Option<Attribute<'a>>,
    pub addr_ty: Type<'a>,
    #[dtype(is = i32)]
    pub txcount_ty: Type<'a>,
}

#[mlir::op("nvvm.mbarrier.expect_tx", format = "$addr `,` $txcount attr-dict `:` qualified(type($addr)) `,` qualified(type($txcount))")]
pub struct MBarrierExpectTxOp<'a> {
    #[slot(addr_ty)]
    pub addr: Value<'a>,
    #[slot(txcount_ty)]
    pub txcount: Value<'a>,
    #[attr(dialect = "nvvm.mem_scope", default = "<cta>")]
    pub scope: Option<Attribute<'a>>,
    pub addr_ty: Type<'a>,
    #[dtype(is = i32)]
    pub txcount_ty: Type<'a>,
}

#[mlir::op("nvvm.mbarrier.init")]
pub struct MBarrierInitOp<'a> {
    #[slot(addr_ty)]
    pub addr: Value<'a>,
    #[slot(count_ty)]
    pub count: Value<'a>,
    #[slot(predicate_ty)]
    pub predicate: Vec<Value<'a>>,
    pub addr_ty: Type<'a>,
    #[dtype(is = i32)]
    pub count_ty: Type<'a>,
    #[dtype(is = i1)]
    pub predicate_ty: Type<'a>,
}

#[mlir::op("nvvm.mbarrier.inval", format = "$addr attr-dict `:` qualified(type($addr))")]
pub struct MBarrierInvalOp<'a> {
    #[slot(addr_ty)]
    pub addr: Value<'a>,
    pub addr_ty: Type<'a>,
}

#[mlir::op("nvvm.mbarrier.test.wait", format = "$addr `,` $stateOrPhase attr-dict `:` qualified(type($addr)) `,` qualified(type($stateOrPhase)) `->` type($res)", results(res))]
pub struct MBarrierTestWaitOp<'a> {
    #[slot(addr_ty)]
    pub addr: Value<'a>,
    #[slot(state_or_phase_ty, name = "stateOrPhase")]
    pub state_or_phase: Value<'a>,
    #[attr(dialect = "nvvm.mem_scope", default = "<cta>")]
    pub scope: Option<Attribute<'a>>,
    #[attr(default = "false")]
    pub relaxed: Option<Attribute<'a>>,
    pub addr_ty: Type<'a>,
    pub state_or_phase_ty: Type<'a>,
    #[dtype(is = i1)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.mbarrier.try_wait", results(res))]
pub struct MBarrierTryWaitOp<'a> {
    #[slot(addr_ty)]
    pub addr: Value<'a>,
    #[slot(state_or_phase_ty, name = "stateOrPhase")]
    pub state_or_phase: Value<'a>,
    #[slot(ticks_ty)]
    pub ticks: Vec<Value<'a>>,
    #[attr(dialect = "nvvm.mem_scope", default = "<cta>")]
    pub scope: Option<Attribute<'a>>,
    #[attr(default = "false")]
    pub relaxed: Option<Attribute<'a>>,
    pub addr_ty: Type<'a>,
    pub state_or_phase_ty: Type<'a>,
    #[dtype(is = i32)]
    pub ticks_ty: Type<'a>,
    #[dtype(is = i1)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.mbarrier.try_wait.parity", format = "$addr `,` $phase `,` $ticks attr-dict `:` qualified(type($addr)) `,` qualified(type($phase)) `,` qualified(type($ticks))")]
pub struct MBarrierTryWaitParityOp<'a> {
    #[slot(addr_ty)]
    pub addr: Value<'a>,
    #[slot(phase_ty)]
    pub phase: Value<'a>,
    #[slot(ticks_ty)]
    pub ticks: Value<'a>,
    pub addr_ty: Type<'a>,
    #[dtype(is = i32)]
    pub phase_ty: Type<'a>,
    #[dtype(is = i32)]
    pub ticks_ty: Type<'a>,
}

#[mlir::op("nvvm.mapa", format = "$a`,` $b attr-dict `:` type($a) `->` type($res)", results(res))]
pub struct MapaOp<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    pub a_ty: Type<'a>,
    #[dtype(is = i32)]
    pub b_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("nvvm.match.sync", format = "$kind $thread_mask `,` $val attr-dict `:` type($val) `->` type($res)", results(res))]
pub struct MatchSyncOp<'a> {
    #[slot(thread_mask_ty)]
    pub thread_mask: Value<'a>,
    #[slot(val_ty)]
    pub val: Value<'a>,
    #[attr(dialect = "nvvm<match_sync_kind")]
    pub kind: Attribute<'a>,
    #[dtype(is = i32)]
    pub thread_mask_ty: Type<'a>,
    pub val_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("nvvm.memory.barrier", format = "$scope attr-dict")]
pub struct MembarOp<'a> {
    #[attr(dialect = "nvvm.mem_scope")]
    pub scope: Attribute<'a>,
}

#[mlir::op("nvvm.mma.block_scale", results(res))]
pub struct MmaBlockScaleOp<'a> {
    #[slot(operand_a_ty, name = "operandA")]
    pub operand_a: Vec<Value<'a>>,
    #[slot(operand_b_ty, name = "operandB")]
    pub operand_b: Vec<Value<'a>>,
    #[slot(operand_c_ty, name = "operandC")]
    pub operand_c: Vec<Value<'a>>,
    #[slot(scale_a_data_ty, name = "scaleAData")]
    pub scale_a_data: Value<'a>,
    #[slot(byte_id_a_ty, name = "byteIdA")]
    pub byte_id_a: Value<'a>,
    #[slot(thread_id_a_ty, name = "threadIdA")]
    pub thread_id_a: Value<'a>,
    #[slot(scale_b_data_ty, name = "scaleBData")]
    pub scale_b_data: Value<'a>,
    #[slot(byte_id_b_ty, name = "byteIdB")]
    pub byte_id_b: Value<'a>,
    #[slot(thread_id_b_ty, name = "threadIdB")]
    pub thread_id_b: Value<'a>,
    #[attr(dialect = "nvvm.shape")]
    pub shape: Attribute<'a>,
    #[attr(name = "multiplicandAPtxType", dialect = "nvvm.mma_type")]
    pub multiplicand_a_ptx_type: Option<Attribute<'a>>,
    #[attr(name = "multiplicandBPtxType", dialect = "nvvm.mma_type")]
    pub multiplicand_b_ptx_type: Option<Attribute<'a>>,
    #[attr(name = "scaleVecSize", dialect = "nvvm.scale_vec_size")]
    pub scale_vec_size: Attribute<'a>,
    #[attr(name = "blockScaleFormat", dialect = "nvvm.block_scale_format")]
    pub block_scale_format: Attribute<'a>,
    #[attr(dialect = "nvvm.block_scale_kind")]
    pub kind: Attribute<'a>,
    pub operand_a_ty: Vec<Type<'a>>,
    pub operand_b_ty: Vec<Type<'a>>,
    pub operand_c_ty: Vec<Type<'a>>,
    #[dtype(is = i32)]
    pub scale_a_data_ty: Type<'a>,
    #[dtype(is = i16)]
    pub byte_id_a_ty: Type<'a>,
    #[dtype(is = i16)]
    pub thread_id_a_ty: Type<'a>,
    #[dtype(is = i32)]
    pub scale_b_data_ty: Type<'a>,
    #[dtype(is = i16)]
    pub byte_id_b_ty: Type<'a>,
    #[dtype(is = i16)]
    pub thread_id_b_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("nvvm.mma.sync", results(res))]
pub struct MmaOp<'a> {
    #[slot(operand_a_ty, name = "operandA")]
    pub operand_a: Vec<Value<'a>>,
    #[slot(operand_b_ty, name = "operandB")]
    pub operand_b: Vec<Value<'a>>,
    #[slot(operand_c_ty, name = "operandC")]
    pub operand_c: Vec<Value<'a>>,
    #[attr(dialect = "nvvm.shape")]
    pub shape: Attribute<'a>,
    #[attr(name = "b1Op", dialect = "nvvm.mma_b1op")]
    pub b1_op: Option<Attribute<'a>>,
    #[attr(name = "intOverflowBehavior", dialect = "nvvm.mma_int_overflow")]
    pub int_overflow_behavior: Option<Attribute<'a>>,
    #[attr(name = "layoutA", dialect = "nvvm.mma_layout")]
    pub layout_a: Attribute<'a>,
    #[attr(name = "layoutB", dialect = "nvvm.mma_layout")]
    pub layout_b: Attribute<'a>,
    #[attr(name = "multiplicandAPtxType", dialect = "nvvm.mma_type")]
    pub multiplicand_a_ptx_type: Option<Attribute<'a>>,
    #[attr(name = "multiplicandBPtxType", dialect = "nvvm.mma_type")]
    pub multiplicand_b_ptx_type: Option<Attribute<'a>>,
    pub operand_a_ty: Vec<Type<'a>>,
    pub operand_b_ty: Vec<Type<'a>>,
    pub operand_c_ty: Vec<Type<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("nvvm.mma.sp.block_scale", results(res))]
pub struct MmaSpBlockScaleOp<'a> {
    #[slot(operand_a_ty, name = "operandA")]
    pub operand_a: Vec<Value<'a>>,
    #[slot(operand_b_ty, name = "operandB")]
    pub operand_b: Vec<Value<'a>>,
    #[slot(operand_c_ty, name = "operandC")]
    pub operand_c: Vec<Value<'a>>,
    #[slot(sparse_metadata_ty, name = "sparseMetadata")]
    pub sparse_metadata: Value<'a>,
    #[slot(sparsity_selector_ty, name = "sparsitySelector")]
    pub sparsity_selector: Value<'a>,
    #[slot(scale_a_data_ty, name = "scaleAData")]
    pub scale_a_data: Value<'a>,
    #[slot(byte_id_a_ty, name = "byteIdA")]
    pub byte_id_a: Value<'a>,
    #[slot(thread_id_a_ty, name = "threadIdA")]
    pub thread_id_a: Value<'a>,
    #[slot(scale_b_data_ty, name = "scaleBData")]
    pub scale_b_data: Value<'a>,
    #[slot(byte_id_b_ty, name = "byteIdB")]
    pub byte_id_b: Value<'a>,
    #[slot(thread_id_b_ty, name = "threadIdB")]
    pub thread_id_b: Value<'a>,
    #[attr(dialect = "nvvm.shape")]
    pub shape: Attribute<'a>,
    #[attr(name = "multiplicandAPtxType", dialect = "nvvm.mma_type")]
    pub multiplicand_a_ptx_type: Option<Attribute<'a>>,
    #[attr(name = "multiplicandBPtxType", dialect = "nvvm.mma_type")]
    pub multiplicand_b_ptx_type: Option<Attribute<'a>>,
    #[attr(name = "scaleVecSize", dialect = "nvvm.scale_vec_size")]
    pub scale_vec_size: Attribute<'a>,
    #[attr(name = "blockScaleFormat", dialect = "nvvm.block_scale_format")]
    pub block_scale_format: Attribute<'a>,
    #[attr(dialect = "nvvm.block_scale_kind")]
    pub kind: Attribute<'a>,
    #[attr(name = "orderedMetadata")]
    pub ordered_metadata: bool,
    pub operand_a_ty: Vec<Type<'a>>,
    pub operand_b_ty: Vec<Type<'a>>,
    pub operand_c_ty: Vec<Type<'a>>,
    #[dtype(is = i32)]
    pub sparse_metadata_ty: Type<'a>,
    #[dtype(is = i32)]
    pub sparsity_selector_ty: Type<'a>,
    #[dtype(is = i32)]
    pub scale_a_data_ty: Type<'a>,
    #[dtype(is = i16)]
    pub byte_id_a_ty: Type<'a>,
    #[dtype(is = i16)]
    pub thread_id_a_ty: Type<'a>,
    #[dtype(is = i32)]
    pub scale_b_data_ty: Type<'a>,
    #[dtype(is = i16)]
    pub byte_id_b_ty: Type<'a>,
    #[dtype(is = i16)]
    pub thread_id_b_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("nvvm.mma.sp.sync", results(res))]
pub struct MmaSpOp<'a> {
    #[slot(operand_a_ty, name = "operandA")]
    pub operand_a: Vec<Value<'a>>,
    #[slot(operand_b_ty, name = "operandB")]
    pub operand_b: Vec<Value<'a>>,
    #[slot(operand_c_ty, name = "operandC")]
    pub operand_c: Vec<Value<'a>>,
    #[slot(sparse_metadata_ty, name = "sparseMetadata")]
    pub sparse_metadata: Value<'a>,
    #[slot(sparsity_selector_ty, name = "sparsitySelector")]
    pub sparsity_selector: Value<'a>,
    #[attr(dialect = "nvvm.shape")]
    pub shape: Attribute<'a>,
    #[attr(name = "intOverflowBehavior", dialect = "nvvm.mma_int_overflow")]
    pub int_overflow_behavior: Option<Attribute<'a>>,
    #[attr(name = "multiplicandAPtxType", dialect = "nvvm.mma_type")]
    pub multiplicand_a_ptx_type: Option<Attribute<'a>>,
    #[attr(name = "multiplicandBPtxType", dialect = "nvvm.mma_type")]
    pub multiplicand_b_ptx_type: Option<Attribute<'a>>,
    #[attr(name = "orderedMetadata")]
    pub ordered_metadata: bool,
    #[attr(dialect = "nvvm.mma_kind")]
    pub kind: Option<Attribute<'a>>,
    pub operand_a_ty: Vec<Type<'a>>,
    pub operand_b_ty: Vec<Type<'a>>,
    pub operand_c_ty: Vec<Type<'a>>,
    #[dtype(is = i32)]
    pub sparse_metadata_ty: Type<'a>,
    #[dtype(is = i32)]
    pub sparsity_selector_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("nvvm.movmatrix", format = "$src attr-dict `:` type($src)", results(dst))]
pub struct MovMatrixOp<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[attr(dialect = "nvvm.ld_st_matrix_shape")]
    pub shape: Attribute<'a>,
    #[attr(dialect = "nvvm.mma_layout", default = "<col>")]
    pub layout: Option<Attribute<'a>>,
    #[attr(name = "eltType", dialect = "nvvm.ld_st_matrix_elt_type")]
    pub elt_type: Attribute<'a>,
    #[dtype(is = i32)]
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub dst: Type<'a>,
}

#[mlir::op("nvvm.nanosleep", format = "attr-dict $duration")]
pub struct NanosleepOp<'a> {
    #[slot(duration_ty)]
    pub duration: Value<'a>,
    #[dtype(is = i32)]
    pub duration_ty: Type<'a>,
}

#[mlir::op("nvvm.pmevent", format = "attr-dict (`id` `=` $eventId^)? (`mask` `=` $maskedEventId^)?")]
pub struct PMEventOp<'a> {
    #[attr(name = "maskedEventId", int = "i16")]
    pub masked_event_id: Option<Attribute<'a>>,
    #[attr(name = "eventId", int = "i32")]
    pub event_id: Option<Attribute<'a>>,
}

#[mlir::op("nvvm.prmt", format = "$mode $selector `,` $lo (`,` $hi^)? attr-dict `:` type($res)", results(res))]
pub struct PermuteOp<'a> {
    #[slot(lo_ty)]
    pub lo: Value<'a>,
    #[slot(hi_ty)]
    pub hi: Vec<Value<'a>>,
    #[slot(selector_ty)]
    pub selector: Value<'a>,
    #[attr(dialect = "nvvm.permute_mode")]
    pub mode: Attribute<'a>,
    #[dtype(is = i32)]
    pub lo_ty: Type<'a>,
    #[dtype(is = i32)]
    pub hi_ty: Type<'a>,
    #[dtype(is = i32)]
    pub selector_ty: Type<'a>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.prefetch")]
pub struct PrefetchOp<'a> {
    #[slot(addr_ty)]
    pub addr: Value<'a>,
    #[slot(predicate_ty)]
    pub predicate: Vec<Value<'a>>,
    #[attr(name = "cacheLevel", dialect = "nvvm<prefetch_cache_level")]
    pub cache_level: Option<Attribute<'a>>,
    #[attr(name = "evictPriority", dialect = "nvvm<cache_eviction_priority")]
    pub evict_priority: Option<Attribute<'a>>,
    pub tensormap: bool,
    pub uniform: bool,
    pub in_param_space: bool,
    pub addr_ty: Type<'a>,
    #[dtype(is = i1)]
    pub predicate_ty: Type<'a>,
}

#[mlir::op("nvvm.rcp.approx.ftz.f", format = "$arg attr-dict `:` type($res)", results(res))]
pub struct RcpApproxFtzF32Op<'a> {
    #[slot(arg_ty)]
    pub arg: Value<'a>,
    #[dtype(is = f32)]
    pub arg_ty: Type<'a>,
    #[dtype(is = f32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.redux.sync", format = "$kind $val `,` $mask_and_clamp attr-dict `:` type($val) `->` type($res)", results(res))]
pub struct ReduxOp<'a> {
    #[slot(res)]
    pub val: Value<'a>,
    #[slot(mask_and_clamp_ty)]
    pub mask_and_clamp: Value<'a>,
    #[attr(dialect = "nvvm<reduction_kind")]
    pub kind: Attribute<'a>,
    #[attr(default = "false")]
    pub abs: Option<Attribute<'a>>,
    #[attr(default = "false")]
    pub nan: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub mask_and_clamp_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("nvvm.rsqrt", format = "$src attr-dict `:` type($src)", results(res))]
pub struct RsqrtOp<'a> {
    #[slot(res)]
    pub src: Value<'a>,
    #[attr(default = "false")]
    pub ftz: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("nvvm.setmaxregister", format = "$action $regCount attr-dict")]
pub struct SetMaxRegisterOp<'a> {
    #[attr(name = "regCount", int = "i32")]
    pub reg_count: Attribute<'a>,
    #[attr(dialect = "nvvm<action")]
    pub action: Attribute<'a>,
}

#[mlir::op("nvvm.shfl.sync", format = "$kind $thread_mask `,` $val `,` $offset `,` $mask_and_clamp attr-dict `:` type($val) `->` type($res)", results(res))]
pub struct ShflOp<'a> {
    #[slot(thread_mask_ty)]
    pub thread_mask: Value<'a>,
    #[slot(val_ty)]
    pub val: Value<'a>,
    #[slot(offset_ty)]
    pub offset: Value<'a>,
    #[slot(mask_and_clamp_ty)]
    pub mask_and_clamp: Value<'a>,
    #[attr(dialect = "nvvm<shfl_kind")]
    pub kind: Attribute<'a>,
    pub return_value_and_is_valid: bool,
    #[dtype(is = i32)]
    pub thread_mask_ty: Type<'a>,
    pub val_ty: Type<'a>,
    #[dtype(is = i32)]
    pub offset_ty: Type<'a>,
    #[dtype(is = i32)]
    pub mask_and_clamp_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("nvvm.sin", format = "$src attr-dict `:` type($src)", results(res))]
pub struct SinOp<'a> {
    #[slot(res)]
    pub src: Value<'a>,
    #[attr(default = "false")]
    pub ftz: Option<Attribute<'a>>,
    #[dtype(is = f32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.nsmid", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct SmDimOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.smid", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct SmIdOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.sqrt.approx", format = "$src attr-dict `:` type($src)", results(res))]
pub struct SqrtApproxOp<'a> {
    #[slot(res)]
    pub src: Value<'a>,
    #[attr(default = "false")]
    pub ftz: Option<Attribute<'a>>,
    #[dtype(is = f32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.sqrt", format = "$src attr-dict `:` type($src)", results(res))]
pub struct SqrtOp<'a> {
    #[slot(res)]
    pub src: Value<'a>,
    #[attr(dialect = "nvvm.fp_rnd_mode")]
    pub rnd: Attribute<'a>,
    #[attr(default = "false")]
    pub ftz: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("nvvm.stmatrix")]
pub struct StMatrixOp<'a> {
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    #[slot(sources_ty)]
    pub sources: Vec<Value<'a>>,
    #[attr(dialect = "nvvm.mma_layout")]
    pub layout: Attribute<'a>,
    #[attr(dialect = "nvvm.ld_st_matrix_shape")]
    pub shape: Attribute<'a>,
    #[attr(name = "eltType", dialect = "nvvm.ld_st_matrix_elt_type")]
    pub elt_type: Attribute<'a>,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub ptr_ty: Type<'a>,
    #[dtype(is = i32)]
    pub sources_ty: Type<'a>,
}

#[mlir::op("nvvm.subf", format = "$lhs `,` $rhs attr-dict `:` type($res)", results(res))]
pub struct SubFOp<'a> {
    #[slot(res)]
    pub lhs: Value<'a>,
    #[slot(res)]
    pub rhs: Value<'a>,
    #[attr(dialect = "nvvm.fp_rnd_mode", default = "<none>")]
    pub rnd: Option<Attribute<'a>>,
    #[attr(dialect = "nvvm.sat_mode", default = "<none>")]
    pub sat: Option<Attribute<'a>>,
    #[attr(default = "false")]
    pub ftz: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("nvvm.bar.warp.sync", format = "$mask attr-dict `:` type($mask)")]
pub struct SyncWarpOp<'a> {
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[dtype(is = i32)]
    pub mask_ty: Type<'a>,
}

#[mlir::op("nvvm.tcgen05.alloc", format = "$addr `,` $nCols attr-dict `:` qualified(type($addr)) `,` qualified(type($nCols))")]
pub struct Tcgen05AllocOp<'a> {
    #[slot(addr_ty)]
    pub addr: Value<'a>,
    #[slot(n_cols_ty, name = "nCols")]
    pub n_cols: Value<'a>,
    #[attr(dialect = "nvvm.cta_group", default = "<cta_1>")]
    pub group: Option<Attribute<'a>>,
    pub addr_ty: Type<'a>,
    #[dtype(is = i32)]
    pub n_cols_ty: Type<'a>,
}

#[mlir::op("nvvm.tcgen05.commit")]
pub struct Tcgen05CommitOp<'a> {
    #[slot(addr_ty)]
    pub addr: Value<'a>,
    #[slot(multicast_mask_ty, name = "multicastMask")]
    pub multicast_mask: Vec<Value<'a>>,
    #[attr(dialect = "nvvm.cta_group", default = "<cta_1>")]
    pub group: Option<Attribute<'a>>,
    pub addr_ty: Type<'a>,
    #[dtype(is = i16)]
    pub multicast_mask_ty: Type<'a>,
}

#[mlir::op("nvvm.tcgen05.cp", format = "$taddr`,` $smem_desc attr-dict")]
pub struct Tcgen05CpOp<'a> {
    #[slot(taddr_ty)]
    pub taddr: Value<'a>,
    #[slot(smem_desc_ty)]
    pub smem_desc: Value<'a>,
    #[attr(dialect = "nvvm.tcgen05_cp_shape")]
    pub shape: Attribute<'a>,
    #[attr(dialect = "nvvm.cta_group", default = "<cta_1>")]
    pub group: Option<Attribute<'a>>,
    #[attr(dialect = "nvvm.tcgen05_cp_multicast", default = "<none>")]
    pub multicast: Option<Attribute<'a>>,
    #[attr(name = "srcFormat", dialect = "nvvm.tcgen05_cp_src_fmt")]
    pub src_format: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr<6>", strip = "llvm.ptr")]
    pub taddr_ty: Type<'a>,
    #[dtype(is = i64)]
    pub smem_desc_ty: Type<'a>,
}

#[mlir::op("nvvm.tcgen05.dealloc", format = "$taddr `,` $nCols attr-dict `:` qualified(type($taddr)) `,` qualified(type($nCols))")]
pub struct Tcgen05DeallocOp<'a> {
    #[slot(taddr_ty)]
    pub taddr: Value<'a>,
    #[slot(n_cols_ty, name = "nCols")]
    pub n_cols: Value<'a>,
    #[attr(dialect = "nvvm.cta_group", default = "<cta_1>")]
    pub group: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr<6>", strip = "llvm.ptr")]
    pub taddr_ty: Type<'a>,
    #[dtype(is = i32)]
    pub n_cols_ty: Type<'a>,
}

#[mlir::op("nvvm.tcgen05.fence", format = "$kind attr-dict")]
pub struct Tcgen05FenceOp<'a> {
    #[attr(dialect = "nvvm.tcgen05_fence")]
    pub kind: Attribute<'a>,
}

#[mlir::op("nvvm.tcgen05.ld", format = "$tmemAddr (`,` $offset^)? (`pack` $pack^)? attr-dict `:` type($res)", results(res))]
pub struct Tcgen05LdOp<'a> {
    #[slot(tmem_addr_ty, name = "tmemAddr")]
    pub tmem_addr: Value<'a>,
    #[slot(offset_ty)]
    pub offset: Vec<Value<'a>>,
    pub pack: bool,
    #[attr(dialect = "nvvm.tcgen05_ldst_shape")]
    pub shape: Attribute<'a>,
    #[dtype(is = "!llvm.ptr<6>", strip = "llvm.ptr")]
    pub tmem_addr_ty: Type<'a>,
    #[dtype(is = i64)]
    pub offset_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("nvvm.tcgen05.ld.red", format = "$op $addr (`,` $offset^)? attr-dict `:` type($data) `,` type($redVal)", results(data, red_val))]
pub struct Tcgen05LdRedOp<'a> {
    #[slot(addr_ty)]
    pub addr: Value<'a>,
    #[slot(offset_ty)]
    pub offset: Vec<Value<'a>>,
    #[attr(dialect = "nvvm.tcgen05_ldst_shape")]
    pub shape: Attribute<'a>,
    #[attr(dialect = "nvvm<reduction_kind")]
    pub op: Attribute<'a>,
    pub abs: bool,
    pub nan: bool,
    #[dtype(is = "!llvm.ptr<6>", strip = "llvm.ptr")]
    pub addr_ty: Type<'a>,
    #[dtype(is = i64)]
    pub offset_ty: Type<'a>,
    pub data: Type<'a>,
    #[dtype(name = "redVal")]
    pub red_val: Type<'a>,
}

#[mlir::op("nvvm.tcgen05.mma.block_scale", format = "$matrixD `,` $matrixA `,` $matrixB `,` $idesc `,` $enableInputD `,` $scaleA `,` $scaleB attr-dict `:` `(` qualified(type($matrixD)) `,` qualified(type($matrixA)) `,` qualified(type($matrixB)) `,` qualified(type($idesc)) `,` qualified(type($enableInputD)) `,` qualified(type($scaleA)) `,` qualified(type($scaleB)) `)`")]
pub struct Tcgen05MMABlockScaleOp<'a> {
    #[slot(matrix_d_ty, name = "matrixD")]
    pub matrix_d: Value<'a>,
    #[slot(matrix_a_ty, name = "matrixA")]
    pub matrix_a: Value<'a>,
    #[slot(matrix_b_ty, name = "matrixB")]
    pub matrix_b: Value<'a>,
    #[slot(idesc_ty)]
    pub idesc: Value<'a>,
    #[slot(enable_input_d_ty, name = "enableInputD")]
    pub enable_input_d: Value<'a>,
    #[slot(scale_a_ty, name = "scaleA")]
    pub scale_a: Value<'a>,
    #[slot(scale_b_ty, name = "scaleB")]
    pub scale_b: Value<'a>,
    #[attr(dialect = "nvvm.tcgen05_mma_kind")]
    pub kind: Attribute<'a>,
    #[attr(name = "ctaGroup", dialect = "nvvm.cta_group")]
    pub cta_group: Attribute<'a>,
    #[attr(name = "blockScale", dialect = "nvvm.tcgen05_mma_block_scale", default = "<default>")]
    pub block_scale: Option<Attribute<'a>>,
    #[attr(name = "collectorOp", dialect = "nvvm.tcgen05_mma_collectorop", default = "<discard>")]
    pub collector_op: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr<6>", strip = "llvm.ptr")]
    pub matrix_d_ty: Type<'a>,
    pub matrix_a_ty: Type<'a>,
    #[dtype(is = i64)]
    pub matrix_b_ty: Type<'a>,
    #[dtype(is = i32)]
    pub idesc_ty: Type<'a>,
    #[dtype(is = i1)]
    pub enable_input_d_ty: Type<'a>,
    #[dtype(is = "!llvm.ptr<6>", strip = "llvm.ptr")]
    pub scale_a_ty: Type<'a>,
    #[dtype(is = "!llvm.ptr<6>", strip = "llvm.ptr")]
    pub scale_b_ty: Type<'a>,
}

#[mlir::op("nvvm.tcgen05.mma")]
pub struct Tcgen05MMAOp<'a> {
    #[slot(matrix_d_ty, name = "matrixD")]
    pub matrix_d: Value<'a>,
    #[slot(matrix_a_ty, name = "matrixA")]
    pub matrix_a: Value<'a>,
    #[slot(matrix_b_ty, name = "matrixB")]
    pub matrix_b: Value<'a>,
    #[slot(idesc_ty)]
    pub idesc: Value<'a>,
    #[slot(enable_input_d_ty, name = "enableInputD")]
    pub enable_input_d: Value<'a>,
    #[slot(scale_input_d_ty, name = "scaleInputD")]
    pub scale_input_d: Vec<Value<'a>>,
    #[slot(disable_output_lane_ty, name = "disableOutputLane")]
    pub disable_output_lane: Vec<Value<'a>>,
    #[attr(dialect = "nvvm.tcgen05_mma_kind")]
    pub kind: Attribute<'a>,
    #[attr(name = "ctaGroup", dialect = "nvvm.cta_group")]
    pub cta_group: Attribute<'a>,
    #[attr(name = "collectorOp", dialect = "nvvm.tcgen05_mma_collectorop", default = "<discard>")]
    pub collector_op: Option<Attribute<'a>>,
    #[attr(name = "aShift")]
    pub a_shift: bool,
    #[dtype(is = "!llvm.ptr<6>", strip = "llvm.ptr")]
    pub matrix_d_ty: Type<'a>,
    pub matrix_a_ty: Type<'a>,
    #[dtype(is = i64)]
    pub matrix_b_ty: Type<'a>,
    #[dtype(is = i32)]
    pub idesc_ty: Type<'a>,
    #[dtype(is = i1)]
    pub enable_input_d_ty: Type<'a>,
    #[dtype(is = i64)]
    pub scale_input_d_ty: Type<'a>,
    pub disable_output_lane_ty: Vec<Type<'a>>,
}

#[mlir::op("nvvm.tcgen05.mma.sp.block_scale", format = "$matrixD `,` $matrixA `,` $matrixB `,` $idesc `,` $enableInputD `,` $sparseMetadata `,` $scaleA `,` $scaleB attr-dict `:` `(` qualified(type($matrixD)) `,` qualified(type($matrixA)) `,` qualified(type($matrixB)) `,` qualified(type($idesc)) `,` qualified(type($enableInputD)) `,` qualified(type($sparseMetadata)) `,` qualified(type($scaleA)) `,` qualified(type($scaleB)) `)`")]
pub struct Tcgen05MMASparseBlockScaleOp<'a> {
    #[slot(matrix_d_ty, name = "matrixD")]
    pub matrix_d: Value<'a>,
    #[slot(matrix_a_ty, name = "matrixA")]
    pub matrix_a: Value<'a>,
    #[slot(matrix_b_ty, name = "matrixB")]
    pub matrix_b: Value<'a>,
    #[slot(idesc_ty)]
    pub idesc: Value<'a>,
    #[slot(enable_input_d_ty, name = "enableInputD")]
    pub enable_input_d: Value<'a>,
    #[slot(sparse_metadata_ty, name = "sparseMetadata")]
    pub sparse_metadata: Value<'a>,
    #[slot(scale_a_ty, name = "scaleA")]
    pub scale_a: Value<'a>,
    #[slot(scale_b_ty, name = "scaleB")]
    pub scale_b: Value<'a>,
    #[attr(dialect = "nvvm.tcgen05_mma_kind")]
    pub kind: Attribute<'a>,
    #[attr(name = "ctaGroup", dialect = "nvvm.cta_group")]
    pub cta_group: Attribute<'a>,
    #[attr(name = "blockScale", dialect = "nvvm.tcgen05_mma_block_scale", default = "<default>")]
    pub block_scale: Option<Attribute<'a>>,
    #[attr(name = "collectorOp", dialect = "nvvm.tcgen05_mma_collectorop", default = "<discard>")]
    pub collector_op: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr<6>", strip = "llvm.ptr")]
    pub matrix_d_ty: Type<'a>,
    pub matrix_a_ty: Type<'a>,
    #[dtype(is = i64)]
    pub matrix_b_ty: Type<'a>,
    #[dtype(is = i32)]
    pub idesc_ty: Type<'a>,
    #[dtype(is = i1)]
    pub enable_input_d_ty: Type<'a>,
    #[dtype(is = "!llvm.ptr<6>", strip = "llvm.ptr")]
    pub sparse_metadata_ty: Type<'a>,
    #[dtype(is = "!llvm.ptr<6>", strip = "llvm.ptr")]
    pub scale_a_ty: Type<'a>,
    #[dtype(is = "!llvm.ptr<6>", strip = "llvm.ptr")]
    pub scale_b_ty: Type<'a>,
}

#[mlir::op("nvvm.tcgen05.mma.sp")]
pub struct Tcgen05MMASparseOp<'a> {
    #[slot(matrix_d_ty, name = "matrixD")]
    pub matrix_d: Value<'a>,
    #[slot(matrix_a_ty, name = "matrixA")]
    pub matrix_a: Value<'a>,
    #[slot(matrix_b_ty, name = "matrixB")]
    pub matrix_b: Value<'a>,
    #[slot(idesc_ty)]
    pub idesc: Value<'a>,
    #[slot(enable_input_d_ty, name = "enableInputD")]
    pub enable_input_d: Value<'a>,
    #[slot(sparse_metadata_ty, name = "sparseMetadata")]
    pub sparse_metadata: Value<'a>,
    #[slot(scale_input_d_ty, name = "scaleInputD")]
    pub scale_input_d: Vec<Value<'a>>,
    #[slot(disable_output_lane_ty, name = "disableOutputLane")]
    pub disable_output_lane: Vec<Value<'a>>,
    #[attr(dialect = "nvvm.tcgen05_mma_kind")]
    pub kind: Attribute<'a>,
    #[attr(name = "ctaGroup", dialect = "nvvm.cta_group")]
    pub cta_group: Attribute<'a>,
    #[attr(name = "collectorOp", dialect = "nvvm.tcgen05_mma_collectorop", default = "<discard>")]
    pub collector_op: Option<Attribute<'a>>,
    #[attr(name = "aShift")]
    pub a_shift: bool,
    #[dtype(is = "!llvm.ptr<6>", strip = "llvm.ptr")]
    pub matrix_d_ty: Type<'a>,
    pub matrix_a_ty: Type<'a>,
    #[dtype(is = i64)]
    pub matrix_b_ty: Type<'a>,
    #[dtype(is = i32)]
    pub idesc_ty: Type<'a>,
    #[dtype(is = i1)]
    pub enable_input_d_ty: Type<'a>,
    #[dtype(is = "!llvm.ptr<6>", strip = "llvm.ptr")]
    pub sparse_metadata_ty: Type<'a>,
    #[dtype(is = i64)]
    pub scale_input_d_ty: Type<'a>,
    pub disable_output_lane_ty: Vec<Type<'a>>,
}

#[mlir::op("nvvm.tcgen05.mma.ws")]
pub struct Tcgen05MMAWsOp<'a> {
    #[slot(matrix_d_ty, name = "matrixD")]
    pub matrix_d: Value<'a>,
    #[slot(matrix_a_ty, name = "matrixA")]
    pub matrix_a: Value<'a>,
    #[slot(matrix_b_ty, name = "matrixB")]
    pub matrix_b: Value<'a>,
    #[slot(idesc_ty)]
    pub idesc: Value<'a>,
    #[slot(enable_input_d_ty, name = "enableInputD")]
    pub enable_input_d: Value<'a>,
    #[slot(zero_col_mask_ty, name = "zeroColMask")]
    pub zero_col_mask: Vec<Value<'a>>,
    #[attr(dialect = "nvvm.tcgen05_mma_kind")]
    pub kind: Attribute<'a>,
    #[attr(name = "collectorBBuffer", dialect = "nvvm.tcgen05_mma_collectorb", default = "<b0>")]
    pub collector_b_buffer: Option<Attribute<'a>>,
    #[attr(name = "collectorOp", dialect = "nvvm.tcgen05_mma_collectorop", default = "<discard>")]
    pub collector_op: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr<6>", strip = "llvm.ptr")]
    pub matrix_d_ty: Type<'a>,
    pub matrix_a_ty: Type<'a>,
    #[dtype(is = i64)]
    pub matrix_b_ty: Type<'a>,
    #[dtype(is = i32)]
    pub idesc_ty: Type<'a>,
    #[dtype(is = i1)]
    pub enable_input_d_ty: Type<'a>,
    #[dtype(is = i64)]
    pub zero_col_mask_ty: Type<'a>,
}

#[mlir::op("nvvm.tcgen05.mma.ws.sp")]
pub struct Tcgen05MMAWsSparseOp<'a> {
    #[slot(matrix_d_ty, name = "matrixD")]
    pub matrix_d: Value<'a>,
    #[slot(matrix_a_ty, name = "matrixA")]
    pub matrix_a: Value<'a>,
    #[slot(matrix_b_ty, name = "matrixB")]
    pub matrix_b: Value<'a>,
    #[slot(idesc_ty)]
    pub idesc: Value<'a>,
    #[slot(enable_input_d_ty, name = "enableInputD")]
    pub enable_input_d: Value<'a>,
    #[slot(sparse_metadata_ty, name = "sparseMetadata")]
    pub sparse_metadata: Value<'a>,
    #[slot(zero_col_mask_ty, name = "zeroColMask")]
    pub zero_col_mask: Vec<Value<'a>>,
    #[attr(dialect = "nvvm.tcgen05_mma_kind")]
    pub kind: Attribute<'a>,
    #[attr(name = "collectorBBuffer", dialect = "nvvm.tcgen05_mma_collectorb", default = "<b0>")]
    pub collector_b_buffer: Option<Attribute<'a>>,
    #[attr(name = "collectorOp", dialect = "nvvm.tcgen05_mma_collectorop", default = "<discard>")]
    pub collector_op: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr<6>", strip = "llvm.ptr")]
    pub matrix_d_ty: Type<'a>,
    pub matrix_a_ty: Type<'a>,
    #[dtype(is = i64)]
    pub matrix_b_ty: Type<'a>,
    #[dtype(is = i32)]
    pub idesc_ty: Type<'a>,
    #[dtype(is = i1)]
    pub enable_input_d_ty: Type<'a>,
    #[dtype(is = "!llvm.ptr<6>", strip = "llvm.ptr")]
    pub sparse_metadata_ty: Type<'a>,
    #[dtype(is = i64)]
    pub zero_col_mask_ty: Type<'a>,
}

#[mlir::op("nvvm.tcgen05.mma_smem_desc", format = "`(` $startAddr `,` $leadingDimOffset `,` $strideDimOffset `,` $baseOffset `,` $leadingDimMode `,` $swizzleMode `)` attr-dict `:` `(` qualified(type($startAddr)) `,` qualified(type($leadingDimOffset)) `,` qualified(type($strideDimOffset)) `,` qualified(type($baseOffset)) `,` qualified(type($leadingDimMode)) `,` qualified(type($swizzleMode)) `)` `->` type($res)", results(res))]
pub struct Tcgen05MmaSmemDescOp<'a> {
    #[slot(start_addr_ty, name = "startAddr")]
    pub start_addr: Value<'a>,
    #[slot(leading_dim_offset_ty, name = "leadingDimOffset")]
    pub leading_dim_offset: Value<'a>,
    #[slot(stride_dim_offset_ty, name = "strideDimOffset")]
    pub stride_dim_offset: Value<'a>,
    #[slot(base_offset_ty, name = "baseOffset")]
    pub base_offset: Value<'a>,
    #[slot(leading_dim_mode_ty, name = "leadingDimMode")]
    pub leading_dim_mode: Value<'a>,
    #[slot(swizzle_mode_ty, name = "swizzleMode")]
    pub swizzle_mode: Value<'a>,
    #[dtype(is = i32)]
    pub start_addr_ty: Type<'a>,
    #[dtype(is = i32)]
    pub leading_dim_offset_ty: Type<'a>,
    #[dtype(is = i32)]
    pub stride_dim_offset_ty: Type<'a>,
    #[dtype(is = i8)]
    pub base_offset_ty: Type<'a>,
    #[dtype(is = i1)]
    pub leading_dim_mode_ty: Type<'a>,
    #[dtype(is = i8)]
    pub swizzle_mode_ty: Type<'a>,
    #[dtype(is = i64)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.tcgen05.relinquish_alloc_permit", format = "attr-dict")]
pub struct Tcgen05RelinquishAllocPermitOp<'a> {
    #[attr(dialect = "nvvm.cta_group", default = "<cta_1>")]
    pub group: Option<Attribute<'a>>,
}

#[mlir::op("nvvm.tcgen05.shift", format = "$taddr attr-dict `:` qualified(type($taddr))")]
pub struct Tcgen05ShiftOp<'a> {
    #[slot(taddr_ty)]
    pub taddr: Value<'a>,
    #[attr(dialect = "nvvm.cta_group", default = "<cta_1>")]
    pub group: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr<6>", strip = "llvm.ptr")]
    pub taddr_ty: Type<'a>,
}

#[mlir::op("nvvm.tcgen05.st", format = "$tmemAddr `,` $val (`,` $offset^)? (`unpack` $unpack^)? attr-dict `:` type($val)")]
pub struct Tcgen05StOp<'a> {
    #[slot(tmem_addr_ty, name = "tmemAddr")]
    pub tmem_addr: Value<'a>,
    #[slot(val_ty)]
    pub val: Value<'a>,
    #[slot(offset_ty)]
    pub offset: Vec<Value<'a>>,
    pub unpack: bool,
    #[attr(dialect = "nvvm.tcgen05_ldst_shape")]
    pub shape: Attribute<'a>,
    #[dtype(is = "!llvm.ptr<6>", strip = "llvm.ptr")]
    pub tmem_addr_ty: Type<'a>,
    pub val_ty: Type<'a>,
    #[dtype(is = i64)]
    pub offset_ty: Type<'a>,
}

#[mlir::op("nvvm.tcgen05.wait", format = "$kind attr-dict")]
pub struct Tcgen05WaitOp<'a> {
    #[attr(dialect = "nvvm.tcgen05_wait")]
    pub kind: Attribute<'a>,
}

#[mlir::op("nvvm.tensormap.replace")]
pub struct TensormapReplaceOp<'a> {
    #[slot(addr_ty)]
    pub addr: Value<'a>,
    #[slot(new_value_ty)]
    pub new_value: Vec<Value<'a>>,
    #[attr(dialect = "nvvm<tensormap_field")]
    pub field: Attribute<'a>,
    #[attr(int = "i32")]
    pub ord: Option<Attribute<'a>>,
    pub new_value_attr: Option<Attribute<'a>>,
    pub addr_ty: Type<'a>,
    pub new_value_ty: Vec<Type<'a>>,
}

#[mlir::op("nvvm.read.ptx.sreg.tid.x", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct ThreadIdXOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.tid.y", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct ThreadIdYOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.tid.z", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct ThreadIdZOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.total.smem.size", format = "attr-dict `:` type($res)", results(res))]
pub struct TotalSmemSize<'a> {
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.vote.sync", format = "$kind $mask `,` $pred attr-dict `->` type($res)", results(res))]
pub struct VoteSyncOp<'a> {
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(pred_ty)]
    pub pred: Value<'a>,
    #[attr(dialect = "nvvm<vote_sync_kind")]
    pub kind: Attribute<'a>,
    #[dtype(is = i32)]
    pub mask_ty: Type<'a>,
    #[dtype(is = i1)]
    pub pred_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("nvvm.wmma.load", format = "$ptr `,` $stride attr-dict `:` functional-type($ptr, $res)", results(res))]
pub struct WMMALoadOp<'a> {
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    #[slot(stride_ty)]
    pub stride: Value<'a>,
    #[attr(int = "i32")]
    pub m: Attribute<'a>,
    #[attr(int = "i32")]
    pub n: Attribute<'a>,
    #[attr(int = "i32")]
    pub k: Attribute<'a>,
    #[attr(dialect = "nvvm.mma_layout")]
    pub layout: Attribute<'a>,
    #[attr(dialect = "nvvm.mma_type")]
    pub eltype: Attribute<'a>,
    #[attr(dialect = "nvvm.mma_frag")]
    pub frag: Attribute<'a>,
    #[dtype(strip = "llvm.ptr")]
    pub ptr_ty: Type<'a>,
    #[dtype(is = i32)]
    pub stride_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("nvvm.wmma.mma", format = "$args attr-dict `:` functional-type($args, $res)", results(res))]
pub struct WMMAMmaOp<'a> {
    #[slot(args_ty)]
    pub args: Vec<Value<'a>>,
    #[attr(int = "i32")]
    pub m: Attribute<'a>,
    #[attr(int = "i32")]
    pub n: Attribute<'a>,
    #[attr(int = "i32")]
    pub k: Attribute<'a>,
    #[attr(name = "layoutA", dialect = "nvvm.mma_layout")]
    pub layout_a: Attribute<'a>,
    #[attr(name = "layoutB", dialect = "nvvm.mma_layout")]
    pub layout_b: Attribute<'a>,
    #[attr(name = "eltypeA", dialect = "nvvm.mma_type")]
    pub eltype_a: Attribute<'a>,
    #[attr(name = "eltypeB", dialect = "nvvm.mma_type")]
    pub eltype_b: Attribute<'a>,
    pub args_ty: Vec<Type<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("nvvm.wmma.store", format = "$ptr `,` $stride `,` $args attr-dict `:` qualified(type($ptr)) `,` type($args)")]
pub struct WMMAStoreOp<'a> {
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    #[slot(args_ty)]
    pub args: Vec<Value<'a>>,
    #[slot(stride_ty)]
    pub stride: Value<'a>,
    #[attr(int = "i32")]
    pub m: Attribute<'a>,
    #[attr(int = "i32")]
    pub n: Attribute<'a>,
    #[attr(int = "i32")]
    pub k: Attribute<'a>,
    #[attr(dialect = "nvvm.mma_layout")]
    pub layout: Attribute<'a>,
    #[attr(dialect = "nvvm.mma_type")]
    pub eltype: Attribute<'a>,
    #[dtype(strip = "llvm.ptr")]
    pub ptr_ty: Type<'a>,
    pub args_ty: Vec<Type<'a>>,
    #[dtype(is = i32)]
    pub stride_ty: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.nwarpid", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct WarpDimOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.warpid", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct WarpIdOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.read.ptx.sreg.warpsize", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct WarpSizeOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("nvvm.wgmma.fence.aligned", format = "attr-dict")]
pub struct WgmmaFenceAlignedOp<'a> {
}

#[mlir::op("nvvm.wgmma.commit.group.sync.aligned", format = "attr-dict")]
pub struct WgmmaGroupSyncAlignedOp<'a> {
}

#[mlir::op("nvvm.wgmma.mma_async", format = "$descriptorA `,` $descriptorB `,` $inouts `,` $shape `,` `D` `[` $typeD `,` $scaleD (`,` $satfinite^)? `]` `,` `A` `[` $typeA `,` $scaleA `,` $layoutA `]` `,` `B` `[` $typeB `,` $scaleB `,` $layoutB `]` attr-dict `:` type($inouts) `->` type($results)", results(results))]
pub struct WgmmaMmaAsyncOp<'a> {
    #[slot(inouts_ty)]
    pub inouts: Value<'a>,
    #[slot(descriptor_a_ty, name = "descriptorA")]
    pub descriptor_a: Value<'a>,
    #[slot(descriptor_b_ty, name = "descriptorB")]
    pub descriptor_b: Value<'a>,
    #[attr(dialect = "nvvm.shape")]
    pub shape: Attribute<'a>,
    #[attr(name = "typeA", dialect = "nvvm.wgmma_type")]
    pub type_a: Attribute<'a>,
    #[attr(name = "typeB", dialect = "nvvm.wgmma_type")]
    pub type_b: Attribute<'a>,
    #[attr(name = "typeD", dialect = "nvvm.wgmma_type")]
    pub type_d: Attribute<'a>,
    #[attr(name = "scaleD", dialect = "nvvm.wgmma_scale_out")]
    pub scale_d: Attribute<'a>,
    #[attr(name = "scaleA", dialect = "nvvm.wgmma_scale_in")]
    pub scale_a: Attribute<'a>,
    #[attr(name = "scaleB", dialect = "nvvm.wgmma_scale_in")]
    pub scale_b: Attribute<'a>,
    #[attr(name = "layoutA", dialect = "nvvm.mma_layout")]
    pub layout_a: Attribute<'a>,
    #[attr(name = "layoutB", dialect = "nvvm.mma_layout")]
    pub layout_b: Attribute<'a>,
    #[attr(dialect = "nvvm.mma_int_overflow")]
    pub satfinite: Option<Attribute<'a>>,
    pub inouts_ty: Type<'a>,
    #[dtype(is = i64)]
    pub descriptor_a_ty: Type<'a>,
    #[dtype(is = i64)]
    pub descriptor_b_ty: Type<'a>,
    pub results: Type<'a>,
}

#[mlir::op("nvvm.wgmma.wait.group.sync.aligned", format = "attr-dict $group")]
pub struct WgmmaWaitGroupSyncOp<'a> {
    #[attr(int = "i64")]
    pub group: Attribute<'a>,
}

#[mlir::dialect(
    "nvvm",
    ops = [AddFOp, AggrSmemSize, BarrierArriveOp, BarrierOp, BarrierReductionOp, BlockDimXOp, BlockDimYOp, BlockDimZOp, BlockIdXOp, BlockIdYOp, BlockIdZOp, BlockInClusterIdXOp, BlockInClusterIdYOp, BlockInClusterIdZOp, Breakpoint, BulkStoreOp, Clock64Op, ClockOp, ClusterArriveOp, ClusterArriveRelaxedOp, ClusterDim, ClusterDimBlocksXOp, ClusterDimBlocksYOp, ClusterDimBlocksZOp, ClusterDimXOp, ClusterDimYOp, ClusterDimZOp, ClusterId, ClusterIdXOp, ClusterIdYOp, ClusterIdZOp, ClusterLaunchControlQueryCancelOp, ClusterLaunchControlTryCancelOp, ClusterWaitOp, ConvertBF16x2ToF4x2Op, ConvertBF16x2ToF6x2Op, ConvertBF16x2ToF8x2Op, ConvertBF16x2ToS2F6x2Op, ConvertF16x2ToF4x2Op, ConvertF16x2ToF6x2Op, ConvertF16x2ToF8x2Op, ConvertF32x2ToBF16x2Op, ConvertF32x2ToF16x2Op, ConvertF32x2ToF4x2Op, ConvertF32x2ToF6x2Op, ConvertF32x2ToF8x2Op, ConvertF32x2ToS2F6x2Op, ConvertF32x4ToF4x4Op, ConvertF32x4ToF6x4Op, ConvertF32x4ToF8x4Op, ConvertF4x2ToBF16x2Op, ConvertF4x2ToF16x2Op, ConvertF6x2ToBF16x2Op, ConvertF6x2ToF16x2Op, ConvertF8x2ToBF16x2Op, ConvertF8x2ToF16x2Op, ConvertFloatToTF32Op, ConvertS2F6x2ToBF16x2Op, CosOp, CpAsyncBulkCommitGroupOp, CpAsyncBulkGlobalToSharedClusterOp, CpAsyncBulkPrefetchOp, CpAsyncBulkSharedCTAToGlobalOp, CpAsyncBulkSharedCTAToSharedClusterOp, CpAsyncBulkTensorGlobalToSharedClusterOp, CpAsyncBulkTensorPrefetchOp, CpAsyncBulkTensorReduceOp, CpAsyncBulkTensorSharedCTAToGlobalOp, CpAsyncBulkWaitGroupOp, CpAsyncCommitGroupOp, CpAsyncMBarrierArriveOp, CpAsyncOp, CpAsyncWaitGroupOp, DivFOp, DotAccumulate2WayOp, DotAccumulate4WayOp, DynamicSmemSize, ElectSyncOp, EnvReg0Op, EnvReg10Op, EnvReg11Op, EnvReg12Op, EnvReg13Op, EnvReg14Op, EnvReg15Op, EnvReg16Op, EnvReg17Op, EnvReg18Op, EnvReg19Op, EnvReg1Op, EnvReg20Op, EnvReg21Op, EnvReg22Op, EnvReg23Op, EnvReg24Op, EnvReg25Op, EnvReg26Op, EnvReg27Op, EnvReg28Op, EnvReg29Op, EnvReg2Op, EnvReg30Op, EnvReg31Op, EnvReg3Op, EnvReg4Op, EnvReg5Op, EnvReg6Op, EnvReg7Op, EnvReg8Op, EnvReg9Op, Ex2Op, Exit, FenceMbarrierInitOp, FenceProxyAcquireOp, FenceProxyOp, FenceProxyReleaseOp, FenceProxySyncRestrictOp, FenceScClusterOp, FenceSyncRestrictOp, FmaOp, GlobalTimerLoOp, GlobalTimerOp, GridDimXOp, GridDimYOp, GridDimZOp, GridIdOp, GriddepcontrolOp, InlinePtxOp, LaneIdOp, LaneMaskEqOp, LaneMaskGeOp, LaneMaskGtOp, LaneMaskLeOp, LaneMaskLtOp, LdMatrixOp, Log2Op, MBarrierArriveDropExpectTxOp, MBarrierArriveDropNocompleteOp, MBarrierArriveDropOp, MBarrierArriveExpectTxOp, MBarrierArriveNocompleteOp, MBarrierArriveOp, MBarrierCompleteTxOp, MBarrierExpectTxOp, MBarrierInitOp, MBarrierInvalOp, MBarrierTestWaitOp, MBarrierTryWaitOp, MBarrierTryWaitParityOp, MapaOp, MatchSyncOp, MembarOp, MmaBlockScaleOp, MmaOp, MmaSpBlockScaleOp, MmaSpOp, MovMatrixOp, NanosleepOp, PMEventOp, PermuteOp, PrefetchOp, RcpApproxFtzF32Op, ReduxOp, RsqrtOp, SetMaxRegisterOp, ShflOp, SinOp, SmDimOp, SmIdOp, SqrtApproxOp, SqrtOp, StMatrixOp, SubFOp, SyncWarpOp, Tcgen05AllocOp, Tcgen05CommitOp, Tcgen05CpOp, Tcgen05DeallocOp, Tcgen05FenceOp, Tcgen05LdOp, Tcgen05LdRedOp, Tcgen05MMABlockScaleOp, Tcgen05MMAOp, Tcgen05MMASparseBlockScaleOp, Tcgen05MMASparseOp, Tcgen05MMAWsOp, Tcgen05MMAWsSparseOp, Tcgen05MmaSmemDescOp, Tcgen05RelinquishAllocPermitOp, Tcgen05ShiftOp, Tcgen05StOp, Tcgen05WaitOp, TensormapReplaceOp, ThreadIdXOp, ThreadIdYOp, ThreadIdZOp, TotalSmemSize, VoteSyncOp, WMMALoadOp, WMMAMmaOp, WMMAStoreOp, WarpDimOp, WarpIdOp, WarpSizeOp, WgmmaFenceAlignedOp, WgmmaGroupSyncAlignedOp, WgmmaMmaAsyncOp, WgmmaWaitGroupSyncOp],
    dependents = ["llvm"]
)]
pub struct NvvmDialect;
