module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage, ExpectAssumeKHR], [SPV_KHR_expect_assume]> {
    spirv.func @assume_true(%arg0: i1) "None" {
      spirv.KHR.AssumeTrue %arg0
      spirv.Return
    }
    spirv.func @expect_scalar_int(%arg0: i32, %arg1: i32) -> i32 "None" {
      %0 = spirv.KHR.Expect %arg0, %arg1 : i32
      spirv.ReturnValue %0 : i32
    }
    spirv.func @expect_scalar_bool(%arg0: i1, %arg1: i1) -> i1 "None" {
      %0 = spirv.KHR.Expect %arg0, %arg1 : i1
      spirv.ReturnValue %0 : i1
    }
    spirv.func @expect_vector_int(%arg0: vector<4xi32>, %arg1: vector<4xi32>) -> vector<4xi32> "None" {
      %0 = spirv.KHR.Expect %arg0, %arg1 : vector<4xi32>
      spirv.ReturnValue %0 : vector<4xi32>
    }
    spirv.func @expect_vector_bool(%arg0: vector<4xi1>, %arg1: vector<4xi1>) -> vector<4xi1> "None" {
      %0 = spirv.KHR.Expect %arg0, %arg1 : vector<4xi1>
      spirv.ReturnValue %0 : vector<4xi1>
    }
  }
}

