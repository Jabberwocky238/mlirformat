#![allow(non_camel_case_types, unused_imports, clippy::all, rustdoc::all)]

use mlirformat::{mlir, Attribute, Region, Str, Type, Value, __Vec as Vec};

#[mlir::op("tosa.abs", format = "$input1 attr-dict `:` functional-type($input1, $output)", results(output))]
pub struct AbsOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    pub input1_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.add", format = "$input1 `,` $input2 attr-dict `:` functional-type($input1 $input2, $output)", results(output))]
pub struct AddOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    pub input1_ty: Type<'a>,
    pub input2_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.add_shape", format = "$input1 `,` $input2 attr-dict `:` functional-type($input1 $input2, $output)", results(output))]
pub struct AddShapeOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    #[dtype(strip = "tosa.shape")]
    pub input1_ty: Type<'a>,
    #[dtype(strip = "tosa.shape")]
    pub input2_ty: Type<'a>,
    #[dtype(strip = "tosa.shape")]
    pub output: Type<'a>,
}

#[mlir::op("tosa.apply_scale", results(output))]
pub struct ApplyScaleOp<'a> {
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[slot(multiplier_ty)]
    pub multiplier: Value<'a>,
    #[slot(shift_ty)]
    pub shift: Value<'a>,
    #[attr(dialect = "tosa.rounding_mode")]
    pub rounding_mode: Attribute<'a>,
    pub value_ty: Type<'a>,
    pub multiplier_ty: Type<'a>,
    pub shift_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.argmax", results(output))]
pub struct ArgMaxOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    #[attr(int = "i32")]
    pub axis: Attribute<'a>,
    #[attr(dialect = "tosa.nan_mode", default = "<PROPAGATE>")]
    pub nan_mode: Option<Attribute<'a>>,
    pub input_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.arithmetic_right_shift", format = "$input1 `,` $input2 attr-dict `:` functional-type($input1 $input2, $output)", results(output))]
pub struct ArithmeticRightShiftOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    pub round: Attribute<'a>,
    pub input1_ty: Type<'a>,
    pub input2_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.assert_equal_shape")]
pub struct AssertEqualShapeOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    pub allow_broadcast: Attribute<'a>,
    #[dtype(strip = "tosa.shape")]
    pub input1_ty: Type<'a>,
    #[dtype(strip = "tosa.shape")]
    pub input2_ty: Type<'a>,
}

#[mlir::op("tosa.avg_pool2d_adaptive", format = "$input `,` $input_zp `,` $output_zp `,` $kernel `,` $stride `,` $pad attr-dict `:` functional-type($input $input_zp $output_zp $kernel $stride $pad, $output)", results(output))]
pub struct AvgPool2dAdaptiveOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    #[slot(input_zp_ty)]
    pub input_zp: Value<'a>,
    #[slot(output_zp_ty)]
    pub output_zp: Value<'a>,
    #[slot(kernel_ty)]
    pub kernel: Value<'a>,
    #[slot(stride_ty)]
    pub stride: Value<'a>,
    #[slot(pad_ty)]
    pub pad: Value<'a>,
    pub acc_type: Attribute<'a>,
    pub input_ty: Type<'a>,
    pub input_zp_ty: Type<'a>,
    pub output_zp_ty: Type<'a>,
    pub kernel_ty: Type<'a>,
    pub stride_ty: Type<'a>,
    pub pad_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.avg_pool2d", format = "$input `,` $input_zp `,` $output_zp attr-dict `:` functional-type($input $input_zp $output_zp, $output)", results(output))]
pub struct AvgPool2dOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    #[slot(input_zp_ty)]
    pub input_zp: Value<'a>,
    #[slot(output_zp_ty)]
    pub output_zp: Value<'a>,
    #[attr(dense = "i64")]
    pub kernel: Attribute<'a>,
    #[attr(dense = "i64")]
    pub stride: Attribute<'a>,
    #[attr(dense = "i64")]
    pub pad: Attribute<'a>,
    pub acc_type: Attribute<'a>,
    pub input_ty: Type<'a>,
    pub input_zp_ty: Type<'a>,
    pub output_zp_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.bitwise_and", format = "$input1 `,` $input2 attr-dict `:` functional-type($input1 $input2, $output)", results(output))]
pub struct BitwiseAndOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    pub input1_ty: Type<'a>,
    pub input2_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.bitwise_not", format = "$input1 attr-dict `:` functional-type($input1, $output)", results(output))]
pub struct BitwiseNotOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    pub input1_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.bitwise_or", format = "$input1 `,` $input2 attr-dict `:` functional-type($input1 $input2, $output)", results(output))]
pub struct BitwiseOrOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    pub input1_ty: Type<'a>,
    pub input2_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.bitwise_xor", format = "$input1 `,` $input2 attr-dict `:` functional-type($input1 $input2, $output)", results(output))]
pub struct BitwiseXorOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    pub input1_ty: Type<'a>,
    pub input2_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.cast_from_block_scaled", results(output_data))]
