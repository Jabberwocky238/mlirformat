#![allow(non_camel_case_types, unused_imports, clippy::all, rustdoc::all)]

use mlirformat::{mlir, Attribute, Region, Str, Type, Value, __Vec as Vec};

#[mlir::op("rocdl.cos", format = "$arg qualified(type($arg)) attr-dict `->` qualified(type($res))", results(res))]
pub struct ROCDLCos<'a> {
    #[slot(arg_ty)]
    pub arg: Value<'a>,
    pub arg_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.exp", format = "$arg qualified(type($arg)) attr-dict `->` qualified(type($res))", results(res))]
pub struct ROCDLExp<'a> {
    #[slot(arg_ty)]
    pub arg: Value<'a>,
    pub arg_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.exp2", format = "$arg qualified(type($arg)) attr-dict `->` qualified(type($res))", results(res))]
pub struct ROCDLExp2<'a> {
    #[slot(arg_ty)]
    pub arg: Value<'a>,
    pub arg_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.log", format = "$arg qualified(type($arg)) attr-dict `->` qualified(type($res))", results(res))]
pub struct ROCDLLog<'a> {
    #[slot(arg_ty)]
    pub arg: Value<'a>,
    pub arg_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.rcp", format = "$arg qualified(type($arg)) attr-dict `->` qualified(type($res))", results(res))]
pub struct ROCDLRcp<'a> {
    #[slot(arg_ty)]
    pub arg: Value<'a>,
    pub arg_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.rsq", format = "$arg qualified(type($arg)) attr-dict `->` qualified(type($res))", results(res))]
pub struct ROCDLRsq<'a> {
    #[slot(arg_ty)]
    pub arg: Value<'a>,
    pub arg_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.sin", format = "$arg qualified(type($arg)) attr-dict `->` qualified(type($res))", results(res))]
pub struct ROCDLSin<'a> {
    #[slot(arg_ty)]
    pub arg: Value<'a>,
    pub arg_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.sqrt", format = "$arg qualified(type($arg)) attr-dict `->` qualified(type($res))", results(res))]
pub struct ROCDLSqrt<'a> {
    #[slot(arg_ty)]
    pub arg: Value<'a>,
    pub arg_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.tanh", format = "$arg qualified(type($arg)) attr-dict `->` qualified(type($res))", results(res))]
pub struct ROCDLTanh<'a> {
    #[slot(arg_ty)]
    pub arg: Value<'a>,
    pub arg_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.asyncmark", format = "attr-dict")]
pub struct AsyncmarkOp<'a> {
}

#[mlir::op("rocdl.ballot", format = "$pred attr-dict `:` type($res)", results(res))]
pub struct BallotOp<'a> {
    #[slot(pred_ty)]
    pub pred: Value<'a>,
    #[dtype(is = i1)]
    pub pred_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.s.barrier.init", format = "$ptr `member_cnt` `=` $memberCnt attr-dict `:` qualified(type($ptr))")]
pub struct BarrierInitOp<'a> {
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    #[attr(name = "memberCnt", int = "i32")]
    pub member_cnt: Attribute<'a>,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub ptr_ty: Type<'a>,
}

#[mlir::op("rocdl.s.barrier.join", format = "$ptr attr-dict `:` qualified(type($ptr))")]
pub struct BarrierJoinOp<'a> {
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub ptr_ty: Type<'a>,
}

#[mlir::op("rocdl.s.barrier.leave", format = "`id` `=` $id attr-dict")]
pub struct BarrierLeaveOp<'a> {
    #[attr(int = "i16")]
    pub id: Attribute<'a>,
}

#[mlir::op("rocdl.barrier", format = "attr-dict")]
pub struct BarrierOp<'a> {
}

#[mlir::op("rocdl.s.barrier.signal.isfirst", format = "`id` `=` $id attr-dict `->` type($res)", results(res))]
pub struct BarrierSignalIsfirstOp<'a> {
    #[attr(int = "i32")]
    pub id: Attribute<'a>,
    #[dtype(is = i1)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.s.barrier.signal", format = "`id` `=` $id attr-dict")]
pub struct BarrierSignalOp<'a> {
    #[attr(int = "i32")]
    pub id: Attribute<'a>,
}

#[mlir::op("rocdl.s.barrier.signal.var", format = "$ptr `member_cnt` `=` $memberCnt attr-dict `:` qualified(type($ptr))")]
pub struct BarrierSignalVarOp<'a> {
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    #[attr(name = "memberCnt", int = "i32")]
    pub member_cnt: Attribute<'a>,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub ptr_ty: Type<'a>,
}

#[mlir::op("rocdl.s.barrier.wait", format = "`id` `=` $id attr-dict")]
pub struct BarrierWaitOp<'a> {
    #[attr(int = "i16")]
    pub id: Attribute<'a>,
}

#[mlir::op("rocdl.workgroup.id.x", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct BlockIdXOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.workgroup.id.y", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct BlockIdYOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.workgroup.id.z", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct BlockIdZOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cluster.id.x", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct ClusterIdXOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cluster.id.y", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct ClusterIdYOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cluster.id.z", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct ClusterIdZOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cluster.load.async.to.lds.b128")]
pub struct ClusterLoadAsyncToLDSB128Op<'a> {
    #[slot(global_ptr_ty, name = "globalPtr")]
    pub global_ptr: Value<'a>,
    #[slot(lds_ptr_ty, name = "ldsPtr")]
    pub lds_ptr: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[attr(int = "i32")]
    pub offset: Attribute<'a>,
    pub cpol: Option<Attribute<'a>>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr<1>", strip = "llvm.ptr")]
    pub global_ptr_ty: Type<'a>,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub lds_ptr_ty: Type<'a>,
    #[dtype(is = i32)]
    pub mask_ty: Type<'a>,
}

#[mlir::op("rocdl.cluster.load.async.to.lds.b32")]
pub struct ClusterLoadAsyncToLDSB32Op<'a> {
    #[slot(global_ptr_ty, name = "globalPtr")]
    pub global_ptr: Value<'a>,
    #[slot(lds_ptr_ty, name = "ldsPtr")]
    pub lds_ptr: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[attr(int = "i32")]
    pub offset: Attribute<'a>,
    pub cpol: Option<Attribute<'a>>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr<1>", strip = "llvm.ptr")]
    pub global_ptr_ty: Type<'a>,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub lds_ptr_ty: Type<'a>,
    #[dtype(is = i32)]
    pub mask_ty: Type<'a>,
}

#[mlir::op("rocdl.cluster.load.async.to.lds.b64")]
pub struct ClusterLoadAsyncToLDSB64Op<'a> {
    #[slot(global_ptr_ty, name = "globalPtr")]
    pub global_ptr: Value<'a>,
    #[slot(lds_ptr_ty, name = "ldsPtr")]
    pub lds_ptr: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[attr(int = "i32")]
    pub offset: Attribute<'a>,
    pub cpol: Option<Attribute<'a>>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr<1>", strip = "llvm.ptr")]
    pub global_ptr_ty: Type<'a>,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub lds_ptr_ty: Type<'a>,
    #[dtype(is = i32)]
    pub mask_ty: Type<'a>,
}

#[mlir::op("rocdl.cluster.load.async.to.lds.b8")]
pub struct ClusterLoadAsyncToLDSB8Op<'a> {
    #[slot(global_ptr_ty, name = "globalPtr")]
    pub global_ptr: Value<'a>,
    #[slot(lds_ptr_ty, name = "ldsPtr")]
    pub lds_ptr: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[attr(int = "i32")]
    pub offset: Attribute<'a>,
    pub cpol: Option<Attribute<'a>>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr<1>", strip = "llvm.ptr")]
    pub global_ptr_ty: Type<'a>,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub lds_ptr_ty: Type<'a>,
    #[dtype(is = i32)]
    pub mask_ty: Type<'a>,
}

#[mlir::op("rocdl.cluster.workgroup.id.x", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct ClusterWorkgroupIdXOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cluster.workgroup.id.y", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct ClusterWorkgroupIdYOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cluster.workgroup.id.z", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct ClusterWorkgroupIdZOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.f32.bf8", format = "attr-dict $srcA `[` $byteSel `]` `:` type($res)", results(res))]
pub struct CvtF32Bf8Op<'a> {
    #[slot(src_a_ty, name = "srcA")]
    pub src_a: Value<'a>,
    #[attr(name = "byteSel", int = "i32")]
    pub byte_sel: Attribute<'a>,
    #[dtype(is = i32)]
    pub src_a_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.f32.fp8", format = "attr-dict $srcA `[` $byteSel `]` `:` type($res)", results(res))]
pub struct CvtF32Fp8Op<'a> {
    #[slot(src_a_ty, name = "srcA")]
    pub src_a: Value<'a>,
    #[attr(name = "byteSel", int = "i32")]
    pub byte_sel: Attribute<'a>,
    #[dtype(is = i32)]
    pub src_a_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.pk.bf8.f32", format = "attr-dict $srcA `,` $srcB `->` $old `[` $wordSel `]` `:` type($res)", results(res))]
pub struct CvtPkBf8F32Op<'a> {
    #[slot(src_a_ty, name = "srcA")]
    pub src_a: Value<'a>,
    #[slot(src_b_ty, name = "srcB")]
    pub src_b: Value<'a>,
    #[slot(old_ty)]
    pub old: Value<'a>,
    #[attr(name = "wordSel", int = "i1")]
    pub word_sel: Attribute<'a>,
    #[dtype(is = f32)]
    pub src_a_ty: Type<'a>,
    #[dtype(is = f32)]
    pub src_b_ty: Type<'a>,
    #[dtype(is = i32)]
    pub old_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.pk.f32.bf8", format = "attr-dict $src `[` $wordSel `]` `:` type($res)", results(res))]
pub struct CvtPkF32Bf8Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[attr(name = "wordSel", int = "i1")]
    pub word_sel: Attribute<'a>,
    #[dtype(is = i32)]
    pub src_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.pk.f32.fp8", format = "attr-dict $src `[` $wordSel `]` `:` type($res)", results(res))]
pub struct CvtPkF32Fp8Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[attr(name = "wordSel", int = "i1")]
    pub word_sel: Attribute<'a>,
    #[dtype(is = i32)]
    pub src_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.pk.fp8.f32", format = "attr-dict $srcA `,` $srcB `->` $old `[` $wordSel `]` `:` type($res)", results(res))]
pub struct CvtPkFp8F32Op<'a> {
    #[slot(src_a_ty, name = "srcA")]
    pub src_a: Value<'a>,
    #[slot(src_b_ty, name = "srcB")]
    pub src_b: Value<'a>,
    #[slot(old_ty)]
    pub old: Value<'a>,
    #[attr(name = "wordSel", int = "i1")]
    pub word_sel: Attribute<'a>,
    #[dtype(is = f32)]
    pub src_a_ty: Type<'a>,
    #[dtype(is = f32)]
    pub src_b_ty: Type<'a>,
    #[dtype(is = i32)]
    pub old_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.pkrtz", format = "attr-dict $srcA `,` $srcB `:` type($res)", results(res))]
pub struct CvtPkRtz<'a> {
    #[slot(src_a_ty, name = "srcA")]
    pub src_a: Value<'a>,
    #[slot(src_b_ty, name = "srcB")]
    pub src_b: Value<'a>,
    #[dtype(is = f32)]
    pub src_a_ty: Type<'a>,
    #[dtype(is = f32)]
    pub src_b_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scale.pk16.bf16.bf6", format = "attr-dict $src `,` $scale `[` $scaleSel `]` `:` type($res)", results(res))]
pub struct CvtPkScalePk16Bf16Bf6Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "scaleSel", int = "i32")]
    pub scale_sel: Attribute<'a>,
    #[dtype(is = "vector<3xi32>")]
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<16xbf16>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scale.pk16.bf16.fp6", format = "attr-dict $src `,` $scale `[` $scaleSel `]` `:` type($res)", results(res))]
pub struct CvtPkScalePk16Bf16Fp6Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "scaleSel", int = "i32")]
    pub scale_sel: Attribute<'a>,
    #[dtype(is = "vector<3xi32>")]
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<16xbf16>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scale.pk16.f16.bf6", format = "attr-dict $src `,` $scale `[` $scaleSel `]` `:` type($res)", results(res))]
pub struct CvtPkScalePk16F16Bf6Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "scaleSel", int = "i32")]
    pub scale_sel: Attribute<'a>,
    #[dtype(is = "vector<3xi32>")]
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<16xf16>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scale.pk16.f16.fp6", format = "attr-dict $src `,` $scale `[` $scaleSel `]` `:` type($res)", results(res))]
pub struct CvtPkScalePk16F16Fp6Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "scaleSel", int = "i32")]
    pub scale_sel: Attribute<'a>,
    #[dtype(is = "vector<3xi32>")]
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<16xf16>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scale.pk16.f32.bf6", format = "attr-dict $src `,` $scale `[` $scaleSel `]` `:` type($res)", results(res))]
pub struct CvtPkScalePk16F32Bf6Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "scaleSel", int = "i32")]
    pub scale_sel: Attribute<'a>,
    #[dtype(is = "vector<3xi32>")]
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scale.pk16.f32.fp6", format = "attr-dict $src `,` $scale `[` $scaleSel `]` `:` type($res)", results(res))]
pub struct CvtPkScalePk16F32Fp6Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "scaleSel", int = "i32")]
    pub scale_sel: Attribute<'a>,
    #[dtype(is = "vector<3xi32>")]
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scale.pk8.bf16.bf8", format = "attr-dict $src `,` $scale `[` $scaleSel `]` `:` type($res)", results(res))]
pub struct CvtPkScalePk8Bf16Bf8Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "scaleSel", int = "i32")]
    pub scale_sel: Attribute<'a>,
    #[dtype(is = "vector<2xi32>")]
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<8xbf16>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scale.pk8.bf16.fp4", format = "attr-dict $src `,` $scale `[` $scaleSel `]` `:` type($res)", results(res))]
pub struct CvtPkScalePk8Bf16Fp4Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "scaleSel", int = "i32")]
    pub scale_sel: Attribute<'a>,
    #[dtype(is = i32)]
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<8xbf16>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scale.pk8.bf16.fp8", format = "attr-dict $src `,` $scale `[` $scaleSel `]` `:` type($res)", results(res))]
pub struct CvtPkScalePk8Bf16Fp8Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "scaleSel", int = "i32")]
    pub scale_sel: Attribute<'a>,
    #[dtype(is = "vector<2xi32>")]
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<8xbf16>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scale.pk8.f16.bf8", format = "attr-dict $src `,` $scale `[` $scaleSel `]` `:` type($res)", results(res))]
pub struct CvtPkScalePk8F16Bf8Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "scaleSel", int = "i32")]
    pub scale_sel: Attribute<'a>,
    #[dtype(is = "vector<2xi32>")]
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<8xf16>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scale.pk8.f16.fp4", format = "attr-dict $src `,` $scale `[` $scaleSel `]` `:` type($res)", results(res))]
pub struct CvtPkScalePk8F16Fp4Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "scaleSel", int = "i32")]
    pub scale_sel: Attribute<'a>,
    #[dtype(is = i32)]
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<8xf16>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scale.pk8.f16.fp8", format = "attr-dict $src `,` $scale `[` $scaleSel `]` `:` type($res)", results(res))]
pub struct CvtPkScalePk8F16Fp8Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "scaleSel", int = "i32")]
    pub scale_sel: Attribute<'a>,
    #[dtype(is = "vector<2xi32>")]
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<8xf16>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scale.pk8.f32.bf8", format = "attr-dict $src `,` $scale `[` $scaleSel `]` `:` type($res)", results(res))]
pub struct CvtPkScalePk8F32Bf8Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "scaleSel", int = "i32")]
    pub scale_sel: Attribute<'a>,
    #[dtype(is = "vector<2xi32>")]
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<8xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scale.pk8.f32.fp4", format = "attr-dict $src `,` $scale `[` $scaleSel `]` `:` type($res)", results(res))]
pub struct CvtPkScalePk8F32Fp4Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "scaleSel", int = "i32")]
    pub scale_sel: Attribute<'a>,
    #[dtype(is = i32)]
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<8xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scale.pk8.f32.fp8", format = "attr-dict $src `,` $scale `[` $scaleSel `]` `:` type($res)", results(res))]
pub struct CvtPkScalePk8F32Fp8Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "scaleSel", int = "i32")]
    pub scale_sel: Attribute<'a>,
    #[dtype(is = "vector<2xi32>")]
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<8xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.2xpk16.bf6.f32", format = "attr-dict $src0 `,` $src1 `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF322xPk16Bf6F32Op<'a> {
    #[slot(src0_ty)]
    pub src0: Value<'a>,
    #[slot(src1_ty)]
    pub src1: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub src0_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub src1_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<6xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.2xpk16.fp6.f32", format = "attr-dict $src0 `,` $src1 `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF322xPk16Fp6F32Op<'a> {
    #[slot(src0_ty)]
    pub src0: Value<'a>,
    #[slot(src1_ty)]
    pub src1: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub src0_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub src1_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<6xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.f16.bf8", format = "attr-dict $src `[` $srcSelIndex `]` `,` $scale `->` $oldVdst `[` $dstLoHiSel `]` `:` type($res)", results(res))]
pub struct CvtScaleF32F16Bf8Op<'a> {
    #[slot(old_vdst_ty, name = "oldVdst")]
    pub old_vdst: Value<'a>,
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "srcSelIndex", int = "i32")]
    pub src_sel_index: Attribute<'a>,
    #[attr(name = "dstLoHiSel", int = "i1")]
    pub dst_lo_hi_sel: Attribute<'a>,
    #[dtype(is = "vector<2xf16>")]
    pub old_vdst_ty: Type<'a>,
    #[dtype(is = i32)]
    pub src_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<2xf16>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.f16.fp8", format = "attr-dict $src `[` $srcSelIndex `]` `,` $scale `->` $oldVdst `[` $dstLoHiSel `]` `:` type($res)", results(res))]
