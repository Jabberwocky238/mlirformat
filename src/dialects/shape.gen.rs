#![allow(non_camel_case_types, unused_imports, clippy::all, rustdoc::all)]

use mlirformat::{mlir, Attribute, Region, Str, Type, Value, __Vec as Vec};

#[mlir::op("shape.add", format = "$lhs `,` $rhs attr-dict `:` type($lhs) `,` type($rhs) `->` type($result)", results(result))]
pub struct AddOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    pub lhs_ty: Type<'a>,
    pub rhs_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("shape.any", format = "$inputs attr-dict `:` type($inputs) `->` type($result)", results(result))]
pub struct AnyOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    pub inputs_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("shape.assuming_all", format = "$inputs attr-dict", results(result))]
pub struct AssumingAllOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[dtype(is = "!shape.witness")]
    pub inputs_ty: Type<'a>,
    #[dtype(is = "!shape.witness")]
    pub result: Type<'a>,
}

#[mlir::op("shape.assuming", results(results))]
pub struct AssumingOp<'a> {
    #[slot(witness_ty)]
    pub witness: Value<'a>,
    #[region(name = "doRegion")]
    pub do_region: Region<'a>,
    #[dtype(is = "!shape.witness")]
    pub witness_ty: Type<'a>,
    pub results: Vec<Type<'a>>,
}

#[mlir::op("shape.assuming_yield", format = "attr-dict ($operands^ `:` type($operands))?")]
pub struct AssumingYieldOp<'a> {
    #[slot(operands_ty)]
    pub operands: Vec<Value<'a>>,
    pub operands_ty: Vec<Type<'a>>,
}

#[mlir::op("shape.broadcast", format = "$shapes attr-dict `:` type($shapes) `->` type($result)", results(result))]
pub struct BroadcastOp<'a> {
    #[slot(shapes_ty)]
    pub shapes: Vec<Value<'a>>,
    pub error: Option<Attribute<'a>>,
    pub shapes_ty: Vec<Type<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("shape.concat", format = "$lhs `,` $rhs attr-dict `:` type($lhs) `,` type($rhs) `->` type($result)", results(result))]
pub struct ConcatOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    pub lhs_ty: Type<'a>,
    pub rhs_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("shape.const_shape", results(result))]
pub struct ConstShapeOp<'a> {
    pub shape: Attribute<'a>,
    pub result: Type<'a>,
}

#[mlir::op("shape.const_size", format = "$value attr-dict", results(result))]
pub struct ConstSizeOp<'a> {
    #[attr(int = "index")]
    pub value: Attribute<'a>,
    #[dtype(is = "!shape.size")]
    pub result: Type<'a>,
}

#[mlir::op("shape.const_witness", format = "$passing attr-dict", results(result))]
pub struct ConstWitnessOp<'a> {
    pub passing: Attribute<'a>,
    #[dtype(is = "!shape.witness")]
    pub result: Type<'a>,
}

#[mlir::op("shape.cstr_broadcastable", format = "$shapes attr-dict `:` type($shapes)", results(result))]
pub struct CstrBroadcastableOp<'a> {
    #[slot(shapes_ty)]
    pub shapes: Vec<Value<'a>>,
    pub shapes_ty: Vec<Type<'a>>,
    #[dtype(is = "!shape.witness")]
    pub result: Type<'a>,
}

#[mlir::op("shape.cstr_eq", format = "$shapes attr-dict `:` type($shapes)", results(result))]
pub struct CstrEqOp<'a> {
    #[slot(shapes_ty)]
    pub shapes: Vec<Value<'a>>,
    pub shapes_ty: Vec<Type<'a>>,
    #[dtype(is = "!shape.witness")]
    pub result: Type<'a>,
}

#[mlir::op("shape.cstr_require", format = "$pred `,` $msg attr-dict", results(result))]
pub struct CstrRequireOp<'a> {
    #[slot(pred_ty)]
    pub pred: Value<'a>,
    pub msg: Attribute<'a>,
    #[dtype(is = i1)]
    pub pred_ty: Type<'a>,
    #[dtype(is = "!shape.witness")]
    pub result: Type<'a>,
}

#[mlir::op("shape.debug_print", results(output))]
pub struct DebugPrintOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    pub input_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("shape.dim", format = "$value `,` $index attr-dict `:` type($value) `,`type($index) `->` type($extent)", results(extent))]
pub struct DimOp<'a> {
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    pub value_ty: Type<'a>,
    pub index_ty: Type<'a>,
    pub extent: Type<'a>,
}

