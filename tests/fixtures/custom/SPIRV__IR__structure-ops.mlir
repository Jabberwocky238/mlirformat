module {
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @var1 : !spirv.ptr<!spirv.struct<(f32, !spirv.array<4 x f32>)>, Input>
    spirv.func @access_chain() "None" {
      %cst1_i32 = spirv.Constant 1 : i32
      %var1_addr = spirv.mlir.addressof @var1 : !spirv.ptr<!spirv.struct<(f32, !spirv.array<4 x f32>)>, Input>
      %0 = spirv.AccessChain %var1_addr[%cst1_i32, %cst1_i32] : !spirv.ptr<!spirv.struct<(f32, !spirv.array<4 x f32>)>, Input>, i32, i32 -> !spirv.ptr<f32, Input>
      spirv.Return
    }
  }
}

// -----
module {
  spirv.GlobalVariable @var : !spirv.ptr<!spirv.struct<(f32, !spirv.array<4 x f32>)>, Input>
  func.func @addressof() {
    %var_addr = spirv.mlir.addressof @var : !spirv.ptr<!spirv.struct<(f32, !spirv.array<4 x f32>)>, Input>
    return
  }
}

// -----
// -----
// -----
module {
  func.func @const() {
    %true = spirv.Constant true
    %cst42_i32 = spirv.Constant 42 : i32
    %cst_f32 = spirv.Constant 5.000000e-01 : f32
    %cst_vec_2xi32 = spirv.Constant dense<[2, 3]> : vector<2xi32>
    %cst = spirv.Constant [dense<3.000000e+00> : vector<2xf32>] : !spirv.array<1 x vector<2xf32>>
    %cst_0 = spirv.Constant dense<1> : tensor<2x3xi32> : !spirv.array<2 x !spirv.array<3 x i32>>
    %cst_1 = spirv.Constant dense<1.000000e+00> : tensor<2x3xf32> : !spirv.array<2 x !spirv.array<3 x f32>>
    %cst_2 = spirv.Constant dense<[[1, 2, 3], [4, 5, 6]]> : tensor<2x3xi32> : !spirv.array<2 x !spirv.array<3 x i32>>
    %cst_3 = spirv.Constant dense<[[1.000000e+00, 2.000000e+00, 3.000000e+00], [4.000000e+00, 5.000000e+00, 6.000000e+00]]> : tensor<2x3xf32> : !spirv.array<2 x !spirv.array<3 x f32>>
    %cst_4 = spirv.Constant [[dense<3.000000e+00> : vector<2xf32>]] : !spirv.array<1 x !spirv.array<1 x vector<2xf32>>>
    %cst_5 = spirv.Constant dense<0.000000e+00> : !spirv.coopmatrix<16x16xf32, Subgroup, MatrixAcc>
    %cst_6 = spirv.Constant dense<4.200000e+00> : !spirv.coopmatrix<16x16xf32, Subgroup, MatrixAcc>
    %cst_7 = spirv.Constant dense<0> : !spirv.coopmatrix<16x16xi8, Subgroup, MatrixAcc>
    %cst_8 = spirv.Constant dense<4> : !spirv.coopmatrix<16x16xi8, Subgroup, MatrixAcc>
    return
  }
}

// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
module {
  spirv.module Logical GLSL450 {
    spirv.func @do_nothing() "None" {
      spirv.Return
    }
    spirv.EntryPoint "GLCompute" @do_nothing
  }
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @var2 : !spirv.ptr<f32, Input>
    spirv.GlobalVariable @var3 : !spirv.ptr<f32, Output>
    spirv.func @do_something(%arg0: !spirv.ptr<f32, Input>, %arg1: !spirv.ptr<f32, Output>) "None" {
      %0 = spirv.Load "Input" %arg0 : f32
      spirv.Store "Output" %arg1, %0 : f32
      spirv.Return
    }
    spirv.EntryPoint "GLCompute" @do_something, @var2, @var3
  }
}

