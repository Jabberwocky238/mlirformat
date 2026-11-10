module {
  spirv.module Logical GLSL450 {
    spirv.SpecConstant @m1_sc = 4.242000e+01 : f32
    spirv.GlobalVariable @m1_gv bind(1, 0) : !spirv.ptr<f32, Input>
    spirv.func @no_op() "None" {
      spirv.Return
    }
    spirv.EntryPoint "GLCompute" @no_op
    spirv.ExecutionMode @no_op "LocalSize", 32, 1, 1
  }
  spirv.module Logical GLSL450 {
    spirv.SpecConstant @m2_sc = 42 : i32
    spirv.GlobalVariable @m2_gv bind(0, 1) : !spirv.ptr<f32, Input>
    spirv.func @variable_init_spec_constant() "None" {
      %0 = spirv.mlir.referenceof @m2_sc : i32
      %1 = spirv.Variable init(%0) : !spirv.ptr<i32, Function>
      spirv.Return
    }
  }
}

// -----
module {
  func.func @foo(%arg0: i32) -> i32 {
    return %arg0 : i32
  }
}

