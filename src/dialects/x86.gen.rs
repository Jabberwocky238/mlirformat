#![allow(non_camel_case_types, unused_imports, clippy::all, rustdoc::all)]

use mlirformat::{mlir, Attribute, Region, Str, Type, Value, __Vec as Vec};

#[mlir::op("x86.avx10.dot.i8", format = "$w `,` $a `,` $b attr-dict `:` type($a) `->` type($w)", results(dst))]
pub struct AVX10DotInt8Op<'a> {
    #[slot(dst)]
    pub w: Value<'a>,
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(a_ty)]
    pub b: Value<'a>,
    pub a_ty: Type<'a>,
    pub dst: Type<'a>,
}

#[mlir::op("x86.avx.bcst_to_f32.packed", format = "$a attr-dict`:` type($a)`->` type($dst)", results(dst))]
pub struct BcstToPackedF32Op<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    pub a_ty: Type<'a>,
    pub dst: Type<'a>,
}

#[mlir::op("x86.avx.cvt.packed.even.indexed_to_f32", format = "$a attr-dict`:` type($a)`->` type($dst)", results(dst))]
pub struct CvtPackedEvenIndexedToF32Op<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    pub a_ty: Type<'a>,
    pub dst: Type<'a>,
}

#[mlir::op("x86.avx512.cvt.packed.f32_to_bf16", format = "$a attr-dict `:` type($a) `->` type($dst)", results(dst))]
pub struct CvtPackedF32ToBF16Op<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    pub a_ty: Type<'a>,
    pub dst: Type<'a>,
}

#[mlir::op("x86.avx.cvt.packed.odd.indexed_to_f32", format = "$a attr-dict`:` type($a)`->` type($dst)", results(dst))]
pub struct CvtPackedOddIndexedToF32Op<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    pub a_ty: Type<'a>,
    pub dst: Type<'a>,
}

#[mlir::op("x86.avx512.dot", format = "$src `,` $a `,` $b attr-dict `:` type($a) `->` type($src)", results(dst))]
pub struct DotBF16Op<'a> {
    #[slot(dst)]
    pub src: Value<'a>,
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(a_ty)]
    pub b: Value<'a>,
    pub a_ty: Type<'a>,
    pub dst: Type<'a>,
}

#[mlir::op("x86.avx.dot.i8", format = "$w `,` $a `,` $b attr-dict `:` type($a) `->` type($w)", results(dst))]
pub struct DotInt8Op<'a> {
    #[slot(dst)]
    pub w: Value<'a>,
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(a_ty)]
    pub b: Value<'a>,
    pub a_ty: Type<'a>,
    pub dst: Type<'a>,
}

#[mlir::op("x86.avx.intr.dot", format = "$a `,` $b attr-dict `:` type($res)", results(res))]
pub struct DotOp<'a> {
    #[slot(res)]
    pub a: Value<'a>,
    #[slot(res)]
    pub b: Value<'a>,
    pub res: Type<'a>,
}

#[mlir::op("x86.avx512.mask.compress", format = "$k `,` $a (`,` $src^)? attr-dict `:` type($dst) (`,` type($src)^)?", results(dst))]
pub struct MaskCompressOp<'a> {
    #[slot(k_ty)]
    pub k: Value<'a>,
    #[slot(dst)]
    pub a: Value<'a>,
    #[slot(src_ty)]
    pub src: Vec<Value<'a>>,
    pub constant_src: Option<Attribute<'a>>,
    #[dtype(i1 = dst)]
    pub k_ty: Type<'a>,
    pub src_ty: Vec<Type<'a>>,
    pub dst: Type<'a>,
}

#[mlir::op("x86.avx512.mask.rndscale", format = "$src `,` $k `,` $a `,` $imm `,` $rounding attr-dict `:` type($dst)", results(dst))]
pub struct MaskRndScaleOp<'a> {
    #[slot(dst)]
    pub src: Value<'a>,
    #[slot(k_ty)]
    pub k: Value<'a>,
    #[slot(dst)]
    pub a: Value<'a>,
    #[slot(imm_ty)]
    pub imm: Value<'a>,
    #[slot(rounding_ty)]
    pub rounding: Value<'a>,
    #[dtype(is = i32)]
    pub k_ty: Type<'a>,
    #[dtype(width = dst)]
    pub imm_ty: Type<'a>,
    #[dtype(is = i32)]
    pub rounding_ty: Type<'a>,
    pub dst: Type<'a>,
}

