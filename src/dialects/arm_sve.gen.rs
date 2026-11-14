#![allow(non_camel_case_types, unused_imports, clippy::all, rustdoc::all)]

use mlirformat::{mlir, Attribute, Region, Str, Type, Value, __Vec as Vec};

#[mlir::op("arm_sve.intr.bfmmla", format = "$acc `,` $src1 `,` $src2 attr-dict `:` type($src1) `to` type($res)", results(res))]
pub struct BfmmlaOp<'a> {
    #[slot(res)]
    pub acc: Value<'a>,
    #[slot(src1_ty)]
    pub src1: Value<'a>,
    #[slot(src1_ty)]
    pub src2: Value<'a>,
    pub src1_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("arm_sve.intr.convert.from.svbool", results(res))]
pub struct ConvertFromSvboolIntrOp<'a> {
    #[slot(svbool_ty)]
    pub svbool: Value<'a>,
    pub svbool_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("arm_sve.convert_from_svbool", format = "$source attr-dict `:` type($result)", results(result))]
pub struct ConvertFromSvboolOp<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    #[dtype(svbool = result)]
    pub source_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("arm_sve.intr.convert.to.svbool", results(res))]
pub struct ConvertToSvboolIntrOp<'a> {
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    pub mask_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("arm_sve.convert_to_svbool", format = "$source attr-dict `:` type($source)", results(result))]
pub struct ConvertToSvboolOp<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    pub source_ty: Type<'a>,
    #[dtype(svbool = source_ty)]
    pub result: Type<'a>,
}

#[mlir::op("arm_sve.intr.dupq_lane", results(res))]
pub struct DupQLaneIntrOp<'a> {
    #[slot(v_ty)]
    pub v: Value<'a>,
    #[attr(int = "i64")]
    pub lane: Attribute<'a>,
    pub v_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("arm_sve.dupq_lane", format = "$src `[` $lane `]` attr-dict `:` type($dst)", results(dst))]
pub struct DupQLaneOp<'a> {
    #[slot(dst)]
    pub src: Value<'a>,
    #[attr(int = "i64")]
    pub lane: Attribute<'a>,
    pub dst: Type<'a>,
}

#[mlir::op("arm_sve.intr.psel", results(res))]
pub struct PselIntrOp<'a> {
    #[slot(p1_ty)]
    pub p1: Value<'a>,
    #[slot(p2_ty)]
    pub p2: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    pub p1_ty: Type<'a>,
    pub p2_ty: Type<'a>,
    #[dtype(is = i32)]
    pub index_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("arm_sve.psel", format = "$p1 `,` $p2 `[` $index `]` attr-dict `:` type($p1) `,` type($p2)", results(result))]
pub struct PselOp<'a> {
    #[slot(result)]
    pub p1: Value<'a>,
    #[slot(p2_ty)]
    pub p2: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    pub p2_ty: Type<'a>,
    #[dtype(is = index)]
    pub index_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("arm_sve.intr.fadd", results(res))]
pub struct ScalableMaskedAddFIntrOp<'a> {
    #[slot(operand0_ty)]
    pub operand0: Value<'a>,
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand2_ty)]
    pub operand2: Value<'a>,
    pub operand0_ty: Type<'a>,
    pub operand1_ty: Type<'a>,
    pub operand2_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("arm_sve.masked.addf", format = "$mask `,` $src1 `,` $src2 attr-dict `:` type($mask) `,` type($res)", results(res))]
pub struct ScalableMaskedAddFOp<'a> {
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(res)]
    pub src1: Value<'a>,
    #[slot(res)]
    pub src2: Value<'a>,
    #[dtype(i1 = res)]
    pub mask_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("arm_sve.intr.add", results(res))]
pub struct ScalableMaskedAddIIntrOp<'a> {
    #[slot(operand0_ty)]
    pub operand0: Value<'a>,
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand2_ty)]
    pub operand2: Value<'a>,
    pub operand0_ty: Type<'a>,
    pub operand1_ty: Type<'a>,
    pub operand2_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("arm_sve.masked.addi", format = "$mask `,` $src1 `,` $src2 attr-dict `:` type($mask) `,` type($res)", results(res))]
pub struct ScalableMaskedAddIOp<'a> {
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(res)]
    pub src1: Value<'a>,
    #[slot(res)]
    pub src2: Value<'a>,
    #[dtype(i1 = res)]
    pub mask_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("arm_sve.intr.fdiv", results(res))]