pub struct CvtScaleF32F16Fp8Op<'a> {
    #[slot(old_vdst_ty, name = "oldVdst")]
    pub old_vdst: Value<'a>,
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "srcSelIndex", int = "i32")]
    pub src_sel_index: Attribute<'a>,
    #[attr(name = "dstLoHiSel", int = "i1")]
    pub dst_lo_hi_sel: Attribute<'a>,
    #[dtype(is = "vector<2xf16>")]
    pub old_vdst_ty: Type<'a>,
    #[dtype(is = i32)]
    pub src_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<2xf16>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.f32.bf8", format = "attr-dict $src `[` $srcSelIndex `]` `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32F32Bf8Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "srcSelIndex", int = "i32")]
    pub src_sel_index: Attribute<'a>,
    #[dtype(is = i32)]
    pub src_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = f32)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.f32.fp8", format = "attr-dict $src `[` $srcSelIndex `]` `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32F32Fp8Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "srcSelIndex", int = "i32")]
    pub src_sel_index: Attribute<'a>,
    #[dtype(is = i32)]
    pub src_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = f32)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.pk16.bf6.bf16", format = "attr-dict $src `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32Pk16Bf6Bf16Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<16xbf16>")]
    pub src_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<3xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.pk16.bf6.f16", format = "attr-dict $src `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32Pk16Bf6F16Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<16xf16>")]
    pub src_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<3xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.pk16.bf6.f32", format = "attr-dict $src `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32Pk16Bf6F32Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub src_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<3xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.pk16.fp6.bf16", format = "attr-dict $src `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32Pk16Fp6Bf16Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<16xbf16>")]
    pub src_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<3xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.pk16.fp6.f16", format = "attr-dict $src `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32Pk16Fp6F16Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<16xf16>")]
    pub src_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<3xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.pk16.fp6.f32", format = "attr-dict $src `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32Pk16Fp6F32Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub src_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<3xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.pk32.bf16.bf6", format = "attr-dict $src `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32Pk32Bf16Bf6Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<6xi32>")]
    pub src_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<32xbf16>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.pk32.bf16.fp6", format = "attr-dict $src `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32Pk32Bf16Fp6Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<6xi32>")]
    pub src_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<32xbf16>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.pk32.bf6.bf16", format = "attr-dict $src `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32Pk32Bf6Bf16Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<32xbf16>")]
    pub src_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<6xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.pk32.bf6.f16", format = "attr-dict $src `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32Pk32Bf6F16Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<32xf16>")]
    pub src_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<6xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.pk32.f16.bf6", format = "attr-dict $src `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32Pk32F16Bf6Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<6xi32>")]
    pub src_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<32xf16>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.pk32.f16.fp6", format = "attr-dict $src `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32Pk32F16Fp6Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<6xi32>")]
    pub src_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<32xf16>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.pk32.f32.bf6", format = "attr-dict $src `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32Pk32F32Bf6Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<6xi32>")]
    pub src_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<32xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.pk32.f32.fp6", format = "attr-dict $src `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32Pk32F32Fp6Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<6xi32>")]
    pub src_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<32xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.pk32.fp6.bf16", format = "attr-dict $src `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32Pk32Fp6Bf16Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<32xbf16>")]
    pub src_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<6xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.pk32.fp6.f16", format = "attr-dict $src `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32Pk32Fp6F16Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<32xf16>")]
    pub src_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<6xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.pk8.bf8.bf16", format = "attr-dict $src `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32Pk8Bf8Bf16Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<8xbf16>")]
    pub src_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<2xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.pk8.bf8.f16", format = "attr-dict $src `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32Pk8Bf8F16Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<8xf16>")]
    pub src_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<2xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.pk8.bf8.f32", format = "attr-dict $src `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32Pk8Bf8F32Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<8xf32>")]
    pub src_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<2xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.pk8.fp4.bf16", format = "attr-dict $src `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32Pk8Fp4Bf16Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<8xbf16>")]
    pub src_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.pk8.fp4.f16", format = "attr-dict $src `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32Pk8Fp4F16Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<8xf16>")]
    pub src_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.pk8.fp4.f32", format = "attr-dict $src `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32Pk8Fp4F32Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<8xf32>")]
    pub src_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.pk8.fp8.bf16", format = "attr-dict $src `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32Pk8Fp8Bf16Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<8xbf16>")]
    pub src_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<2xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.pk8.fp8.f16", format = "attr-dict $src `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32Pk8Fp8F16Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<8xf16>")]
    pub src_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<2xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.pk8.fp8.f32", format = "attr-dict $src `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32Pk8Fp8F32Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<8xf32>")]
    pub src_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<2xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.pk.bf16.bf8", format = "attr-dict $src `[` $srcLoHiSel `]` `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32PkBf16Bf8Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "srcLoHiSel", int = "i1")]
    pub src_lo_hi_sel: Attribute<'a>,
    #[dtype(is = i32)]
    pub src_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<2xbf16>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.pk.bf16.fp4", format = "attr-dict $src `[` $srcSelIndex `]` `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32PkBf16Fp4Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "srcSelIndex", int = "i32")]
    pub src_sel_index: Attribute<'a>,
    #[dtype(is = i32)]
    pub src_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<2xbf16>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.pk.bf16.fp8", format = "attr-dict $src `[` $srcLoHiSel `]` `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32PkBf16Fp8Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "srcLoHiSel", int = "i1")]
    pub src_lo_hi_sel: Attribute<'a>,
    #[dtype(is = i32)]
    pub src_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<2xbf16>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.pk.bf8.bf16", format = "attr-dict $src0 `,` $scale `->` $oldVdst `[` $dstLoHiSel `]` `:` type($res)", results(res))]
pub struct CvtScaleF32PkBf8Bf16Op<'a> {
    #[slot(old_vdst_ty, name = "oldVdst")]
    pub old_vdst: Value<'a>,
    #[slot(src0_ty)]
    pub src0: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "dstLoHiSel", int = "i1")]
    pub dst_lo_hi_sel: Attribute<'a>,
    #[dtype(is = "vector<2xi16>")]
    pub old_vdst_ty: Type<'a>,
    #[dtype(is = "vector<2xbf16>")]
    pub src0_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<2xi16>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.pk.bf8.f16", format = "attr-dict $src0 `,` $scale `->` $oldVdst `[` $dstLoHiSel `]` `:` type($res)", results(res))]
pub struct CvtScaleF32PkBf8F16Op<'a> {
    #[slot(old_vdst_ty, name = "oldVdst")]
    pub old_vdst: Value<'a>,
    #[slot(src0_ty)]
    pub src0: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "dstLoHiSel", int = "i1")]
    pub dst_lo_hi_sel: Attribute<'a>,
    #[dtype(is = "vector<2xi16>")]
    pub old_vdst_ty: Type<'a>,
    #[dtype(is = "vector<2xf16>")]
    pub src0_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<2xi16>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.pk.bf8.f32", format = "attr-dict $src0 `,` $src1 `,` $scale `->` $oldVdst `[` $dstLoHiSel `]` `:` type($res)", results(res))]
pub struct CvtScaleF32PkBf8F32Op<'a> {
    #[slot(old_vdst_ty, name = "oldVdst")]
    pub old_vdst: Value<'a>,
    #[slot(src0_ty)]
    pub src0: Value<'a>,
    #[slot(src1_ty)]
    pub src1: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "dstLoHiSel", int = "i1")]
    pub dst_lo_hi_sel: Attribute<'a>,
    #[dtype(is = "vector<2xi16>")]
    pub old_vdst_ty: Type<'a>,
    #[dtype(is = f32)]
    pub src0_ty: Type<'a>,
    #[dtype(is = f32)]
    pub src1_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<2xi16>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.pk.f16.bf8", format = "attr-dict $src `[` $srcLoHiSel `]` `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32PkF16Bf8Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "srcLoHiSel", int = "i1")]
    pub src_lo_hi_sel: Attribute<'a>,
    #[dtype(is = i32)]
    pub src_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<2xf16>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.pk.f16.fp4", format = "attr-dict $src `[` $srcSelIndex `]` `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32PkF16Fp4Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "srcSelIndex", int = "i32")]
    pub src_sel_index: Attribute<'a>,
    #[dtype(is = i32)]
    pub src_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<2xf16>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.pk.f16.fp8", format = "attr-dict $src `[` $srcLoHiSel `]` `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32PkF16Fp8Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "srcLoHiSel", int = "i1")]
    pub src_lo_hi_sel: Attribute<'a>,
    #[dtype(is = i32)]
    pub src_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<2xf16>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.pk.f32.bf8", format = "attr-dict $src `[` $srcLoHiSel `]` `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32PkF32Bf8Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "srcLoHiSel", int = "i1")]
    pub src_lo_hi_sel: Attribute<'a>,
    #[dtype(is = i32)]
    pub src_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<2xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.pk.f32.fp4", format = "attr-dict $src `[` $srcSelIndex `]` `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32PkF32Fp4Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "srcSelIndex", int = "i32")]
    pub src_sel_index: Attribute<'a>,
    #[dtype(is = i32)]
    pub src_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<2xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.pk.f32.fp8", format = "attr-dict $src `[` $srcLoHiSel `]` `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32PkF32Fp8Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "srcLoHiSel", int = "i1")]
    pub src_lo_hi_sel: Attribute<'a>,
    #[dtype(is = i32)]
    pub src_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<2xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.pk.fp4.bf16", format = "attr-dict $src `,` $scale `->` $oldVdst `[` $dstSelIndex `]` `:` type($res)", results(res))]
pub struct CvtScaleF32PkFp4Bf16Op<'a> {
    #[slot(old_vdst_ty, name = "oldVdst")]
    pub old_vdst: Value<'a>,
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "dstSelIndex", int = "i32")]
    pub dst_sel_index: Attribute<'a>,
    #[dtype(is = i32)]
    pub old_vdst_ty: Type<'a>,
    #[dtype(is = "vector<2xbf16>")]
    pub src_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.pk.fp4.f16", format = "attr-dict $src `,` $scale `->` $oldVdst `[` $dstSelIndex `]` `:` type($res)", results(res))]
pub struct CvtScaleF32PkFp4F16Op<'a> {
    #[slot(old_vdst_ty, name = "oldVdst")]
    pub old_vdst: Value<'a>,
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "dstSelIndex", int = "i32")]
    pub dst_sel_index: Attribute<'a>,
    #[dtype(is = i32)]
    pub old_vdst_ty: Type<'a>,
    #[dtype(is = "vector<2xf16>")]
    pub src_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.pk.fp4.f32", format = "attr-dict $src0 `,` $src1 `,` $scale `->` $oldVdst `[` $dstSelIndex `]` `:` type($res)", results(res))]
pub struct CvtScaleF32PkFp4F32Op<'a> {
    #[slot(old_vdst_ty, name = "oldVdst")]
    pub old_vdst: Value<'a>,
    #[slot(src0_ty)]
    pub src0: Value<'a>,
    #[slot(src1_ty)]
    pub src1: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "dstSelIndex", int = "i32")]
    pub dst_sel_index: Attribute<'a>,
    #[dtype(is = i32)]
    pub old_vdst_ty: Type<'a>,
    #[dtype(is = f32)]
    pub src0_ty: Type<'a>,
    #[dtype(is = f32)]
    pub src1_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.pk.fp8.bf16", format = "attr-dict $src0 `,` $scale `->` $oldVdst `[` $dstLoHiSel `]` `:` type($res)", results(res))]
pub struct CvtScaleF32PkFp8Bf16Op<'a> {
    #[slot(old_vdst_ty, name = "oldVdst")]
    pub old_vdst: Value<'a>,
    #[slot(src0_ty)]
    pub src0: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "dstLoHiSel", int = "i1")]
    pub dst_lo_hi_sel: Attribute<'a>,
    #[dtype(is = "vector<2xi16>")]
    pub old_vdst_ty: Type<'a>,
    #[dtype(is = "vector<2xbf16>")]
    pub src0_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<2xi16>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.pk.fp8.f16", format = "attr-dict $src0 `,` $scale `->` $oldVdst `[` $dstLoHiSel `]` `:` type($res)", results(res))]
pub struct CvtScaleF32PkFp8F16Op<'a> {
    #[slot(old_vdst_ty, name = "oldVdst")]
    pub old_vdst: Value<'a>,
    #[slot(src0_ty)]
    pub src0: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "dstLoHiSel", int = "i1")]
    pub dst_lo_hi_sel: Attribute<'a>,
    #[dtype(is = "vector<2xi16>")]
    pub old_vdst_ty: Type<'a>,
    #[dtype(is = "vector<2xf16>")]
    pub src0_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<2xi16>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.pk.fp8.f32", format = "attr-dict $src0 `,` $src1 `,` $scale `->` $oldVdst `[` $dstLoHiSel `]` `:` type($res)", results(res))]
pub struct CvtScaleF32PkFp8F32Op<'a> {
    #[slot(old_vdst_ty, name = "oldVdst")]
    pub old_vdst: Value<'a>,
    #[slot(src0_ty)]
    pub src0: Value<'a>,
    #[slot(src1_ty)]
    pub src1: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "dstLoHiSel", int = "i1")]
    pub dst_lo_hi_sel: Attribute<'a>,
    #[dtype(is = "vector<2xi16>")]
    pub old_vdst_ty: Type<'a>,
    #[dtype(is = f32)]
    pub src0_ty: Type<'a>,
    #[dtype(is = f32)]
    pub src1_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<2xi16>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.sr.bf8.bf16", format = "attr-dict $src0 `,` $seed `,` $scale `->` $oldVdst `[` $dstSelIndex `]` `:` type($res)", results(res))]
pub struct CvtScaleF32SrBf8BF16Op<'a> {
    #[slot(old_vdst_ty, name = "oldVdst")]
    pub old_vdst: Value<'a>,
    #[slot(src0_ty)]
    pub src0: Value<'a>,
    #[slot(seed_ty)]
    pub seed: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "dstSelIndex", int = "i32")]
    pub dst_sel_index: Attribute<'a>,
    #[dtype(is = i32)]
    pub old_vdst_ty: Type<'a>,
    #[dtype(is = bf16)]
    pub src0_ty: Type<'a>,
    #[dtype(is = i32)]
    pub seed_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.sr.bf8.f16", format = "attr-dict $src0 `,` $seed `,` $scale `->` $oldVdst `[` $dstSelIndex `]` `:` type($res)", results(res))]
pub struct CvtScaleF32SrBf8F16Op<'a> {
    #[slot(old_vdst_ty, name = "oldVdst")]
    pub old_vdst: Value<'a>,
    #[slot(src0_ty)]
    pub src0: Value<'a>,
    #[slot(seed_ty)]
    pub seed: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "dstSelIndex", int = "i32")]
    pub dst_sel_index: Attribute<'a>,
    #[dtype(is = i32)]
    pub old_vdst_ty: Type<'a>,
    #[dtype(is = f16)]
    pub src0_ty: Type<'a>,
    #[dtype(is = i32)]
    pub seed_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.sr.bf8.f32", format = "attr-dict $src0 `,` $seed `,` $scale `->` $oldVdst `[` $dstSelIndex `]` `:` type($res)", results(res))]
pub struct CvtScaleF32SrBf8F32Op<'a> {
    #[slot(old_vdst_ty, name = "oldVdst")]
    pub old_vdst: Value<'a>,
    #[slot(src0_ty)]
    pub src0: Value<'a>,
    #[slot(seed_ty)]
    pub seed: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "dstSelIndex", int = "i32")]
    pub dst_sel_index: Attribute<'a>,
    #[dtype(is = i32)]
    pub old_vdst_ty: Type<'a>,
    #[dtype(is = f32)]
    pub src0_ty: Type<'a>,
    #[dtype(is = i32)]
    pub seed_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.sr.fp8.bf16", format = "attr-dict $src0 `,` $seed `,` $scale `->` $oldVdst `[` $dstSelIndex `]` `:` type($res)", results(res))]
pub struct CvtScaleF32SrFp8BF16Op<'a> {
    #[slot(old_vdst_ty, name = "oldVdst")]
    pub old_vdst: Value<'a>,
    #[slot(src0_ty)]
    pub src0: Value<'a>,
    #[slot(seed_ty)]
    pub seed: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "dstSelIndex", int = "i32")]
    pub dst_sel_index: Attribute<'a>,
    #[dtype(is = i32)]
    pub old_vdst_ty: Type<'a>,
    #[dtype(is = bf16)]
    pub src0_ty: Type<'a>,
    #[dtype(is = i32)]
    pub seed_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.sr.fp8.f16", format = "attr-dict $src0 `,` $seed `,` $scale `->` $oldVdst `[` $dstSelIndex `]` `:` type($res)", results(res))]
pub struct CvtScaleF32SrFp8F16Op<'a> {
    #[slot(old_vdst_ty, name = "oldVdst")]
    pub old_vdst: Value<'a>,
    #[slot(src0_ty)]
    pub src0: Value<'a>,
    #[slot(seed_ty)]
    pub seed: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "dstSelIndex", int = "i32")]
    pub dst_sel_index: Attribute<'a>,
    #[dtype(is = i32)]
    pub old_vdst_ty: Type<'a>,
    #[dtype(is = f16)]
    pub src0_ty: Type<'a>,
    #[dtype(is = i32)]
    pub seed_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.sr.fp8.f32", format = "attr-dict $src0 `,` $seed `,` $scale `->` $oldVdst `[` $dstSelIndex `]` `:` type($res)", results(res))]
pub struct CvtScaleF32SrFp8F32Op<'a> {
    #[slot(old_vdst_ty, name = "oldVdst")]
    pub old_vdst: Value<'a>,
    #[slot(src0_ty)]
    pub src0: Value<'a>,
    #[slot(seed_ty)]
    pub seed: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "dstSelIndex", int = "i32")]
    pub dst_sel_index: Attribute<'a>,
    #[dtype(is = i32)]
    pub old_vdst_ty: Type<'a>,
    #[dtype(is = f32)]
    pub src0_ty: Type<'a>,
    #[dtype(is = i32)]
    pub seed_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.sr.pk16.bf6.bf16", format = "attr-dict $src `,` $seed `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32SrPk16Bf6Bf16Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(seed_ty)]
    pub seed: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<16xbf16>")]
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub seed_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<3xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.sr.pk16.bf6.f16", format = "attr-dict $src `,` $seed `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32SrPk16Bf6F16Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(seed_ty)]
    pub seed: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<16xf16>")]
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub seed_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<3xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.sr.pk16.bf6.f32", format = "attr-dict $src `,` $seed `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32SrPk16Bf6F32Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(seed_ty)]
    pub seed: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub seed_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<3xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.sr.pk16.fp6.bf16", format = "attr-dict $src `,` $seed `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32SrPk16Fp6Bf16Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(seed_ty)]
    pub seed: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<16xbf16>")]
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub seed_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<3xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.sr.pk16.fp6.f16", format = "attr-dict $src `,` $seed `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32SrPk16Fp6F16Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(seed_ty)]
    pub seed: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<16xf16>")]
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub seed_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<3xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.sr.pk16.fp6.f32", format = "attr-dict $src `,` $seed `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32SrPk16Fp6F32Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(seed_ty)]
    pub seed: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub seed_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<3xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.sr.pk32.bf6.bf16", format = "attr-dict $src `,` $seed `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32SrPk32Bf6Bf16Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(seed_ty)]
    pub seed: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<32xbf16>")]
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub seed_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<6xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.sr.pk32.bf6.f16", format = "attr-dict $src `,` $seed `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32SrPk32Bf6F16Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(seed_ty)]
    pub seed: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<32xf16>")]
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub seed_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<6xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.sr.pk32.bf6.f32", format = "attr-dict $src `,` $seed `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32SrPk32Bf6F32Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(seed_ty)]
    pub seed: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<32xf32>")]
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub seed_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<6xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.sr.pk32.fp6.bf16", format = "attr-dict $src `,` $seed `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32SrPk32Fp6Bf16Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(seed_ty)]
    pub seed: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<32xbf16>")]
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub seed_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<6xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.sr.pk32.fp6.f16", format = "attr-dict $src `,` $seed `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32SrPk32Fp6F16Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(seed_ty)]
    pub seed: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<32xf16>")]
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub seed_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<6xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.sr.pk32.fp6.f32", format = "attr-dict $src `,` $seed `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32SrPk32Fp6F32Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(seed_ty)]
    pub seed: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<32xf32>")]
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub seed_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<6xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.sr.pk8.bf8.bf16", format = "attr-dict $src `,` $seed `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32SrPk8Bf8Bf16Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(seed_ty)]
    pub seed: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<8xbf16>")]
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub seed_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<2xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.sr.pk8.bf8.f16", format = "attr-dict $src `,` $seed `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32SrPk8Bf8F16Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(seed_ty)]
    pub seed: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<8xf16>")]
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub seed_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<2xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.sr.pk8.bf8.f32", format = "attr-dict $src `,` $seed `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32SrPk8Bf8F32Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(seed_ty)]
    pub seed: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<8xf32>")]
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub seed_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<2xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.sr.pk8.fp4.bf16", format = "attr-dict $src `,` $seed `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32SrPk8Fp4Bf16Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(seed_ty)]
    pub seed: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<8xbf16>")]
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub seed_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.sr.pk8.fp4.f16", format = "attr-dict $src `,` $seed `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32SrPk8Fp4F16Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(seed_ty)]
    pub seed: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<8xf16>")]
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub seed_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.sr.pk8.fp4.f32", format = "attr-dict $src `,` $seed `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32SrPk8Fp4F32Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(seed_ty)]
    pub seed: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<8xf32>")]
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub seed_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.sr.pk8.fp8.bf16", format = "attr-dict $src `,` $seed `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32SrPk8Fp8Bf16Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(seed_ty)]
    pub seed: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<8xbf16>")]
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub seed_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<2xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.sr.pk8.fp8.f16", format = "attr-dict $src `,` $seed `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32SrPk8Fp8F16Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(seed_ty)]
    pub seed: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<8xf16>")]
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub seed_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<2xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.sr.pk8.fp8.f32", format = "attr-dict $src `,` $seed `,` $scale `:` type($res)", results(res))]
pub struct CvtScaleF32SrPk8Fp8F32Op<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(seed_ty)]
    pub seed: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[dtype(is = "vector<8xf32>")]
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub seed_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = "vector<2xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.sr.pk.fp4.bf16", format = "attr-dict $src `,` $seed `,` $scale `->` $oldVdst `[` $dstSelIndex `]` `:` type($res)", results(res))]
pub struct CvtScaleF32SrPkFp4Bf16Op<'a> {
    #[slot(old_vdst_ty, name = "oldVdst")]
    pub old_vdst: Value<'a>,
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(seed_ty)]
    pub seed: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "dstSelIndex", int = "i32")]
    pub dst_sel_index: Attribute<'a>,
    #[dtype(is = i32)]
    pub old_vdst_ty: Type<'a>,
    #[dtype(is = "vector<2xbf16>")]
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub seed_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.sr.pk.fp4.f16", format = "attr-dict $src `,` $seed `,` $scale `->` $oldVdst `[` $dstSelIndex `]` `:` type($res)", results(res))]
pub struct CvtScaleF32SrPkFp4F16Op<'a> {
    #[slot(old_vdst_ty, name = "oldVdst")]
    pub old_vdst: Value<'a>,
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(seed_ty)]
    pub seed: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "dstSelIndex", int = "i32")]
    pub dst_sel_index: Attribute<'a>,
    #[dtype(is = i32)]
    pub old_vdst_ty: Type<'a>,
    #[dtype(is = "vector<2xf16>")]
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub seed_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.scalef32.sr.pk.fp4.f32", format = "attr-dict $src `,` $seed `,` $scale `->` $oldVdst `[` $dstSelIndex `]` `:` type($res)", results(res))]
pub struct CvtScaleF32SrPkFp4F32Op<'a> {
    #[slot(old_vdst_ty, name = "oldVdst")]
    pub old_vdst: Value<'a>,
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(seed_ty)]
    pub seed: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(name = "dstSelIndex", int = "i32")]
    pub dst_sel_index: Attribute<'a>,
    #[dtype(is = i32)]
    pub old_vdst_ty: Type<'a>,
    #[dtype(is = "vector<2xf32>")]
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub seed_ty: Type<'a>,
    #[dtype(is = f32)]
    pub scale_ty: Type<'a>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.sr.bf8.f32", format = "attr-dict $srcA `,` $srcB `->` $old `[` $byteSel `]` `:` type($res)", results(res))]