#[mlir::op("shape.div", format = "$lhs `,` $rhs attr-dict `:` type($lhs) `,` type($rhs) `->` type($result)", results(result))]
pub struct DivOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    pub lhs_ty: Type<'a>,
    pub rhs_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("shape.from_extent_tensor", format = "$input attr-dict `:` type($input)", results(result))]
pub struct FromExtentTensorOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    pub input_ty: Type<'a>,
    #[dtype(is = "!shape.shape")]
    pub result: Type<'a>,
}

#[mlir::op("shape.from_extents", format = "$extents attr-dict `:` type($extents)", results(shape))]
pub struct FromExtentsOp<'a> {
    #[slot(extents_ty)]
    pub extents: Vec<Value<'a>>,
    pub extents_ty: Vec<Type<'a>>,
    #[dtype(is = "!shape.shape")]
    pub shape: Type<'a>,
}

#[mlir::op("shape.func")]
pub struct FuncOp<'a> {
    #[attr(symbol)]
    pub sym_name: Attribute<'a>,
    pub function_type: Attribute<'a>,
    pub arg_attrs: Option<Attribute<'a>>,
    pub res_attrs: Option<Attribute<'a>>,
    pub sym_visibility: Option<Attribute<'a>>,
    pub body: Region<'a>,
}

#[mlir::op("shape.function_library")]
pub struct FunctionLibraryOp<'a> {
    #[attr(symbol)]
    pub sym_name: Attribute<'a>,
    pub sym_visibility: Option<Attribute<'a>>,
    pub mapping: Attribute<'a>,
    pub body: Region<'a>,
}

#[mlir::op("shape.get_extent", format = "$shape `,` $dim attr-dict `:` type($shape) `,` type($dim) `->` type($extent)", results(extent))]
pub struct GetExtentOp<'a> {
    #[slot(shape_ty)]
    pub shape: Value<'a>,
    #[slot(dim_ty)]
    pub dim: Value<'a>,
    pub shape_ty: Type<'a>,
    pub dim_ty: Type<'a>,
    pub extent: Type<'a>,
}

#[mlir::op("shape.index_to_size", format = "$arg attr-dict", results(result))]
pub struct IndexToSizeOp<'a> {
    #[slot(arg_ty)]
    pub arg: Value<'a>,
    #[dtype(is = index)]
    pub arg_ty: Type<'a>,
    #[dtype(is = "!shape.size")]
    pub result: Type<'a>,
}

#[mlir::op("shape.is_broadcastable", format = "$shapes attr-dict `:` type($shapes)", results(result))]
pub struct IsBroadcastableOp<'a> {
    #[slot(shapes_ty)]
    pub shapes: Vec<Value<'a>>,
    pub shapes_ty: Vec<Type<'a>>,
    #[dtype(is = i1)]
    pub result: Type<'a>,
}

#[mlir::op("shape.max", format = "$lhs `,` $rhs attr-dict `:` type($lhs) `,` type($rhs) `->` type($result)", results(result))]
pub struct MaxOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    pub lhs_ty: Type<'a>,
    pub rhs_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("shape.meet", format = "$arg0 `,` $arg1 (`,` `error` `=` $error^)? attr-dict `:` type($arg0) `,` type($arg1) `->` type($result)", results(result))]
pub struct MeetOp<'a> {
    #[slot(arg0_ty)]
    pub arg0: Value<'a>,
    #[slot(arg1_ty)]
    pub arg1: Value<'a>,
    pub error: Option<Attribute<'a>>,
    pub arg0_ty: Type<'a>,
    pub arg1_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("shape.min", format = "$lhs `,` $rhs attr-dict `:` type($lhs) `,` type($rhs) `->` type($result)", results(result))]
pub struct MinOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    pub lhs_ty: Type<'a>,
    pub rhs_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("shape.mul", format = "$lhs `,` $rhs attr-dict `:` type($lhs) `,` type($rhs) `->` type($result)", results(result))]
pub struct MulOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    pub lhs_ty: Type<'a>,
    pub rhs_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("shape.num_elements", format = "$shape attr-dict `:` type($shape) `->` type($result)", results(result))]
pub struct NumElementsOp<'a> {
    #[slot(shape_ty)]
    pub shape: Value<'a>,
    pub shape_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("shape.rank", format = "$shape attr-dict `:` type($shape) `->` type($rank)", results(rank))]