pub struct CastFromBlockScaledOp<'a> {
    #[slot(input_data_ty)]
    pub input_data: Value<'a>,
    #[slot(input_scale_ty)]
    pub input_scale: Value<'a>,
    #[attr(dialect = "tosa.block_size")]
    pub block_size: Attribute<'a>,
    pub input_data_ty: Type<'a>,
    pub input_scale_ty: Type<'a>,
    pub output_data: Type<'a>,
}

#[mlir::op("tosa.cast", format = "$input attr-dict `:` functional-type($input, $output)", results(output))]
pub struct CastOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    pub input_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.cast_to_block_scaled", results(output_data, output_scale))]
pub struct CastToBlockScaledOp<'a> {
    #[slot(input_data_ty)]
    pub input_data: Value<'a>,
    #[attr(dialect = "tosa.block_size")]
    pub block_size: Attribute<'a>,
    pub input_data_ty: Type<'a>,
    pub output_data: Type<'a>,
    pub output_scale: Type<'a>,
}

#[mlir::op("tosa.ceil", format = "$input1 attr-dict `:` functional-type($input1, $output)", results(output))]
pub struct CeilOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    pub input1_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.clamp", results(output))]
pub struct ClampOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    pub min_val: Attribute<'a>,
    pub max_val: Attribute<'a>,
    #[attr(dialect = "tosa.nan_mode", default = "<PROPAGATE>")]
    pub nan_mode: Option<Attribute<'a>>,
    pub input_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.clz", format = "$input1 attr-dict `:` functional-type($input1, $output)", results(output))]
pub struct ClzOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    pub input1_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.concat", format = "$input1 attr-dict `:` functional-type($input1, $output)", results(output))]
pub struct ConcatOp<'a> {
    #[slot(input1_ty)]
    pub input1: Vec<Value<'a>>,
    #[attr(int = "i32")]
    pub axis: Attribute<'a>,
    pub input1_ty: Vec<Type<'a>>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.concat_shape", format = "$input attr-dict `:` functional-type($input, $output)", results(output))]
pub struct ConcatShapeOp<'a> {
    #[slot(input_ty)]
    pub input: Vec<Value<'a>>,
    #[dtype(strip = "tosa.shape")]
    pub input_ty: Vec<Type<'a>>,
    #[dtype(strip = "tosa.shape")]
    pub output: Type<'a>,
}

#[mlir::op("tosa.const", results(output))]
pub struct ConstOp<'a> {
    pub values: Attribute<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.const_shape", results(output))]
pub struct ConstShapeOp<'a> {
    pub values: Attribute<'a>,
    #[dtype(strip = "tosa.shape")]
    pub output: Type<'a>,
}

#[mlir::op("tosa.conv2d_block_scaled", results(output))]
pub struct Conv2DBlockScaledOp<'a> {
    #[slot(input_data_ty)]
    pub input_data: Value<'a>,
    #[slot(input_scale_ty)]
    pub input_scale: Value<'a>,
    #[slot(weight_data_ty)]
    pub weight_data: Value<'a>,
    #[slot(weight_scale_ty)]
    pub weight_scale: Value<'a>,
    #[slot(bias_ty)]
    pub bias: Value<'a>,
    #[slot(pad_ty)]
    pub pad: Value<'a>,
    #[slot(stride_ty)]
    pub stride: Value<'a>,
    #[slot(dilation_ty)]
    pub dilation: Value<'a>,
    #[attr(dialect = "tosa.block_size")]
    pub block_size: Attribute<'a>,
    pub input_data_ty: Type<'a>,
    pub input_scale_ty: Type<'a>,
    pub weight_data_ty: Type<'a>,
    pub weight_scale_ty: Type<'a>,
    pub bias_ty: Type<'a>,
    pub pad_ty: Type<'a>,
    pub stride_ty: Type<'a>,
    pub dilation_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.conv2d", format = "$input `,` $weight `,` $bias `,` $input_zp `,` $weight_zp attr-dict `:` functional-type($input $weight $bias $input_zp $weight_zp, $output)", results(output))]
pub struct Conv2DOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    #[slot(weight_ty)]
    pub weight: Value<'a>,
    #[slot(bias_ty)]
    pub bias: Value<'a>,
    #[slot(input_zp_ty)]
    pub input_zp: Value<'a>,
    #[slot(weight_zp_ty)]
    pub weight_zp: Value<'a>,
    #[attr(dense = "i64")]
    pub pad: Attribute<'a>,
    #[attr(dense = "i64")]
    pub stride: Attribute<'a>,
    #[attr(dense = "i64")]
    pub dilation: Attribute<'a>,
    pub acc_type: Attribute<'a>,
    #[attr(default = "false", optional)]
    pub local_bound: Option<Attribute<'a>>,
    pub input_ty: Type<'a>,
    pub weight_ty: Type<'a>,
    pub bias_ty: Type<'a>,
    pub input_zp_ty: Type<'a>,
    pub weight_zp_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.conv3d", format = "$input `,` $weight `,` $bias `,` $input_zp `,` $weight_zp attr-dict `:` functional-type($input $weight $bias $input_zp $weight_zp, $output)", results(output))]
