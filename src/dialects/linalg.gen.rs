#![allow(non_camel_case_types, unused_imports, clippy::all, rustdoc::all)]

use mlirformat::{mlir, Attribute, Region, Str, Type, Value, __Vec as Vec};

#[derive(Debug, Clone, Copy, PartialEq, Eq, mlirformat::__serde::Serialize, mlirformat::__serde::Deserialize, mlir::Cases)]
#[serde(crate = "mlirformat::__serde")]
pub enum WinogradConv2DFmr {
    #[serde(rename = "F_2_3")]
    F23,
    #[serde(rename = "F_4_3")]
    F43,
    #[serde(rename = "F_2_5")]
    F25,
}

#[mlir::op("linalg.abs", results(result_tensors))]
pub struct AbsOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.add", results(result_tensors))]
pub struct AddOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.batch_matmul", results(result_tensors))]
pub struct BatchMatmulOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub indexing_maps: Option<Attribute<'a>>,
    #[attr(dialect = "linalg.type_fn", default = "<cast_signed>", optional)]
    pub cast: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.batch_matvec", results(result_tensors))]
pub struct BatchMatvecOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.batch_mmt4d", results(result_tensors))]
pub struct BatchMmt4DOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.batch_reduce_matmul", results(result_tensors))]
pub struct BatchReduceMatmulOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub indexing_maps: Option<Attribute<'a>>,
    #[attr(dialect = "linalg.type_fn", default = "<cast_signed>", optional)]
    pub cast: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.batch_vecmat", results(result_tensors))]
pub struct BatchVecmatOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.broadcast", results(result))]
pub struct BroadcastOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    #[slot(init_ty)]
    pub init: Value<'a>,
    #[attr(dense = "i64")]
    pub dimensions: Attribute<'a>,
    pub region: Region<'a>,
    pub input_ty: Type<'a>,
    pub init_ty: Type<'a>,
    pub result: Vec<Type<'a>>,
}

#[mlir::op("linalg.ceil", results(result_tensors))]
pub struct CeilOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.contract", results(result_tensors))]
pub struct ContractOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub indexing_maps: Attribute<'a>,
    #[attr(dialect = "linalg.type_fn", default = "<cast_signed>", optional)]
    pub cast: Option<Attribute<'a>>,
    pub combiner: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.conv_1d_ncw_fcw", results(result_tensors))]
pub struct Conv1DNcwFcwOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub strides: Option<Attribute<'a>>,
    pub dilations: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.conv_1d_nwc_wcf", results(result_tensors))]
pub struct Conv1DNwcWcfOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub strides: Option<Attribute<'a>>,
    pub dilations: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.conv_1d", results(result_tensors))]
pub struct Conv1DOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.conv_2d_nchw_fchw", results(result_tensors))]
pub struct Conv2DNchwFchwOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub strides: Option<Attribute<'a>>,
    pub dilations: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.conv_2d_nchw_fchw_q", results(result_tensors))]
pub struct Conv2DNchwFchwQOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub strides: Option<Attribute<'a>>,
    pub dilations: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.conv_2d_ngchw_fgchw", results(result_tensors))]
pub struct Conv2DNgchwFgchwOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub strides: Option<Attribute<'a>>,
    pub dilations: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.conv_2d_ngchw_gfchw", results(result_tensors))]
pub struct Conv2DNgchwGfchwOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub strides: Option<Attribute<'a>>,
    pub dilations: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.conv_2d_ngchw_gfchw_q", results(result_tensors))]
pub struct Conv2DNgchwGfchwQOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub strides: Option<Attribute<'a>>,
    pub dilations: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.conv_2d_nhwc_fhwc", results(result_tensors))]
pub struct Conv2DNhwcFhwcOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub strides: Option<Attribute<'a>>,
    pub dilations: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.conv_2d_nhwc_fhwc_q", results(result_tensors))]
pub struct Conv2DNhwcFhwcQOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub strides: Option<Attribute<'a>>,
    pub dilations: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.conv_2d_nhwc_hwcf", results(result_tensors))]
pub struct Conv2DNhwcHwcfOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub strides: Option<Attribute<'a>>,
    pub dilations: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.conv_2d_nhwc_hwcf_q", results(result_tensors))]