pub struct CvtSrBf8F32Op<'a> {
    #[slot(src_a_ty, name = "srcA")]
    pub src_a: Value<'a>,
    #[slot(src_b_ty, name = "srcB")]
    pub src_b: Value<'a>,
    #[slot(old_ty)]
    pub old: Value<'a>,
    #[attr(name = "byteSel", int = "i32")]
    pub byte_sel: Attribute<'a>,
    #[dtype(is = f32)]
    pub src_a_ty: Type<'a>,
    #[dtype(is = i32)]
    pub src_b_ty: Type<'a>,
    #[dtype(is = i32)]
    pub old_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.cvt.sr.fp8.f32", format = "attr-dict $srcA `,` $srcB `->` $old `[` $byteSel `]` `:` type($res)", results(res))]
pub struct CvtSrFp8F32Op<'a> {
    #[slot(src_a_ty, name = "srcA")]
    pub src_a: Value<'a>,
    #[slot(src_b_ty, name = "srcB")]
    pub src_b: Value<'a>,
    #[slot(old_ty)]
    pub old: Value<'a>,
    #[attr(name = "byteSel", int = "i32")]
    pub byte_sel: Attribute<'a>,
    #[dtype(is = f32)]
    pub src_a_ty: Type<'a>,
    #[dtype(is = i32)]
    pub src_b_ty: Type<'a>,
    #[dtype(is = i32)]
    pub old_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.update.dpp", format = "attr-dict $old `,` $src `with` $dppCtrl `,` $rowMask `,` $bankMask `,` $boundCtrl `:` type($src)", results(res))]
pub struct DPPUpdateOp<'a> {
    #[slot(res)]
    pub old: Value<'a>,
    #[slot(res)]
    pub src: Value<'a>,
    #[attr(name = "dppCtrl", int = "i32")]
    pub dpp_ctrl: Attribute<'a>,
    #[attr(name = "rowMask", int = "i32")]
    pub row_mask: Attribute<'a>,
    #[attr(name = "bankMask", int = "i32")]
    pub bank_mask: Attribute<'a>,
    #[attr(name = "boundCtrl", int = "i1")]
    pub bound_ctrl: Attribute<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.ds.atomic.async.barrier.arrive.b64", format = "$barrierPtr attr-dict `:` qualified(type($barrierPtr))")]
pub struct DsAtomicAsyncBarrierArriveOp<'a> {
    #[slot(barrier_ptr_ty, name = "barrierPtr")]
    pub barrier_ptr: Value<'a>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub barrier_ptr_ty: Type<'a>,
}

#[mlir::op("rocdl.ds.atomic.barrier.arrive.rtn.b64", format = "$barrierPtr `,` $val attr-dict `:` qualified(type($barrierPtr)) `,` type($val) `->` type($res)", results(res))]
pub struct DsAtomicBarrierArriveRtnOp<'a> {
    #[slot(barrier_ptr_ty, name = "barrierPtr")]
    pub barrier_ptr: Value<'a>,
    #[slot(val_ty)]
    pub val: Value<'a>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub barrier_ptr_ty: Type<'a>,
    #[dtype(is = i64)]
    pub val_ty: Type<'a>,
    #[dtype(is = i64)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.ds_bpermute", format = "$index `,` $src attr-dict `:` `(` type($index) `,` type($src) `)` `->` type($res)", results(res))]
pub struct DsBpermuteOp<'a> {
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    #[dtype(is = i32)]
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.ds.load.tr16.b128", format = "$ptr attr-dict `:` qualified(type($ptr)) `->` type($res)", results(res))]
pub struct DsLoadTr16_B128<'a> {
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub ptr_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.ds.load.tr4.b64", format = "$ptr attr-dict `:` qualified(type($ptr)) `->` type($res)", results(res))]
pub struct DsLoadTr4_B64<'a> {
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub ptr_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.ds.load.tr6.b96", format = "$ptr attr-dict `:` qualified(type($ptr)) `->` type($res)", results(res))]
pub struct DsLoadTr6_B96<'a> {
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub ptr_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.ds.load.tr8.b64", format = "$ptr attr-dict `:` qualified(type($ptr)) `->` type($res)", results(res))]
pub struct DsLoadTr8_B64<'a> {
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub ptr_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.ds_swizzle", format = "$src `,` $offset attr-dict `:` `(` type($src) `,` type($offset) `)` `->` type($res)", results(res))]
pub struct DsSwizzleOp<'a> {
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[slot(offset_ty)]
    pub offset: Value<'a>,
    #[dtype(is = i32)]
    pub src_ty: Type<'a>,
    #[dtype(is = i32)]
    pub offset_ty: Type<'a>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.fmed3", format = "$src0 `,` $src1 `,` $src2 attr-dict `:` type($res)", results(res))]
pub struct FMed3Op<'a> {
    #[slot(res)]
    pub src0: Value<'a>,
    #[slot(res)]
    pub src1: Value<'a>,
    #[slot(res)]
    pub src2: Value<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.flat.prefetch")]
pub struct FlatPrefetchOp<'a> {
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    #[attr(name = "cachePolicy")]
    pub cache_policy: Option<Attribute<'a>>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr", strip = "llvm.ptr")]
    pub ptr_ty: Type<'a>,
}

#[mlir::op("rocdl.s.get.barrier.state", format = "`id` `=` $id attr-dict `->` type($res)", results(res))]
pub struct GetBarrierStateOp<'a> {
    #[attr(int = "i32")]
    pub id: Attribute<'a>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.s.get.named.barrier.state", format = "$ptr attr-dict `:` qualified(type($ptr)) `->` type($res)", results(res))]
pub struct GetNamedBarrierStateOp<'a> {
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub ptr_ty: Type<'a>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.global.load.async.lds")]
pub struct GlobalLoadAsyncLDSOp<'a> {
    #[slot(global_ptr_ty, name = "globalPtr")]
    pub global_ptr: Value<'a>,
    #[slot(lds_ptr_ty, name = "ldsPtr")]
    pub lds_ptr: Value<'a>,
    #[attr(int = "i32")]
    pub size: Attribute<'a>,
    #[attr(int = "i32")]
    pub offset: Attribute<'a>,
    pub aux: Option<Attribute<'a>>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr<1>", strip = "llvm.ptr")]
    pub global_ptr_ty: Type<'a>,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub lds_ptr_ty: Type<'a>,
}

#[mlir::op("rocdl.global.load.async.to.lds.b128")]
pub struct GlobalLoadAsyncToLDSB128Op<'a> {
    #[slot(global_ptr_ty, name = "globalPtr")]
    pub global_ptr: Value<'a>,
    #[slot(lds_ptr_ty, name = "ldsPtr")]
    pub lds_ptr: Value<'a>,
    #[attr(int = "i32")]
    pub offset: Attribute<'a>,
    pub aux: Option<Attribute<'a>>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr<1>", strip = "llvm.ptr")]
    pub global_ptr_ty: Type<'a>,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub lds_ptr_ty: Type<'a>,
}

#[mlir::op("rocdl.global.load.async.to.lds.b32")]
pub struct GlobalLoadAsyncToLDSB32Op<'a> {
    #[slot(global_ptr_ty, name = "globalPtr")]
    pub global_ptr: Value<'a>,
    #[slot(lds_ptr_ty, name = "ldsPtr")]
    pub lds_ptr: Value<'a>,
    #[attr(int = "i32")]
    pub offset: Attribute<'a>,
    pub aux: Option<Attribute<'a>>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr<1>", strip = "llvm.ptr")]
    pub global_ptr_ty: Type<'a>,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub lds_ptr_ty: Type<'a>,
}

#[mlir::op("rocdl.global.load.async.to.lds.b64")]
pub struct GlobalLoadAsyncToLDSB64Op<'a> {
    #[slot(global_ptr_ty, name = "globalPtr")]
    pub global_ptr: Value<'a>,
    #[slot(lds_ptr_ty, name = "ldsPtr")]
    pub lds_ptr: Value<'a>,
    #[attr(int = "i32")]
    pub offset: Attribute<'a>,
    pub aux: Option<Attribute<'a>>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr<1>", strip = "llvm.ptr")]
    pub global_ptr_ty: Type<'a>,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub lds_ptr_ty: Type<'a>,
}

#[mlir::op("rocdl.global.load.async.to.lds.b8")]
pub struct GlobalLoadAsyncToLDSB8Op<'a> {
    #[slot(global_ptr_ty, name = "globalPtr")]
    pub global_ptr: Value<'a>,
    #[slot(lds_ptr_ty, name = "ldsPtr")]
    pub lds_ptr: Value<'a>,
    #[attr(int = "i32")]
    pub offset: Attribute<'a>,
    pub aux: Option<Attribute<'a>>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr<1>", strip = "llvm.ptr")]
    pub global_ptr_ty: Type<'a>,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub lds_ptr_ty: Type<'a>,
}

#[mlir::op("rocdl.global.load.lds")]
pub struct GlobalLoadLDSOp<'a> {
    #[slot(global_ptr_ty, name = "globalPtr")]
    pub global_ptr: Value<'a>,
    #[slot(lds_ptr_ty, name = "ldsPtr")]
    pub lds_ptr: Value<'a>,
    #[attr(int = "i32")]
    pub size: Attribute<'a>,
    #[attr(int = "i32")]
    pub offset: Attribute<'a>,
    pub aux: Option<Attribute<'a>>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr<1>", strip = "llvm.ptr")]
    pub global_ptr_ty: Type<'a>,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub lds_ptr_ty: Type<'a>,
}

#[mlir::op("rocdl.global.load.tr4.b64", format = "$ptr attr-dict `:` qualified(type($ptr)) `->` type($res)", results(res))]
pub struct GlobalLoadTr4_B64<'a> {
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr<1>", strip = "llvm.ptr")]
    pub ptr_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.global.load.tr6.b96", format = "$ptr attr-dict `:` qualified(type($ptr)) `->` type($res)", results(res))]
pub struct GlobalLoadTr6_B96<'a> {
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr<1>", strip = "llvm.ptr")]
    pub ptr_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.global.load.tr.b128", format = "$ptr attr-dict `:` qualified(type($ptr)) `->` type($res)", results(res))]
pub struct GlobalLoadTr8_B128<'a> {
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr<1>", strip = "llvm.ptr")]
    pub ptr_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.global.load.tr.b64", format = "$ptr attr-dict `:` qualified(type($ptr)) `->` type($res)", results(res))]
pub struct GlobalLoadTr8_B64<'a> {
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr<1>", strip = "llvm.ptr")]
    pub ptr_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.global.prefetch")]
pub struct GlobalPrefetchOp<'a> {
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    #[attr(name = "cachePolicy")]
    pub cache_policy: Option<Attribute<'a>>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr<1>", strip = "llvm.ptr")]
    pub ptr_ty: Type<'a>,
}

#[mlir::op("rocdl.global.store.async.from.lds.b128")]
pub struct GlobalStoreAsyncFromLDSB128Op<'a> {
    #[slot(global_ptr_ty, name = "globalPtr")]
    pub global_ptr: Value<'a>,
    #[slot(lds_ptr_ty, name = "ldsPtr")]
    pub lds_ptr: Value<'a>,
    #[attr(int = "i32")]
    pub offset: Attribute<'a>,
    pub aux: Option<Attribute<'a>>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr<1>", strip = "llvm.ptr")]
    pub global_ptr_ty: Type<'a>,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub lds_ptr_ty: Type<'a>,
}

#[mlir::op("rocdl.global.store.async.from.lds.b32")]
pub struct GlobalStoreAsyncFromLDSB32Op<'a> {
    #[slot(global_ptr_ty, name = "globalPtr")]
    pub global_ptr: Value<'a>,
    #[slot(lds_ptr_ty, name = "ldsPtr")]
    pub lds_ptr: Value<'a>,
    #[attr(int = "i32")]
    pub offset: Attribute<'a>,
    pub aux: Option<Attribute<'a>>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr<1>", strip = "llvm.ptr")]
    pub global_ptr_ty: Type<'a>,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub lds_ptr_ty: Type<'a>,
}

#[mlir::op("rocdl.global.store.async.from.lds.b64")]
pub struct GlobalStoreAsyncFromLDSB64Op<'a> {
    #[slot(global_ptr_ty, name = "globalPtr")]
    pub global_ptr: Value<'a>,
    #[slot(lds_ptr_ty, name = "ldsPtr")]
    pub lds_ptr: Value<'a>,
    #[attr(int = "i32")]
    pub offset: Attribute<'a>,
    pub aux: Option<Attribute<'a>>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr<1>", strip = "llvm.ptr")]
    pub global_ptr_ty: Type<'a>,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub lds_ptr_ty: Type<'a>,
}

#[mlir::op("rocdl.global.store.async.from.lds.b8")]
pub struct GlobalStoreAsyncFromLDSB8Op<'a> {
    #[slot(global_ptr_ty, name = "globalPtr")]
    pub global_ptr: Value<'a>,
    #[slot(lds_ptr_ty, name = "ldsPtr")]
    pub lds_ptr: Value<'a>,
    #[attr(int = "i32")]
    pub offset: Attribute<'a>,
    pub aux: Option<Attribute<'a>>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr<1>", strip = "llvm.ptr")]
    pub global_ptr_ty: Type<'a>,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub lds_ptr_ty: Type<'a>,
}

#[mlir::op("rocdl.iglp.opt", format = "$variant attr-dict")]
pub struct IglpOpt<'a> {
    #[attr(int = "i32")]
    pub variant: Attribute<'a>,
}

#[mlir::op("rocdl.load.async.to.lds")]
pub struct LoadAsyncToLDSOp<'a> {
    #[slot(global_ptr_ty, name = "globalPtr")]
    pub global_ptr: Value<'a>,
    #[slot(lds_ptr_ty, name = "ldsPtr")]
    pub lds_ptr: Value<'a>,
    #[attr(int = "i32")]
    pub size: Attribute<'a>,
    #[attr(int = "i32")]
    pub offset: Attribute<'a>,
    pub aux: Option<Attribute<'a>>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    #[dtype(strip = "llvm.ptr")]
    pub global_ptr_ty: Type<'a>,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub lds_ptr_ty: Type<'a>,
}

#[mlir::op("rocdl.load.to.lds")]
pub struct LoadToLDSOp<'a> {
    #[slot(global_ptr_ty, name = "globalPtr")]
    pub global_ptr: Value<'a>,
    #[slot(lds_ptr_ty, name = "ldsPtr")]
    pub lds_ptr: Value<'a>,
    #[attr(int = "i32")]
    pub size: Attribute<'a>,
    #[attr(int = "i32")]
    pub offset: Attribute<'a>,
    pub aux: Option<Attribute<'a>>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    #[dtype(strip = "llvm.ptr")]
    pub global_ptr_ty: Type<'a>,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub lds_ptr_ty: Type<'a>,
}

#[mlir::op("rocdl.make.buffer.rsrc", format = "$base `,` $stride `,` $numRecords `,` $flags attr-dict `:` type($base) `to` type($res)", results(res))]
pub struct MakeBufferRsrcOp<'a> {
    #[slot(base_ty)]
    pub base: Value<'a>,
    #[slot(stride_ty)]
    pub stride: Value<'a>,
    #[slot(num_records_ty, name = "numRecords")]
    pub num_records: Value<'a>,
    #[slot(flags_ty)]
    pub flags: Value<'a>,
    #[dtype(strip = "llvm.ptr")]
    pub base_ty: Type<'a>,
    #[dtype(is = i16)]
    pub stride_ty: Type<'a>,
    #[dtype(is = i64)]
    pub num_records_ty: Type<'a>,
    #[dtype(is = i32)]
    pub flags_ty: Type<'a>,
    #[dtype(strip = "llvm.ptr")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mbcnt.hi", format = "$in0 `,` $in1 attr-dict `:` `(` type($in0) `,` type($in1) `)` `->` type($res)", results(res))]
pub struct MbcntHiOp<'a> {
    #[slot(in0_ty)]
    pub in0: Value<'a>,
    #[slot(in1_ty)]
    pub in1: Value<'a>,
    pub arg_attrs: Option<Attribute<'a>>,
    pub res_attrs: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub in0_ty: Type<'a>,
    #[dtype(is = i32)]
    pub in1_ty: Type<'a>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mbcnt.lo", format = "$in0 `,` $in1 attr-dict `:` `(` type($in0) `,` type($in1) `)` `->` type($res)", results(res))]