pub struct Conv3DOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    #[slot(weight_ty)]
    pub weight: Value<'a>,
    #[slot(bias_ty)]
    pub bias: Value<'a>,
    #[slot(input_zp_ty)]
    pub input_zp: Value<'a>,
    #[slot(weight_zp_ty)]
    pub weight_zp: Value<'a>,
    #[attr(dense = "i64")]
    pub pad: Attribute<'a>,
    #[attr(dense = "i64")]
    pub stride: Attribute<'a>,
    #[attr(dense = "i64")]
    pub dilation: Attribute<'a>,
    pub acc_type: Attribute<'a>,
    #[attr(default = "false", optional)]
    pub local_bound: Option<Attribute<'a>>,
    pub input_ty: Type<'a>,
    pub weight_ty: Type<'a>,
    pub bias_ty: Type<'a>,
    pub input_zp_ty: Type<'a>,
    pub weight_zp_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.cos", format = "$input1 attr-dict `:` functional-type($input1, $output)", results(output))]
pub struct CosOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    pub input1_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.custom", format = "$input_list attr-dict `:` functional-type($input_list, $output_list)", results(output_list))]
pub struct CustomOp<'a> {
    #[slot(input_list_ty)]
    pub input_list: Vec<Value<'a>>,
    pub operator_name: Attribute<'a>,
    pub domain_name: Attribute<'a>,
    pub implementation_attrs: Attribute<'a>,
    pub input_list_ty: Vec<Type<'a>>,
    pub output_list: Vec<Type<'a>>,
}

#[mlir::op("tosa.depthwise_conv2d", format = "$input `,` $weight `,` $bias `,` $input_zp `,` $weight_zp attr-dict `:` functional-type($input $weight $bias $input_zp $weight_zp, $output)", results(output))]
pub struct DepthwiseConv2DOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    #[slot(weight_ty)]
    pub weight: Value<'a>,
    #[slot(bias_ty)]
    pub bias: Value<'a>,
    #[slot(input_zp_ty)]
    pub input_zp: Value<'a>,
    #[slot(weight_zp_ty)]
    pub weight_zp: Value<'a>,
    #[attr(dense = "i64")]
    pub pad: Attribute<'a>,
    #[attr(dense = "i64")]
    pub stride: Attribute<'a>,
    #[attr(dense = "i64")]
    pub dilation: Attribute<'a>,
    pub acc_type: Attribute<'a>,
    #[attr(default = "false", optional)]
    pub local_bound: Option<Attribute<'a>>,
    pub input_ty: Type<'a>,
    pub weight_ty: Type<'a>,
    pub bias_ty: Type<'a>,
    pub input_zp_ty: Type<'a>,
    pub weight_zp_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.dim", format = "$input1 attr-dict `:` functional-type($input1, $output)", results(output))]
pub struct DimOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[attr(int = "i32")]
    pub axis: Attribute<'a>,
    pub input1_ty: Type<'a>,
    #[dtype(strip = "tosa.shape")]
    pub output: Type<'a>,
}

#[mlir::op("tosa.div_ceil_shape", format = "$input1 `,` $input2 attr-dict `:` functional-type($input1 $input2, $output)", results(output))]
pub struct DivCeilShapeOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    #[dtype(strip = "tosa.shape")]
    pub input1_ty: Type<'a>,
    #[dtype(strip = "tosa.shape")]
    pub input2_ty: Type<'a>,
    #[dtype(strip = "tosa.shape")]
    pub output: Type<'a>,
}

#[mlir::op("tosa.div_floor_shape", format = "$input1 `,` $input2 attr-dict `:` functional-type($input1 $input2, $output)", results(output))]
pub struct DivFloorShapeOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    #[dtype(strip = "tosa.shape")]
    pub input1_ty: Type<'a>,
    #[dtype(strip = "tosa.shape")]
    pub input2_ty: Type<'a>,
    #[dtype(strip = "tosa.shape")]
    pub output: Type<'a>,
}

#[mlir::op("tosa.equal", format = "$input1 `,` $input2 attr-dict `:` functional-type($input1 $input2, $output)", results(output))]
pub struct EqualOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    pub input1_ty: Type<'a>,
    pub input2_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.erf", format = "$input attr-dict `:` functional-type($input, $output)", results(output))]
pub struct ErfOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    pub input_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.exp2_shape", format = "$input attr-dict `:` functional-type($input, $output)", results(output))]
pub struct Exp2ShapeOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    #[dtype(strip = "tosa.shape")]
    pub input_ty: Type<'a>,
    #[dtype(strip = "tosa.shape")]
    pub output: Type<'a>,
}