pub struct Conv2DNhwcHwcfQOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub strides: Option<Attribute<'a>>,
    pub dilations: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.conv_2d_nhwgc_gfhwc", results(result_tensors))]
pub struct Conv2DNhwgcGfhwcOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub strides: Option<Attribute<'a>>,
    pub dilations: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.conv_2d_nhwgc_gfhwc_q", results(result_tensors))]
pub struct Conv2DNhwgcGfhwcQOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub strides: Option<Attribute<'a>>,
    pub dilations: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.conv_2d", results(result_tensors))]
pub struct Conv2DOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.conv_3d_ncdhw_fcdhw", results(result_tensors))]
pub struct Conv3DNcdhwFcdhwOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub strides: Option<Attribute<'a>>,
    pub dilations: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.conv_3d_ndhwc_dhwcf", results(result_tensors))]
pub struct Conv3DNdhwcDhwcfOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub strides: Option<Attribute<'a>>,
    pub dilations: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.conv_3d_ndhwc_dhwcf_q", results(result_tensors))]
pub struct Conv3DNdhwcDhwcfQOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub strides: Option<Attribute<'a>>,
    pub dilations: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.conv_3d", results(result_tensors))]
pub struct Conv3DOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.copy", results(result_tensors))]
pub struct CopyOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    #[attr(dialect = "linalg.type_fn", default = "<cast_signed>", optional)]
    pub cast: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.depthwise_conv_1d_ncw_cw", results(result_tensors))]
pub struct DepthwiseConv1DNcwCwOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub strides: Option<Attribute<'a>>,
    pub dilations: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.depthwise_conv_1d_nwc_wc", results(result_tensors))]
pub struct DepthwiseConv1DNwcWcOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub strides: Option<Attribute<'a>>,
    pub dilations: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.depthwise_conv_1d_nwc_wcm", results(result_tensors))]
pub struct DepthwiseConv1DNwcWcmOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub strides: Option<Attribute<'a>>,
    pub dilations: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.depthwise_conv_2d_nchw_chw", results(result_tensors))]
pub struct DepthwiseConv2DNchwChwOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub strides: Option<Attribute<'a>>,
    pub dilations: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.depthwise_conv_2d_nhwc_hwc", results(result_tensors))]
pub struct DepthwiseConv2DNhwcHwcOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub strides: Option<Attribute<'a>>,
    pub dilations: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.depthwise_conv_2d_nhwc_hwc_q", results(result_tensors))]
pub struct DepthwiseConv2DNhwcHwcQOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub strides: Option<Attribute<'a>>,
    pub dilations: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.depthwise_conv_2d_nhwc_hwcm", results(result_tensors))]
pub struct DepthwiseConv2DNhwcHwcmOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub strides: Option<Attribute<'a>>,
    pub dilations: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.depthwise_conv_2d_nhwc_hwcm_q", results(result_tensors))]
pub struct DepthwiseConv2DNhwcHwcmQOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub strides: Option<Attribute<'a>>,
    pub dilations: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.depthwise_conv_3d_ncdhw_cdhw", results(result_tensors))]
pub struct DepthwiseConv3DNcdhwCdhwOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub strides: Option<Attribute<'a>>,
    pub dilations: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.depthwise_conv_3d_ndhwc_dhwc", results(result_tensors))]
pub struct DepthwiseConv3DNdhwcDhwcOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub strides: Option<Attribute<'a>>,
    pub dilations: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.depthwise_conv_3d_ndhwc_dhwcm", results(result_tensors))]
pub struct DepthwiseConv3DNdhwcDhwcmOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub strides: Option<Attribute<'a>>,
    pub dilations: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.div", results(result_tensors))]
pub struct DivOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.div_unsigned", results(result_tensors))]
pub struct DivUnsignedOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.dot", results(result_tensors))]
pub struct DotOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.elementwise", results(result_tensors))]
pub struct ElementwiseOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    #[attr(dialect = "linalg.elementwise_kind")]
    pub kind: Attribute<'a>,
    pub indexing_maps: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.erf", results(result_tensors))]
