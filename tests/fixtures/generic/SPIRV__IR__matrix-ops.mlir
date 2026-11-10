"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader], []>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.matrix<3 x vector<3xf32>>, f32) -> !spirv.matrix<3 x vector<3xf32>>, sym_name = "matrix_times_scalar_1"}> ({
    ^bb0(%arg14: !spirv.matrix<3 x vector<3xf32>>, %arg15: f32):
      %8 = "spirv.MatrixTimesScalar"(%arg14, %arg15) : (!spirv.matrix<3 x vector<3xf32>>, f32) -> !spirv.matrix<3 x vector<3xf32>>
      "spirv.ReturnValue"(%8) : (!spirv.matrix<3 x vector<3xf32>>) -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.coopmatrix<16x16xf16, Subgroup, MatrixA>, f16) -> !spirv.coopmatrix<16x16xf16, Subgroup, MatrixA>, sym_name = "matrix_times_scalar_2"}> ({
    ^bb0(%arg12: !spirv.coopmatrix<16x16xf16, Subgroup, MatrixA>, %arg13: f16):
      %7 = "spirv.MatrixTimesScalar"(%arg12, %arg13) : (!spirv.coopmatrix<16x16xf16, Subgroup, MatrixA>, f16) -> !spirv.coopmatrix<16x16xf16, Subgroup, MatrixA>
      "spirv.ReturnValue"(%7) : (!spirv.coopmatrix<16x16xf16, Subgroup, MatrixA>) -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.matrix<3 x vector<2xf32>>) -> !spirv.matrix<2 x vector<3xf32>>, sym_name = "matrix_transpose_1"}> ({
    ^bb0(%arg11: !spirv.matrix<3 x vector<2xf32>>):
      %6 = "spirv.Transpose"(%arg11) : (!spirv.matrix<3 x vector<2xf32>>) -> !spirv.matrix<2 x vector<3xf32>>
      "spirv.ReturnValue"(%6) : (!spirv.matrix<2 x vector<3xf32>>) -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.matrix<3 x vector<3xf32>>) -> !spirv.matrix<3 x vector<3xf32>>, sym_name = "matrix_transpose_2"}> ({
    ^bb0(%arg10: !spirv.matrix<3 x vector<3xf32>>):
      %5 = "spirv.Transpose"(%arg10) : (!spirv.matrix<3 x vector<3xf32>>) -> !spirv.matrix<3 x vector<3xf32>>
      "spirv.ReturnValue"(%5) : (!spirv.matrix<3 x vector<3xf32>>) -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.matrix<3 x vector<4xf32>>, vector<3xf32>) -> vector<4xf32>, sym_name = "matrix_times_vector_1"}> ({
    ^bb0(%arg8: !spirv.matrix<3 x vector<4xf32>>, %arg9: vector<3xf32>):
      %4 = "spirv.MatrixTimesVector"(%arg8, %arg9) : (!spirv.matrix<3 x vector<4xf32>>, vector<3xf32>) -> vector<4xf32>
      "spirv.ReturnValue"(%4) : (vector<4xf32>) -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<3xf32>, !spirv.matrix<4 x vector<3xf32>>) -> vector<4xf32>, sym_name = "vector_times_matrix_1"}> ({
    ^bb0(%arg6: vector<3xf32>, %arg7: !spirv.matrix<4 x vector<3xf32>>):
      %3 = "spirv.VectorTimesMatrix"(%arg6, %arg7) : (vector<3xf32>, !spirv.matrix<4 x vector<3xf32>>) -> vector<4xf32>
      "spirv.ReturnValue"(%3) : (vector<4xf32>) -> ()
    }) : () -> ()
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<3xf32>, vector<2xf32>) -> !spirv.matrix<2 x vector<3xf32>>, sym_name = "outer_product_1"}> ({
    ^bb0(%arg4: vector<3xf32>, %arg5: vector<2xf32>):
      %2 = "spirv.OuterProduct"(%arg4, %arg5) : (vector<3xf32>, vector<2xf32>) -> !spirv.matrix<2 x vector<3xf32>>
      "spirv.ReturnValue"(%2) : (!spirv.matrix<2 x vector<3xf32>>) -> ()
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
// -----
// -----
// -----
// -----