#[mlir::op("tosa.exp", format = "$input1 attr-dict `:` functional-type($input1, $output)", results(output))]
pub struct ExpOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    pub input1_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.fft2d", format = "$input_real `,` $input_imag attr-dict `:` functional-type($input_real $input_imag, $output_real $output_imag)", results(output_real, output_imag))]
pub struct FFT2dOp<'a> {
    #[slot(input_real_ty)]
    pub input_real: Value<'a>,
    #[slot(input_imag_ty)]
    pub input_imag: Value<'a>,
    pub inverse: Attribute<'a>,
    #[attr(default = "false", optional)]
    pub local_bound: Option<Attribute<'a>>,
    pub input_real_ty: Type<'a>,
    pub input_imag_ty: Type<'a>,
    pub output_real: Type<'a>,
    pub output_imag: Type<'a>,
}

#[mlir::op("tosa.floor", format = "$input1 attr-dict `:` functional-type($input1, $output)", results(output))]
pub struct FloorOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    pub input1_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.gather", format = "$values `,` $indices attr-dict `:` functional-type($values $indices, $output)", results(output))]
pub struct GatherOp<'a> {
    #[slot(values_ty)]
    pub values: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Value<'a>,
    pub values_ty: Type<'a>,
    pub indices_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.greater_equal", format = "$input1 `,` $input2 attr-dict `:` functional-type($input1 $input2, $output)", results(output))]
pub struct GreaterEqualOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    pub input1_ty: Type<'a>,
    pub input2_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.greater", format = "$input1 `,` $input2 attr-dict `:` functional-type($input1 $input2, $output)", results(output))]
pub struct GreaterOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    pub input1_ty: Type<'a>,
    pub input2_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.identity", format = "$input1 attr-dict `:` functional-type($input1, $output)", results(output))]
pub struct IdentityOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    pub input1_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.cond_if", results(output_list))]
pub struct IfOp<'a> {
    #[slot(condition_ty)]
    pub condition: Value<'a>,
    #[slot(input_list_ty)]
    pub input_list: Vec<Value<'a>>,
    pub then_graph: Region<'a>,
    pub else_graph: Region<'a>,
    pub condition_ty: Type<'a>,
    pub input_list_ty: Vec<Type<'a>>,
    pub output_list: Vec<Type<'a>>,
}

#[mlir::op("tosa.intdiv", format = "$input1 `,` $input2 attr-dict `:` functional-type($input1 $input2, $output)", results(output))]
pub struct IntDivOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    pub input1_ty: Type<'a>,
    pub input2_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.log2_ceil_shape", format = "$input attr-dict `:` functional-type($input, $output)", results(output))]
pub struct Log2CeilShapeOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    #[dtype(strip = "tosa.shape")]
    pub input_ty: Type<'a>,
    #[dtype(strip = "tosa.shape")]
    pub output: Type<'a>,
}

#[mlir::op("tosa.log2_floor_shape", format = "$input attr-dict `:` functional-type($input, $output)", results(output))]
pub struct Log2FloorShapeOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    #[dtype(strip = "tosa.shape")]
    pub input_ty: Type<'a>,
    #[dtype(strip = "tosa.shape")]
    pub output: Type<'a>,
}

#[mlir::op("tosa.log", format = "$input1 attr-dict `:` functional-type($input1, $output)", results(output))]
pub struct LogOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    pub input1_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.logical_and", format = "$input1 `,` $input2 attr-dict `:` functional-type($input1 $input2, $output)", results(output))]
pub struct LogicalAndOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    pub input1_ty: Type<'a>,
    pub input2_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.logical_left_shift", format = "$input1 `,` $input2 attr-dict `:` functional-type($input1 $input2, $output)", results(output))]
pub struct LogicalLeftShiftOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    pub input1_ty: Type<'a>,
    pub input2_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.logical_not", format = "$input1 attr-dict `:` functional-type($input1, $output)", results(output))]
pub struct LogicalNotOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    pub input1_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.logical_or", format = "$input1 `,` $input2 attr-dict `:` functional-type($input1 $input2, $output)", results(output))]
pub struct LogicalOrOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    pub input1_ty: Type<'a>,
    pub input2_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.logical_right_shift", format = "$input1 `,` $input2 attr-dict `:` functional-type($input1 $input2, $output)", results(output))]
pub struct LogicalRightShiftOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    pub input1_ty: Type<'a>,
    pub input2_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.logical_xor", format = "$input1 `,` $input2 attr-dict `:` functional-type($input1 $input2, $output)", results(output))]
pub struct LogicalXorOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    pub input1_ty: Type<'a>,
    pub input2_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.matmul", format = "$a `,` $b `,` $a_zp `,` $b_zp attr-dict `:` functional-type($a $b $a_zp $b_zp, $output)", results(output))]
pub struct MatMulOp<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(a_zp_ty)]
    pub a_zp: Value<'a>,
    #[slot(b_zp_ty)]
    pub b_zp: Value<'a>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub a_zp_ty: Type<'a>,
    pub b_zp_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.matmul_t", format = "$a `,` $b `,` $a_zp `,` $b_zp attr-dict `:` functional-type($a $b $a_zp $b_zp, $output)", results(output))]
pub struct MatMulTOp<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(a_zp_ty)]
    pub a_zp: Value<'a>,
    #[slot(b_zp_ty)]
    pub b_zp: Value<'a>,
    pub a_ty: Type<'a>,
    pub b_ty: Type<'a>,
    pub a_zp_ty: Type<'a>,
    pub b_zp_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.matmul_t_block_scaled", results(output_data))]
