"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader], []>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.matrix<3 x vector<3xf32>>, f32) -> !spirv.matrix<3 x vector<3xf32>>, sym_name = "matrix_times_scalar_1"}> ({
    ^bb0(%arg12: !spirv.matrix<3 x vector<3xf32>>, %arg13: f32):
      %7 = "spirv.MatrixTimesScalar"(%arg12, %arg13) : (!spirv.matrix<3 x vector<3xf32>>, f32) -> !spirv.matrix<3 x vector<3xf32>>
      "spirv.ReturnValue"(%7) : (!spirv.matrix<3 x vector<3xf32>>) -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.coopmatrix<16x16xf16, Subgroup, MatrixA>, f16) -> !spirv.coopmatrix<16x16xf16, Subgroup, MatrixA>, sym_name = "matrix_times_scalar_2"}> ({
    ^bb0(%arg10: !spirv.coopmatrix<16x16xf16, Subgroup, MatrixA>, %arg11: f16):
      %6 = "spirv.MatrixTimesScalar"(%arg10, %arg11) : (!spirv.coopmatrix<16x16xf16, Subgroup, MatrixA>, f16) -> !spirv.coopmatrix<16x16xf16, Subgroup, MatrixA>
      "spirv.ReturnValue"(%6) : (!spirv.coopmatrix<16x16xf16, Subgroup, MatrixA>) -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.matrix<3 x vector<2xf32>>) -> !spirv.matrix<2 x vector<3xf32>>, sym_name = "matrix_transpose_1"}> ({
    ^bb0(%arg9: !spirv.matrix<3 x vector<2xf32>>):
      %5 = "spirv.Transpose"(%arg9) : (!spirv.matrix<3 x vector<2xf32>>) -> !spirv.matrix<2 x vector<3xf32>>
      "spirv.ReturnValue"(%5) : (!spirv.matrix<2 x vector<3xf32>>) -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.matrix<3 x vector<3xf32>>) -> !spirv.matrix<3 x vector<3xf32>>, sym_name = "matrix_transpose_2"}> ({
    ^bb0(%arg8: !spirv.matrix<3 x vector<3xf32>>):
      %4 = "spirv.Transpose"(%arg8) : (!spirv.matrix<3 x vector<3xf32>>) -> !spirv.matrix<3 x vector<3xf32>>
      "spirv.ReturnValue"(%4) : (!spirv.matrix<3 x vector<3xf32>>) -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.matrix<3 x vector<4xf32>>, vector<3xf32>) -> vector<4xf32>, sym_name = "matrix_times_vector_1"}> ({
    ^bb0(%arg6: !spirv.matrix<3 x vector<4xf32>>, %arg7: vector<3xf32>):
      %3 = "spirv.MatrixTimesVector"(%arg6, %arg7) : (!spirv.matrix<3 x vector<4xf32>>, vector<3xf32>) -> vector<4xf32>
      "spirv.ReturnValue"(%3) : (vector<4xf32>) -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<3xf32>, !spirv.matrix<4 x vector<3xf32>>) -> vector<4xf32>, sym_name = "vector_times_matrix_1"}> ({
    ^bb0(%arg4: vector<3xf32>, %arg5: !spirv.matrix<4 x vector<3xf32>>):
      %2 = "spirv.VectorTimesMatrix"(%arg4, %arg5) : (vector<3xf32>, !spirv.matrix<4 x vector<3xf32>>) -> vector<4xf32>
      "spirv.ReturnValue"(%2) : (vector<4xf32>) -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.matrix<3 x vector<3xf32>>, !spirv.matrix<3 x vector<3xf32>>) -> !spirv.matrix<3 x vector<3xf32>>, sym_name = "matrix_times_matrix_1"}> ({
    ^bb0(%arg2: !spirv.matrix<3 x vector<3xf32>>, %arg3: !spirv.matrix<3 x vector<3xf32>>):
      %1 = "spirv.MatrixTimesMatrix"(%arg2, %arg3) : (!spirv.matrix<3 x vector<3xf32>>, !spirv.matrix<3 x vector<3xf32>>) -> !spirv.matrix<3 x vector<3xf32>>
      "spirv.ReturnValue"(%1) : (!spirv.matrix<3 x vector<3xf32>>) -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.matrix<3 x vector<2xf32>>, !spirv.matrix<2 x vector<3xf32>>) -> !spirv.matrix<2 x vector<2xf32>>, sym_name = "matrix_times_matrix_2"}> ({
    ^bb0(%arg0: !spirv.matrix<3 x vector<2xf32>>, %arg1: !spirv.matrix<2 x vector<3xf32>>):
      %0 = "spirv.MatrixTimesMatrix"(%arg0, %arg1) : (!spirv.matrix<3 x vector<2xf32>>, !spirv.matrix<2 x vector<3xf32>>) -> !spirv.matrix<2 x vector<2xf32>>
      "spirv.ReturnValue"(%0) : (!spirv.matrix<2 x vector<2xf32>>) -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

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
