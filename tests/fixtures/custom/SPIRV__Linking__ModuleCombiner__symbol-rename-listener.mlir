module {
  spirv.module @Module1 Logical GLSL450 {
    spirv.GlobalVariable @foo bind(1, 0) : !spirv.ptr<f32, Input>
    spirv.func @bar() "None" {
      spirv.Return
    }
    spirv.func @baz() "None" {
      spirv.Return
    }
    spirv.SpecConstant @sc = -5 : i32
  }
  spirv.module @Module2 Logical GLSL450 {
    spirv.func @foo() "None" {
      spirv.Return
    }
    spirv.GlobalVariable @bar bind(1, 0) : !spirv.ptr<f32, Input>
    spirv.func @baz() "None" {
      spirv.Return
    }
    spirv.SpecConstant @sc = -5 : i32
  }
  spirv.module @Module3 Logical GLSL450 {
    spirv.func @foo() "None" {
      spirv.Return
    }
    spirv.GlobalVariable @bar bind(1, 0) : !spirv.ptr<f32, Input>
    spirv.func @baz() "None" {
      spirv.Return
    }
    spirv.SpecConstant @sc = -5 : i32
  }
}