pub struct ScalableMaskedDivFIntrOp<'a> {
    #[slot(operand0_ty)]
    pub operand0: Value<'a>,
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand2_ty)]
    pub operand2: Value<'a>,
    pub operand0_ty: Type<'a>,
    pub operand1_ty: Type<'a>,
    pub operand2_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("arm_sve.masked.divf", format = "$mask `,` $src1 `,` $src2 attr-dict `:` type($mask) `,` type($res)", results(res))]
pub struct ScalableMaskedDivFOp<'a> {
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(res)]
    pub src1: Value<'a>,
    #[slot(res)]
    pub src2: Value<'a>,
    #[dtype(i1 = res)]
    pub mask_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("arm_sve.intr.fmul", results(res))]
pub struct ScalableMaskedMulFIntrOp<'a> {
    #[slot(operand0_ty)]
    pub operand0: Value<'a>,
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand2_ty)]
    pub operand2: Value<'a>,
    pub operand0_ty: Type<'a>,
    pub operand1_ty: Type<'a>,
    pub operand2_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("arm_sve.masked.mulf", format = "$mask `,` $src1 `,` $src2 attr-dict `:` type($mask) `,` type($res)", results(res))]
pub struct ScalableMaskedMulFOp<'a> {
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(res)]
    pub src1: Value<'a>,
    #[slot(res)]
    pub src2: Value<'a>,
    #[dtype(i1 = res)]
    pub mask_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("arm_sve.intr.mul", results(res))]
pub struct ScalableMaskedMulIIntrOp<'a> {
    #[slot(operand0_ty)]
    pub operand0: Value<'a>,
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand2_ty)]
    pub operand2: Value<'a>,
    pub operand0_ty: Type<'a>,
    pub operand1_ty: Type<'a>,
    pub operand2_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("arm_sve.masked.muli", format = "$mask `,` $src1 `,` $src2 attr-dict `:` type($mask) `,` type($res)", results(res))]
pub struct ScalableMaskedMulIOp<'a> {
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(res)]
    pub src1: Value<'a>,
    #[slot(res)]
    pub src2: Value<'a>,
    #[dtype(i1 = res)]
    pub mask_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("arm_sve.intr.sdiv", results(res))]
pub struct ScalableMaskedSDivIIntrOp<'a> {
    #[slot(operand0_ty)]
    pub operand0: Value<'a>,
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand2_ty)]
    pub operand2: Value<'a>,
    pub operand0_ty: Type<'a>,
    pub operand1_ty: Type<'a>,
    pub operand2_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("arm_sve.masked.divi_signed", format = "$mask `,` $src1 `,` $src2 attr-dict `:` type($mask) `,` type($res)", results(res))]
pub struct ScalableMaskedSDivIOp<'a> {
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(res)]
    pub src1: Value<'a>,
    #[slot(res)]
    pub src2: Value<'a>,
    #[dtype(i1 = res)]
    pub mask_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("arm_sve.intr.fsub", results(res))]
pub struct ScalableMaskedSubFIntrOp<'a> {
    #[slot(operand0_ty)]
    pub operand0: Value<'a>,
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand2_ty)]
    pub operand2: Value<'a>,
    pub operand0_ty: Type<'a>,
    pub operand1_ty: Type<'a>,
    pub operand2_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("arm_sve.masked.subf", format = "$mask `,` $src1 `,` $src2 attr-dict `:` type($mask) `,` type($res)", results(res))]
pub struct ScalableMaskedSubFOp<'a> {
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(res)]
    pub src1: Value<'a>,
    #[slot(res)]
    pub src2: Value<'a>,
    #[dtype(i1 = res)]
    pub mask_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("arm_sve.intr.sub", results(res))]
pub struct ScalableMaskedSubIIntrOp<'a> {
    #[slot(operand0_ty)]
    pub operand0: Value<'a>,
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand2_ty)]
    pub operand2: Value<'a>,
    pub operand0_ty: Type<'a>,
    pub operand1_ty: Type<'a>,
    pub operand2_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("arm_sve.masked.subi", format = "$mask `,` $src1 `,` $src2 attr-dict `:` type($mask) `,` type($res)", results(res))]
pub struct ScalableMaskedSubIOp<'a> {
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(res)]
    pub src1: Value<'a>,
    #[slot(res)]
    pub src2: Value<'a>,
    #[dtype(i1 = res)]
    pub mask_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("arm_sve.intr.udiv", results(res))]
