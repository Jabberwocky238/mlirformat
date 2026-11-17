"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32, f32) -> vector<3xf32>, sym_name = "composite_construct_vector"}> ({
  ^bb0(%arg10: f32 loc("<stdin>":3:8), %arg11: f32 loc("<stdin>":3:21), %arg12: f32 loc("<stdin>":3:34)):
    %4 = "spirv.CompositeConstruct"(%arg10, %arg11, %arg12) : (f32, f32, f32) -> vector<3xf32> loc("<stdin>":4:10)
    "func.return"(%4) : (vector<3xf32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (bf16, bf16, bf16) -> vector<3xbf16>, sym_name = "composite_construct_bf16_vector"}> ({
  ^bb0(%arg7: bf16 loc("<stdin>":8:8), %arg8: bf16 loc("<stdin>":8:21), %arg9: bf16 loc("<stdin>":8:34)):
    %3 = "spirv.CompositeConstruct"(%arg7, %arg8, %arg9) : (bf16, bf16, bf16) -> vector<3xbf16> loc("<stdin>":9:10)
    "func.return"(%3) : (vector<3xbf16>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (vector<3xf32>, !spirv.array<4 x f32>, !spirv.struct<(f32)>) -> !spirv.struct<(vector<3xf32>, !spirv.array<4 x f32>, !spirv.struct<(f32)>)>, sym_name = "composite_construct_struct"}> ({
  ^bb0(%arg4: vector<3xf32> loc("<stdin>":13:8), %arg5: !spirv.array<4 x f32> loc("<stdin>":13:30), %arg6: !spirv.struct<(f32)> loc("<stdin>":13:60)):
    %2 = "spirv.CompositeConstruct"(%arg4, %arg5, %arg6) : (vector<3xf32>, !spirv.array<4 x f32>, !spirv.struct<(f32)>) -> !spirv.struct<(vector<3xf32>, !spirv.array<4 x f32>, !spirv.struct<(f32)>)> loc("<stdin>":14:10)
    "func.return"(%2) : (!spirv.struct<(vector<3xf32>, !spirv.array<4 x f32>, !spirv.struct<(f32)>)>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (f32, f32, vector<2xf32>) -> vector<4xf32>, sym_name = "composite_construct_mixed_scalar_vector"}> ({
  ^bb0(%arg1: f32 loc("<stdin>":18:8), %arg2: f32 loc("<stdin>":18:20), %arg3: vector<2xf32> loc("<stdin>":18:32)):
    %1 = "spirv.CompositeConstruct"(%arg1, %arg3, %arg2) : (f32, vector<2xf32>, f32) -> vector<4xf32> loc("<stdin>":19:10)
    "func.return"(%1) : (vector<4xf32>) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (f32) -> !spirv.coopmatrix<8x16xf32, Subgroup, MatrixA>, sym_name = "composite_construct_coopmatrix_khr"}> ({
  ^bb0(%arg0: f32 loc("<stdin>":23:8)):
    %0 = "spirv.CompositeConstruct"(%arg0) : (f32) -> !spirv.coopmatrix<8x16xf32, Subgroup, MatrixA> loc("<stdin>":24:10)
    "func.return"(%0) : (!spirv.coopmatrix<8x16xf32, Subgroup, MatrixA>) -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":22:3)
}) : () -> () loc("<stdin>":1:1)
