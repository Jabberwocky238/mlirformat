module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Sampled1D, SampledRect, StorageImageExtendedFormats, Linkage], []> {
    spirv.GlobalVariable @var0 bind(0, 1) : !spirv.ptr<!spirv.sampled_image<!spirv.image<f32, Dim1D, NoDepth, NonArrayed, SingleSampled, NeedSampler, Unknown>>, UniformConstant>
    spirv.GlobalVariable @var1 bind(0, 0) : !spirv.ptr<!spirv.sampled_image<!spirv.image<si32, Cube, DepthUnknown, Arrayed, MultiSampled, NeedSampler, Unknown>>, UniformConstant>
    spirv.GlobalVariable @var2 bind(0, 0) : !spirv.ptr<!spirv.sampled_image<!spirv.image<i32, Rect, DepthUnknown, Arrayed, MultiSampled, NeedSampler, R8ui>>, UniformConstant>
    spirv.GlobalVariable @var3 bind(0, 2) : !spirv.ptr<!spirv.sampler, UniformConstant>
  }
}