pub struct MbcntLoOp<'a> {
    #[slot(in0_ty)]
    pub in0: Value<'a>,
    #[slot(in1_ty)]
    pub in1: Value<'a>,
    pub arg_attrs: Option<Attribute<'a>>,
    pub res_attrs: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub in0_ty: Type<'a>,
    #[dtype(is = i32)]
    pub in1_ty: Type<'a>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.permlane16.swap", format = "attr-dict $old `,` $src `,` $fi `,` $boundControl `:` `(` type($old) `,` type($src) `)` `->` type($res)", results(res))]
pub struct Permlane16SwapOp<'a> {
    #[slot(old_ty)]
    pub old: Value<'a>,
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[attr(int = "i1")]
    pub fi: Attribute<'a>,
    #[attr(name = "boundControl", int = "i1")]
    pub bound_control: Attribute<'a>,
    #[dtype(is = i32)]
    pub old_ty: Type<'a>,
    #[dtype(is = i32)]
    pub src_ty: Type<'a>,
    #[dtype(is = i32, strip = "llvm.struct")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.permlane16.var", format = "attr-dict $old `,` $src0 `,` $src1 `,` $fi `,` $boundControl `:` functional-type($old $src0 $src1, $res)", results(res))]
pub struct Permlane16VarOp<'a> {
    #[slot(old_ty)]
    pub old: Value<'a>,
    #[slot(src0_ty)]
    pub src0: Value<'a>,
    #[slot(src1_ty)]
    pub src1: Value<'a>,
    #[attr(int = "i1")]
    pub fi: Attribute<'a>,
    #[attr(name = "boundControl", int = "i1")]
    pub bound_control: Attribute<'a>,
    #[dtype(is = i32)]
    pub old_ty: Type<'a>,
    #[dtype(is = i32)]
    pub src0_ty: Type<'a>,
    #[dtype(is = i32)]
    pub src1_ty: Type<'a>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.permlane32.swap", format = "attr-dict $old `,` $src `,` $fi `,` $boundControl `:` `(` type($old) `,` type($src) `)` `->` type($res)", results(res))]
pub struct Permlane32SwapOp<'a> {
    #[slot(old_ty)]
    pub old: Value<'a>,
    #[slot(src_ty)]
    pub src: Value<'a>,
    #[attr(int = "i1")]
    pub fi: Attribute<'a>,
    #[attr(name = "boundControl", int = "i1")]
    pub bound_control: Attribute<'a>,
    #[dtype(is = i32)]
    pub old_ty: Type<'a>,
    #[dtype(is = i32)]
    pub src_ty: Type<'a>,
    #[dtype(is = i32, strip = "llvm.struct")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.permlanex16", format = "attr-dict $old `,` $src0 `,` $src1 `,` $src2 `,` $fi `,` $boundControl `:` type($src0) `,` type($src1)", results(res))]
pub struct PermlaneX16Op<'a> {
    #[slot(res)]
    pub old: Value<'a>,
    #[slot(res)]
    pub src0: Value<'a>,
    #[slot(src1_ty)]
    pub src1: Value<'a>,
    #[slot(src1_ty)]
    pub src2: Value<'a>,
    #[attr(int = "i1")]
    pub fi: Attribute<'a>,
    #[attr(name = "boundControl", int = "i1")]
    pub bound_control: Attribute<'a>,
    pub src1_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.permlanex16.var", format = "attr-dict $old `,` $src0 `,` $src1 `,` $fi `,` $boundControl `:` functional-type($old $src0 $src1, $res)", results(res))]
pub struct PermlaneX16VarOp<'a> {
    #[slot(old_ty)]
    pub old: Value<'a>,
    #[slot(src0_ty)]
    pub src0: Value<'a>,
    #[slot(src1_ty)]
    pub src1: Value<'a>,
    #[attr(int = "i1")]
    pub fi: Attribute<'a>,
    #[attr(name = "boundControl", int = "i1")]
    pub bound_control: Attribute<'a>,
    #[dtype(is = i32)]
    pub old_ty: Type<'a>,
    #[dtype(is = i32)]
    pub src0_ty: Type<'a>,
    #[dtype(is = i32)]
    pub src1_ty: Type<'a>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.raw.buffer.atomic.cmpswap", results(res))]
pub struct RawBufferAtomicCmpSwap<'a> {
    #[slot(res)]
    pub src: Value<'a>,
    #[slot(res)]
    pub cmp: Value<'a>,
    #[slot(rsrc_ty)]
    pub rsrc: Value<'a>,
    #[slot(offset_ty)]
    pub offset: Value<'a>,
    #[slot(soffset_ty)]
    pub soffset: Value<'a>,
    pub aux: Option<Attribute<'a>>,
    #[dtype(is = "vector<4xi32>")]
    pub rsrc_ty: Type<'a>,
    #[dtype(is = i32)]
    pub offset_ty: Type<'a>,
    #[dtype(is = i32)]
    pub soffset_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.raw.buffer.atomic.fadd", results(res))]
pub struct RawBufferAtomicFAddOp<'a> {
    #[slot(res)]
    pub vdata: Value<'a>,
    #[slot(rsrc_ty)]
    pub rsrc: Value<'a>,
    #[slot(offset_ty)]
    pub offset: Value<'a>,
    #[slot(soffset_ty)]
    pub soffset: Value<'a>,
    pub aux: Option<Attribute<'a>>,
    #[dtype(is = "vector<4xi32>")]
    pub rsrc_ty: Type<'a>,
    #[dtype(is = i32)]
    pub offset_ty: Type<'a>,
    #[dtype(is = i32)]
    pub soffset_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.raw.buffer.atomic.fmax", results(res))]
pub struct RawBufferAtomicFMaxOp<'a> {
    #[slot(res)]
    pub vdata: Value<'a>,
    #[slot(rsrc_ty)]
    pub rsrc: Value<'a>,
    #[slot(offset_ty)]
    pub offset: Value<'a>,
    #[slot(soffset_ty)]
    pub soffset: Value<'a>,
    pub aux: Option<Attribute<'a>>,
    #[dtype(is = "vector<4xi32>")]
    pub rsrc_ty: Type<'a>,
    #[dtype(is = i32)]
    pub offset_ty: Type<'a>,
    #[dtype(is = i32)]
    pub soffset_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.raw.buffer.atomic.smax", results(res))]
pub struct RawBufferAtomicSMaxOp<'a> {
    #[slot(res)]
    pub vdata: Value<'a>,
    #[slot(rsrc_ty)]
    pub rsrc: Value<'a>,
    #[slot(offset_ty)]
    pub offset: Value<'a>,
    #[slot(soffset_ty)]
    pub soffset: Value<'a>,
    pub aux: Option<Attribute<'a>>,
    #[dtype(is = "vector<4xi32>")]
    pub rsrc_ty: Type<'a>,
    #[dtype(is = i32)]
    pub offset_ty: Type<'a>,
    #[dtype(is = i32)]
    pub soffset_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.raw.buffer.atomic.umin", results(res))]
pub struct RawBufferAtomicUMinOp<'a> {
    #[slot(res)]
    pub vdata: Value<'a>,
    #[slot(rsrc_ty)]
    pub rsrc: Value<'a>,
    #[slot(offset_ty)]
    pub offset: Value<'a>,
    #[slot(soffset_ty)]
    pub soffset: Value<'a>,
    pub aux: Option<Attribute<'a>>,
    #[dtype(is = "vector<4xi32>")]
    pub rsrc_ty: Type<'a>,
    #[dtype(is = i32)]
    pub offset_ty: Type<'a>,
    #[dtype(is = i32)]
    pub soffset_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.raw.buffer.load", results(res))]
pub struct RawBufferLoadOp<'a> {
    #[slot(rsrc_ty)]
    pub rsrc: Value<'a>,
    #[slot(offset_ty)]
    pub offset: Value<'a>,
    #[slot(soffset_ty)]
    pub soffset: Value<'a>,
    pub aux: Option<Attribute<'a>>,
    #[dtype(is = "vector<4xi32>")]
    pub rsrc_ty: Type<'a>,
    #[dtype(is = i32)]
    pub offset_ty: Type<'a>,
    #[dtype(is = i32)]
    pub soffset_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.raw.buffer.store")]
pub struct RawBufferStoreOp<'a> {
    #[slot(vdata_ty)]
    pub vdata: Value<'a>,
    #[slot(rsrc_ty)]
    pub rsrc: Value<'a>,
    #[slot(offset_ty)]
    pub offset: Value<'a>,
    #[slot(soffset_ty)]
    pub soffset: Value<'a>,
    pub aux: Option<Attribute<'a>>,
    pub vdata_ty: Type<'a>,
    #[dtype(is = "vector<4xi32>")]
    pub rsrc_ty: Type<'a>,
    #[dtype(is = i32)]
    pub offset_ty: Type<'a>,
    #[dtype(is = i32)]
    pub soffset_ty: Type<'a>,
}

#[mlir::op("rocdl.raw.ptr.buffer.atomic.cmpswap", results(res))]
pub struct RawPtrBufferAtomicCmpSwap<'a> {
    #[slot(res)]
    pub src: Value<'a>,
    #[slot(res)]
    pub cmp: Value<'a>,
    #[slot(rsrc_ty)]
    pub rsrc: Value<'a>,
    #[slot(offset_ty)]
    pub offset: Value<'a>,
    #[slot(soffset_ty)]
    pub soffset: Value<'a>,
    pub aux: Option<Attribute<'a>>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr<8>", strip = "llvm.ptr")]
    pub rsrc_ty: Type<'a>,
    #[dtype(is = i32)]
    pub offset_ty: Type<'a>,
    #[dtype(is = i32)]
    pub soffset_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.raw.ptr.buffer.atomic.fadd", results(res))]
pub struct RawPtrBufferAtomicFaddOp<'a> {
    #[slot(res)]
    pub vdata: Value<'a>,
    #[slot(rsrc_ty)]
    pub rsrc: Value<'a>,
    #[slot(offset_ty)]
    pub offset: Value<'a>,
    #[slot(soffset_ty)]
    pub soffset: Value<'a>,
    pub aux: Option<Attribute<'a>>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr<8>", strip = "llvm.ptr")]
    pub rsrc_ty: Type<'a>,
    #[dtype(is = i32)]
    pub offset_ty: Type<'a>,
    #[dtype(is = i32)]
    pub soffset_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.raw.ptr.buffer.atomic.fmax", results(res))]
pub struct RawPtrBufferAtomicFmaxOp<'a> {
    #[slot(res)]
    pub vdata: Value<'a>,
    #[slot(rsrc_ty)]
    pub rsrc: Value<'a>,
    #[slot(offset_ty)]
    pub offset: Value<'a>,
    #[slot(soffset_ty)]
    pub soffset: Value<'a>,
    pub aux: Option<Attribute<'a>>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr<8>", strip = "llvm.ptr")]
    pub rsrc_ty: Type<'a>,
    #[dtype(is = i32)]
    pub offset_ty: Type<'a>,
    #[dtype(is = i32)]
    pub soffset_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.raw.ptr.buffer.atomic.smax", results(res))]
pub struct RawPtrBufferAtomicSmaxOp<'a> {
    #[slot(res)]
    pub vdata: Value<'a>,
    #[slot(rsrc_ty)]
    pub rsrc: Value<'a>,
    #[slot(offset_ty)]
    pub offset: Value<'a>,
    #[slot(soffset_ty)]
    pub soffset: Value<'a>,
    pub aux: Option<Attribute<'a>>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr<8>", strip = "llvm.ptr")]
    pub rsrc_ty: Type<'a>,
    #[dtype(is = i32)]
    pub offset_ty: Type<'a>,
    #[dtype(is = i32)]
    pub soffset_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.raw.ptr.buffer.atomic.umin", results(res))]
pub struct RawPtrBufferAtomicUminOp<'a> {
    #[slot(res)]
    pub vdata: Value<'a>,
    #[slot(rsrc_ty)]
    pub rsrc: Value<'a>,
    #[slot(offset_ty)]
    pub offset: Value<'a>,
    #[slot(soffset_ty)]
    pub soffset: Value<'a>,
    pub aux: Option<Attribute<'a>>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr<8>", strip = "llvm.ptr")]
    pub rsrc_ty: Type<'a>,
    #[dtype(is = i32)]
    pub offset_ty: Type<'a>,
    #[dtype(is = i32)]
    pub soffset_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.raw.ptr.buffer.load.async.lds")]
pub struct RawPtrBufferLoadAsyncLdsOp<'a> {
    #[slot(rsrc_ty)]
    pub rsrc: Value<'a>,
    #[slot(lds_ptr_ty, name = "ldsPtr")]
    pub lds_ptr: Value<'a>,
    #[slot(size_ty)]
    pub size: Value<'a>,
    #[slot(voffset_ty)]
    pub voffset: Value<'a>,
    #[slot(soffset_ty)]
    pub soffset: Value<'a>,
    #[slot(offset_ty)]
    pub offset: Value<'a>,
    pub aux: Option<Attribute<'a>>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr<8>", strip = "llvm.ptr")]
    pub rsrc_ty: Type<'a>,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub lds_ptr_ty: Type<'a>,
    #[dtype(is = i32)]
    pub size_ty: Type<'a>,
    #[dtype(is = i32)]
    pub voffset_ty: Type<'a>,
    #[dtype(is = i32)]
    pub soffset_ty: Type<'a>,
    #[dtype(is = i32)]
    pub offset_ty: Type<'a>,
}

#[mlir::op("rocdl.raw.ptr.buffer.load.lds")]
pub struct RawPtrBufferLoadLdsOp<'a> {
    #[slot(rsrc_ty)]
    pub rsrc: Value<'a>,
    #[slot(lds_ptr_ty, name = "ldsPtr")]
    pub lds_ptr: Value<'a>,
    #[slot(size_ty)]
    pub size: Value<'a>,
    #[slot(voffset_ty)]
    pub voffset: Value<'a>,
    #[slot(soffset_ty)]
    pub soffset: Value<'a>,
    #[slot(offset_ty)]
    pub offset: Value<'a>,
    pub aux: Option<Attribute<'a>>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr<8>", strip = "llvm.ptr")]
    pub rsrc_ty: Type<'a>,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub lds_ptr_ty: Type<'a>,
    #[dtype(is = i32)]
    pub size_ty: Type<'a>,
    #[dtype(is = i32)]
    pub voffset_ty: Type<'a>,
    #[dtype(is = i32)]
    pub soffset_ty: Type<'a>,
    #[dtype(is = i32)]
    pub offset_ty: Type<'a>,
}

#[mlir::op("rocdl.raw.ptr.buffer.load", results(res))]
pub struct RawPtrBufferLoadOp<'a> {
    #[slot(rsrc_ty)]
    pub rsrc: Value<'a>,
    #[slot(offset_ty)]
    pub offset: Value<'a>,
    #[slot(soffset_ty)]
    pub soffset: Value<'a>,
    pub aux: Option<Attribute<'a>>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr<8>", strip = "llvm.ptr")]
    pub rsrc_ty: Type<'a>,
    #[dtype(is = i32)]
    pub offset_ty: Type<'a>,
    #[dtype(is = i32)]
    pub soffset_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.raw.ptr.buffer.store")]
pub struct RawPtrBufferStoreOp<'a> {
    #[slot(vdata_ty)]
    pub vdata: Value<'a>,
    #[slot(rsrc_ty)]
    pub rsrc: Value<'a>,
    #[slot(offset_ty)]
    pub offset: Value<'a>,
    #[slot(soffset_ty)]
    pub soffset: Value<'a>,
    pub aux: Option<Attribute<'a>>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    pub vdata_ty: Type<'a>,
    #[dtype(is = "!llvm.ptr<8>", strip = "llvm.ptr")]
    pub rsrc_ty: Type<'a>,
    #[dtype(is = i32)]
    pub offset_ty: Type<'a>,
    #[dtype(is = i32)]
    pub soffset_ty: Type<'a>,
}

#[mlir::op("rocdl.readfirstlane", format = "$src attr-dict `:` type($res)", results(res))]
pub struct ReadfirstlaneOp<'a> {
    #[slot(res)]
    pub src: Value<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.readlane", format = "$src0 `,` $src1 attr-dict `:` `(` type($src0) `,` type($src1) `)` `->` type($res)", results(res))]
pub struct ReadlaneOp<'a> {
    #[slot(res)]
    pub src0: Value<'a>,
    #[slot(src1_ty)]
    pub src1: Value<'a>,
    #[dtype(is = i32)]
    pub src1_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.s.barrier", format = "attr-dict")]
pub struct SBarrierOp<'a> {
}

#[mlir::op("rocdl.s.nop", format = "attr-dict $count")]
pub struct SNopOp<'a> {
    #[attr(int = "i16")]
    pub count: Attribute<'a>,
}

#[mlir::op("rocdl.s.sleep", format = "attr-dict $count")]
pub struct SSleepOp<'a> {
    #[attr(int = "i32")]
    pub count: Attribute<'a>,
}

#[mlir::op("rocdl.s.waitcnt", format = "attr-dict $bitfield")]
pub struct SWaitcntOp<'a> {
    #[attr(int = "i32")]
    pub bitfield: Attribute<'a>,
}

#[mlir::op("rocdl.sched.barrier", format = "$mask attr-dict")]
pub struct SchedBarrier<'a> {
    #[attr(dialect = "rocdl<sched_group_mask")]
    pub mask: Attribute<'a>,
}

#[mlir::op("rocdl.sched.group.barrier", format = "$mask `,` $size `,` $groupId attr-dict")]
pub struct SchedGroupBarrier<'a> {
    #[attr(dialect = "rocdl<sched_group_mask")]
    pub mask: Attribute<'a>,
    #[attr(int = "i32")]
    pub size: Attribute<'a>,
    #[attr(name = "groupId", int = "i32")]
    pub group_id: Attribute<'a>,
}

#[mlir::op("rocdl.s.setprio", format = "$priority attr-dict")]
pub struct SetPrioOp<'a> {
    #[attr(int = "i16")]
    pub priority: Attribute<'a>,
}

#[mlir::op("rocdl.tensor.load.to.lds")]
pub struct TensorLoadToLDSOp<'a> {
    #[slot(dgroup0_ty)]
    pub dgroup0: Value<'a>,
    #[slot(dgroup1_ty)]
    pub dgroup1: Value<'a>,
    #[slot(dgroup2_ty)]
    pub dgroup2: Value<'a>,
    #[slot(dgroup3_ty)]
    pub dgroup3: Value<'a>,
    #[slot(dgroup4_ty)]
    pub dgroup4: Value<'a>,
    #[attr(name = "cachePolicy")]
    pub cache_policy: Option<Attribute<'a>>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    #[dtype(is = "vector<4xi32>")]
    pub dgroup0_ty: Type<'a>,
    #[dtype(is = "vector<8xi32>")]
    pub dgroup1_ty: Type<'a>,
    #[dtype(is = "vector<4xi32>")]
    pub dgroup2_ty: Type<'a>,
    #[dtype(is = "vector<4xi32>")]
    pub dgroup3_ty: Type<'a>,
    #[dtype(is = "vector<8xi32>")]
    pub dgroup4_ty: Type<'a>,
}

