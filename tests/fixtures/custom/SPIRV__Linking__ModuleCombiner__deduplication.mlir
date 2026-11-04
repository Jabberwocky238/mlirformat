module {
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @foo bind(1, 0) : !spirv.ptr<f32, Input>
    spirv.func @use_foo() -> f32 "None" {
      %foo_addr = spirv.mlir.addressof @foo : !spirv.ptr<f32, Input>
      %0 = spirv.Load "Input" %foo_addr : f32
      spirv.ReturnValue %0 : f32
    }
  }
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @bar bind(1, 0) : !spirv.ptr<f32, Input>
    spirv.func @use_bar() -> f32 "None" {
      %bar_addr = spirv.mlir.addressof @bar : !spirv.ptr<f32, Input>
      %0 = spirv.Load "Input" %bar_addr : f32
      %1 = spirv.FAdd %0, %0 : f32
      spirv.ReturnValue %1 : f32
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @foo bind(1, 0) : !spirv.ptr<i32, Input>
  }
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @bar bind(1, 0) : !spirv.ptr<f32, Input>
    spirv.func @use_bar() -> f32 "None" {
      %bar_addr = spirv.mlir.addressof @bar : !spirv.ptr<f32, Input>
      %0 = spirv.Load "Input" %bar_addr : f32
      spirv.ReturnValue %0 : f32
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @foo built_in("GlobalInvocationId") : !spirv.ptr<vector<3xi32>, Input>
  }
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @bar built_in("GlobalInvocationId") : !spirv.ptr<vector<3xi32>, Input>
    spirv.func @use_bar() -> vector<3xi32> "None" {
      %bar_addr = spirv.mlir.addressof @bar : !spirv.ptr<vector<3xi32>, Input>
      %0 = spirv.Load "Input" %bar_addr : vector<3xi32>
      spirv.ReturnValue %0 : vector<3xi32>
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.SpecConstant @foo spec_id(5) = 1.000000e+00 : f32
    spirv.func @use_foo() -> f32 "None" {
      %0 = spirv.mlir.referenceof @foo : f32
      spirv.ReturnValue %0 : f32
    }
  }
  spirv.module Logical GLSL450 {
    spirv.SpecConstant @bar spec_id(5) = 1.000000e+00 : f32
    spirv.func @use_bar() -> f32 "None" {
      %0 = spirv.mlir.referenceof @bar : f32
      %1 = spirv.FAdd %0, %0 : f32
      spirv.ReturnValue %1 : f32
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.func @foo(%arg0: f32, %arg1: f32, %arg2: f32) -> f32 "None" {
      %0 = spirv.FAdd %arg0, %arg1 : f32
      %1 = spirv.FMul %0, %arg2 : f32
      spirv.ReturnValue %1 : f32
    }
  }
  spirv.module Logical GLSL450 {
    spirv.func @foo(%arg0: f32, %arg1: f32, %arg2: f32) -> f32 "None" {
      %0 = spirv.FAdd %arg0, %arg2 : f32
      %1 = spirv.FMul %0, %arg1 : f32
      spirv.ReturnValue %1 : f32
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.SpecConstant @bar spec_id(5) = 1.000000e+00 : f32
    spirv.func @foo(%arg0: f32) -> f32 "None" {
      spirv.ReturnValue %arg0 : f32
    }
    spirv.func @foo_duplicate(%arg0: f32) -> f32 "None" {
      spirv.ReturnValue %arg0 : f32
    }
    spirv.func @foo_different_body(%arg0: f32) -> f32 "None" {
      %0 = spirv.mlir.referenceof @bar : f32
      spirv.ReturnValue %arg0 : f32
    }
    spirv.func @baz(%arg0: i32) -> i32 "None" {
      spirv.ReturnValue %arg0 : i32
    }
    spirv.func @baz_no_return(%arg0: i32) "None" {
      spirv.Return
    }
    spirv.func @baz_no_return_duplicate(%arg0: i32) "None" {
      spirv.Return
    }
    spirv.func @baz_no_return_different_control(%arg0: i32) "Inline" {
      spirv.Return
    }
    spirv.func @baz_no_return_another_control(%arg0: i32) "Inline|Pure" {
      spirv.Return
    }
    spirv.func @kernel(%arg0: f32, %arg1: !spirv.ptr<!spirv.struct<(!spirv.array<12 x f32>)>, CrossWorkgroup>) "None" attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [32, 1, 1]>} {
      spirv.Return
    }
    spirv.func @kernel_different_attr(%arg0: f32, %arg1: !spirv.ptr<!spirv.struct<(!spirv.array<12 x f32>)>, CrossWorkgroup>) "None" attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [64, 1, 1]>} {
      spirv.Return
    }
  }
}

