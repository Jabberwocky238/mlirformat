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
  ^bb0(%arg3: vector<4xf32>, %arg4: i32):
    %1 = "spirv.VectorExtractDynamic"(%arg3, %arg4) : (vector<4xf32>, i32) -> f32
    "func.return"(%1) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<4xf32>, i32) -> vector<4xf32>, sym_name = "vector_dynamic_insert"}> ({
  ^bb0(%arg0: f32, %arg1: vector<4xf32>, %arg2: i32):
    %0 = "spirv.VectorInsertDynamic"(%arg1, %arg0, %arg2) : (vector<4xf32>, f32, i32) -> vector<4xf32>
    "func.return"(%0) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf32>, vector<2xf32>) -> vector<3xf32>, sym_name = "vector_shuffle"}> ({
  ^bb0(%arg0: vector<4xf32>, %arg1: vector<2xf32>):
    %0 = "spirv.VectorShuffle"(%arg0, %arg1) <{components = [1 : i32, 3 : i32, -1 : i32]}> : (vector<4xf32>, vector<2xf32>) -> vector<3xf32>
    "func.return"(%0) : (vector<3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
