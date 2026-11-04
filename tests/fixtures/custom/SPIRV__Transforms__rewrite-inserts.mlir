module {
  spirv.module Logical GLSL450 {
    spirv.func @rewrite(%arg0: f32, %arg1: f32, %arg2: f32, %arg3: i32, %arg4: !spirv.array<3 x f32>) -> vector<3xf32> "None" {
      %0 = spirv.Undef : vector<3xf32>
      %1 = spirv.CompositeInsert %arg0, %0[0 : i32] : f32 into vector<3xf32>
      %2 = spirv.CompositeInsert %arg1, %1[1 : i32] : f32 into vector<3xf32>
      %3 = spirv.CompositeInsert %arg2, %2[2 : i32] : f32 into vector<3xf32>
      %4 = spirv.Undef : !spirv.array<4 x f32>
      %5 = spirv.CompositeInsert %arg0, %4[0 : i32] : f32 into !spirv.array<4 x f32>
      %6 = spirv.CompositeInsert %arg1, %5[1 : i32] : f32 into !spirv.array<4 x f32>
      %7 = spirv.CompositeInsert %arg2, %6[2 : i32] : f32 into !spirv.array<4 x f32>
      %8 = spirv.CompositeInsert %arg0, %7[3 : i32] : f32 into !spirv.array<4 x f32>
      %9 = spirv.Undef : !spirv.struct<(f32, i32, f32)>
      %10 = spirv.CompositeInsert %arg0, %9[0 : i32] : f32 into !spirv.struct<(f32, i32, f32)>
      %11 = spirv.CompositeInsert %arg3, %10[1 : i32] : i32 into !spirv.struct<(f32, i32, f32)>
      %12 = spirv.CompositeInsert %arg1, %11[2 : i32] : f32 into !spirv.struct<(f32, i32, f32)>
      %13 = spirv.Undef : !spirv.struct<(f32, !spirv.array<3 x f32>)>
      %14 = spirv.CompositeInsert %arg0, %13[0 : i32] : f32 into !spirv.struct<(f32, !spirv.array<3 x f32>)>
      %15 = spirv.CompositeInsert %arg4, %14[1 : i32] : !spirv.array<3 x f32> into !spirv.struct<(f32, !spirv.array<3 x f32>)>
      spirv.ReturnValue %3 : vector<3xf32>
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.func @insertCoopMatrix(%arg0: f32) -> !spirv.coopmatrix<4x4xf32, Subgroup, MatrixA> "None" {
      %0 = spirv.Undef : !spirv.coopmatrix<4x4xf32, Subgroup, MatrixA>
      %1 = spirv.CompositeInsert %arg0, %0[0 : i32] : f32 into !spirv.coopmatrix<4x4xf32, Subgroup, MatrixA>
      spirv.ReturnValue %1 : !spirv.coopmatrix<4x4xf32, Subgroup, MatrixA>
    }
  }
}

