module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage, Sampled1D, StorageImageExtendedFormats, InputAttachment], []> {
    spirv.GlobalVariable @var0 bind(0, 1) : !spirv.ptr<!spirv.image<f32, Dim1D, NoDepth, NonArrayed, SingleSampled, SamplerUnknown, Unknown>, UniformConstant>
    spirv.GlobalVariable @var1 : !spirv.ptr<!spirv.image<si32, Cube, IsDepth, NonArrayed, SingleSampled, NeedSampler, R8ui>, UniformConstant>
    spirv.GlobalVariable @var2 : !spirv.ptr<!spirv.image<i32, SubpassData, DepthUnknown, Arrayed, MultiSampled, NoSampler, Unknown>, UniformConstant>
  }
}