pub struct MatmulTBlockScaledOp<'a> {
    #[slot(a_data_ty)]
    pub a_data: Value<'a>,
    #[slot(a_scale_ty)]
    pub a_scale: Value<'a>,
    #[slot(b_data_ty)]
    pub b_data: Value<'a>,
    #[slot(b_scale_ty)]
    pub b_scale: Value<'a>,
    #[attr(dialect = "tosa.block_size")]
    pub block_size: Attribute<'a>,
    pub a_data_ty: Type<'a>,
    pub a_scale_ty: Type<'a>,
    pub b_data_ty: Type<'a>,
    pub b_scale_ty: Type<'a>,
    pub output_data: Type<'a>,
}

#[mlir::op("tosa.max_pool2d_adaptive", results(output))]
pub struct MaxPool2dAdaptiveOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    #[slot(kernel_ty)]
    pub kernel: Value<'a>,
    #[slot(stride_ty)]
    pub stride: Value<'a>,
    #[slot(pad_ty)]
    pub pad: Value<'a>,
    #[attr(dialect = "tosa.nan_mode", default = "<PROPAGATE>")]
    pub nan_mode: Option<Attribute<'a>>,
    pub input_ty: Type<'a>,
    pub kernel_ty: Type<'a>,
    pub stride_ty: Type<'a>,
    pub pad_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.max_pool2d", results(output))]
pub struct MaxPool2dOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    #[attr(dense = "i64")]
    pub kernel: Attribute<'a>,
    #[attr(dense = "i64")]
    pub stride: Attribute<'a>,
    #[attr(dense = "i64")]
    pub pad: Attribute<'a>,
    #[attr(dialect = "tosa.nan_mode", default = "<PROPAGATE>")]
    pub nan_mode: Option<Attribute<'a>>,
    pub input_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.max_shape", format = "$input1 `,` $input2 attr-dict `:` functional-type($input1 $input2, $output)", results(output))]
pub struct MaxShapeOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    #[dtype(strip = "tosa.shape")]
    pub input1_ty: Type<'a>,
    #[dtype(strip = "tosa.shape")]
    pub input2_ty: Type<'a>,
    #[dtype(strip = "tosa.shape")]
    pub output: Type<'a>,
}

#[mlir::op("tosa.maximum", results(output))]
pub struct MaximumOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    #[attr(dialect = "tosa.nan_mode", default = "<PROPAGATE>")]
    pub nan_mode: Option<Attribute<'a>>,
    pub input1_ty: Type<'a>,
    pub input2_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.min_shape", format = "$input1 `,` $input2 attr-dict `:` functional-type($input1 $input2, $output)", results(output))]
pub struct MinShapeOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    #[dtype(strip = "tosa.shape")]
    pub input1_ty: Type<'a>,
    #[dtype(strip = "tosa.shape")]
    pub input2_ty: Type<'a>,
    #[dtype(strip = "tosa.shape")]
    pub output: Type<'a>,
}

#[mlir::op("tosa.minimum", results(output))]
pub struct MinimumOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    #[attr(dialect = "tosa.nan_mode", default = "<PROPAGATE>")]
    pub nan_mode: Option<Attribute<'a>>,
    pub input1_ty: Type<'a>,
    pub input2_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.mod_shape", format = "$input1 `,` $input2 attr-dict `:` functional-type($input1 $input2, $output)", results(output))]
pub struct ModShapeOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    #[dtype(strip = "tosa.shape")]
    pub input1_ty: Type<'a>,
    #[dtype(strip = "tosa.shape")]
    pub input2_ty: Type<'a>,
    #[dtype(strip = "tosa.shape")]
    pub output: Type<'a>,
}

#[mlir::op("tosa.mul", format = "$input1 `,` $input2 `,` $shift attr-dict `:` functional-type($input1 $input2 $shift, $output)", results(output))]
pub struct MulOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    #[slot(shift_ty)]
    pub shift: Value<'a>,
    pub input1_ty: Type<'a>,
    pub input2_ty: Type<'a>,
    pub shift_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.mul_shape", format = "$input1 `,` $input2 attr-dict `:` functional-type($input1 $input2, $output)", results(output))]
pub struct MulShapeOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    #[dtype(strip = "tosa.shape")]
    pub input1_ty: Type<'a>,
    #[dtype(strip = "tosa.shape")]
    pub input2_ty: Type<'a>,
    #[dtype(strip = "tosa.shape")]
    pub output: Type<'a>,
}

#[mlir::op("tosa.negate", format = "$input1 `,` $input1_zp `,` $output_zp attr-dict `:` functional-type($input1 $input1_zp $output_zp, $output)", results(output))]
pub struct NegateOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input1_zp_ty)]
    pub input1_zp: Value<'a>,
    #[slot(output_zp_ty)]
    pub output_zp: Value<'a>,
    pub input1_ty: Type<'a>,
    pub input1_zp_ty: Type<'a>,
    pub output_zp_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.pad", format = "$input1 `,` $padding `,` $pad_const attr-dict `:` functional-type($input1 $padding $pad_const, $output)", results(output))]