#[mlir::op("rocdl.tensor.store.from.lds")]
pub struct TensorStoreFromLDSOp<'a> {
    #[slot(dgroup0_ty)]
    pub dgroup0: Value<'a>,
    #[slot(dgroup1_ty)]
    pub dgroup1: Value<'a>,
    #[slot(dgroup2_ty)]
    pub dgroup2: Value<'a>,
    #[slot(dgroup3_ty)]
    pub dgroup3: Value<'a>,
    #[slot(dgroup4_ty)]
    pub dgroup4: Value<'a>,
    #[attr(name = "cachePolicy")]
    pub cache_policy: Option<Attribute<'a>>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    #[dtype(is = "vector<4xi32>")]
    pub dgroup0_ty: Type<'a>,
    #[dtype(is = "vector<8xi32>")]
    pub dgroup1_ty: Type<'a>,
    #[dtype(is = "vector<4xi32>")]
    pub dgroup2_ty: Type<'a>,
    #[dtype(is = "vector<4xi32>")]
    pub dgroup3_ty: Type<'a>,
    #[dtype(is = "vector<8xi32>")]
    pub dgroup4_ty: Type<'a>,
}

#[mlir::op("rocdl.workitem.id.x", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct ThreadIdXOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.workitem.id.y", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct ThreadIdYOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.workitem.id.z", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct ThreadIdZOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.s.wait.asynccnt", format = "$count attr-dict")]
pub struct WaitAsynccntOp<'a> {
    #[attr(int = "i16")]
    pub count: Attribute<'a>,
}

#[mlir::op("rocdl.wait.asyncmark", format = "$count attr-dict")]
pub struct WaitAsyncmarkOp<'a> {
    #[attr(int = "i16")]
    pub count: Attribute<'a>,
}

#[mlir::op("rocdl.s.wait.dscnt", format = "$count attr-dict")]
pub struct WaitDscntOp<'a> {
    #[attr(int = "i16")]
    pub count: Attribute<'a>,
}

#[mlir::op("rocdl.s.wait.expcnt", format = "$count attr-dict")]
pub struct WaitExpcntOp<'a> {
    #[attr(int = "i16")]
    pub count: Attribute<'a>,
}

#[mlir::op("rocdl.s.wait.loadcnt", format = "$count attr-dict")]
pub struct WaitLoadcntOp<'a> {
    #[attr(int = "i16")]
    pub count: Attribute<'a>,
}

#[mlir::op("rocdl.s.wait.storecnt", format = "$count attr-dict")]
pub struct WaitStorecntOp<'a> {
    #[attr(int = "i16")]
    pub count: Attribute<'a>,
}

#[mlir::op("rocdl.s.wait.tensorcnt", format = "$count attr-dict")]
pub struct WaitTensorcntOp<'a> {
    #[attr(int = "i16")]
    pub count: Attribute<'a>,
}

#[mlir::op("rocdl.s.wakeup.barrier", format = "$ptr attr-dict `:` qualified(type($ptr))")]
pub struct WakeupBarrierOp<'a> {
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub ptr_ty: Type<'a>,
}

#[mlir::op("rocdl.wave.barrier", format = "attr-dict")]
pub struct WaveBarrierOp<'a> {
}

#[mlir::op("rocdl.wave.id", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct WaveId<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.wavefrontsize", format = "(`range` $range^)? attr-dict `:` type($res)", results(res))]
pub struct WavefrontSizeOp<'a> {
    #[attr(dialect = "llvm.constant_range")]
    pub range: Option<Attribute<'a>>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.dot4.f32.bf8.bf8", format = "$a `,` $b `,` $c attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct dot4_f32_bf8_bf8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[dtype(is = i32)]
    pub a_ty: Type<'a>,
    #[dtype(is = i32)]
    pub b_ty: Type<'a>,
    #[dtype(is = f32)]
    pub c_ty: Type<'a>,
    #[dtype(is = f32)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.dot4.f32.bf8.fp8", format = "$a `,` $b `,` $c attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct dot4_f32_bf8_fp8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[dtype(is = i32)]
    pub a_ty: Type<'a>,
    #[dtype(is = i32)]
    pub b_ty: Type<'a>,
    #[dtype(is = f32)]
    pub c_ty: Type<'a>,
    #[dtype(is = f32)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.dot4.f32.fp8.bf8", format = "$a `,` $b `,` $c attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct dot4_f32_fp8_bf8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[dtype(is = i32)]
    pub a_ty: Type<'a>,
    #[dtype(is = i32)]
    pub b_ty: Type<'a>,
    #[dtype(is = f32)]
    pub c_ty: Type<'a>,
    #[dtype(is = f32)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.dot4.f32.fp8.fp8", format = "$a `,` $b `,` $c attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct dot4_f32_fp8_fp8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[dtype(is = i32)]
    pub a_ty: Type<'a>,
    #[dtype(is = i32)]
    pub b_ty: Type<'a>,
    #[dtype(is = f32)]
    pub c_ty: Type<'a>,
    #[dtype(is = f32)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.ds.read.tr16.b64", format = "$ptr attr-dict `:` type($ptr) `->` type($res)", results(res))]
pub struct ds_read_tr16_b64<'a> {
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub ptr_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.ds.read.tr4.b64", format = "$ptr attr-dict `:` type($ptr) `->` type($res)", results(res))]
pub struct ds_read_tr4_b64<'a> {
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub ptr_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.ds.read.tr6.b96", format = "$ptr attr-dict `:` type($ptr) `->` type($res)", results(res))]
pub struct ds_read_tr6_b96<'a> {
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub ptr_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.ds.read.tr8.b64", format = "$ptr attr-dict `:` type($ptr) `->` type($res)", results(res))]
pub struct ds_read_tr8_b64<'a> {
    #[slot(ptr_ty)]
    pub ptr: Value<'a>,
    pub alias_scopes: Option<Attribute<'a>>,
    pub noalias_scopes: Option<Attribute<'a>>,
    pub tbaa: Option<Attribute<'a>>,
    #[dtype(is = "!llvm.ptr<3>", strip = "llvm.ptr")]
    pub ptr_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.fdot2", format = "$a `,` $b `,` $c attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct fdot2<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i1", default = "0")]
    pub clamp: Option<Attribute<'a>>,
    #[dtype(is = "vector<2xf16>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<2xf16>")]
    pub b_ty: Type<'a>,
    #[dtype(is = f32)]
    pub c_ty: Type<'a>,
    #[dtype(is = f32)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.fdot2.bf16.bf16", format = "$a `,` $b `,` $c attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct fdot2_bf16_bf16<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[dtype(is = "vector<2xbf16>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<2xbf16>")]
    pub b_ty: Type<'a>,
    #[dtype(is = bf16)]
    pub c_ty: Type<'a>,
    #[dtype(is = bf16)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.fdot2.f16.f16", format = "$a `,` $b `,` $c attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct fdot2_f16_f16<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[dtype(is = "vector<2xf16>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<2xf16>")]
    pub b_ty: Type<'a>,
    #[dtype(is = f16)]
    pub c_ty: Type<'a>,
    #[dtype(is = f16)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.fdot2.f32.bf16", format = "$a `,` $b `,` $c attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct fdot2_f32_bf16<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i1", default = "0")]
    pub clamp: Option<Attribute<'a>>,
    #[dtype(is = "vector<2xbf16>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<2xbf16>")]
    pub b_ty: Type<'a>,
    #[dtype(is = f32)]
    pub c_ty: Type<'a>,
    #[dtype(is = f32)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.f32.16x16x16bf16.1k", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_f32_16x16x16bf16_1k<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_perm_b")]
    pub blgp: Attribute<'a>,
    #[dtype(is = "vector<4xi16>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<4xi16>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.f32.16x16x16f16", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_f32_16x16x16f16<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_perm_b")]
    pub blgp: Attribute<'a>,
    #[dtype(is = "vector<4xf16>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<4xf16>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.f32.16x16x1f32", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_f32_16x16x1f32<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_perm_b")]
    pub blgp: Attribute<'a>,
    #[dtype(is = f32)]
    pub a_ty: Type<'a>,
    #[dtype(is = f32)]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.f32.16x16x2bf16", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_f32_16x16x2bf16<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_perm_b")]
    pub blgp: Attribute<'a>,
    #[dtype(is = "vector<2xi16>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<2xi16>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.f32.16x16x32.bf16", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_f32_16x16x32_bf16<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_perm_b")]
    pub blgp: Attribute<'a>,
    #[dtype(is = "vector<8xbf16>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<8xbf16>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.f32.16x16x32.bf8.bf8", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_f32_16x16x32_bf8_bf8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_perm_b")]
    pub blgp: Attribute<'a>,
    #[dtype(is = i64)]
    pub a_ty: Type<'a>,
    #[dtype(is = i64)]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.f32.16x16x32.bf8.fp8", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_f32_16x16x32_bf8_fp8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_perm_b")]
    pub blgp: Attribute<'a>,
    #[dtype(is = i64)]
    pub a_ty: Type<'a>,
    #[dtype(is = i64)]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.f32.16x16x32.f16", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_f32_16x16x32_f16<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_perm_b")]
    pub blgp: Attribute<'a>,
    #[dtype(is = "vector<8xf16>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<8xf16>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.f32.16x16x32.fp8.bf8", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_f32_16x16x32_fp8_bf8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_perm_b")]
    pub blgp: Attribute<'a>,
    #[dtype(is = i64)]
    pub a_ty: Type<'a>,
    #[dtype(is = i64)]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.f32.16x16x32.fp8.fp8", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_f32_16x16x32_fp8_fp8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_perm_b")]
    pub blgp: Attribute<'a>,
    #[dtype(is = i64)]
    pub a_ty: Type<'a>,
    #[dtype(is = i64)]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.f32.16x16x4bf16.1k", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_f32_16x16x4bf16_1k<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_perm_b")]
    pub blgp: Attribute<'a>,
    #[dtype(is = "vector<4xi16>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<4xi16>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.f32.16x16x4f16", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_f32_16x16x4f16<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_perm_b")]
    pub blgp: Attribute<'a>,
    #[dtype(is = "vector<4xf16>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<4xf16>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.f32.16x16x4f32", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_f32_16x16x4f32<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_perm_b")]
    pub blgp: Attribute<'a>,
    #[dtype(is = f32)]
    pub a_ty: Type<'a>,
    #[dtype(is = f32)]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.f32.16x16x8.xf32", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_f32_16x16x8_xf32<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_perm_b")]
    pub blgp: Attribute<'a>,
    #[dtype(is = "vector<2xf32>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<2xf32>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.f32.16x16x8bf16", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_f32_16x16x8bf16<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_perm_b")]
    pub blgp: Attribute<'a>,
    #[dtype(is = "vector<2xi16>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<2xi16>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.f32.32x32x16.bf16", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_f32_32x32x16_bf16<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_perm_b")]
    pub blgp: Attribute<'a>,
    #[dtype(is = "vector<8xbf16>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<8xbf16>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.f32.32x32x16.bf8.bf8", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_f32_32x32x16_bf8_bf8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_perm_b")]
    pub blgp: Attribute<'a>,
    #[dtype(is = i64)]
    pub a_ty: Type<'a>,
    #[dtype(is = i64)]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.f32.32x32x16.bf8.fp8", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_f32_32x32x16_bf8_fp8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_perm_b")]
    pub blgp: Attribute<'a>,
    #[dtype(is = i64)]
    pub a_ty: Type<'a>,
    #[dtype(is = i64)]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.f32.32x32x16.f16", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_f32_32x32x16_f16<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_perm_b")]
    pub blgp: Attribute<'a>,
    #[dtype(is = "vector<8xf16>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<8xf16>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.f32.32x32x16.fp8.bf8", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_f32_32x32x16_fp8_bf8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_perm_b")]
    pub blgp: Attribute<'a>,
    #[dtype(is = i64)]
    pub a_ty: Type<'a>,
    #[dtype(is = i64)]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.f32.32x32x16.fp8.fp8", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_f32_32x32x16_fp8_fp8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_perm_b")]
    pub blgp: Attribute<'a>,
    #[dtype(is = i64)]
    pub a_ty: Type<'a>,
    #[dtype(is = i64)]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.f32.32x32x1f32", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_f32_32x32x1f32<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_perm_b")]
    pub blgp: Attribute<'a>,
    #[dtype(is = f32)]
    pub a_ty: Type<'a>,
    #[dtype(is = f32)]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<32xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = "vector<32xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.f32.32x32x2bf16", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_f32_32x32x2bf16<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_perm_b")]
    pub blgp: Attribute<'a>,
    #[dtype(is = "vector<2xi16>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<2xi16>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<32xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = "vector<32xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.f32.32x32x2f32", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_f32_32x32x2f32<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_perm_b")]
    pub blgp: Attribute<'a>,
    #[dtype(is = f32)]
    pub a_ty: Type<'a>,
    #[dtype(is = f32)]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.f32.32x32x4.xf32", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_f32_32x32x4_xf32<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_perm_b")]
    pub blgp: Attribute<'a>,
    #[dtype(is = "vector<2xf32>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<2xf32>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.f32.32x32x4bf16", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_f32_32x32x4bf16<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_perm_b")]
    pub blgp: Attribute<'a>,
    #[dtype(is = "vector<2xi16>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<2xi16>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.f32.32x32x4bf16.1k", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_f32_32x32x4bf16_1k<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_perm_b")]
    pub blgp: Attribute<'a>,
    #[dtype(is = "vector<4xi16>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<4xi16>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<32xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = "vector<32xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.f32.32x32x4f16", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_f32_32x32x4f16<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_perm_b")]
    pub blgp: Attribute<'a>,
    #[dtype(is = "vector<4xf16>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<4xf16>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<32xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = "vector<32xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.f32.32x32x8bf16.1k", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_f32_32x32x8bf16_1k<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_perm_b")]
    pub blgp: Attribute<'a>,
    #[dtype(is = "vector<4xi16>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<4xi16>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.f32.32x32x8f16", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_f32_32x32x8f16<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_perm_b")]
    pub blgp: Attribute<'a>,
    #[dtype(is = "vector<4xf16>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<4xf16>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.f32.4x4x1f32", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_f32_4x4x1f32<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_perm_b")]
    pub blgp: Attribute<'a>,
    #[dtype(is = f32)]
    pub a_ty: Type<'a>,
    #[dtype(is = f32)]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.f32.4x4x2bf16", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_f32_4x4x2bf16<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_perm_b")]
    pub blgp: Attribute<'a>,
    #[dtype(is = "vector<2xi16>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<2xi16>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.f32.4x4x4bf16.1k", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_f32_4x4x4bf16_1k<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_perm_b")]
    pub blgp: Attribute<'a>,
    #[dtype(is = "vector<4xi16>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<4xi16>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.f32.4x4x4f16", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_f32_4x4x4f16<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_perm_b")]
    pub blgp: Attribute<'a>,
    #[dtype(is = "vector<4xf16>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<4xf16>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.f64.16x16x4f64", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_f64_16x16x4f64<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_neg_modifier")]
    pub blgp: Attribute<'a>,
    #[dtype(is = f64)]
    pub a_ty: Type<'a>,
    #[dtype(is = f64)]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<4xf64>")]
    pub c_ty: Type<'a>,
    #[dtype(is = "vector<4xf64>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.f64.4x4x4f64", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_f64_4x4x4f64<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_neg_modifier")]
    pub blgp: Attribute<'a>,
    #[dtype(is = f64)]
    pub a_ty: Type<'a>,
    #[dtype(is = f64)]
    pub b_ty: Type<'a>,
    #[dtype(is = f64)]
    pub c_ty: Type<'a>,
    #[dtype(is = f64)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.i32.16x16x16i8", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_i32_16x16x16i8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_perm_b")]
    pub blgp: Attribute<'a>,
    #[dtype(is = i32)]
    pub a_ty: Type<'a>,
    #[dtype(is = i32)]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<4xi32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = "vector<4xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.i32.16x16x32.i8", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_i32_16x16x32_i8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_perm_b")]
    pub blgp: Attribute<'a>,
    #[dtype(is = i64)]
    pub a_ty: Type<'a>,
    #[dtype(is = i64)]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<4xi32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = "vector<4xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.i32.16x16x4i8", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_i32_16x16x4i8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_perm_b")]
    pub blgp: Attribute<'a>,
    #[dtype(is = i32)]
    pub a_ty: Type<'a>,
    #[dtype(is = i32)]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<16xi32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = "vector<16xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.i32.16x16x64.i8", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_i32_16x16x64_i8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_perm_b")]
    pub blgp: Attribute<'a>,
    #[dtype(is = "vector<4xi32>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<4xi32>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<4xi32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = "vector<4xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.i32.32x32x16.i8", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_i32_32x32x16_i8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_perm_b")]
    pub blgp: Attribute<'a>,
    #[dtype(is = i64)]
    pub a_ty: Type<'a>,
    #[dtype(is = i64)]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<16xi32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = "vector<16xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.i32.32x32x32.i8", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_i32_32x32x32_i8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_perm_b")]
    pub blgp: Attribute<'a>,
    #[dtype(is = "vector<4xi32>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<4xi32>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<16xi32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = "vector<16xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.i32.32x32x4i8", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_i32_32x32x4i8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_perm_b")]
    pub blgp: Attribute<'a>,
    #[dtype(is = i32)]
    pub a_ty: Type<'a>,
    #[dtype(is = i32)]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<32xi32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = "vector<32xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.i32.32x32x8i8", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_i32_32x32x8i8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_perm_b")]
    pub blgp: Attribute<'a>,
    #[dtype(is = i32)]
    pub a_ty: Type<'a>,
    #[dtype(is = i32)]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<16xi32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = "vector<16xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.i32.4x4x4i8", format = "$a `,` $b `,` $c `,` $cbsz `,` $abid `,` $blgp attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct mfma_i32_4x4x4i8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[attr(dialect = "rocdl<mfma_perm_b")]
    pub blgp: Attribute<'a>,
    #[dtype(is = i32)]
    pub a_ty: Type<'a>,
    #[dtype(is = i32)]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<4xi32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = "vector<4xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.scale.f32.16x16x128.f8f6f4", format = "$a `,` $b `,` $c `,` $cbsz `,` $blgp `,` $opselA `,` $scaleA `,` $opselB `,` $scaleB attr-dict `:` functional-type($a $b $c $scaleA $scaleB, $res)", results(res))]
pub struct mfma_scale_f32_16x16x128_f8f6f4<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(scale_a_ty, name = "scaleA")]
    pub scale_a: Value<'a>,
    #[slot(scale_b_ty, name = "scaleB")]
    pub scale_b: Value<'a>,
    #[attr(dialect = "rocdl<matrix_format")]
    pub cbsz: Attribute<'a>,
    #[attr(dialect = "rocdl<matrix_format")]
    pub blgp: Attribute<'a>,
    #[attr(name = "opselA", int = "i32")]
    pub opsel_a: Attribute<'a>,
    #[attr(name = "opselB", int = "i32")]
    pub opsel_b: Attribute<'a>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub scale_a_ty: Type<'a>,
    #[dtype(is = i32)]
    pub scale_b_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.mfma.scale.f32.32x32x64.f8f6f4", format = "$a `,` $b `,` $c `,` $cbsz `,` $blgp `,` $opselA `,` $scaleA `,` $opselB `,` $scaleB attr-dict `:` functional-type($a $b $c $scaleA $scaleB, $res)", results(res))]