pub struct ScalableMaskedUDivIIntrOp<'a> {
    #[slot(operand0_ty)]
    pub operand0: Value<'a>,
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand2_ty)]
    pub operand2: Value<'a>,
    pub operand0_ty: Type<'a>,
    pub operand1_ty: Type<'a>,
    pub operand2_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("arm_sve.masked.divi_unsigned", format = "$mask `,` $src1 `,` $src2 attr-dict `:` type($mask) `,` type($res)", results(res))]
pub struct ScalableMaskedUDivIOp<'a> {
    #[slot(mask_ty)]
    pub mask: Value<'a>,
    #[slot(res)]
    pub src1: Value<'a>,
    #[slot(res)]
    pub src2: Value<'a>,
    #[dtype(i1 = res)]
    pub mask_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("arm_sve.intr.sdot", results(res))]
pub struct SdotIntrOp<'a> {
    #[slot(operand0_ty)]
    pub operand0: Value<'a>,
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand2_ty)]
    pub operand2: Value<'a>,
    pub operand0_ty: Type<'a>,
    pub operand1_ty: Type<'a>,
    pub operand2_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("arm_sve.sdot", format = "$acc `,` $src1 `,` $src2 attr-dict `:` type($src1) `to` type($dst)", results(dst))]
pub struct SdotOp<'a> {
    #[slot(dst)]
    pub acc: Value<'a>,
    #[slot(src1_ty)]
    pub src1: Value<'a>,
    #[slot(src1_ty)]
    pub src2: Value<'a>,
    pub src1_ty: Type<'a>,
    pub dst: Type<'a>,
}

#[mlir::op("arm_sve.intr.smmla", results(res))]
pub struct SmmlaIntrOp<'a> {
    #[slot(operand0_ty)]
    pub operand0: Value<'a>,
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand2_ty)]
    pub operand2: Value<'a>,
    pub operand0_ty: Type<'a>,
    pub operand1_ty: Type<'a>,
    pub operand2_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("arm_sve.smmla", format = "$acc `,` $src1 `,` $src2 attr-dict `:` type($src1) `to` type($dst)", results(dst))]
pub struct SmmlaOp<'a> {
    #[slot(dst)]
    pub acc: Value<'a>,
    #[slot(src1_ty)]
    pub src1: Value<'a>,
    #[slot(src1_ty)]
    pub src2: Value<'a>,
    pub src1_ty: Type<'a>,
    pub dst: Type<'a>,
}

#[mlir::op("arm_sve.intr.udot", results(res))]
pub struct UdotIntrOp<'a> {
    #[slot(operand0_ty)]
    pub operand0: Value<'a>,
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand2_ty)]
    pub operand2: Value<'a>,
    pub operand0_ty: Type<'a>,
    pub operand1_ty: Type<'a>,
    pub operand2_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("arm_sve.udot", format = "$acc `,` $src1 `,` $src2 attr-dict `:` type($src1) `to` type($dst)", results(dst))]
pub struct UdotOp<'a> {
    #[slot(dst)]
    pub acc: Value<'a>,
    #[slot(src1_ty)]
    pub src1: Value<'a>,
    #[slot(src1_ty)]
    pub src2: Value<'a>,
    pub src1_ty: Type<'a>,
    pub dst: Type<'a>,
}

#[mlir::op("arm_sve.intr.ummla", results(res))]
pub struct UmmlaIntrOp<'a> {
    #[slot(operand0_ty)]
    pub operand0: Value<'a>,
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand2_ty)]
    pub operand2: Value<'a>,
    pub operand0_ty: Type<'a>,
    pub operand1_ty: Type<'a>,
    pub operand2_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("arm_sve.ummla", format = "$acc `,` $src1 `,` $src2 attr-dict `:` type($src1) `to` type($dst)", results(dst))]
pub struct UmmlaOp<'a> {
    #[slot(dst)]
    pub acc: Value<'a>,
    #[slot(src1_ty)]
    pub src1: Value<'a>,
    #[slot(src1_ty)]
    pub src2: Value<'a>,
    pub src1_ty: Type<'a>,
    pub dst: Type<'a>,
}

#[mlir::op("arm_sve.intr.usmmla", results(res))]
pub struct UsmmlaIntrOp<'a> {
    #[slot(operand0_ty)]
    pub operand0: Value<'a>,
    #[slot(operand1_ty)]
    pub operand1: Value<'a>,
    #[slot(operand2_ty)]
    pub operand2: Value<'a>,
    pub operand0_ty: Type<'a>,
    pub operand1_ty: Type<'a>,
    pub operand2_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("arm_sve.usmmla", format = "$acc `,` $src1 `,` $src2 attr-dict `:` type($src1) `to` type($dst)", results(dst))]