pub struct PadOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(padding_ty)]
    pub padding: Value<'a>,
    #[slot(pad_const_ty)]
    pub pad_const: Value<'a>,
    pub input1_ty: Type<'a>,
    #[dtype(strip = "tosa.shape")]
    pub padding_ty: Type<'a>,
    pub pad_const_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.pow", format = "$input1 `,` $input2 attr-dict `:` functional-type($input1 $input2, $output)", results(output))]
pub struct PowOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    pub input1_ty: Type<'a>,
    pub input2_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.rfft2d", format = "$input_real attr-dict `:` functional-type($input_real, $output_real $output_imag)", results(output_real, output_imag))]
pub struct RFFT2dOp<'a> {
    #[slot(input_real_ty)]
    pub input_real: Value<'a>,
    #[attr(default = "false", optional)]
    pub local_bound: Option<Attribute<'a>>,
    pub input_real_ty: Type<'a>,
    pub output_real: Type<'a>,
    pub output_imag: Type<'a>,
}

#[mlir::op("tosa.reciprocal", format = "$input1 attr-dict `:` functional-type($input1, $output)", results(output))]
pub struct ReciprocalOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    pub input1_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.reduce_all", format = "$input attr-dict `:` functional-type($input, $output)", results(output))]
pub struct ReduceAllOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    #[attr(int = "i32")]
    pub axis: Attribute<'a>,
    pub input_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.reduce_any", format = "$input attr-dict `:` functional-type($input, $output)", results(output))]
pub struct ReduceAnyOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    #[attr(int = "i32")]
    pub axis: Attribute<'a>,
    pub input_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.reduce_max", results(output))]
pub struct ReduceMaxOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    #[attr(int = "i32")]
    pub axis: Attribute<'a>,
    #[attr(dialect = "tosa.nan_mode", default = "<PROPAGATE>")]
    pub nan_mode: Option<Attribute<'a>>,
    pub input_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.reduce_min", results(output))]
pub struct ReduceMinOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    #[attr(int = "i32")]
    pub axis: Attribute<'a>,
    #[attr(dialect = "tosa.nan_mode", default = "<PROPAGATE>")]
    pub nan_mode: Option<Attribute<'a>>,
    pub input_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.reduce_product", format = "$input attr-dict `:` functional-type($input, $output)", results(output))]
pub struct ReduceProductOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    #[attr(int = "i32")]
    pub axis: Attribute<'a>,
    pub input_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.reduce_sum", format = "$input attr-dict `:` functional-type($input, $output)", results(output))]
pub struct ReduceSumOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    #[attr(int = "i32")]
    pub axis: Attribute<'a>,
    pub input_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.rescale", results(output))]
pub struct RescaleOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    #[slot(multiplier_ty)]
    pub multiplier: Value<'a>,
    #[slot(shift_ty)]
    pub shift: Value<'a>,
    #[slot(input_zp_ty)]
    pub input_zp: Value<'a>,
    #[slot(output_zp_ty)]
    pub output_zp: Value<'a>,
    pub scale32: Attribute<'a>,
    #[attr(dialect = "tosa.rounding_mode")]
    pub rounding_mode: Attribute<'a>,
    pub per_channel: Attribute<'a>,
    pub input_unsigned: Attribute<'a>,
    pub output_unsigned: Attribute<'a>,
    pub input_ty: Type<'a>,
    pub multiplier_ty: Type<'a>,
    pub shift_ty: Type<'a>,
    pub input_zp_ty: Type<'a>,
    pub output_zp_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.reshape_block_scaled", results(output))]
pub struct ReshapeBlockScaledOp<'a> {
    #[slot(input_ty)]
    pub input: Vec<Value<'a>>,
    #[slot(new_value_shape_ty)]
    pub new_value_shape: Value<'a>,
    #[attr(dialect = "tosa.block_size")]
    pub block_size: Attribute<'a>,
    pub input_ty: Vec<Type<'a>>,
    #[dtype(strip = "tosa.shape")]
    pub new_value_shape_ty: Type<'a>,
    pub output: Vec<Type<'a>>,
}

#[mlir::op("tosa.reshape", format = "$input1 `,` $shape attr-dict `:` functional-type($input1 $shape, $output)", results(output))]
pub struct ReshapeOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(shape_ty)]
    pub shape: Value<'a>,
    pub input1_ty: Type<'a>,
    #[dtype(strip = "tosa.shape")]
    pub shape_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.resize", results(output))]
pub struct ResizeOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[slot(offset_ty)]
    pub offset: Value<'a>,
    #[slot(border_ty)]
    pub border: Value<'a>,
    #[attr(dialect = "tosa.resize_mode")]
    pub mode: Attribute<'a>,
    pub input_ty: Type<'a>,
    pub scale_ty: Type<'a>,
    pub offset_ty: Type<'a>,
    pub border_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.reverse", format = "$input1 attr-dict `:` functional-type($input1, $output)", results(output))]