pub struct mfma_scale_f32_32x32x64_f8f6f4<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(scale_a_ty, name = "scaleA")]
    pub scale_a: Value<'a>,
    #[slot(scale_b_ty, name = "scaleB")]
    pub scale_b: Value<'a>,
    #[attr(dialect = "rocdl<matrix_format")]
    pub cbsz: Attribute<'a>,
    #[attr(dialect = "rocdl<matrix_format")]
    pub blgp: Attribute<'a>,
    #[attr(name = "opselA", int = "i32")]
    pub opsel_a: Attribute<'a>,
    #[attr(name = "opselB", int = "i32")]
    pub opsel_b: Attribute<'a>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub scale_a_ty: Type<'a>,
    #[dtype(is = i32)]
    pub scale_b_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.sdot2", format = "$a `,` $b `,` $c attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct sdot2<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i1", default = "0")]
    pub clamp: Option<Attribute<'a>>,
    #[dtype(is = "vector<2xi16>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<2xi16>")]
    pub b_ty: Type<'a>,
    #[dtype(is = i32)]
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.sdot4", format = "$a `,` $b `,` $c attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct sdot4<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i1", default = "0")]
    pub clamp: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub a_ty: Type<'a>,
    #[dtype(is = i32)]
    pub b_ty: Type<'a>,
    #[dtype(is = i32)]
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.sdot8", format = "$a `,` $b `,` $c attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct sdot8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i1", default = "0")]
    pub clamp: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub a_ty: Type<'a>,
    #[dtype(is = i32)]
    pub b_ty: Type<'a>,
    #[dtype(is = i32)]
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.smfmac.f32.16x16x128.bf8.bf8", format = "$a `,` $b `,` $c `,` $index `,` $cbsz `,` $abid attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct smfmac_f32_16x16x128_bf8_bf8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[dtype(is = "vector<4xi32>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<8xi32>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.smfmac.f32.16x16x128.bf8.fp8", format = "$a `,` $b `,` $c `,` $index `,` $cbsz `,` $abid attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct smfmac_f32_16x16x128_bf8_fp8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[dtype(is = "vector<4xi32>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<8xi32>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.smfmac.f32.16x16x128.fp8.bf8", format = "$a `,` $b `,` $c `,` $index `,` $cbsz `,` $abid attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct smfmac_f32_16x16x128_fp8_bf8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[dtype(is = "vector<4xi32>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<8xi32>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.smfmac.f32.16x16x128.fp8.fp8", format = "$a `,` $b `,` $c `,` $index `,` $cbsz `,` $abid attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct smfmac_f32_16x16x128_fp8_fp8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[dtype(is = "vector<4xi32>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<8xi32>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.smfmac.f32.16x16x32.bf16", format = "$a `,` $b `,` $c `,` $index `,` $cbsz `,` $abid attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct smfmac_f32_16x16x32_bf16<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[dtype(is = "vector<4xi16>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<8xi16>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.smfmac.f32.16x16x32.f16", format = "$a `,` $b `,` $c `,` $index `,` $cbsz `,` $abid attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct smfmac_f32_16x16x32_f16<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[dtype(is = "vector<4xf16>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<8xf16>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.smfmac.f32.16x16x64.bf16", format = "$a `,` $b `,` $c `,` $index `,` $cbsz `,` $abid attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct smfmac_f32_16x16x64_bf16<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[dtype(is = "vector<8xbf16>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<16xbf16>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.smfmac.f32.16x16x64.bf8.bf8", format = "$a `,` $b `,` $c `,` $index `,` $cbsz `,` $abid attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct smfmac_f32_16x16x64_bf8_bf8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[dtype(is = "vector<2xi32>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<4xi32>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.smfmac.f32.16x16x64.bf8.fp8", format = "$a `,` $b `,` $c `,` $index `,` $cbsz `,` $abid attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct smfmac_f32_16x16x64_bf8_fp8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[dtype(is = "vector<2xi32>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<4xi32>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.smfmac.f32.16x16x64.f16", format = "$a `,` $b `,` $c `,` $index `,` $cbsz `,` $abid attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct smfmac_f32_16x16x64_f16<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[dtype(is = "vector<8xf16>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<16xf16>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.smfmac.f32.16x16x64.fp8.bf8", format = "$a `,` $b `,` $c `,` $index `,` $cbsz `,` $abid attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct smfmac_f32_16x16x64_fp8_bf8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[dtype(is = "vector<2xi32>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<4xi32>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.smfmac.f32.16x16x64.fp8.fp8", format = "$a `,` $b `,` $c `,` $index `,` $cbsz `,` $abid attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct smfmac_f32_16x16x64_fp8_fp8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[dtype(is = "vector<2xi32>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<4xi32>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    #[dtype(is = "vector<4xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.smfmac.f32.32x32x16.bf16", format = "$a `,` $b `,` $c `,` $index `,` $cbsz `,` $abid attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct smfmac_f32_32x32x16_bf16<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[dtype(is = "vector<4xi16>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<8xi16>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.smfmac.f32.32x32x16.f16", format = "$a `,` $b `,` $c `,` $index `,` $cbsz `,` $abid attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct smfmac_f32_32x32x16_f16<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[dtype(is = "vector<4xf16>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<8xf16>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.smfmac.f32.32x32x32.bf16", format = "$a `,` $b `,` $c `,` $index `,` $cbsz `,` $abid attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct smfmac_f32_32x32x32_bf16<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[dtype(is = "vector<8xbf16>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<16xbf16>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.smfmac.f32.32x32x32.bf8.bf8", format = "$a `,` $b `,` $c `,` $index `,` $cbsz `,` $abid attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct smfmac_f32_32x32x32_bf8_bf8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[dtype(is = "vector<2xi32>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<4xi32>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.smfmac.f32.32x32x32.bf8.fp8", format = "$a `,` $b `,` $c `,` $index `,` $cbsz `,` $abid attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct smfmac_f32_32x32x32_bf8_fp8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[dtype(is = "vector<2xi32>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<4xi32>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.smfmac.f32.32x32x32.f16", format = "$a `,` $b `,` $c `,` $index `,` $cbsz `,` $abid attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct smfmac_f32_32x32x32_f16<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[dtype(is = "vector<8xf16>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<16xf16>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.smfmac.f32.32x32x32.fp8.bf8", format = "$a `,` $b `,` $c `,` $index `,` $cbsz `,` $abid attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct smfmac_f32_32x32x32_fp8_bf8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[dtype(is = "vector<2xi32>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<4xi32>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.smfmac.f32.32x32x32.fp8.fp8", format = "$a `,` $b `,` $c `,` $index `,` $cbsz `,` $abid attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct smfmac_f32_32x32x32_fp8_fp8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[dtype(is = "vector<2xi32>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<4xi32>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.smfmac.f32.32x32x64.bf8.bf8", format = "$a `,` $b `,` $c `,` $index `,` $cbsz `,` $abid attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct smfmac_f32_32x32x64_bf8_bf8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[dtype(is = "vector<4xi32>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<8xi32>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.smfmac.f32.32x32x64.bf8.fp8", format = "$a `,` $b `,` $c `,` $index `,` $cbsz `,` $abid attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct smfmac_f32_32x32x64_bf8_fp8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[dtype(is = "vector<4xi32>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<8xi32>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.smfmac.f32.32x32x64.fp8.bf8", format = "$a `,` $b `,` $c `,` $index `,` $cbsz `,` $abid attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct smfmac_f32_32x32x64_fp8_bf8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[dtype(is = "vector<4xi32>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<8xi32>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.smfmac.f32.32x32x64.fp8.fp8", format = "$a `,` $b `,` $c `,` $index `,` $cbsz `,` $abid attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct smfmac_f32_32x32x64_fp8_fp8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[dtype(is = "vector<4xi32>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<8xi32>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    #[dtype(is = "vector<16xf32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.smfmac.i32.16x16x128.i8", format = "$a `,` $b `,` $c `,` $index `,` $cbsz `,` $abid attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct smfmac_i32_16x16x128_i8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[dtype(is = "vector<4xi32>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<8xi32>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<4xi32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    #[dtype(is = "vector<4xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.smfmac.i32.16x16x64.i8", format = "$a `,` $b `,` $c `,` $index `,` $cbsz `,` $abid attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct smfmac_i32_16x16x64_i8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[dtype(is = "vector<2xi32>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<4xi32>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<4xi32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    #[dtype(is = "vector<4xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.smfmac.i32.32x32x32.i8", format = "$a `,` $b `,` $c `,` $index `,` $cbsz `,` $abid attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct smfmac_i32_32x32x32_i8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[dtype(is = "vector<2xi32>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<4xi32>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<16xi32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    #[dtype(is = "vector<16xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.smfmac.i32.32x32x64.i8", format = "$a `,` $b `,` $c `,` $index `,` $cbsz `,` $abid attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct smfmac_i32_32x32x64_i8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(int = "i32")]
    pub cbsz: Attribute<'a>,
    #[attr(int = "i32")]
    pub abid: Attribute<'a>,
    #[dtype(is = "vector<4xi32>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<8xi32>")]
    pub b_ty: Type<'a>,
    #[dtype(is = "vector<16xi32>")]
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    #[dtype(is = "vector<16xi32>")]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.sudot4", format = "$a `,` $b `,` $c attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct sudot4<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(name = "signA", int = "i1", default = "0")]
    pub sign_a: Option<Attribute<'a>>,
    #[attr(name = "signB", int = "i1", default = "0")]
    pub sign_b: Option<Attribute<'a>>,
    #[attr(int = "i1", default = "0")]
    pub clamp: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub a_ty: Type<'a>,
    #[dtype(is = i32)]
    pub b_ty: Type<'a>,
    #[dtype(is = i32)]
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.sudot8", format = "$a `,` $b `,` $c attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct sudot8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(name = "signA", int = "i1", default = "0")]
    pub sign_a: Option<Attribute<'a>>,
    #[attr(name = "signB", int = "i1", default = "0")]
    pub sign_b: Option<Attribute<'a>>,
    #[attr(int = "i1", default = "0")]
    pub clamp: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub a_ty: Type<'a>,
    #[dtype(is = i32)]
    pub b_ty: Type<'a>,
    #[dtype(is = i32)]
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.swmmac.bf16.16x16x32.bf16", format = "$a `,` $b `,` $c `,` $index attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct swmmac_bf16_16x16x32_bf16<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.swmmac.bf16.16x16x64.bf16", format = "$a `,` $b `,` $c `,` $index attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct swmmac_bf16_16x16x64_bf16<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(name = "signA", int = "i1", default = "0")]
    pub sign_a: Option<Attribute<'a>>,
    #[attr(name = "signB", int = "i1", default = "0")]
    pub sign_b: Option<Attribute<'a>>,
    #[attr(name = "reuseA", int = "i1", default = "0")]
    pub reuse_a: Option<Attribute<'a>>,
    #[attr(name = "reuseB", int = "i1", default = "0")]
    pub reuse_b: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.swmmac.bf16f32.16x16x64.bf16", format = "$a `,` $b `,` $c `,` $index attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct swmmac_bf16f32_16x16x64_bf16<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(name = "signA", int = "i1", default = "0")]
    pub sign_a: Option<Attribute<'a>>,
    #[attr(name = "signB", int = "i1", default = "0")]
    pub sign_b: Option<Attribute<'a>>,
    #[attr(name = "reuseA", int = "i1", default = "0")]
    pub reuse_a: Option<Attribute<'a>>,
    #[attr(name = "reuseB", int = "i1", default = "0")]
    pub reuse_b: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.swmmac.f16.16x16x128.bf8.bf8", format = "$a `,` $b `,` $c `,` $index attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct swmmac_f16_16x16x128_bf8_bf8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(name = "reuseA", int = "i1", default = "0")]
    pub reuse_a: Option<Attribute<'a>>,
    #[attr(name = "reuseB", int = "i1", default = "0")]
    pub reuse_b: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.swmmac.f16.16x16x128.bf8.fp8", format = "$a `,` $b `,` $c `,` $index attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct swmmac_f16_16x16x128_bf8_fp8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(name = "reuseA", int = "i1", default = "0")]
    pub reuse_a: Option<Attribute<'a>>,
    #[attr(name = "reuseB", int = "i1", default = "0")]
    pub reuse_b: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.swmmac.f16.16x16x128.fp8.bf8", format = "$a `,` $b `,` $c `,` $index attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct swmmac_f16_16x16x128_fp8_bf8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(name = "reuseA", int = "i1", default = "0")]
    pub reuse_a: Option<Attribute<'a>>,
    #[attr(name = "reuseB", int = "i1", default = "0")]
    pub reuse_b: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.swmmac.f16.16x16x128.fp8.fp8", format = "$a `,` $b `,` $c `,` $index attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct swmmac_f16_16x16x128_fp8_fp8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(name = "reuseA", int = "i1", default = "0")]
    pub reuse_a: Option<Attribute<'a>>,
    #[attr(name = "reuseB", int = "i1", default = "0")]
    pub reuse_b: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.swmmac.f16.16x16x32.f16", format = "$a `,` $b `,` $c `,` $index attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct swmmac_f16_16x16x32_f16<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.swmmac.f16.16x16x64.f16", format = "$a `,` $b `,` $c `,` $index attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct swmmac_f16_16x16x64_f16<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(name = "signA", int = "i1", default = "0")]
    pub sign_a: Option<Attribute<'a>>,
    #[attr(name = "signB", int = "i1", default = "0")]
    pub sign_b: Option<Attribute<'a>>,
    #[attr(name = "reuseA", int = "i1", default = "0")]
    pub reuse_a: Option<Attribute<'a>>,
    #[attr(name = "reuseB", int = "i1", default = "0")]
    pub reuse_b: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.swmmac.f32.16x16x128.bf8.bf8", format = "$a `,` $b `,` $c `,` $index attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct swmmac_f32_16x16x128_bf8_bf8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(name = "reuseA", int = "i1", default = "0")]
    pub reuse_a: Option<Attribute<'a>>,
    #[attr(name = "reuseB", int = "i1", default = "0")]
    pub reuse_b: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.swmmac.f32.16x16x128.bf8.fp8", format = "$a `,` $b `,` $c `,` $index attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct swmmac_f32_16x16x128_bf8_fp8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(name = "reuseA", int = "i1", default = "0")]
    pub reuse_a: Option<Attribute<'a>>,
    #[attr(name = "reuseB", int = "i1", default = "0")]
    pub reuse_b: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.swmmac.f32.16x16x128.fp8.bf8", format = "$a `,` $b `,` $c `,` $index attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct swmmac_f32_16x16x128_fp8_bf8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(name = "reuseA", int = "i1", default = "0")]
    pub reuse_a: Option<Attribute<'a>>,
    #[attr(name = "reuseB", int = "i1", default = "0")]
    pub reuse_b: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.swmmac.f32.16x16x128.fp8.fp8", format = "$a `,` $b `,` $c `,` $index attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct swmmac_f32_16x16x128_fp8_fp8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(name = "reuseA", int = "i1", default = "0")]
    pub reuse_a: Option<Attribute<'a>>,
    #[attr(name = "reuseB", int = "i1", default = "0")]
    pub reuse_b: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.swmmac.f32.16x16x32.bf16", format = "$a `,` $b `,` $c `,` $index attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct swmmac_f32_16x16x32_bf16<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.swmmac.f32.16x16x32.bf8.bf8", format = "$a `,` $b `,` $c `,` $index attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct swmmac_f32_16x16x32_bf8_bf8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.swmmac.f32.16x16x32.bf8.fp8", format = "$a `,` $b `,` $c `,` $index attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct swmmac_f32_16x16x32_bf8_fp8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.swmmac.f32.16x16x32.f16", format = "$a `,` $b `,` $c `,` $index attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct swmmac_f32_16x16x32_f16<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.swmmac.f32.16x16x32.fp8.bf8", format = "$a `,` $b `,` $c `,` $index attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct swmmac_f32_16x16x32_fp8_bf8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.swmmac.f32.16x16x32.fp8.fp8", format = "$a `,` $b `,` $c `,` $index attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct swmmac_f32_16x16x32_fp8_fp8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.swmmac.f32.16x16x64.bf16", format = "$a `,` $b `,` $c `,` $index attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct swmmac_f32_16x16x64_bf16<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(name = "signA", int = "i1", default = "0")]
    pub sign_a: Option<Attribute<'a>>,
    #[attr(name = "signB", int = "i1", default = "0")]
    pub sign_b: Option<Attribute<'a>>,
    #[attr(name = "reuseA", int = "i1", default = "0")]
    pub reuse_a: Option<Attribute<'a>>,
    #[attr(name = "reuseB", int = "i1", default = "0")]
    pub reuse_b: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.swmmac.f32.16x16x64.f16", format = "$a `,` $b `,` $c `,` $index attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct swmmac_f32_16x16x64_f16<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(name = "signA", int = "i1", default = "0")]
    pub sign_a: Option<Attribute<'a>>,
    #[attr(name = "signB", int = "i1", default = "0")]
    pub sign_b: Option<Attribute<'a>>,
    #[attr(name = "reuseA", int = "i1", default = "0")]
    pub reuse_a: Option<Attribute<'a>>,
    #[attr(name = "reuseB", int = "i1", default = "0")]
    pub reuse_b: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.swmmac.i32.16x16x128.iu8", format = "$a `,` $b `,` $c `,` $index attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct swmmac_i32_16x16x128_iu8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(name = "signA", int = "i1", default = "0")]
    pub sign_a: Option<Attribute<'a>>,
    #[attr(name = "signB", int = "i1", default = "0")]
    pub sign_b: Option<Attribute<'a>>,
    #[attr(name = "reuseA", int = "i1", default = "0")]
    pub reuse_a: Option<Attribute<'a>>,
    #[attr(name = "reuseB", int = "i1", default = "0")]
    pub reuse_b: Option<Attribute<'a>>,
    #[attr(int = "i1", default = "0")]
    pub clamp: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.swmmac.i32.16x16x32.iu4", format = "$a `,` $b `,` $c `,` $index attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct swmmac_i32_16x16x32_iu4<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(name = "signA", int = "i1", default = "0")]
    pub sign_a: Option<Attribute<'a>>,
    #[attr(name = "signB", int = "i1", default = "0")]
    pub sign_b: Option<Attribute<'a>>,
    #[attr(int = "i1", default = "0")]
    pub clamp: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.swmmac.i32.16x16x32.iu8", format = "$a `,` $b `,` $c `,` $index attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct swmmac_i32_16x16x32_iu8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(name = "signA", int = "i1", default = "0")]
    pub sign_a: Option<Attribute<'a>>,
    #[attr(name = "signB", int = "i1", default = "0")]
    pub sign_b: Option<Attribute<'a>>,
    #[attr(int = "i1", default = "0")]
    pub clamp: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.swmmac.i32.16x16x64.iu4", format = "$a `,` $b `,` $c `,` $index attr-dict `:` functional-type($a $b $c $index, $res)", results(res))]
pub struct swmmac_i32_16x16x64_iu4<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    #[attr(name = "signA", int = "i1", default = "0")]
    pub sign_a: Option<Attribute<'a>>,
    #[attr(name = "signB", int = "i1", default = "0")]
    pub sign_b: Option<Attribute<'a>>,
    #[attr(int = "i1", default = "0")]
    pub clamp: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.udot2", format = "$a `,` $b `,` $c attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct udot2<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i1", default = "0")]
    pub clamp: Option<Attribute<'a>>,
    #[dtype(is = "vector<2xi16>")]
    pub a_ty: Type<'a>,
    #[dtype(is = "vector<2xi16>")]
    pub b_ty: Type<'a>,
    #[dtype(is = i32)]
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.udot4", format = "$a `,` $b `,` $c attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct udot4<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i1", default = "0")]
    pub clamp: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub a_ty: Type<'a>,
    #[dtype(is = i32)]
    pub b_ty: Type<'a>,
    #[dtype(is = i32)]
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.udot8", format = "$a `,` $b `,` $c attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct udot8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i1", default = "0")]
    pub clamp: Option<Attribute<'a>>,
    #[dtype(is = i32)]
    pub a_ty: Type<'a>,
    #[dtype(is = i32)]
    pub b_ty: Type<'a>,
    #[dtype(is = i32)]
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub res: Type<'a>,
}

