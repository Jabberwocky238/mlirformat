module {
  spirv.module Logical OpenCL requires #spirv.vce<v1.0, [Kernel], []> {
    spirv.func @noop() "None" {
      spirv.Return
    }
    spirv.EntryPoint "Kernel" @noop
    spirv.ExecutionMode @noop "ContractionOff"
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader], []> {
    spirv.GlobalVariable @var2 : !spirv.ptr<f32, Input>
    spirv.GlobalVariable @var3 : !spirv.ptr<f32, Output>
    spirv.func @noop() "None" {
      spirv.Return
    }
    spirv.EntryPoint "GLCompute" @noop, @var2, @var3
    spirv.ExecutionMode @noop "LocalSize", 1, 1, 1
  }
}

