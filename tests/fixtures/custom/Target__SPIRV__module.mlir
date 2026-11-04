module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader], []> {
    spirv.func @foo() "Inline" {
      spirv.Return
    }
    spirv.EntryPoint "Vertex" @foo
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.5, [Shader, Linkage], []> {
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.6, [Shader, Linkage], []> {
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Float16, Linkage], []> {
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage], [SPV_KHR_float_controls, SPV_KHR_subgroup_vote]> {
  }
}