#[mlir::op("rocdl.wmma.bf16.16x16x16.bf16", format = "$a `,` $b `,` $c attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct wmma_bf16_16x16x16_bf16<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i1", default = "0")]
    pub opsel: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.wmma.bf16.16x16x32.bf16", format = "$a `,` $b `,` $c `,` `modC` `=` $modC attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct wmma_bf16_16x16x32_bf16<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(name = "modC", dialect = "rocdl<wmma_c_modifier", default = "none")]
    pub mod_c: Option<Attribute<'a>>,
    #[attr(name = "reuseA", int = "i1", default = "0")]
    pub reuse_a: Option<Attribute<'a>>,
    #[attr(name = "reuseB", int = "i1", default = "0")]
    pub reuse_b: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.wmma.bf16f32.16x16x32.bf16", format = "$a `,` $b `,` $c `,` `modC` `=` $modC attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct wmma_bf16f32_16x16x32_bf16<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(name = "modC", dialect = "rocdl<wmma_c_modifier", default = "none")]
    pub mod_c: Option<Attribute<'a>>,
    #[attr(name = "reuseA", int = "i1", default = "0")]
    pub reuse_a: Option<Attribute<'a>>,
    #[attr(name = "reuseB", int = "i1", default = "0")]
    pub reuse_b: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.wmma.f16.16x16x128.bf8_bf8", format = "$a `,` $b `,` $c `,` `modC` `=` $modC attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct wmma_f16_16x16x128_bf8_bf8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(name = "modC", dialect = "rocdl<wmma_c_modifier", default = "none")]
    pub mod_c: Option<Attribute<'a>>,
    #[attr(name = "reuseA", int = "i1", default = "0")]
    pub reuse_a: Option<Attribute<'a>>,
    #[attr(name = "reuseB", int = "i1", default = "0")]
    pub reuse_b: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.wmma.f16.16x16x128.bf8_fp8", format = "$a `,` $b `,` $c `,` `modC` `=` $modC attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct wmma_f16_16x16x128_bf8_fp8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(name = "modC", dialect = "rocdl<wmma_c_modifier", default = "none")]
    pub mod_c: Option<Attribute<'a>>,
    #[attr(name = "reuseA", int = "i1", default = "0")]
    pub reuse_a: Option<Attribute<'a>>,
    #[attr(name = "reuseB", int = "i1", default = "0")]
    pub reuse_b: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.wmma.f16.16x16x128.fp8_bf8", format = "$a `,` $b `,` $c `,` `modC` `=` $modC attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct wmma_f16_16x16x128_fp8_bf8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(name = "modC", dialect = "rocdl<wmma_c_modifier", default = "none")]
    pub mod_c: Option<Attribute<'a>>,
    #[attr(name = "reuseA", int = "i1", default = "0")]
    pub reuse_a: Option<Attribute<'a>>,
    #[attr(name = "reuseB", int = "i1", default = "0")]
    pub reuse_b: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.wmma.f16.16x16x128.fp8_fp8", format = "$a `,` $b `,` $c `,` `modC` `=` $modC attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct wmma_f16_16x16x128_fp8_fp8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(name = "modC", dialect = "rocdl<wmma_c_modifier", default = "none")]
    pub mod_c: Option<Attribute<'a>>,
    #[attr(name = "reuseA", int = "i1", default = "0")]
    pub reuse_a: Option<Attribute<'a>>,
    #[attr(name = "reuseB", int = "i1", default = "0")]
    pub reuse_b: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.wmma.f16.16x16x16.f16", format = "$a `,` $b `,` $c attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct wmma_f16_16x16x16_f16<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(int = "i1", default = "0")]
    pub opsel: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.wmma.f16.16x16x32.f16", format = "$a `,` $b `,` $c `,` `modC` `=` $modC attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct wmma_f16_16x16x32_f16<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(name = "modC", dialect = "rocdl<wmma_c_modifier", default = "none")]
    pub mod_c: Option<Attribute<'a>>,
    #[attr(name = "reuseA", int = "i1", default = "0")]
    pub reuse_a: Option<Attribute<'a>>,
    #[attr(name = "reuseB", int = "i1", default = "0")]
    pub reuse_b: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.wmma.f16.16x16x64.bf8_bf8", format = "$a `,` $b `,` $c `,` `modC` `=` $modC attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct wmma_f16_16x16x64_bf8_bf8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(name = "modC", dialect = "rocdl<wmma_c_modifier", default = "none")]
    pub mod_c: Option<Attribute<'a>>,
    #[attr(name = "reuseA", int = "i1", default = "0")]
    pub reuse_a: Option<Attribute<'a>>,
    #[attr(name = "reuseB", int = "i1", default = "0")]
    pub reuse_b: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.wmma.f16.16x16x64.bf8_fp8", format = "$a `,` $b `,` $c `,` `modC` `=` $modC attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct wmma_f16_16x16x64_bf8_fp8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(name = "modC", dialect = "rocdl<wmma_c_modifier", default = "none")]
    pub mod_c: Option<Attribute<'a>>,
    #[attr(name = "reuseA", int = "i1", default = "0")]
    pub reuse_a: Option<Attribute<'a>>,
    #[attr(name = "reuseB", int = "i1", default = "0")]
    pub reuse_b: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.wmma.f16.16x16x64.fp8_bf8", format = "$a `,` $b `,` $c `,` `modC` `=` $modC attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct wmma_f16_16x16x64_fp8_bf8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(name = "modC", dialect = "rocdl<wmma_c_modifier", default = "none")]
    pub mod_c: Option<Attribute<'a>>,
    #[attr(name = "reuseA", int = "i1", default = "0")]
    pub reuse_a: Option<Attribute<'a>>,
    #[attr(name = "reuseB", int = "i1", default = "0")]
    pub reuse_b: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.wmma.f16.16x16x64.fp8_fp8", format = "$a `,` $b `,` $c `,` `modC` `=` $modC attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct wmma_f16_16x16x64_fp8_fp8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(name = "modC", dialect = "rocdl<wmma_c_modifier", default = "none")]
    pub mod_c: Option<Attribute<'a>>,
    #[attr(name = "reuseA", int = "i1", default = "0")]
    pub reuse_a: Option<Attribute<'a>>,
    #[attr(name = "reuseB", int = "i1", default = "0")]
    pub reuse_b: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.wmma.f32.16x16x128.bf8_bf8", format = "$a `,` $b `,` $c `,` `modC` `=` $modC attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct wmma_f32_16x16x128_bf8_bf8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(name = "modC", dialect = "rocdl<wmma_c_modifier", default = "none")]
    pub mod_c: Option<Attribute<'a>>,
    #[attr(name = "reuseA", int = "i1", default = "0")]
    pub reuse_a: Option<Attribute<'a>>,
    #[attr(name = "reuseB", int = "i1", default = "0")]
    pub reuse_b: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.wmma.f32.16x16x128.bf8_fp8", format = "$a `,` $b `,` $c `,` `modC` `=` $modC attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct wmma_f32_16x16x128_bf8_fp8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(name = "modC", dialect = "rocdl<wmma_c_modifier", default = "none")]
    pub mod_c: Option<Attribute<'a>>,
    #[attr(name = "reuseA", int = "i1", default = "0")]
    pub reuse_a: Option<Attribute<'a>>,
    #[attr(name = "reuseB", int = "i1", default = "0")]
    pub reuse_b: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.wmma.f32.16x16x128.fp8_bf8", format = "$a `,` $b `,` $c `,` `modC` `=` $modC attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct wmma_f32_16x16x128_fp8_bf8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(name = "modC", dialect = "rocdl<wmma_c_modifier", default = "none")]
    pub mod_c: Option<Attribute<'a>>,
    #[attr(name = "reuseA", int = "i1", default = "0")]
    pub reuse_a: Option<Attribute<'a>>,
    #[attr(name = "reuseB", int = "i1", default = "0")]
    pub reuse_b: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.wmma.f32.16x16x128.fp8_fp8", format = "$a `,` $b `,` $c `,` `modC` `=` $modC attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct wmma_f32_16x16x128_fp8_fp8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(name = "modC", dialect = "rocdl<wmma_c_modifier", default = "none")]
    pub mod_c: Option<Attribute<'a>>,
    #[attr(name = "reuseA", int = "i1", default = "0")]
    pub reuse_a: Option<Attribute<'a>>,
    #[attr(name = "reuseB", int = "i1", default = "0")]
    pub reuse_b: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.wmma.f32.16x16x16.bf16", format = "$a `,` $b `,` $c attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct wmma_f32_16x16x16_bf16<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.wmma.f32.16x16x16.bf8_bf8", format = "$a `,` $b `,` $c attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct wmma_f32_16x16x16_bf8_bf8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.wmma.f32.16x16x16.bf8_fp8", format = "$a `,` $b `,` $c attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct wmma_f32_16x16x16_bf8_fp8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.wmma.f32.16x16x16.f16", format = "$a `,` $b `,` $c attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct wmma_f32_16x16x16_f16<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.wmma.f32.16x16x16.fp8_bf8", format = "$a `,` $b `,` $c attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct wmma_f32_16x16x16_fp8_bf8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.wmma.f32.16x16x16.fp8_fp8", format = "$a `,` $b `,` $c attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct wmma_f32_16x16x16_fp8_fp8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.wmma.f32.16x16x32.bf16", format = "$a `,` $b `,` $c `,` `modC` `=` $modC attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct wmma_f32_16x16x32_bf16<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(name = "modC", dialect = "rocdl<wmma_c_modifier", default = "none")]
    pub mod_c: Option<Attribute<'a>>,
    #[attr(name = "reuseA", int = "i1", default = "0")]
    pub reuse_a: Option<Attribute<'a>>,
    #[attr(name = "reuseB", int = "i1", default = "0")]
    pub reuse_b: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.wmma.f32.16x16x32.f16", format = "$a `,` $b `,` $c `,` `modC` `=` $modC attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct wmma_f32_16x16x32_f16<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(name = "modC", dialect = "rocdl<wmma_c_modifier", default = "none")]
    pub mod_c: Option<Attribute<'a>>,
    #[attr(name = "reuseA", int = "i1", default = "0")]
    pub reuse_a: Option<Attribute<'a>>,
    #[attr(name = "reuseB", int = "i1", default = "0")]
    pub reuse_b: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.wmma.f32.16x16x4.f32", format = "$a `,` $b `,` $c `,` `modC` `=` $modC attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct wmma_f32_16x16x4_f32<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(name = "modC", dialect = "rocdl<wmma_c_modifier", default = "none")]
    pub mod_c: Option<Attribute<'a>>,
    #[attr(name = "reuseA", int = "i1", default = "0")]
    pub reuse_a: Option<Attribute<'a>>,
    #[attr(name = "reuseB", int = "i1", default = "0")]
    pub reuse_b: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.wmma.f32.16x16x64.bf8_bf8", format = "$a `,` $b `,` $c `,` `modC` `=` $modC attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct wmma_f32_16x16x64_bf8_bf8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(name = "modC", dialect = "rocdl<wmma_c_modifier", default = "none")]
    pub mod_c: Option<Attribute<'a>>,
    #[attr(name = "reuseA", int = "i1", default = "0")]
    pub reuse_a: Option<Attribute<'a>>,
    #[attr(name = "reuseB", int = "i1", default = "0")]
    pub reuse_b: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.wmma.f32.16x16x64.bf8_fp8", format = "$a `,` $b `,` $c `,` `modC` `=` $modC attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct wmma_f32_16x16x64_bf8_fp8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(name = "modC", dialect = "rocdl<wmma_c_modifier", default = "none")]
    pub mod_c: Option<Attribute<'a>>,
    #[attr(name = "reuseA", int = "i1", default = "0")]
    pub reuse_a: Option<Attribute<'a>>,
    #[attr(name = "reuseB", int = "i1", default = "0")]
    pub reuse_b: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.wmma.f32.16x16x64.fp8_bf8", format = "$a `,` $b `,` $c `,` `modC` `=` $modC attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct wmma_f32_16x16x64_fp8_bf8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(name = "modC", dialect = "rocdl<wmma_c_modifier", default = "none")]
    pub mod_c: Option<Attribute<'a>>,
    #[attr(name = "reuseA", int = "i1", default = "0")]
    pub reuse_a: Option<Attribute<'a>>,
    #[attr(name = "reuseB", int = "i1", default = "0")]
    pub reuse_b: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.wmma.f32.16x16x64.fp8_fp8", format = "$a `,` $b `,` $c `,` `modC` `=` $modC attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct wmma_f32_16x16x64_fp8_fp8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(name = "modC", dialect = "rocdl<wmma_c_modifier", default = "none")]
    pub mod_c: Option<Attribute<'a>>,
    #[attr(name = "reuseA", int = "i1", default = "0")]
    pub reuse_a: Option<Attribute<'a>>,
    #[attr(name = "reuseB", int = "i1", default = "0")]
    pub reuse_b: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.wmma.i32.16x16x16.iu4", format = "$a `,` $b `,` $c attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct wmma_i32_16x16x16_iu4<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(name = "signA", int = "i1", default = "0")]
    pub sign_a: Option<Attribute<'a>>,
    #[attr(name = "signB", int = "i1", default = "0")]
    pub sign_b: Option<Attribute<'a>>,
    #[attr(int = "i1", default = "0")]
    pub clamp: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.wmma.i32.16x16x16.iu8", format = "$a `,` $b `,` $c attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct wmma_i32_16x16x16_iu8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(name = "signA", int = "i1", default = "0")]
    pub sign_a: Option<Attribute<'a>>,
    #[attr(name = "signB", int = "i1", default = "0")]
    pub sign_b: Option<Attribute<'a>>,
    #[attr(int = "i1", default = "0")]
    pub clamp: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.wmma.i32.16x16x32.iu4", format = "$a `,` $b `,` $c attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct wmma_i32_16x16x32_iu4<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(name = "signA", int = "i1", default = "0")]
    pub sign_a: Option<Attribute<'a>>,
    #[attr(name = "signB", int = "i1", default = "0")]
    pub sign_b: Option<Attribute<'a>>,
    #[attr(int = "i1", default = "0")]
    pub clamp: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.wmma.i32.16x16x64.iu8", format = "$a `,` $b `,` $c attr-dict `:` functional-type($a $b $c, $res)", results(res))]
pub struct wmma_i32_16x16x64_iu8<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[attr(name = "signA", int = "i1", default = "0")]
    pub sign_a: Option<Attribute<'a>>,
    #[attr(name = "signB", int = "i1", default = "0")]
    pub sign_b: Option<Attribute<'a>>,
    #[attr(name = "reuseA", int = "i1", default = "0")]
    pub reuse_a: Option<Attribute<'a>>,
    #[attr(name = "reuseB", int = "i1", default = "0")]
    pub reuse_b: Option<Attribute<'a>>,
    #[attr(int = "i1", default = "0")]
    pub clamp: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.wmma.scale16.f32.16x16x128.f8f6f4", format = "$a `,` $b `,` $c `,` $scaleA `,` $scaleB `,` `fmtA` `=` $fmtA `,` `fmtB` `=` $fmtB `,` `modC` `=` $modC `,` `scaleAType` `=` $scaleAType `,` `fmtScaleA` `=` $fmtScaleA `,` `scaleBType` `=` $scaleBType `,` `fmtScaleB` `=` $fmtScaleB attr-dict `:` functional-type($a $b $c $scaleA $scaleB, $res)", results(res))]
pub struct wmma_scale16_f32_16x16x128_f8f6f4<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(scale_a_ty, name = "scaleA")]
    pub scale_a: Value<'a>,
    #[slot(scale_b_ty, name = "scaleB")]
    pub scale_b: Value<'a>,
    #[attr(name = "fmtA", dialect = "rocdl<matrix_format", default = "fp8_e4m3")]
    pub fmt_a: Option<Attribute<'a>>,
    #[attr(name = "fmtB", dialect = "rocdl<matrix_format", default = "fp8_e4m3")]
    pub fmt_b: Option<Attribute<'a>>,
    #[attr(name = "modC", dialect = "rocdl<wmma_c_modifier", default = "none")]
    pub mod_c: Option<Attribute<'a>>,
    #[attr(name = "scaleAType", dialect = "rocdl<wmma_matrix_scale", default = "row0")]
    pub scale_a_type: Option<Attribute<'a>>,
    #[attr(name = "fmtScaleA", dialect = "rocdl<wmma_matrix_scale_format", default = "e8")]
    pub fmt_scale_a: Option<Attribute<'a>>,
    #[attr(name = "scaleBType", dialect = "rocdl<wmma_matrix_scale", default = "row0")]
    pub scale_b_type: Option<Attribute<'a>>,
    #[attr(name = "fmtScaleB", dialect = "rocdl<wmma_matrix_scale_format", default = "e8")]
    pub fmt_scale_b: Option<Attribute<'a>>,
    #[attr(name = "reuseA", int = "i1", default = "0")]
    pub reuse_a: Option<Attribute<'a>>,
    #[attr(name = "reuseB", int = "i1", default = "0")]
    pub reuse_b: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    #[dtype(is = i64)]
    pub scale_a_ty: Type<'a>,
    #[dtype(is = i64)]
    pub scale_b_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.wmma.scale16.f32.32x16x128.f4", format = "$a `,` $b `,` $c `,` $scaleA `,` $scaleB `,` `modC` `=` $modC `,` `scaleAType` `=` $scaleAType `,` `fmtScaleA` `=` $fmtScaleA `,` `scaleBType` `=` $scaleBType `,` `fmtScaleB` `=` $fmtScaleB attr-dict `:` functional-type($a $b $c $scaleA $scaleB, $res)", results(res))]
pub struct wmma_scale16_f32_32x16x128_f4<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(scale_a_ty, name = "scaleA")]
    pub scale_a: Value<'a>,
    #[slot(scale_b_ty, name = "scaleB")]
    pub scale_b: Value<'a>,
    #[attr(name = "modC", dialect = "rocdl<wmma_c_modifier", default = "none")]
    pub mod_c: Option<Attribute<'a>>,
    #[attr(name = "scaleAType", dialect = "rocdl<wmma_matrix_scale", default = "row0")]
    pub scale_a_type: Option<Attribute<'a>>,
    #[attr(name = "fmtScaleA", dialect = "rocdl<wmma_matrix_scale_format", default = "e8")]
    pub fmt_scale_a: Option<Attribute<'a>>,
    #[attr(name = "scaleBType", dialect = "rocdl<wmma_matrix_scale", default = "row0")]
    pub scale_b_type: Option<Attribute<'a>>,
    #[attr(name = "fmtScaleB", dialect = "rocdl<wmma_matrix_scale_format", default = "e8")]
    pub fmt_scale_b: Option<Attribute<'a>>,
    #[attr(name = "reuseA", int = "i1", default = "0")]
    pub reuse_a: Option<Attribute<'a>>,
    #[attr(name = "reuseB", int = "i1", default = "0")]
    pub reuse_b: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    #[dtype(is = i64)]
    pub scale_a_ty: Type<'a>,
    #[dtype(is = i64)]
    pub scale_b_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.wmma.scale.f32.16x16x128.f8f6f4", format = "$a `,` $b `,` $c `,` $scaleA `,` $scaleB `,` `fmtA` `=` $fmtA `,` `fmtB` `=` $fmtB `,` `modC` `=` $modC `,` `scaleAType` `=` $scaleAType `,` `fmtScaleA` `=` $fmtScaleA `,` `scaleBType` `=` $scaleBType `,` `fmtScaleB` `=` $fmtScaleB attr-dict `:` functional-type($a $b $c $scaleA $scaleB, $res)", results(res))]
