module {
  spirv.module Logical GLSL450 {
    spirv.func @umul_extended_i32(%arg0: i32, %arg1: i32) -> !spirv.struct<(i32, i32)> "None" {
      %0 = spirv.UMulExtended %arg0, %arg1 : !spirv.struct<(i32, i32)>
      spirv.ReturnValue %0 : !spirv.struct<(i32, i32)>
    }
    spirv.func @umul_extended_vector_i32(%arg0: vector<3xi32>, %arg1: vector<3xi32>) -> !spirv.struct<(vector<3xi32>, vector<3xi32>)> "None" {
      %0 = spirv.UMulExtended %arg0, %arg1 : !spirv.struct<(vector<3xi32>, vector<3xi32>)>
      spirv.ReturnValue %0 : !spirv.struct<(vector<3xi32>, vector<3xi32>)>
    }
    spirv.func @umul_extended_i16(%arg0: i16) -> !spirv.struct<(i16, i16)> "None" {
      %0 = spirv.UMulExtended %arg0, %arg0 : !spirv.struct<(i16, i16)>
      spirv.ReturnValue %0 : !spirv.struct<(i16, i16)>
    }
    spirv.func @smul_extended_i32(%arg0: i32, %arg1: i32) -> !spirv.struct<(i32, i32)> "None" {
      %0 = spirv.SMulExtended %arg0, %arg1 : !spirv.struct<(i32, i32)>
      spirv.ReturnValue %0 : !spirv.struct<(i32, i32)>
    }
    spirv.func @smul_extended_vector_i32(%arg0: vector<3xi32>, %arg1: vector<3xi32>) -> !spirv.struct<(vector<3xi32>, vector<3xi32>)> "None" {
      %0 = spirv.SMulExtended %arg0, %arg1 : !spirv.struct<(vector<3xi32>, vector<3xi32>)>
      spirv.ReturnValue %0 : !spirv.struct<(vector<3xi32>, vector<3xi32>)>
    }
    spirv.func @smul_extended_i16(%arg0: i16) -> !spirv.struct<(i16, i16)> "None" {
      %0 = spirv.SMulExtended %arg0, %arg0 : !spirv.struct<(i16, i16)>
      spirv.ReturnValue %0 : !spirv.struct<(i16, i16)>
    }
    spirv.func @iaddcarry_i32(%arg0: i32, %arg1: i32) -> !spirv.struct<(i32, i32)> "None" {
      %0 = spirv.IAddCarry %arg0, %arg1 : !spirv.struct<(i32, i32)>
      spirv.ReturnValue %0 : !spirv.struct<(i32, i32)>
    }
    spirv.func @iaddcarry_vector_i32(%arg0: vector<3xi32>, %arg1: vector<3xi32>) -> !spirv.struct<(vector<3xi32>, vector<3xi32>)> "None" {
      %0 = spirv.IAddCarry %arg0, %arg1 : !spirv.struct<(vector<3xi32>, vector<3xi32>)>
      spirv.ReturnValue %0 : !spirv.struct<(vector<3xi32>, vector<3xi32>)>
    }
    spirv.func @iaddcarry_i16(%arg0: i16, %arg1: i16) -> !spirv.struct<(i16, i16)> "None" {
      %0 = spirv.IAddCarry %arg0, %arg1 : !spirv.struct<(i16, i16)>
      spirv.ReturnValue %0 : !spirv.struct<(i16, i16)>
    }
    spirv.func @is_inf_f32(%arg0: f32) -> i1 "None" {
      %0 = spirv.IsInf %arg0 : f32
      spirv.ReturnValue %0 : i1
    }
    spirv.func @is_inf_4xf32(%arg0: vector<4xf32>) -> vector<4xi1> "None" {
      %0 = spirv.IsInf %arg0 : vector<4xf32>
      spirv.ReturnValue %0 : vector<4xi1>
    }
    spirv.func @is_nan_f32(%arg0: f32) -> i1 "None" {
      %0 = spirv.IsNan %arg0 : f32
      spirv.ReturnValue %0 : i1
    }
    spirv.func @is_nan_4xf32(%arg0: vector<4xf32>) -> vector<4xi1> "None" {
      %0 = spirv.IsNan %arg0 : vector<4xf32>
      spirv.ReturnValue %0 : vector<4xi1>
    }
  }
}