pub struct ReverseOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[attr(int = "i32")]
    pub axis: Attribute<'a>,
    pub input1_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.row_gather_block_scaled", results(output))]
pub struct RowGatherBlockScaledOp<'a> {
    #[slot(values_ty)]
    pub values: Vec<Value<'a>>,
    #[slot(indices_ty)]
    pub indices: Value<'a>,
    #[slot(row_count_ty)]
    pub row_count: Value<'a>,
    #[attr(dialect = "tosa.block_size")]
    pub block_size: Attribute<'a>,
    pub values_ty: Vec<Type<'a>>,
    pub indices_ty: Type<'a>,
    pub row_count_ty: Type<'a>,
    pub output: Vec<Type<'a>>,
}

#[mlir::op("tosa.row_gather", format = "$values `,` $indices `,` $row_count attr-dict `:` functional-type($values $indices $row_count, $output)", results(output))]
pub struct RowGatherOp<'a> {
    #[slot(values_ty)]
    pub values: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Value<'a>,
    #[slot(row_count_ty)]
    pub row_count: Value<'a>,
    pub values_ty: Type<'a>,
    pub indices_ty: Type<'a>,
    pub row_count_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.rsqrt", format = "$input1 attr-dict `:` functional-type($input1, $output)", results(output))]
pub struct RsqrtOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    pub input1_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.scatter", format = "$values_in `,` $indices `,` $input attr-dict `:` functional-type($values_in $indices $input, $values_out)", results(values_out))]
pub struct ScatterOp<'a> {
    #[slot(values_in_ty)]
    pub values_in: Value<'a>,
    #[slot(indices_ty)]
    pub indices: Value<'a>,
    #[slot(input_ty)]
    pub input: Value<'a>,
    pub values_in_ty: Type<'a>,
    pub indices_ty: Type<'a>,
    pub input_ty: Type<'a>,
    pub values_out: Type<'a>,
}

#[mlir::op("tosa.select", format = "$input1 `,` $input2 `,` $input3 attr-dict `:` functional-type($input1 $input2 $input3, $output)", results(output))]
pub struct SelectOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    #[slot(input3_ty)]
    pub input3: Value<'a>,
    pub input1_ty: Type<'a>,
    pub input2_ty: Type<'a>,
    pub input3_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.sigmoid", format = "$input attr-dict `:` functional-type($input, $output)", results(output))]
pub struct SigmoidOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    pub input_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.sin", format = "$input1 attr-dict `:` functional-type($input1, $output)", results(output))]
pub struct SinOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    pub input1_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.slice", format = "$input1 `,` $start `,` $size attr-dict `:` functional-type($input1 $start $size, $output)", results(output))]
pub struct SliceOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(start_ty)]
    pub start: Value<'a>,
    #[slot(size_ty)]
    pub size: Value<'a>,
    pub input1_ty: Type<'a>,
    #[dtype(strip = "tosa.shape")]
    pub start_ty: Type<'a>,
    #[dtype(strip = "tosa.shape")]
    pub size_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.slice_shape", format = "$input `,` $start `,` $size attr-dict `:` functional-type($input $start $size, $output)", results(output))]
pub struct SliceShapeOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    #[slot(start_ty)]
    pub start: Value<'a>,
    #[slot(size_ty)]
    pub size: Value<'a>,
    #[dtype(strip = "tosa.shape")]
    pub input_ty: Type<'a>,
    pub start_ty: Type<'a>,
    pub size_ty: Type<'a>,
    #[dtype(strip = "tosa.shape")]
    pub output: Type<'a>,
}

#[mlir::op("tosa.sub", format = "$input1 `,` $input2 attr-dict `:` functional-type($input1 $input2, $output)", results(output))]
pub struct SubOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    pub input1_ty: Type<'a>,
    pub input2_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.sub_shape", format = "$input1 `,` $input2 attr-dict `:` functional-type($input1 $input2, $output)", results(output))]
pub struct SubShapeOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(input2_ty)]
    pub input2: Value<'a>,
    #[dtype(strip = "tosa.shape")]
    pub input1_ty: Type<'a>,
    #[dtype(strip = "tosa.shape")]
    pub input2_ty: Type<'a>,
    #[dtype(strip = "tosa.shape")]
    pub output: Type<'a>,
}

#[mlir::op("tosa.table", format = "$input1 `,` $table attr-dict `:` functional-type($input1 $table, $output)", results(output))]
pub struct TableOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(table_ty)]
    pub table: Value<'a>,
    pub input1_ty: Type<'a>,
    pub table_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.tanh", format = "$input attr-dict `:` functional-type($input, $output)", results(output))]
pub struct TanhOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    pub input_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.tile", format = "$input1 `,` $multiples attr-dict `:` functional-type($input1 $multiples, $output)", results(output))]
pub struct TileOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[slot(multiples_ty)]
    pub multiples: Value<'a>,
    pub input1_ty: Type<'a>,
    #[dtype(strip = "tosa.shape")]
    pub multiples_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.transpose_conv2d", format = "$input `,` $weight `,` $bias `,` $input_zp `,` $weight_zp attr-dict `:` functional-type($input $weight $bias $input_zp $weight_zp, $output)", results(output))]