pub struct wmma_scale_f32_16x16x128_f8f6f4<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(scale_a_ty, name = "scaleA")]
    pub scale_a: Value<'a>,
    #[slot(scale_b_ty, name = "scaleB")]
    pub scale_b: Value<'a>,
    #[attr(name = "fmtA", dialect = "rocdl<matrix_format", default = "fp8_e4m3")]
    pub fmt_a: Option<Attribute<'a>>,
    #[attr(name = "fmtB", dialect = "rocdl<matrix_format", default = "fp8_e4m3")]
    pub fmt_b: Option<Attribute<'a>>,
    #[attr(name = "modC", dialect = "rocdl<wmma_c_modifier", default = "none")]
    pub mod_c: Option<Attribute<'a>>,
    #[attr(name = "scaleAType", dialect = "rocdl<wmma_matrix_scale", default = "row0")]
    pub scale_a_type: Option<Attribute<'a>>,
    #[attr(name = "fmtScaleA", dialect = "rocdl<wmma_matrix_scale_format", default = "e8")]
    pub fmt_scale_a: Option<Attribute<'a>>,
    #[attr(name = "scaleBType", dialect = "rocdl<wmma_matrix_scale", default = "row0")]
    pub scale_b_type: Option<Attribute<'a>>,
    #[attr(name = "fmtScaleB", dialect = "rocdl<wmma_matrix_scale_format", default = "e8")]
    pub fmt_scale_b: Option<Attribute<'a>>,
    #[attr(name = "reuseA", int = "i1", default = "0")]
    pub reuse_a: Option<Attribute<'a>>,
    #[attr(name = "reuseB", int = "i1", default = "0")]
    pub reuse_b: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub scale_a_ty: Type<'a>,
    #[dtype(is = i32)]
    pub scale_b_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("rocdl.wmma.scale.f32.32x16x128.f4", format = "$a `,` $b `,` $c `,` $scaleA `,` $scaleB `,` `modC` `=` $modC `,` `scaleAType` `=` $scaleAType `,` `fmtScaleA` `=` $fmtScaleA `,` `scaleBType` `=` $scaleBType `,` `fmtScaleB` `=` $fmtScaleB attr-dict `:` functional-type($a $b $c $scaleA $scaleB, $res)", results(res))]
pub struct wmma_scale_f32_32x16x128_f4<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(c_ty)]
    pub c: Value<'a>,
    #[slot(scale_a_ty, name = "scaleA")]
    pub scale_a: Value<'a>,
    #[slot(scale_b_ty, name = "scaleB")]
    pub scale_b: Value<'a>,
    #[attr(name = "modC", dialect = "rocdl<wmma_c_modifier", default = "none")]
    pub mod_c: Option<Attribute<'a>>,
    #[attr(name = "scaleAType", dialect = "rocdl<wmma_matrix_scale", default = "row0")]
    pub scale_a_type: Option<Attribute<'a>>,
    #[attr(name = "fmtScaleA", dialect = "rocdl<wmma_matrix_scale_format", default = "e8")]
    pub fmt_scale_a: Option<Attribute<'a>>,
    #[attr(name = "scaleBType", dialect = "rocdl<wmma_matrix_scale", default = "row0")]
    pub scale_b_type: Option<Attribute<'a>>,
    #[attr(name = "fmtScaleB", dialect = "rocdl<wmma_matrix_scale_format", default = "e8")]
    pub fmt_scale_b: Option<Attribute<'a>>,
    #[attr(name = "reuseA", int = "i1", default = "0")]
    pub reuse_a: Option<Attribute<'a>>,
    #[attr(name = "reuseB", int = "i1", default = "0")]
    pub reuse_b: Option<Attribute<'a>>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub c_ty: Type<'a>,
    #[dtype(is = i32)]
    pub scale_a_ty: Type<'a>,
    #[dtype(is = i32)]
    pub scale_b_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::dialect(
    "rocdl",
    ops = [ROCDLCos, ROCDLExp, ROCDLExp2, ROCDLLog, ROCDLRcp, ROCDLRsq, ROCDLSin, ROCDLSqrt, ROCDLTanh, AsyncmarkOp, BallotOp, BarrierInitOp, BarrierJoinOp, BarrierLeaveOp, BarrierOp, BarrierSignalIsfirstOp, BarrierSignalOp, BarrierSignalVarOp, BarrierWaitOp, BlockIdXOp, BlockIdYOp, BlockIdZOp, ClusterIdXOp, ClusterIdYOp, ClusterIdZOp, ClusterLoadAsyncToLDSB128Op, ClusterLoadAsyncToLDSB32Op, ClusterLoadAsyncToLDSB64Op, ClusterLoadAsyncToLDSB8Op, ClusterWorkgroupIdXOp, ClusterWorkgroupIdYOp, ClusterWorkgroupIdZOp, CvtF32Bf8Op, CvtF32Fp8Op, CvtPkBf8F32Op, CvtPkF32Bf8Op, CvtPkF32Fp8Op, CvtPkFp8F32Op, CvtPkRtz, CvtPkScalePk16Bf16Bf6Op, CvtPkScalePk16Bf16Fp6Op, CvtPkScalePk16F16Bf6Op, CvtPkScalePk16F16Fp6Op, CvtPkScalePk16F32Bf6Op, CvtPkScalePk16F32Fp6Op, CvtPkScalePk8Bf16Bf8Op, CvtPkScalePk8Bf16Fp4Op, CvtPkScalePk8Bf16Fp8Op, CvtPkScalePk8F16Bf8Op, CvtPkScalePk8F16Fp4Op, CvtPkScalePk8F16Fp8Op, CvtPkScalePk8F32Bf8Op, CvtPkScalePk8F32Fp4Op, CvtPkScalePk8F32Fp8Op, CvtScaleF322xPk16Bf6F32Op, CvtScaleF322xPk16Fp6F32Op, CvtScaleF32F16Bf8Op, CvtScaleF32F16Fp8Op, CvtScaleF32F32Bf8Op, CvtScaleF32F32Fp8Op, CvtScaleF32Pk16Bf6Bf16Op, CvtScaleF32Pk16Bf6F16Op, CvtScaleF32Pk16Bf6F32Op, CvtScaleF32Pk16Fp6Bf16Op, CvtScaleF32Pk16Fp6F16Op, CvtScaleF32Pk16Fp6F32Op, CvtScaleF32Pk32Bf16Bf6Op, CvtScaleF32Pk32Bf16Fp6Op, CvtScaleF32Pk32Bf6Bf16Op, CvtScaleF32Pk32Bf6F16Op, CvtScaleF32Pk32F16Bf6Op, CvtScaleF32Pk32F16Fp6Op, CvtScaleF32Pk32F32Bf6Op, CvtScaleF32Pk32F32Fp6Op, CvtScaleF32Pk32Fp6Bf16Op, CvtScaleF32Pk32Fp6F16Op, CvtScaleF32Pk8Bf8Bf16Op, CvtScaleF32Pk8Bf8F16Op, CvtScaleF32Pk8Bf8F32Op, CvtScaleF32Pk8Fp4Bf16Op, CvtScaleF32Pk8Fp4F16Op, CvtScaleF32Pk8Fp4F32Op, CvtScaleF32Pk8Fp8Bf16Op, CvtScaleF32Pk8Fp8F16Op, CvtScaleF32Pk8Fp8F32Op, CvtScaleF32PkBf16Bf8Op, CvtScaleF32PkBf16Fp4Op, CvtScaleF32PkBf16Fp8Op, CvtScaleF32PkBf8Bf16Op, CvtScaleF32PkBf8F16Op, CvtScaleF32PkBf8F32Op, CvtScaleF32PkF16Bf8Op, CvtScaleF32PkF16Fp4Op, CvtScaleF32PkF16Fp8Op, CvtScaleF32PkF32Bf8Op, CvtScaleF32PkF32Fp4Op, CvtScaleF32PkF32Fp8Op, CvtScaleF32PkFp4Bf16Op, CvtScaleF32PkFp4F16Op, CvtScaleF32PkFp4F32Op, CvtScaleF32PkFp8Bf16Op, CvtScaleF32PkFp8F16Op, CvtScaleF32PkFp8F32Op, CvtScaleF32SrBf8BF16Op, CvtScaleF32SrBf8F16Op, CvtScaleF32SrBf8F32Op, CvtScaleF32SrFp8BF16Op, CvtScaleF32SrFp8F16Op, CvtScaleF32SrFp8F32Op, CvtScaleF32SrPk16Bf6Bf16Op, CvtScaleF32SrPk16Bf6F16Op, CvtScaleF32SrPk16Bf6F32Op, CvtScaleF32SrPk16Fp6Bf16Op, CvtScaleF32SrPk16Fp6F16Op, CvtScaleF32SrPk16Fp6F32Op, CvtScaleF32SrPk32Bf6Bf16Op, CvtScaleF32SrPk32Bf6F16Op, CvtScaleF32SrPk32Bf6F32Op, CvtScaleF32SrPk32Fp6Bf16Op, CvtScaleF32SrPk32Fp6F16Op, CvtScaleF32SrPk32Fp6F32Op, CvtScaleF32SrPk8Bf8Bf16Op, CvtScaleF32SrPk8Bf8F16Op, CvtScaleF32SrPk8Bf8F32Op, CvtScaleF32SrPk8Fp4Bf16Op, CvtScaleF32SrPk8Fp4F16Op, CvtScaleF32SrPk8Fp4F32Op, CvtScaleF32SrPk8Fp8Bf16Op, CvtScaleF32SrPk8Fp8F16Op, CvtScaleF32SrPk8Fp8F32Op, CvtScaleF32SrPkFp4Bf16Op, CvtScaleF32SrPkFp4F16Op, CvtScaleF32SrPkFp4F32Op, CvtSrBf8F32Op, CvtSrFp8F32Op, DPPUpdateOp, DsAtomicAsyncBarrierArriveOp, DsAtomicBarrierArriveRtnOp, DsBpermuteOp, DsLoadTr16_B128, DsLoadTr4_B64, DsLoadTr6_B96, DsLoadTr8_B64, DsSwizzleOp, FMed3Op, FlatPrefetchOp, GetBarrierStateOp, GetNamedBarrierStateOp, GlobalLoadAsyncLDSOp, GlobalLoadAsyncToLDSB128Op, GlobalLoadAsyncToLDSB32Op, GlobalLoadAsyncToLDSB64Op, GlobalLoadAsyncToLDSB8Op, GlobalLoadLDSOp, GlobalLoadTr4_B64, GlobalLoadTr6_B96, GlobalLoadTr8_B128, GlobalLoadTr8_B64, GlobalPrefetchOp, GlobalStoreAsyncFromLDSB128Op, GlobalStoreAsyncFromLDSB32Op, GlobalStoreAsyncFromLDSB64Op, GlobalStoreAsyncFromLDSB8Op, IglpOpt, LoadAsyncToLDSOp, LoadToLDSOp, MakeBufferRsrcOp, MbcntHiOp, MbcntLoOp, Permlane16SwapOp, Permlane16VarOp, Permlane32SwapOp, PermlaneX16Op, PermlaneX16VarOp, RawBufferAtomicCmpSwap, RawBufferAtomicFAddOp, RawBufferAtomicFMaxOp, RawBufferAtomicSMaxOp, RawBufferAtomicUMinOp, RawBufferLoadOp, RawBufferStoreOp, RawPtrBufferAtomicCmpSwap, RawPtrBufferAtomicFaddOp, RawPtrBufferAtomicFmaxOp, RawPtrBufferAtomicSmaxOp, RawPtrBufferAtomicUminOp, RawPtrBufferLoadAsyncLdsOp, RawPtrBufferLoadLdsOp, RawPtrBufferLoadOp, RawPtrBufferStoreOp, ReadfirstlaneOp, ReadlaneOp, SBarrierOp, SNopOp, SSleepOp, SWaitcntOp, SchedBarrier, SchedGroupBarrier, SetPrioOp, TensorLoadToLDSOp, TensorStoreFromLDSOp, ThreadIdXOp, ThreadIdYOp, ThreadIdZOp, WaitAsynccntOp, WaitAsyncmarkOp, WaitDscntOp, WaitExpcntOp, WaitLoadcntOp, WaitStorecntOp, WaitTensorcntOp, WakeupBarrierOp, WaveBarrierOp, WaveId, WavefrontSizeOp, dot4_f32_bf8_bf8, dot4_f32_bf8_fp8, dot4_f32_fp8_bf8, dot4_f32_fp8_fp8, ds_read_tr16_b64, ds_read_tr4_b64, ds_read_tr6_b96, ds_read_tr8_b64, fdot2, fdot2_bf16_bf16, fdot2_f16_f16, fdot2_f32_bf16, mfma_f32_16x16x16bf16_1k, mfma_f32_16x16x16f16, mfma_f32_16x16x1f32, mfma_f32_16x16x2bf16, mfma_f32_16x16x32_bf16, mfma_f32_16x16x32_bf8_bf8, mfma_f32_16x16x32_bf8_fp8, mfma_f32_16x16x32_f16, mfma_f32_16x16x32_fp8_bf8, mfma_f32_16x16x32_fp8_fp8, mfma_f32_16x16x4bf16_1k, mfma_f32_16x16x4f16, mfma_f32_16x16x4f32, mfma_f32_16x16x8_xf32, mfma_f32_16x16x8bf16, mfma_f32_32x32x16_bf16, mfma_f32_32x32x16_bf8_bf8, mfma_f32_32x32x16_bf8_fp8, mfma_f32_32x32x16_f16, mfma_f32_32x32x16_fp8_bf8, mfma_f32_32x32x16_fp8_fp8, mfma_f32_32x32x1f32, mfma_f32_32x32x2bf16, mfma_f32_32x32x2f32, mfma_f32_32x32x4_xf32, mfma_f32_32x32x4bf16, mfma_f32_32x32x4bf16_1k, mfma_f32_32x32x4f16, mfma_f32_32x32x8bf16_1k, mfma_f32_32x32x8f16, mfma_f32_4x4x1f32, mfma_f32_4x4x2bf16, mfma_f32_4x4x4bf16_1k, mfma_f32_4x4x4f16, mfma_f64_16x16x4f64, mfma_f64_4x4x4f64, mfma_i32_16x16x16i8, mfma_i32_16x16x32_i8, mfma_i32_16x16x4i8, mfma_i32_16x16x64_i8, mfma_i32_32x32x16_i8, mfma_i32_32x32x32_i8, mfma_i32_32x32x4i8, mfma_i32_32x32x8i8, mfma_i32_4x4x4i8, mfma_scale_f32_16x16x128_f8f6f4, mfma_scale_f32_32x32x64_f8f6f4, sdot2, sdot4, sdot8, smfmac_f32_16x16x128_bf8_bf8, smfmac_f32_16x16x128_bf8_fp8, smfmac_f32_16x16x128_fp8_bf8, smfmac_f32_16x16x128_fp8_fp8, smfmac_f32_16x16x32_bf16, smfmac_f32_16x16x32_f16, smfmac_f32_16x16x64_bf16, smfmac_f32_16x16x64_bf8_bf8, smfmac_f32_16x16x64_bf8_fp8, smfmac_f32_16x16x64_f16, smfmac_f32_16x16x64_fp8_bf8, smfmac_f32_16x16x64_fp8_fp8, smfmac_f32_32x32x16_bf16, smfmac_f32_32x32x16_f16, smfmac_f32_32x32x32_bf16, smfmac_f32_32x32x32_bf8_bf8, smfmac_f32_32x32x32_bf8_fp8, smfmac_f32_32x32x32_f16, smfmac_f32_32x32x32_fp8_bf8, smfmac_f32_32x32x32_fp8_fp8, smfmac_f32_32x32x64_bf8_bf8, smfmac_f32_32x32x64_bf8_fp8, smfmac_f32_32x32x64_fp8_bf8, smfmac_f32_32x32x64_fp8_fp8, smfmac_i32_16x16x128_i8, smfmac_i32_16x16x64_i8, smfmac_i32_32x32x32_i8, smfmac_i32_32x32x64_i8, sudot4, sudot8, swmmac_bf16_16x16x32_bf16, swmmac_bf16_16x16x64_bf16, swmmac_bf16f32_16x16x64_bf16, swmmac_f16_16x16x128_bf8_bf8, swmmac_f16_16x16x128_bf8_fp8, swmmac_f16_16x16x128_fp8_bf8, swmmac_f16_16x16x128_fp8_fp8, swmmac_f16_16x16x32_f16, swmmac_f16_16x16x64_f16, swmmac_f32_16x16x128_bf8_bf8, swmmac_f32_16x16x128_bf8_fp8, swmmac_f32_16x16x128_fp8_bf8, swmmac_f32_16x16x128_fp8_fp8, swmmac_f32_16x16x32_bf16, swmmac_f32_16x16x32_bf8_bf8, swmmac_f32_16x16x32_bf8_fp8, swmmac_f32_16x16x32_f16, swmmac_f32_16x16x32_fp8_bf8, swmmac_f32_16x16x32_fp8_fp8, swmmac_f32_16x16x64_bf16, swmmac_f32_16x16x64_f16, swmmac_i32_16x16x128_iu8, swmmac_i32_16x16x32_iu4, swmmac_i32_16x16x32_iu8, swmmac_i32_16x16x64_iu4, udot2, udot4, udot8, wmma_bf16_16x16x16_bf16, wmma_bf16_16x16x32_bf16, wmma_bf16f32_16x16x32_bf16, wmma_f16_16x16x128_bf8_bf8, wmma_f16_16x16x128_bf8_fp8, wmma_f16_16x16x128_fp8_bf8, wmma_f16_16x16x128_fp8_fp8, wmma_f16_16x16x16_f16, wmma_f16_16x16x32_f16, wmma_f16_16x16x64_bf8_bf8, wmma_f16_16x16x64_bf8_fp8, wmma_f16_16x16x64_fp8_bf8, wmma_f16_16x16x64_fp8_fp8, wmma_f32_16x16x128_bf8_bf8, wmma_f32_16x16x128_bf8_fp8, wmma_f32_16x16x128_fp8_bf8, wmma_f32_16x16x128_fp8_fp8, wmma_f32_16x16x16_bf16, wmma_f32_16x16x16_bf8_bf8, wmma_f32_16x16x16_bf8_fp8, wmma_f32_16x16x16_f16, wmma_f32_16x16x16_fp8_bf8, wmma_f32_16x16x16_fp8_fp8, wmma_f32_16x16x32_bf16, wmma_f32_16x16x32_f16, wmma_f32_16x16x4_f32, wmma_f32_16x16x64_bf8_bf8, wmma_f32_16x16x64_bf8_fp8, wmma_f32_16x16x64_fp8_bf8, wmma_f32_16x16x64_fp8_fp8, wmma_i32_16x16x16_iu4, wmma_i32_16x16x16_iu8, wmma_i32_16x16x32_iu4, wmma_i32_16x16x64_iu8, wmma_scale16_f32_16x16x128_f8f6f4, wmma_scale16_f32_32x16x128_f4, wmma_scale_f32_16x16x128_f8f6f4, wmma_scale_f32_32x16x128_f4],
    dependents = ["llvm"]
)]
pub struct RocdlDialect;