pub struct ErfOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.exp", results(result_tensors))]
pub struct ExpOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.fill", results(result_tensors))]
pub struct FillOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.fill_rng_2d", results(result_tensors))]
pub struct FillRng2DOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.floor", results(result_tensors))]
pub struct FloorOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.generic", results(result_tensors))]
pub struct GenericOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub indexing_maps: Attribute<'a>,
    pub iterator_types: Attribute<'a>,
    pub doc: Option<Attribute<'a>>,
    pub library_call: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.index", format = "$dim attr-dict `:` type($result)", results(result))]
pub struct IndexOp<'a> {
    #[attr(int = "i64")]
    pub dim: Attribute<'a>,
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::op("linalg.pack", results(result))]
pub struct PackOp<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    #[slot(result)]
    pub dest: Value<'a>,
    #[slot(padding_value_ty)]
    pub padding_value: Vec<Value<'a>>,
    #[slot(inner_tiles_ty)]
    pub inner_tiles: Vec<Value<'a>>,
    #[attr(dense = "i64")]
    pub outer_dims_perm: Option<Attribute<'a>>,
    #[attr(dense = "i64")]
    pub inner_dims_pos: Attribute<'a>,
    #[attr(dense = "i64")]
    pub static_inner_tiles: Attribute<'a>,
    pub source_ty: Type<'a>,
    pub padding_value_ty: Vec<Type<'a>>,
    #[dtype(is = index)]
    pub inner_tiles_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("linalg.softmax", format = "attr-dict `dimension` `(` $dimension `)` `ins` `(` $input `:` type($input) `)` `outs` `(` $output `:` type($output) `)` (`->` type($result)^)?", results(result))]
pub struct SoftmaxOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    #[slot(output_ty)]
    pub output: Value<'a>,
    #[attr(int = "i64")]
    pub dimension: Attribute<'a>,
    pub input_ty: Type<'a>,
    pub output_ty: Type<'a>,
    pub result: Vec<Type<'a>>,
}

#[mlir::op("linalg.unpack", results(result))]
pub struct UnPackOp<'a> {
    #[slot(source_ty)]
    pub source: Value<'a>,
    #[slot(result)]
    pub dest: Value<'a>,
    #[slot(inner_tiles_ty)]
    pub inner_tiles: Vec<Value<'a>>,
    #[attr(dense = "i64")]
    pub outer_dims_perm: Option<Attribute<'a>>,
    #[attr(dense = "i64")]
    pub inner_dims_pos: Attribute<'a>,
    #[attr(dense = "i64")]
    pub static_inner_tiles: Attribute<'a>,
    pub source_ty: Type<'a>,
    #[dtype(is = index)]
    pub inner_tiles_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("linalg.winograd_filter_transform", format = "attr-dict `fmr` `(` $fmr `)` `ins` `(` $filter `:` type($filter) `)` `outs` `(` $output `:` type($output) `)` `->` type($result)", results(result))]
pub struct WinogradFilterTransformOp<'a> {
    #[slot(filter_ty)]
    pub filter: Value<'a>,
    #[slot(output_ty)]
    pub output: Value<'a>,
    #[attr(int = "i32")]
    pub fmr: WinogradConv2DFmr,
    pub filter_ty: Type<'a>,
    pub output_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("linalg.winograd_input_transform", format = "attr-dict `fmr` `(` $fmr `)` `ins` `(` $input `:` type($input) `)` `outs` `(` $output `:` type($output) `)` `->` type($result)", results(result))]
pub struct WinogradInputTransformOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    #[slot(output_ty)]
    pub output: Value<'a>,
    #[attr(int = "i32")]
    pub fmr: WinogradConv2DFmr,
    pub input_ty: Type<'a>,
    pub output_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("linalg.winograd_output_transform", format = "attr-dict `fmr` `(` $fmr `)` `ins` `(` $value `:` type($value) `)` `outs` `(` $output `:` type($output) `)` `->` type($result)", results(result))]
pub struct WinogradOutputTransformOp<'a> {
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[slot(output_ty)]
    pub output: Value<'a>,
    #[attr(int = "i32")]
    pub fmr: WinogradConv2DFmr,
    pub value_ty: Type<'a>,
    pub output_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("linalg.yield")]
pub struct YieldOp<'a> {
    #[slot(values_ty)]
    pub values: Vec<Value<'a>>,
    pub values_ty: Vec<Type<'a>>,
}

