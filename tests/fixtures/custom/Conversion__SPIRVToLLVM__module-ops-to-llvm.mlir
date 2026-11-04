module {
  spirv.module Logical GLSL450 {
  }
  spirv.module @foo Logical GLSL450 {
  }
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader], [SPV_KHR_16bit_storage]> {
  }
  spirv.module Logical GLSL450 {
    spirv.func @empty() "None" {
      spirv.Return
    }
  }
}

