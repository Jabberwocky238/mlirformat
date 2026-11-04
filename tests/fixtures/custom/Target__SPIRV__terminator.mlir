module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage], []> {
    spirv.func @ret() "None" {
      spirv.Return
    }
    spirv.func @ret_val() -> i32 "None" {
      %0 = spirv.Variable : !spirv.ptr<i32, Function>
      %1 = spirv.Load "Function" %0 : i32
      spirv.ReturnValue %1 : i32
    }
    spirv.func @unreachable() "None" {
      spirv.Return
    ^bb1:  // no predecessors
      spirv.Unreachable
    }
    spirv.func @kill() "None" {
      spirv.Kill
    }
  }
}