#[mlir::op("linalg.log", results(result_tensors))]
pub struct LogOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.map", results(result))]
pub struct MapOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(init_ty)]
    pub init: Value<'a>,
    pub mapper: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub init_ty: Type<'a>,
    pub result: Vec<Type<'a>>,
}

#[mlir::op("linalg.matmul", results(result_tensors))]
pub struct MatmulOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub indexing_maps: Option<Attribute<'a>>,
    #[attr(dialect = "linalg.type_fn", default = "<cast_signed>", optional)]
    pub cast: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.matvec", results(result_tensors))]
pub struct MatvecOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.max", results(result_tensors))]
pub struct MaxOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.min", results(result_tensors))]
pub struct MinOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.mmt4d", results(result_tensors))]
pub struct Mmt4DOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.mul", results(result_tensors))]
pub struct MulOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.negf", results(result_tensors))]
pub struct NegFOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.pooling_nchw_max", results(result_tensors))]
pub struct PoolingNchwMaxOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub strides: Option<Attribute<'a>>,
    pub dilations: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.pooling_nchw_sum", results(result_tensors))]
pub struct PoolingNchwSumOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub strides: Option<Attribute<'a>>,
    pub dilations: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.pooling_ncw_max", results(result_tensors))]
pub struct PoolingNcwMaxOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub strides: Option<Attribute<'a>>,
    pub dilations: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.pooling_ncw_sum", results(result_tensors))]
pub struct PoolingNcwSumOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub strides: Option<Attribute<'a>>,
    pub dilations: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.pooling_ndhwc_max", results(result_tensors))]
pub struct PoolingNdhwcMaxOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub strides: Option<Attribute<'a>>,
    pub dilations: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.pooling_ndhwc_min", results(result_tensors))]
pub struct PoolingNdhwcMinOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub strides: Option<Attribute<'a>>,
    pub dilations: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.pooling_ndhwc_sum", results(result_tensors))]
pub struct PoolingNdhwcSumOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub strides: Option<Attribute<'a>>,
    pub dilations: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.pooling_nhwc_max", results(result_tensors))]
pub struct PoolingNhwcMaxOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub strides: Option<Attribute<'a>>,
    pub dilations: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.pooling_nhwc_max_unsigned", results(result_tensors))]
pub struct PoolingNhwcMaxUnsignedOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub strides: Option<Attribute<'a>>,
    pub dilations: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.pooling_nhwc_min", results(result_tensors))]
pub struct PoolingNhwcMinOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub strides: Option<Attribute<'a>>,
    pub dilations: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.pooling_nhwc_min_unsigned", results(result_tensors))]
pub struct PoolingNhwcMinUnsignedOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub strides: Option<Attribute<'a>>,
    pub dilations: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.pooling_nhwc_sum", results(result_tensors))]
pub struct PoolingNhwcSumOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub strides: Option<Attribute<'a>>,
    pub dilations: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.pooling_nwc_max", results(result_tensors))]
pub struct PoolingNwcMaxOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub strides: Option<Attribute<'a>>,
    pub dilations: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.pooling_nwc_max_unsigned", results(result_tensors))]
pub struct PoolingNwcMaxUnsignedOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub strides: Option<Attribute<'a>>,
    pub dilations: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.pooling_nwc_min", results(result_tensors))]
pub struct PoolingNwcMinOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub strides: Option<Attribute<'a>>,
    pub dilations: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.pooling_nwc_min_unsigned", results(result_tensors))]
pub struct PoolingNwcMinUnsignedOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub strides: Option<Attribute<'a>>,
    pub dilations: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.pooling_nwc_sum", results(result_tensors))]
pub struct PoolingNwcSumOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub strides: Option<Attribute<'a>>,
    pub dilations: Option<Attribute<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.powf", results(result_tensors))]
pub struct PowFOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.quantized_batch_matmul", results(result_tensors))]
pub struct QuantizedBatchMatmulOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.quantized_matmul", results(result_tensors))]
pub struct QuantizedMatmulOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.reciprocal", results(result_tensors))]
pub struct ReciprocalOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.reduce", results(result))]
pub struct ReduceOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(inits_ty)]
    pub inits: Vec<Value<'a>>,
    #[attr(dense = "i64")]
    pub dimensions: Attribute<'a>,
    pub combiner: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub inits_ty: Vec<Type<'a>>,
    pub result: Vec<Type<'a>>,
}

