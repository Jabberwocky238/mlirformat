module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader], []> {
    spirv.func @matrix_times_scalar_1(%arg0: !spirv.matrix<3 x vector<3xf32>>, %arg1: f32) -> !spirv.matrix<3 x vector<3xf32>> "None" {
      %0 = spirv.MatrixTimesScalar %arg0, %arg1 : !spirv.matrix<3 x vector<3xf32>>, f32
      spirv.ReturnValue %0 : !spirv.matrix<3 x vector<3xf32>>
    }
    spirv.func @matrix_times_scalar_2(%arg0: !spirv.coopmatrix<16x16xf16, Subgroup, MatrixA>, %arg1: f16) -> !spirv.coopmatrix<16x16xf16, Subgroup, MatrixA> "None" {
      %0 = spirv.MatrixTimesScalar %arg0, %arg1 : !spirv.coopmatrix<16x16xf16, Subgroup, MatrixA>, f16
      spirv.ReturnValue %0 : !spirv.coopmatrix<16x16xf16, Subgroup, MatrixA>
    }
    spirv.func @matrix_transpose_1(%arg0: !spirv.matrix<3 x vector<2xf32>>) -> !spirv.matrix<2 x vector<3xf32>> "None" {
      %0 = spirv.Transpose %arg0 : !spirv.matrix<3 x vector<2xf32>> -> !spirv.matrix<2 x vector<3xf32>>
      spirv.ReturnValue %0 : !spirv.matrix<2 x vector<3xf32>>
    }
    spirv.func @matrix_transpose_2(%arg0: !spirv.matrix<3 x vector<3xf32>>) -> !spirv.matrix<3 x vector<3xf32>> "None" {
      %0 = spirv.Transpose %arg0 : !spirv.matrix<3 x vector<3xf32>> -> !spirv.matrix<3 x vector<3xf32>>
      spirv.ReturnValue %0 : !spirv.matrix<3 x vector<3xf32>>
    }
    spirv.func @matrix_times_vector_1(%arg0: !spirv.matrix<3 x vector<4xf32>>, %arg1: vector<3xf32>) -> vector<4xf32> "None" {
      %0 = spirv.MatrixTimesVector %arg0, %arg1 : !spirv.matrix<3 x vector<4xf32>>, vector<3xf32> -> vector<4xf32>
      spirv.ReturnValue %0 : vector<4xf32>
    }
    spirv.func @vector_times_matrix_1(%arg0: vector<3xf32>, %arg1: !spirv.matrix<4 x vector<3xf32>>) -> vector<4xf32> "None" {
      %0 = spirv.VectorTimesMatrix %arg0, %arg1 : vector<3xf32>, !spirv.matrix<4 x vector<3xf32>> -> vector<4xf32>
      spirv.ReturnValue %0 : vector<4xf32>
    }
    spirv.func @matrix_times_matrix_1(%arg0: !spirv.matrix<3 x vector<3xf32>>, %arg1: !spirv.matrix<3 x vector<3xf32>>) -> !spirv.matrix<3 x vector<3xf32>> "None" {
      %0 = spirv.MatrixTimesMatrix %arg0, %arg1 : !spirv.matrix<3 x vector<3xf32>>, !spirv.matrix<3 x vector<3xf32>> -> !spirv.matrix<3 x vector<3xf32>>
      spirv.ReturnValue %0 : !spirv.matrix<3 x vector<3xf32>>
    }
    spirv.func @matrix_times_matrix_2(%arg0: !spirv.matrix<3 x vector<2xf32>>, %arg1: !spirv.matrix<2 x vector<3xf32>>) -> !spirv.matrix<2 x vector<2xf32>> "None" {
      %0 = spirv.MatrixTimesMatrix %arg0, %arg1 : !spirv.matrix<3 x vector<2xf32>>, !spirv.matrix<2 x vector<3xf32>> -> !spirv.matrix<2 x vector<2xf32>>
      spirv.ReturnValue %0 : !spirv.matrix<2 x vector<2xf32>>
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
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