#[mlir::op("x86.avx512.mask.scalef", format = "$src `,` $a `,` $b `,` $k `,` $rounding attr-dict `:` type($dst)", results(dst))]
pub struct MaskScaleFOp<'a> {
    #[slot(dst)]
    pub src: Value<'a>,
    #[slot(dst)]
    pub a: Value<'a>,
    #[slot(dst)]
    pub b: Value<'a>,
    #[slot(k_ty)]
    pub k: Value<'a>,
    #[slot(rounding_ty)]
    pub rounding: Value<'a>,
    #[dtype(width = dst)]
    pub k_ty: Type<'a>,
    #[dtype(is = i32)]
    pub rounding_ty: Type<'a>,
    pub dst: Type<'a>,
}

#[mlir::op("x86.avx.rsqrt", format = "$a attr-dict `:` type($a)", results(b))]
pub struct RsqrtOp<'a> {
    #[slot(b)]
    pub a: Value<'a>,
    pub b: Type<'a>,
}

#[mlir::op("x86.amx.tile_load", format = "$base `[` $indices `]` (`,` $stride^ )? attr-dict`:` type($base) `into` qualified(type($res))", results(res))]
pub struct TileLoadOp<'a> {
    #[slot(base_ty)]
    pub base: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    #[slot(stride_ty)]
    pub stride: Vec<Value<'a>>,
    pub base_ty: Type<'a>,
    #[dtype(is = index)]
    pub indices_ty: Type<'a>,
    #[dtype(is = index)]
    pub stride_ty: Type<'a>,
    #[dtype(strip = "x86.amx.tile")]
    pub res: Type<'a>,
}

#[mlir::op("x86.amx.tile_mulf", format = "$lhs `,` $rhs `,` $acc attr-dict `:` qualified(type($lhs)) `,` qualified(type($rhs)) `,` qualified(type($acc))", results(res))]
pub struct TileMulFOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[slot(res)]
    pub acc: Value<'a>,
    #[dtype(strip = "x86.amx.tile")]
    pub lhs_ty: Type<'a>,
    #[dtype(strip = "x86.amx.tile")]
    pub rhs_ty: Type<'a>,
    #[dtype(strip = "x86.amx.tile")]
    pub res: Type<'a>,
}

#[mlir::op("x86.amx.tile_muli", format = "$lhs (`zext` $isZextLhs^)? `,` $rhs (`zext` $isZextRhs^)? `,` $acc attr-dict `:` qualified(type($lhs)) `,` qualified(type($rhs)) `,` qualified(type($acc))", results(res))]
pub struct TileMulIOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[slot(res)]
    pub acc: Value<'a>,
    #[attr(name = "isZextLhs")]
    pub is_zext_lhs: bool,
    #[attr(name = "isZextRhs")]
    pub is_zext_rhs: bool,
    #[dtype(strip = "x86.amx.tile")]
    pub lhs_ty: Type<'a>,
    #[dtype(strip = "x86.amx.tile")]
    pub rhs_ty: Type<'a>,
    #[dtype(strip = "x86.amx.tile")]
    pub res: Type<'a>,
}

#[mlir::op("x86.amx.tile_store", format = "$base `[` $indices `]` `,` $val (`,` $stride^ )?attr-dict `:` type($base) `,` qualified(type($val))")]
pub struct TileStoreOp<'a> {
    #[slot(base_ty)]
    pub base: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Vec<Value<'a>>,
    #[slot(val_ty)]
    pub val: Value<'a>,
    #[slot(stride_ty)]
    pub stride: Vec<Value<'a>>,
    pub base_ty: Type<'a>,
    #[dtype(is = index)]
    pub indices_ty: Type<'a>,
    #[dtype(strip = "x86.amx.tile")]
    pub val_ty: Type<'a>,
    #[dtype(is = index)]
    pub stride_ty: Type<'a>,
}

#[mlir::op("x86.amx.tile_zero", format = "attr-dict `:` qualified(type($res))", results(res))]
pub struct TileZeroOp<'a> {
    #[dtype(strip = "x86.amx.tile")]
    pub res: Type<'a>,
}

#[mlir::op("x86.avx512.vp2intersect", format = "$a `,` $b attr-dict `:` type($a)", results(k1, k2))]
pub struct Vp2IntersectOp<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(a_ty)]
    pub b: Value<'a>,
    pub a_ty: Type<'a>,
    #[dtype(i1 = a_ty)]
    pub k1: Type<'a>,
    #[dtype(i1 = a_ty)]
    pub k2: Type<'a>,
}

#[mlir::dialect(
    "x86",
    ops = [AVX10DotInt8Op, BcstToPackedF32Op, CvtPackedEvenIndexedToF32Op, CvtPackedF32ToBF16Op, CvtPackedOddIndexedToF32Op, DotBF16Op, DotInt8Op, DotOp, MaskCompressOp, MaskRndScaleOp, MaskScaleFOp, RsqrtOp, TileLoadOp, TileMulFOp, TileMulIOp, TileStoreOp, TileZeroOp, Vp2IntersectOp]
)]
pub struct X86Dialect;
