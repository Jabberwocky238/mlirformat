module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.2, [Shader], []> {
    spirv.SpecConstant @x = 3 : i32
    spirv.SpecConstant @y = 4 : i32
    spirv.SpecConstant @z = 5 : i32
    spirv.func @foo() "None" {
      spirv.Return
    }
    spirv.EntryPoint "GLCompute" @foo
    spirv.ExecutionModeId @foo "LocalSizeId" @x, @y, @z
  }
}