#[mlir::op("linalg.round", results(result_tensors))]
pub struct RoundOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.rsqrt", results(result_tensors))]
pub struct RsqrtOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.select", results(result_tensors))]
pub struct SelectOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.sqrt", results(result_tensors))]
pub struct SqrtOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.square", results(result_tensors))]
pub struct SquareOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.sub", results(result_tensors))]
pub struct SubOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.tanh", results(result_tensors))]
pub struct TanhOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::op("linalg.transpose", results(result))]
pub struct TransposeOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    #[slot(init_ty)]
    pub init: Value<'a>,
    #[attr(dense = "i64")]
    pub permutation: Attribute<'a>,
    pub region: Region<'a>,
    pub input_ty: Type<'a>,
    pub init_ty: Type<'a>,
    pub result: Vec<Type<'a>>,
}

#[mlir::op("linalg.vecmat", results(result_tensors))]
pub struct VecmatOp<'a> {
    #[slot(inputs_ty)]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty)]
    pub outputs: Vec<Value<'a>>,
    pub region: Region<'a>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    pub result_tensors: Vec<Type<'a>>,
}

#[mlir::dialect(
    "linalg",
    ops = [AbsOp, AddOp, BatchMatmulOp, BatchMatvecOp, BatchMmt4DOp, BatchReduceMatmulOp, BatchVecmatOp, BroadcastOp, CeilOp, ContractOp, Conv1DNcwFcwOp, Conv1DNwcWcfOp, Conv1DOp, Conv2DNchwFchwOp, Conv2DNchwFchwQOp, Conv2DNgchwFgchwOp, Conv2DNgchwGfchwOp, Conv2DNgchwGfchwQOp, Conv2DNhwcFhwcOp, Conv2DNhwcFhwcQOp, Conv2DNhwcHwcfOp, Conv2DNhwcHwcfQOp, Conv2DNhwgcGfhwcOp, Conv2DNhwgcGfhwcQOp, Conv2DOp, Conv3DNcdhwFcdhwOp, Conv3DNdhwcDhwcfOp, Conv3DNdhwcDhwcfQOp, Conv3DOp, CopyOp, DepthwiseConv1DNcwCwOp, DepthwiseConv1DNwcWcOp, DepthwiseConv1DNwcWcmOp, DepthwiseConv2DNchwChwOp, DepthwiseConv2DNhwcHwcOp, DepthwiseConv2DNhwcHwcQOp, DepthwiseConv2DNhwcHwcmOp, DepthwiseConv2DNhwcHwcmQOp, DepthwiseConv3DNcdhwCdhwOp, DepthwiseConv3DNdhwcDhwcOp, DepthwiseConv3DNdhwcDhwcmOp, DivOp, DivUnsignedOp, DotOp, ElementwiseOp, ErfOp, ExpOp, FillOp, FillRng2DOp, FloorOp, GenericOp, IndexOp, PackOp, SoftmaxOp, UnPackOp, WinogradFilterTransformOp, WinogradInputTransformOp, WinogradOutputTransformOp, YieldOp, LogOp, MapOp, MatmulOp, MatvecOp, MaxOp, MinOp, Mmt4DOp, MulOp, NegFOp, PoolingNchwMaxOp, PoolingNchwSumOp, PoolingNcwMaxOp, PoolingNcwSumOp, PoolingNdhwcMaxOp, PoolingNdhwcMinOp, PoolingNdhwcSumOp, PoolingNhwcMaxOp, PoolingNhwcMaxUnsignedOp, PoolingNhwcMinOp, PoolingNhwcMinUnsignedOp, PoolingNhwcSumOp, PoolingNwcMaxOp, PoolingNwcMaxUnsignedOp, PoolingNwcMinOp, PoolingNwcMinUnsignedOp, PoolingNwcSumOp, PowFOp, QuantizedBatchMatmulOp, QuantizedMatmulOp, ReciprocalOp, ReduceOp, RoundOp, RsqrtOp, SelectOp, SqrtOp, SquareOp, SubOp, TanhOp, TransposeOp, VecmatOp],
    dependents = ["arith", "affine", "math", "memref", "tensor"],
    materializer,
    canonicalizer
)]
pub struct LinalgDialect;
