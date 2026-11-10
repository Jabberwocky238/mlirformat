module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage, Sampled1D, StorageImageExtendedFormats, InputAttachment], []> {
    spirv.GlobalVariable @var0 bind(0, 1) : !spirv.ptr<!spirv.image<f32, Dim1D, NoDepth, NonArrayed, SingleSampled, SamplerUnknown, Unknown>, UniformConstant>
    spirv.GlobalVariable @var1 : !spirv.ptr<!spirv.image<si32, Cube, IsDepth, NonArrayed, SingleSampled, NeedSampler, R8ui>, UniformConstant>
    spirv.GlobalVariable @var2 : !spirv.ptr<!spirv.image<i32, SubpassData, DepthUnknown, Arrayed, MultiSampled, NoSampler, Unknown>, UniformConstant>
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage, StorageImageMultisample], []> {
    spirv.GlobalVariable @img_2d_ms_storage bind(0, 0) : !spirv.ptr<!spirv.image<f32, Dim2D, NoDepth, NonArrayed, MultiSampled, NoSampler, Unknown>, UniformConstant>
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage, StorageImageMultisample, ImageMSArray], []> {
    spirv.GlobalVariable @img_2d_ms_arrayed bind(0, 0) : !spirv.ptr<!spirv.image<f32, Dim2D, NoDepth, Arrayed, MultiSampled, NoSampler, Unknown>, UniformConstant>
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage, ImageCubeArray, SampledCubeArray], []> {
    spirv.GlobalVariable @img_cube_arrayed bind(0, 0) : !spirv.ptr<!spirv.image<f32, Cube, NoDepth, Arrayed, SingleSampled, NeedSampler, Unknown>, UniformConstant>
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage, Image1D, Sampled1D], []> {
    spirv.GlobalVariable @img_1d_storage bind(0, 0) : !spirv.ptr<!spirv.image<f32, Dim1D, NoDepth, NonArrayed, SingleSampled, NoSampler, Unknown>, UniformConstant>
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage, ImageBuffer, SampledBuffer], []> {
    spirv.GlobalVariable @img_buffer_storage bind(0, 0) : !spirv.ptr<!spirv.image<f32, Buffer, NoDepth, NonArrayed, SingleSampled, NoSampler, Unknown>, UniformConstant>
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage, Int64, Int64ImageEXT], [SPV_EXT_shader_image_int64]> {
    spirv.GlobalVariable @img_2d_i64 bind(0, 0) : !spirv.ptr<!spirv.image<i64, Dim2D, NoDepth, NonArrayed, SingleSampled, NoSampler, Unknown>, UniformConstant>
  }
}

