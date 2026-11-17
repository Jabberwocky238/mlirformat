"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader], []>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.matrix<3 x vector<3xf32>>, f32) -> !spirv.matrix<3 x vector<3xf32>>, sym_name = "matrix_times_scalar_1"}> ({
    ^bb0(%arg14: !spirv.matrix<3 x vector<3xf32>> loc("<stdin>":4:10), %arg15: f32 loc("<stdin>":4:52)):
      %8 = "spirv.MatrixTimesScalar"(%arg14, %arg15) : (!spirv.matrix<3 x vector<3xf32>>, f32) -> !spirv.matrix<3 x vector<3xf32>> loc("<stdin>":5:12)
      "spirv.ReturnValue"(%8) : (!spirv.matrix<3 x vector<3xf32>>) -> () loc("<stdin>":6:7)
    }) : () -> () loc("<stdin>":3:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.coopmatrix<16x16xf16, Subgroup, MatrixA>, f16) -> !spirv.coopmatrix<16x16xf16, Subgroup, MatrixA>, sym_name = "matrix_times_scalar_2"}> ({
    ^bb0(%arg12: !spirv.coopmatrix<16x16xf16, Subgroup, MatrixA> loc("<stdin>":9:10), %arg13: f16 loc("<stdin>":9:67)):
      %7 = "spirv.MatrixTimesScalar"(%arg12, %arg13) : (!spirv.coopmatrix<16x16xf16, Subgroup, MatrixA>, f16) -> !spirv.coopmatrix<16x16xf16, Subgroup, MatrixA> loc("<stdin>":10:12)
      "spirv.ReturnValue"(%7) : (!spirv.coopmatrix<16x16xf16, Subgroup, MatrixA>) -> () loc("<stdin>":11:7)
    }) : () -> () loc("<stdin>":8:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.matrix<3 x vector<2xf32>>) -> !spirv.matrix<2 x vector<3xf32>>, sym_name = "matrix_transpose_1"}> ({
    ^bb0(%arg11: !spirv.matrix<3 x vector<2xf32>> loc("<stdin>":14:10)):
      %6 = "spirv.Transpose"(%arg11) : (!spirv.matrix<3 x vector<2xf32>>) -> !spirv.matrix<2 x vector<3xf32>> loc("<stdin>":15:12)
      "spirv.ReturnValue"(%6) : (!spirv.matrix<2 x vector<3xf32>>) -> () loc("<stdin>":16:7)
    }) : () -> () loc("<stdin>":13:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.matrix<3 x vector<3xf32>>) -> !spirv.matrix<3 x vector<3xf32>>, sym_name = "matrix_transpose_2"}> ({
    ^bb0(%arg10: !spirv.matrix<3 x vector<3xf32>> loc("<stdin>":19:10)):
      %5 = "spirv.Transpose"(%arg10) : (!spirv.matrix<3 x vector<3xf32>>) -> !spirv.matrix<3 x vector<3xf32>> loc("<stdin>":20:12)
      "spirv.ReturnValue"(%5) : (!spirv.matrix<3 x vector<3xf32>>) -> () loc("<stdin>":21:7)
    }) : () -> () loc("<stdin>":18:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.matrix<3 x vector<4xf32>>, vector<3xf32>) -> vector<4xf32>, sym_name = "matrix_times_vector_1"}> ({
    ^bb0(%arg8: !spirv.matrix<3 x vector<4xf32>> loc("<stdin>":24:10), %arg9: vector<3xf32> loc("<stdin>":24:51)):
      %4 = "spirv.MatrixTimesVector"(%arg8, %arg9) : (!spirv.matrix<3 x vector<4xf32>>, vector<3xf32>) -> vector<4xf32> loc("<stdin>":25:12)
      "spirv.ReturnValue"(%4) : (vector<4xf32>) -> () loc("<stdin>":26:7)
    }) : () -> () loc("<stdin>":23:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<3xf32>, !spirv.matrix<4 x vector<3xf32>>) -> vector<4xf32>, sym_name = "vector_times_matrix_1"}> ({
    ^bb0(%arg6: vector<3xf32> loc("<stdin>":29:10), %arg7: !spirv.matrix<4 x vector<3xf32>> loc("<stdin>":29:32)):
      %3 = "spirv.VectorTimesMatrix"(%arg6, %arg7) : (vector<3xf32>, !spirv.matrix<4 x vector<3xf32>>) -> vector<4xf32> loc("<stdin>":30:12)
      "spirv.ReturnValue"(%3) : (vector<4xf32>) -> () loc("<stdin>":31:7)
    }) : () -> () loc("<stdin>":28:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<3xf32>, vector<2xf32>) -> !spirv.matrix<2 x vector<3xf32>>, sym_name = "outer_product_1"}> ({
    ^bb0(%arg4: vector<3xf32> loc("<stdin>":34:10), %arg5: vector<2xf32> loc("<stdin>":34:32)):
      %2 = "spirv.OuterProduct"(%arg4, %arg5) : (vector<3xf32>, vector<2xf32>) -> !spirv.matrix<2 x vector<3xf32>> loc("<stdin>":35:12)
      "spirv.ReturnValue"(%2) : (!spirv.matrix<2 x vector<3xf32>>) -> () loc("<stdin>":36:7)
    }) : () -> () loc("<stdin>":33:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.matrix<3 x vector<3xf32>>, !spirv.matrix<3 x vector<3xf32>>) -> !spirv.matrix<3 x vector<3xf32>>, sym_name = "matrix_times_matrix_1"}> ({
    ^bb0(%arg2: !spirv.matrix<3 x vector<3xf32>> loc("<stdin>":39:10), %arg3: !spirv.matrix<3 x vector<3xf32>> loc("<stdin>":39:51)):
      %1 = "spirv.MatrixTimesMatrix"(%arg2, %arg3) : (!spirv.matrix<3 x vector<3xf32>>, !spirv.matrix<3 x vector<3xf32>>) -> !spirv.matrix<3 x vector<3xf32>> loc("<stdin>":40:12)
      "spirv.ReturnValue"(%1) : (!spirv.matrix<3 x vector<3xf32>>) -> () loc("<stdin>":41:7)
    }) : () -> () loc("<stdin>":38:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.matrix<3 x vector<2xf32>>, !spirv.matrix<2 x vector<3xf32>>) -> !spirv.matrix<2 x vector<2xf32>>, sym_name = "matrix_times_matrix_2"}> ({
    ^bb0(%arg0: !spirv.matrix<3 x vector<2xf32>> loc("<stdin>":44:10), %arg1: !spirv.matrix<2 x vector<3xf32>> loc("<stdin>":44:51)):
      %0 = "spirv.MatrixTimesMatrix"(%arg0, %arg1) : (!spirv.matrix<3 x vector<2xf32>>, !spirv.matrix<2 x vector<3xf32>>) -> !spirv.matrix<2 x vector<2xf32>> loc("<stdin>":45:12)
      "spirv.ReturnValue"(%0) : (!spirv.matrix<2 x vector<2xf32>>) -> () loc("<stdin>":46:7)
    }) : () -> () loc("<stdin>":43:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