pub struct RankOp<'a> {
    #[slot(shape_ty)]
    pub shape: Value<'a>,
    pub shape_ty: Type<'a>,
    pub rank: Type<'a>,
}

#[mlir::op("shape.reduce", results(result))]
pub struct ReduceOp<'a> {
    #[slot(shape_ty)]
    pub shape: Value<'a>,
    #[slot(init_vals_ty, name = "initVals")]
    pub init_vals: Vec<Value<'a>>,
    pub region: Region<'a>,
    pub shape_ty: Type<'a>,
    pub init_vals_ty: Vec<Type<'a>>,
    pub result: Vec<Type<'a>>,
}

#[mlir::op("shape.return", format = "attr-dict ($operands^ `:` type($operands))?")]
pub struct ReturnOp<'a> {
    #[slot(operands_ty)]
    pub operands: Vec<Value<'a>>,
    pub operands_ty: Vec<Type<'a>>,
}

#[mlir::op("shape.shape_eq", format = "$shapes attr-dict `:` type($shapes)", results(result))]
pub struct ShapeEqOp<'a> {
    #[slot(shapes_ty)]
    pub shapes: Vec<Value<'a>>,
    pub shapes_ty: Vec<Type<'a>>,
    #[dtype(is = i1)]
    pub result: Type<'a>,
}

#[mlir::op("shape.shape_of", format = "$arg attr-dict `:` type($arg) `->` type($result)", results(result))]
pub struct ShapeOfOp<'a> {
    #[slot(arg_ty)]
    pub arg: Value<'a>,
    pub arg_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("shape.size_to_index", format = "$arg attr-dict `:` type($arg)", results(result))]
pub struct SizeToIndexOp<'a> {
    #[slot(arg_ty)]
    pub arg: Value<'a>,
    pub arg_ty: Type<'a>,
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::op("shape.split_at", results(head, tail))]
pub struct SplitAtOp<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    #[slot(index_ty)]
    pub index: Value<'a>,
    pub operand_ty: Type<'a>,
    pub index_ty: Type<'a>,
    pub head: Type<'a>,
    pub tail: Type<'a>,
}

#[mlir::op("shape.to_extent_tensor", format = "$input attr-dict `:` type($input) `->` type($result)", results(result))]
pub struct ToExtentTensorOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    pub input_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("shape.value_as_shape", format = "$arg attr-dict `:` type($arg) `->` type($result)", results(result))]
pub struct ValueAsShapeOp<'a> {
    #[slot(arg_ty)]
    pub arg: Value<'a>,
    pub arg_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("shape.value_of", format = "$arg attr-dict `:` type($result)", results(result))]
pub struct ValueOfOp<'a> {
    #[slot(arg_ty)]
    pub arg: Value<'a>,
    #[dtype(is = "!shape.value_shape")]
    pub arg_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("shape.with_shape", format = "$operand `,` $shape attr-dict `:` type($operand) `,` type($shape)", results(result))]
pub struct WithOp<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    #[slot(shape_ty)]
    pub shape: Value<'a>,
    pub operand_ty: Type<'a>,
    pub shape_ty: Type<'a>,
    #[dtype(is = "!shape.value_shape")]
    pub result: Type<'a>,
}

#[mlir::op("shape.yield", format = "attr-dict ($operands^ `:` type($operands))?")]
pub struct YieldOp<'a> {
    #[slot(operands_ty)]
    pub operands: Vec<Value<'a>>,
    pub operands_ty: Vec<Type<'a>>,
}

#[mlir::dialect(
    "shape",
    ops = [AddOp, AnyOp, AssumingAllOp, AssumingOp, AssumingYieldOp, BroadcastOp, ConcatOp, ConstShapeOp, ConstSizeOp, ConstWitnessOp, CstrBroadcastableOp, CstrEqOp, CstrRequireOp, DebugPrintOp, DimOp, DivOp, FromExtentTensorOp, FromExtentsOp, FuncOp, FunctionLibraryOp, GetExtentOp, IndexToSizeOp, IsBroadcastableOp, MaxOp, MeetOp, MinOp, MulOp, NumElementsOp, RankOp, ReduceOp, ReturnOp, ShapeEqOp, ShapeOfOp, SizeToIndexOp, SplitAtOp, ToExtentTensorOp, ValueAsShapeOp, ValueOfOp, WithOp, YieldOp],
    dependents = ["arith", "tensor"],
    materializer
)]
pub struct ShapeDialect;
