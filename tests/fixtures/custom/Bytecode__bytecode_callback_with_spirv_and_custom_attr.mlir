module {
  spirv.module Logical GLSL450 {
    spirv.func @callee() "None" {
      spirv.Kill
    }
    spirv.func @caller() "None" {
      spirv.FunctionCall @callee() : () -> ()
      spirv.Return
    }
  }
  "test.versionedC"() <{attribute = #test.attr_params<42, 24>}> : () -> ()
}

