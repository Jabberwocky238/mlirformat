module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage], []> {
    spirv.func @composite_insert(%arg0: !spirv.struct<(f32, !spirv.struct<(!spirv.array<4 x f32>, f32)>)>, %arg1: !spirv.array<4 x f32>) -> !spirv.struct<(f32, !spirv.struct<(!spirv.array<4 x f32>, f32)>)> "None" {
      %0 = spirv.CompositeInsert %arg1, %arg0[1 : i32, 0 : i32] : !spirv.array<4 x f32> into !spirv.struct<(f32, !spirv.struct<(!spirv.array<4 x f32>, f32)>)>
      spirv.ReturnValue %0 : !spirv.struct<(f32, !spirv.struct<(!spirv.array<4 x f32>, f32)>)>
    }
    spirv.func @composite_construct_vector(%arg0: f32, %arg1: f32, %arg2: f32) -> vector<3xf32> "None" {
      %0 = spirv.CompositeConstruct %arg0, %arg1, %arg2 : (f32, f32, f32) -> vector<3xf32>
      spirv.ReturnValue %0 : vector<3xf32>
    }
    spirv.func @vector_dynamic_extract(%arg0: vector<4xf32>, %arg1: i32) -> f32 "None" {
      %0 = spirv.VectorExtractDynamic %arg0[%arg1] : vector<4xf32>, i32
      spirv.ReturnValue %0 : f32
    }
    spirv.func @vector_dynamic_insert(%arg0: f32, %arg1: vector<4xf32>, %arg2: i32) -> vector<4xf32> "None" {
      %0 = spirv.VectorInsertDynamic %arg0, %arg1[%arg2] : vector<4xf32>, i32
      spirv.ReturnValue %0 : vector<4xf32>
    }
    spirv.func @vector_shuffle(%arg0: vector<4xf32>, %arg1: vector<2xf32>) -> vector<3xf32> "None" {
      %0 = spirv.VectorShuffle [1 : i32, 3 : i32, -1 : i32] %arg0, %arg1 : vector<4xf32>, vector<2xf32> -> vector<3xf32>
      spirv.ReturnValue %0 : vector<3xf32>
    }
  }
}