pub struct TransposeConv2DOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    #[slot(weight_ty)]
    pub weight: Value<'a>,
    #[slot(bias_ty)]
    pub bias: Value<'a>,
    #[slot(input_zp_ty)]
    pub input_zp: Value<'a>,
    #[slot(weight_zp_ty)]
    pub weight_zp: Value<'a>,
    #[attr(dense = "i64")]
    pub out_pad: Attribute<'a>,
    #[attr(dense = "i64")]
    pub stride: Attribute<'a>,
    pub acc_type: Attribute<'a>,
    #[attr(default = "false", optional)]
    pub local_bound: Option<Attribute<'a>>,
    pub input_ty: Type<'a>,
    pub weight_ty: Type<'a>,
    pub bias_ty: Type<'a>,
    pub input_zp_ty: Type<'a>,
    pub weight_zp_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.transpose", format = "$input1 attr-dict `:` functional-type($input1, $output)", results(output))]
pub struct TransposeOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[attr(dense = "i32")]
    pub perms: Attribute<'a>,
    pub input1_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("tosa.variable")]
pub struct VariableOp<'a> {
    #[attr(symbol)]
    pub sym_name: Attribute<'a>,
    pub var_shape: Attribute<'a>,
    #[attr(name = "type")]
    pub type_: Attribute<'a>,
    pub initial_value: Option<Attribute<'a>>,
}

#[mlir::op("tosa.variable_read", format = "$name attr-dict `:` type($output1)", results(output1))]
pub struct VariableReadOp<'a> {
    #[attr(symbol)]
    pub name: Attribute<'a>,
    pub output1: Type<'a>,
}

#[mlir::op("tosa.variable_write", format = "$name attr-dict `,` $input1 `:` type($input1)")]
pub struct VariableWriteOp<'a> {
    #[slot(input1_ty)]
    pub input1: Value<'a>,
    #[attr(symbol)]
    pub name: Attribute<'a>,
    pub input1_ty: Type<'a>,
}

#[mlir::op("tosa.while_loop", results(output_list))]
pub struct WhileOp<'a> {
    #[slot(input_list_ty)]
    pub input_list: Vec<Value<'a>>,
    pub cond_graph: Region<'a>,
    pub body_graph: Region<'a>,
    pub input_list_ty: Vec<Type<'a>>,
    pub output_list: Vec<Type<'a>>,
}

#[mlir::op("tosa.yield", format = "$inputs attr-dict `:` type($inputs)")]
pub struct YieldOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    pub inputs_ty: Vec<Type<'a>>,
}

#[mlir::dialect(
    "tosa",
    ops = [AbsOp, AddOp, AddShapeOp, ApplyScaleOp, ArgMaxOp, ArithmeticRightShiftOp, AssertEqualShapeOp, AvgPool2dAdaptiveOp, AvgPool2dOp, BitwiseAndOp, BitwiseNotOp, BitwiseOrOp, BitwiseXorOp, CastFromBlockScaledOp, CastOp, CastToBlockScaledOp, CeilOp, ClampOp, ClzOp, ConcatOp, ConcatShapeOp, ConstOp, ConstShapeOp, Conv2DBlockScaledOp, Conv2DOp, Conv3DOp, CosOp, CustomOp, DepthwiseConv2DOp, DimOp, DivCeilShapeOp, DivFloorShapeOp, EqualOp, ErfOp, Exp2ShapeOp, ExpOp, FFT2dOp, FloorOp, GatherOp, GreaterEqualOp, GreaterOp, IdentityOp, IfOp, IntDivOp, Log2CeilShapeOp, Log2FloorShapeOp, LogOp, LogicalAndOp, LogicalLeftShiftOp, LogicalNotOp, LogicalOrOp, LogicalRightShiftOp, LogicalXorOp, MatMulOp, MatMulTOp, MatmulTBlockScaledOp, MaxPool2dAdaptiveOp, MaxPool2dOp, MaxShapeOp, MaximumOp, MinShapeOp, MinimumOp, ModShapeOp, MulOp, MulShapeOp, NegateOp, PadOp, PowOp, RFFT2dOp, ReciprocalOp, ReduceAllOp, ReduceAnyOp, ReduceMaxOp, ReduceMinOp, ReduceProductOp, ReduceSumOp, RescaleOp, ReshapeBlockScaledOp, ReshapeOp, ResizeOp, ReverseOp, RowGatherBlockScaledOp, RowGatherOp, RsqrtOp, ScatterOp, SelectOp, SigmoidOp, SinOp, SliceOp, SliceShapeOp, SubOp, SubShapeOp, TableOp, TanhOp, TileOp, TransposeConv2DOp, TransposeOp, VariableOp, VariableReadOp, VariableWriteOp, WhileOp, YieldOp],
    dependents = ["tensor", "quant"],
    materializer
)]
pub struct TosaDialect;
