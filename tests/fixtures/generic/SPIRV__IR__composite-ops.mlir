"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32, f32) -> vector<3xf32>, sym_name = "composite_construct_vector"}> ({
  ^bb0(%arg10: f32, %arg11: f32, %arg12: f32):
    %4 = "spirv.CompositeConstruct"(%arg10, %arg11, %arg12) : (f32, f32, f32) -> vector<3xf32>
    "func.return"(%4) : (vector<3xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (bf16, bf16, bf16) -> vector<3xbf16>, sym_name = "composite_construct_bf16_vector"}> ({
  ^bb0(%arg7: bf16, %arg8: bf16, %arg9: bf16):
    %3 = "spirv.CompositeConstruct"(%arg7, %arg8, %arg9) : (bf16, bf16, bf16) -> vector<3xbf16>
    "func.return"(%3) : (vector<3xbf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf32>, !spirv.array<4 x f32>, !spirv.struct<(f32)>) -> !spirv.struct<(vector<3xf32>, !spirv.array<4 x f32>, !spirv.struct<(f32)>)>, sym_name = "composite_construct_struct"}> ({
  ^bb0(%arg4: vector<3xf32>, %arg5: !spirv.array<4 x f32>, %arg6: !spirv.struct<(f32)>):
    %2 = "spirv.CompositeConstruct"(%arg4, %arg5, %arg6) : (vector<3xf32>, !spirv.array<4 x f32>, !spirv.struct<(f32)>) -> !spirv.struct<(vector<3xf32>, !spirv.array<4 x f32>, !spirv.struct<(f32)>)>
    "func.return"(%2) : (!spirv.struct<(vector<3xf32>, !spirv.array<4 x f32>, !spirv.struct<(f32)>)>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, f32, vector<2xf32>) -> vector<4xf32>, sym_name = "composite_construct_mixed_scalar_vector"}> ({
  ^bb0(%arg1: f32, %arg2: f32, %arg3: vector<2xf32>):
    %1 = "spirv.CompositeConstruct"(%arg1, %arg3, %arg2) : (f32, vector<2xf32>, f32) -> vector<4xf32>
    "func.return"(%1) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> !spirv.coopmatrix<8x16xf32, Subgroup, MatrixA>, sym_name = "composite_construct_coopmatrix_khr"}> ({
  ^bb0(%arg0: f32):
    %0 = "spirv.CompositeConstruct"(%arg0) : (f32) -> !spirv.coopmatrix<8x16xf32, Subgroup, MatrixA>
    "func.return"(%0) : (!spirv.coopmatrix<8x16xf32, Subgroup, MatrixA>) -> ()
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
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.array<4 x f32>) -> f32, sym_name = "composite_extract_array"}> ({
  ^bb0(%arg0: !spirv.array<4 x f32>):
    %0 = "spirv.CompositeExtract"(%arg0) <{indices = [1 : i32]}> : (!spirv.array<4 x f32>) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.struct<(f32, !spirv.array<4 x f32>)>) -> f32, sym_name = "composite_extract_struct"}> ({
  ^bb0(%arg0: !spirv.struct<(f32, !spirv.array<4 x f32>)>):
    %0 = "spirv.CompositeExtract"(%arg0) <{indices = [1 : i32, 2 : i32]}> : (!spirv.struct<(f32, !spirv.array<4 x f32>)>) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf32>) -> f32, sym_name = "composite_extract_vector"}> ({
  ^bb0(%arg0: vector<4xf32>):
    %0 = "spirv.CompositeExtract"(%arg0) <{indices = [1 : i32]}> : (vector<4xf32>) -> f32
    "func.return"(%0) : (f32) -> ()
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
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.array<4 x f32>, f32) -> !spirv.array<4 x f32>, sym_name = "composite_insert_array"}> ({
  ^bb0(%arg0: !spirv.array<4 x f32>, %arg1: f32):
    %0 = "spirv.CompositeInsert"(%arg1, %arg0) <{indices = [1 : i32]}> : (f32, !spirv.array<4 x f32>) -> !spirv.array<4 x f32>
    "func.return"(%0) : (!spirv.array<4 x f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.struct<(!spirv.array<4 x f32>, f32)>, !spirv.array<4 x f32>) -> !spirv.struct<(!spirv.array<4 x f32>, f32)>, sym_name = "composite_insert_struct"}> ({
  ^bb0(%arg0: !spirv.struct<(!spirv.array<4 x f32>, f32)>, %arg1: !spirv.array<4 x f32>):
    %0 = "spirv.CompositeInsert"(%arg1, %arg0) <{indices = [0 : i32]}> : (!spirv.array<4 x f32>, !spirv.struct<(!spirv.array<4 x f32>, f32)>) -> !spirv.struct<(!spirv.array<4 x f32>, f32)>
    "func.return"(%0) : (!spirv.struct<(!spirv.array<4 x f32>, f32)>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf32>, i32) -> f32, sym_name = "vector_dynamic_extract"}> ({
  ^bb0(%arg18: vector<4xf32>, %arg19: i32):
    %7 = "spirv.VectorExtractDynamic"(%arg18, %arg19) : (vector<4xf32>, i32) -> f32
    "func.return"(%7) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xbf16>, i32) -> bf16, sym_name = "vector_dynamic_extract_bf16"}> ({
  ^bb0(%arg16: vector<4xbf16>, %arg17: i32):
    %6 = "spirv.VectorExtractDynamic"(%arg16, %arg17) : (vector<4xbf16>, i32) -> bf16
    "func.return"(%6) : (bf16) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf8E5M2>, i32) -> f8E5M2, sym_name = "vector_dynamic_extract_f8E5M2"}> ({
  ^bb0(%arg14: vector<4xf8E5M2>, %arg15: i32):
    %5 = "spirv.VectorExtractDynamic"(%arg14, %arg15) : (vector<4xf8E5M2>, i32) -> f8E5M2
    "func.return"(%5) : (f8E5M2) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf8E4M3FN>, i32) -> f8E4M3FN, sym_name = "vector_dynamic_extract_f8E4M3FN"}> ({
  ^bb0(%arg12: vector<4xf8E4M3FN>, %arg13: i32):
    %4 = "spirv.VectorExtractDynamic"(%arg12, %arg13) : (vector<4xf8E4M3FN>, i32) -> f8E4M3FN
    "func.return"(%4) : (f8E4M3FN) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<4xf32>, i32) -> vector<4xf32>, sym_name = "vector_dynamic_insert"}> ({
  ^bb0(%arg9: f32, %arg10: vector<4xf32>, %arg11: i32):
    %3 = "spirv.VectorInsertDynamic"(%arg10, %arg9, %arg11) : (vector<4xf32>, f32, i32) -> vector<4xf32>
    "func.return"(%3) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (bf16, vector<4xbf16>, i32) -> vector<4xbf16>, sym_name = "vector_dynamic_insert_bf16"}> ({
  ^bb0(%arg6: bf16, %arg7: vector<4xbf16>, %arg8: i32):
    %2 = "spirv.VectorInsertDynamic"(%arg7, %arg6, %arg8) : (vector<4xbf16>, bf16, i32) -> vector<4xbf16>
    "func.return"(%2) : (vector<4xbf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f8E5M2, vector<4xf8E5M2>, i32) -> vector<4xf8E5M2>, sym_name = "vector_dynamic_insert_f8E5M2"}> ({
  ^bb0(%arg3: f8E5M2, %arg4: vector<4xf8E5M2>, %arg5: i32):
    %1 = "spirv.VectorInsertDynamic"(%arg4, %arg3, %arg5) : (vector<4xf8E5M2>, f8E5M2, i32) -> vector<4xf8E5M2>
    "func.return"(%1) : (vector<4xf8E5M2>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f8E4M3FN, vector<4xf8E4M3FN>, i32) -> vector<4xf8E4M3FN>, sym_name = "vector_dynamic_insert_f8E4M3FN"}> ({
  ^bb0(%arg0: f8E4M3FN, %arg1: vector<4xf8E4M3FN>, %arg2: i32):
    %0 = "spirv.VectorInsertDynamic"(%arg1, %arg0, %arg2) : (vector<4xf8E4M3FN>, f8E4M3FN, i32) -> vector<4xf8E4M3FN>
    "func.return"(%0) : (vector<4xf8E4M3FN>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf32>, vector<2xf32>) -> vector<3xf32>, sym_name = "vector_shuffle"}> ({
  ^bb0(%arg6: vector<4xf32>, %arg7: vector<2xf32>):
    %3 = "spirv.VectorShuffle"(%arg6, %arg7) <{components = [1 : i32, 3 : i32, -1 : i32]}> : (vector<4xf32>, vector<2xf32>) -> vector<3xf32>
    "func.return"(%3) : (vector<3xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xbf16>, vector<2xbf16>) -> vector<3xbf16>, sym_name = "vector_shuffle_bf16"}> ({
  ^bb0(%arg4: vector<4xbf16>, %arg5: vector<2xbf16>):
    %2 = "spirv.VectorShuffle"(%arg4, %arg5) <{components = [1 : i32, 3 : i32, -1 : i32]}> : (vector<4xbf16>, vector<2xbf16>) -> vector<3xbf16>
    "func.return"(%2) : (vector<3xbf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf8E5M2>, vector<2xf8E5M2>) -> vector<3xf8E5M2>, sym_name = "vector_shuffle_f8E5M2"}> ({
  ^bb0(%arg2: vector<4xf8E5M2>, %arg3: vector<2xf8E5M2>):
    %1 = "spirv.VectorShuffle"(%arg2, %arg3) <{components = [1 : i32, 3 : i32, -1 : i32]}> : (vector<4xf8E5M2>, vector<2xf8E5M2>) -> vector<3xf8E5M2>
    "func.return"(%1) : (vector<3xf8E5M2>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf8E4M3FN>, vector<2xf8E4M3FN>) -> vector<3xf8E4M3FN>, sym_name = "vector_shuffle_f8E4M3FN"}> ({
  ^bb0(%arg0: vector<4xf8E4M3FN>, %arg1: vector<2xf8E4M3FN>):
    %0 = "spirv.VectorShuffle"(%arg0, %arg1) <{components = [1 : i32, 3 : i32, -1 : i32]}> : (vector<4xf8E4M3FN>, vector<2xf8E4M3FN>) -> vector<3xf8E4M3FN>
    "func.return"(%0) : (vector<3xf8E4M3FN>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