pub struct UsmmlaOp<'a> {
    #[slot(dst)]
    pub acc: Value<'a>,
    #[slot(src1_ty)]
    pub src1: Value<'a>,
    #[slot(src1_ty)]
    pub src2: Value<'a>,
    pub src1_ty: Type<'a>,
    pub dst: Type<'a>,
}

#[mlir::op("arm_sve.intr.whilelt", results(res))]
pub struct WhileLTIntrOp<'a> {
    #[slot(base_ty)]
    pub base: Value<'a>,
    #[slot(n_ty)]
    pub n: Value<'a>,
    #[dtype(is = i64)]
    pub base_ty: Type<'a>,
    #[dtype(is = i64)]
    pub n_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("arm_sve.intr.zip.x2", results(res))]
pub struct ZipX2IntrOp<'a> {
    #[slot(v1_ty)]
    pub v1: Value<'a>,
    #[slot(v2_ty)]
    pub v2: Value<'a>,
    pub v1_ty: Type<'a>,
    pub v2_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("arm_sve.zip.x2", format = "$sourceV1 `,` $sourceV2 attr-dict `:` type($sourceV1)", results(result_v1, result_v2))]
pub struct ZipX2Op<'a> {
    #[slot(result_v1, name = "sourceV1")]
    pub source_v1: Value<'a>,
    #[slot(result_v1, name = "sourceV2")]
    pub source_v2: Value<'a>,
    pub result_v1: Type<'a>,
    #[dtype(eq = result_v1)]
    pub result_v2: Type<'a>,
}

#[mlir::op("arm_sve.intr.zip.x4", results(res))]
pub struct ZipX4IntrOp<'a> {
    #[slot(v1_ty)]
    pub v1: Value<'a>,
    #[slot(v2_ty)]
    pub v2: Value<'a>,
    #[slot(v3_ty)]
    pub v3: Value<'a>,
    #[slot(v4_ty)]
    pub v4: Value<'a>,
    pub v1_ty: Type<'a>,
    pub v2_ty: Type<'a>,
    pub v3_ty: Type<'a>,
    pub v4_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("arm_sve.zip.x4", format = "$sourceV1 `,` $sourceV2 `,` $sourceV3 `,` $sourceV4 attr-dict `:` type($sourceV1)", results(result_v1, result_v2, result_v3, result_v4))]
pub struct ZipX4Op<'a> {
    #[slot(result_v1, name = "sourceV1")]
    pub source_v1: Value<'a>,
    #[slot(result_v1, name = "sourceV2")]
    pub source_v2: Value<'a>,
    #[slot(result_v1, name = "sourceV3")]
    pub source_v3: Value<'a>,
    #[slot(result_v1, name = "sourceV4")]
    pub source_v4: Value<'a>,
    pub result_v1: Type<'a>,
    #[dtype(eq = result_v1)]
    pub result_v2: Type<'a>,
    #[dtype(eq = result_v1)]
    pub result_v3: Type<'a>,
    #[dtype(eq = result_v1)]
    pub result_v4: Type<'a>,
}

#[mlir::dialect(
    "arm_sve",
    ops = [BfmmlaOp, ConvertFromSvboolIntrOp, ConvertFromSvboolOp, ConvertToSvboolIntrOp, ConvertToSvboolOp, DupQLaneIntrOp, DupQLaneOp, PselIntrOp, PselOp, ScalableMaskedAddFIntrOp, ScalableMaskedAddFOp, ScalableMaskedAddIIntrOp, ScalableMaskedAddIOp, ScalableMaskedDivFIntrOp, ScalableMaskedDivFOp, ScalableMaskedMulFIntrOp, ScalableMaskedMulFOp, ScalableMaskedMulIIntrOp, ScalableMaskedMulIOp, ScalableMaskedSDivIIntrOp, ScalableMaskedSDivIOp, ScalableMaskedSubFIntrOp, ScalableMaskedSubFOp, ScalableMaskedSubIIntrOp, ScalableMaskedSubIOp, ScalableMaskedUDivIIntrOp, ScalableMaskedUDivIOp, SdotIntrOp, SdotOp, SmmlaIntrOp, SmmlaOp, UdotIntrOp, UdotOp, UmmlaIntrOp, UmmlaOp, UsmmlaIntrOp, UsmmlaOp, WhileLTIntrOp, ZipX2IntrOp, ZipX2Op, ZipX4IntrOp, ZipX4Op],
    dependents = ["vector"]
)]
pub struct ArmSveDialect;