// -----
// -----
// -----
// -----
// -----
// -----
module {
  spirv.module Logical GLSL450 {
    spirv.func @do_nothing() "None" {
      spirv.Return
    }
    spirv.EntryPoint "GLCompute" @do_nothing
    spirv.ExecutionMode @do_nothing "ContractionOff"
  }
  spirv.module Logical GLSL450 {
    spirv.func @do_nothing() "None" {
      spirv.Return
    }
    spirv.EntryPoint "GLCompute" @do_nothing
    spirv.ExecutionMode @do_nothing "LocalSizeHint", 3, 4, 5
  }
}

// -----
// -----
module {
  spirv.func @foo() "None"
  spirv.func @bar(%arg0: i32) -> i32 "Inline|Pure" {
    spirv.ReturnValue %arg0 : i32
  }
  spirv.func @baz(%arg0: i32) "DontInline" attributes {additional_stuff = 64 : i64} {
    spirv.Return
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage], []> {
    spirv.func @outside.func.with.linkage(i8) "Pure" attributes {linkage_attributes = #spirv.linkage_attributes<linkage_name = "outside.func", linkage_type = <Import>>}
    spirv.func @inside.func() "Pure" {
      spirv.Return
    }
  }
}

// -----
// -----
// -----
// -----
// -----
// -----
module {
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @var0 : !spirv.ptr<f32, Input>
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.SpecConstant @sc = 4.000000e+00 : f32
    spirv.GlobalVariable @var initializer(@sc) : !spirv.ptr<f32, Private>
  }
}

// -----
module {
  spirv.SpecConstant @sc = 4.000000e+00 : f32
  spirv.GlobalVariable @var initializer(@sc) : !spirv.ptr<f32, Private>
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.SpecConstant @sc1 = 1 : i8
    spirv.SpecConstant @sc2 = 2 : i8
    spirv.SpecConstant @sc3 = 3 : i8
    spirv.SpecConstantComposite @scc (@sc1, @sc2, @sc3) : !spirv.array<3 x i8>
    spirv.GlobalVariable @var initializer(@scc) : !spirv.ptr<!spirv.array<3 x i8>, Private>
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @var0 bind(1, 2) : !spirv.ptr<f32, Uniform>
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @var1 built_in("GlobalInvocationID") : !spirv.ptr<vector<3xi32>, Input>
    spirv.GlobalVariable @var2 built_in("GlobalInvocationID") : !spirv.ptr<vector<3xi32>, Input>
  }
}

// -----
module {
  spirv.GlobalVariable @var0 : !spirv.ptr<f32, Input>
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage], []> {
    spirv.GlobalVariable @var1 {linkage_attributes = #spirv.linkage_attributes<linkage_name = "outSideGlobalVar1", linkage_type = <Import>>} : !spirv.ptr<f32, Private>
  }
}

// -----
// -----
// -----
// -----
// -----
// -----
// -----
module {
  spirv.module Logical GLSL450 {
  }
  spirv.module @name Logical GLSL450 {
  }
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader], [SPV_KHR_16bit_storage]> {
  }
  spirv.module Logical GLSL450 attributes {foo = "bar"} {
  }
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader], [SPV_KHR_16bit_storage]> attributes {foo = "bar"} {
  }
  spirv.module Logical GLSL450 {
    spirv.func @do_nothing() "None" {
      spirv.Return
    }
  }
}

// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
module {
  spirv.module Logical GLSL450 {
    spirv.SpecConstant @sc1 = false
    spirv.SpecConstant @sc2 = 42 : i64
    spirv.SpecConstant @sc3 = 1.500000e+00 : f32
    spirv.SpecConstantComposite @scc (@sc1, @sc2, @sc3) : !spirv.struct<(i1, i64, f32)>
    spirv.func @reference() -> i1 "None" {
      %0 = spirv.mlir.referenceof @sc1 : i1
      spirv.ReturnValue %0 : i1
    }
    spirv.func @reference_composite() -> i1 "None" {
      %0 = spirv.mlir.referenceof @scc : !spirv.struct<(i1, i64, f32)>
      %1 = spirv.CompositeExtract %0[0 : i32] : !spirv.struct<(i1, i64, f32)>
      spirv.ReturnValue %1 : i1
    }
    spirv.func @initialize() -> i64 "None" {
      %0 = spirv.mlir.referenceof @sc2 : i64
      %1 = spirv.Variable init(%0) : !spirv.ptr<i64, Function>
      %2 = spirv.Load "Function" %1 : i64
      spirv.ReturnValue %2 : i64
    }
    spirv.func @compute() -> f32 "None" {
      %0 = spirv.mlir.referenceof @sc3 : f32
      %cst_f32 = spirv.Constant 6.000000e+00 : f32
      %1 = spirv.FAdd %0, %cst_f32 : f32
      spirv.ReturnValue %1 : f32
    }
  }
}

// -----
module {
  spirv.SpecConstant @sc = 5 : i32
  func.func @reference_of() {
    %0 = spirv.mlir.referenceof @sc : i32
    return
  }
}

// -----
module {
  spirv.SpecConstant @sc = 5 : i32
  spirv.SpecConstantComposite @scc (@sc) : !spirv.array<1 x i32>
  func.func @reference_of_composite() {
    %0 = spirv.mlir.referenceof @scc : !spirv.array<1 x i32>
    %1 = spirv.CompositeExtract %0[0 : i32] : !spirv.array<1 x i32>
    return
  }
}

// -----
// -----
// -----
// -----
module {
  spirv.module Logical GLSL450 {
    spirv.SpecConstant @sc1 = false
    spirv.SpecConstant @sc2 spec_id(5) = 42 : i64
    spirv.SpecConstant @sc3 = 1.500000e+00 : f32
  }
}

// -----
// -----
// -----
// -----
// -----
// -----
module {
  spirv.module Logical GLSL450 {
    spirv.SpecConstant @sc1 = 1.500000e+00 : f32
    spirv.SpecConstant @sc2 = 2.500000e+00 : f32
    spirv.SpecConstant @sc3 = 3.500000e+00 : f32
    spirv.SpecConstantComposite @scc (@sc1, @sc2, @sc3) : !spirv.array<3 x f32>
  }
}

// -----
// -----
// -----
module {
  spirv.module Logical GLSL450 {
    spirv.SpecConstant @sc1 = 1 : i32
    spirv.SpecConstant @sc2 = 2.500000e+00 : f32
    spirv.SpecConstant @sc3 = 3.500000e+00 : f32
    spirv.SpecConstantComposite @scc (@sc1, @sc2, @sc3) : !spirv.struct<(i32, f32, f32)>
  }
}

// -----
// -----
// -----
module {
  spirv.module Logical GLSL450 {
    spirv.SpecConstant @sc1 = 1.500000e+00 : f32
    spirv.SpecConstant @sc2 = 2.500000e+00 : f32
    spirv.SpecConstant @sc3 = 3.500000e+00 : f32
    spirv.SpecConstantComposite @scc (@sc1, @sc2, @sc3) : vector<3xf32>
  }
}

// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
module {
  spirv.module Logical GLSL450 {
    spirv.func @foo() -> i32 "None" {
      %cst1_i32 = spirv.Constant 1 : i32
      %cst1_i32_0 = spirv.Constant 1 : i32
      %0 = spirv.SpecConstantOperation wraps "spirv.IAdd"(%cst1_i32, %cst1_i32_0) : (i32, i32) -> i32
      spirv.ReturnValue %0 : i32
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.SpecConstant @sc = 42 : i32
    spirv.func @foo() -> i32 "None" {
      %0 = spirv.mlir.referenceof @sc : i32
      %1 = spirv.SpecConstantOperation wraps "spirv.ISub"(%0, %0) : (i32, i32) -> i32
      spirv.ReturnValue %1 : i32
    }
  }
}

// -----
// -----
// -----
