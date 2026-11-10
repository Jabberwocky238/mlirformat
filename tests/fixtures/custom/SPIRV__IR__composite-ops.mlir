module {
  func.func @composite_construct_vector(%arg0: f32, %arg1: f32, %arg2: f32) -> vector<3xf32> {
    %0 = spirv.CompositeConstruct %arg0, %arg1, %arg2 : (f32, f32, f32) -> vector<3xf32>
    return %0 : vector<3xf32>
  }
  func.func @composite_construct_bf16_vector(%arg0: bf16, %arg1: bf16, %arg2: bf16) -> vector<3xbf16> {
    %0 = spirv.CompositeConstruct %arg0, %arg1, %arg2 : (bf16, bf16, bf16) -> vector<3xbf16>
    return %0 : vector<3xbf16>
  }
  func.func @composite_construct_struct(%arg0: vector<3xf32>, %arg1: !spirv.array<4 x f32>, %arg2: !spirv.struct<(f32)>) -> !spirv.struct<(vector<3xf32>, !spirv.array<4 x f32>, !spirv.struct<(f32)>)> {
    %0 = spirv.CompositeConstruct %arg0, %arg1, %arg2 : (vector<3xf32>, !spirv.array<4 x f32>, !spirv.struct<(f32)>) -> !spirv.struct<(vector<3xf32>, !spirv.array<4 x f32>, !spirv.struct<(f32)>)>
    return %0 : !spirv.struct<(vector<3xf32>, !spirv.array<4 x f32>, !spirv.struct<(f32)>)>
  }
  func.func @composite_construct_mixed_scalar_vector(%arg0: f32, %arg1: f32, %arg2: vector<2xf32>) -> vector<4xf32> {
    %0 = spirv.CompositeConstruct %arg0, %arg2, %arg1 : (f32, vector<2xf32>, f32) -> vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @composite_construct_coopmatrix_khr(%arg0: f32) -> !spirv.coopmatrix<8x16xf32, Subgroup, MatrixA> {
    %0 = spirv.CompositeConstruct %arg0 : (f32) -> !spirv.coopmatrix<8x16xf32, Subgroup, MatrixA>
    return %0 : !spirv.coopmatrix<8x16xf32, Subgroup, MatrixA>
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
module {
  func.func @composite_extract_array(%arg0: !spirv.array<4 x f32>) -> f32 {
    %0 = spirv.CompositeExtract %arg0[1 : i32] : !spirv.array<4 x f32>
    return %0 : f32
  }
}

// -----
module {
  func.func @composite_extract_struct(%arg0: !spirv.struct<(f32, !spirv.array<4 x f32>)>) -> f32 {
    %0 = spirv.CompositeExtract %arg0[1 : i32, 2 : i32] : !spirv.struct<(f32, !spirv.array<4 x f32>)>
    return %0 : f32
  }
}

// -----
module {
  func.func @composite_extract_vector(%arg0: vector<4xf32>) -> f32 {
    %0 = spirv.CompositeExtract %arg0[1 : i32] : vector<4xf32>
    return %0 : f32
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
module {
  func.func @composite_insert_array(%arg0: !spirv.array<4 x f32>, %arg1: f32) -> !spirv.array<4 x f32> {
    %0 = spirv.CompositeInsert %arg1, %arg0[1 : i32] : f32 into !spirv.array<4 x f32>
    return %0 : !spirv.array<4 x f32>
  }
}

// -----
module {
  func.func @composite_insert_struct(%arg0: !spirv.struct<(!spirv.array<4 x f32>, f32)>, %arg1: !spirv.array<4 x f32>) -> !spirv.struct<(!spirv.array<4 x f32>, f32)> {
    %0 = spirv.CompositeInsert %arg1, %arg0[0 : i32] : !spirv.array<4 x f32> into !spirv.struct<(!spirv.array<4 x f32>, f32)>
    return %0 : !spirv.struct<(!spirv.array<4 x f32>, f32)>
  }
}

// -----
// -----
// -----
// -----
// -----
module {
  func.func @vector_dynamic_extract(%arg0: vector<4xf32>, %arg1: i32) -> f32 {
    %0 = spirv.VectorExtractDynamic %arg0[%arg1] : vector<4xf32>, i32
    return %0 : f32
  }
  func.func @vector_dynamic_extract_bf16(%arg0: vector<4xbf16>, %arg1: i32) -> bf16 {
    %0 = spirv.VectorExtractDynamic %arg0[%arg1] : vector<4xbf16>, i32
    return %0 : bf16
  }
  func.func @vector_dynamic_extract_f8E5M2(%arg0: vector<4xf8E5M2>, %arg1: i32) -> f8E5M2 {
    %0 = spirv.VectorExtractDynamic %arg0[%arg1] : vector<4xf8E5M2>, i32
    return %0 : f8E5M2
  }
  func.func @vector_dynamic_extract_f8E4M3FN(%arg0: vector<4xf8E4M3FN>, %arg1: i32) -> f8E4M3FN {
    %0 = spirv.VectorExtractDynamic %arg0[%arg1] : vector<4xf8E4M3FN>, i32
    return %0 : f8E4M3FN
  }
  func.func @vector_dynamic_insert(%arg0: f32, %arg1: vector<4xf32>, %arg2: i32) -> vector<4xf32> {
    %0 = spirv.VectorInsertDynamic %arg0, %arg1[%arg2] : vector<4xf32>, i32
    return %0 : vector<4xf32>
  }
  func.func @vector_dynamic_insert_bf16(%arg0: bf16, %arg1: vector<4xbf16>, %arg2: i32) -> vector<4xbf16> {
    %0 = spirv.VectorInsertDynamic %arg0, %arg1[%arg2] : vector<4xbf16>, i32
    return %0 : vector<4xbf16>
  }
  func.func @vector_dynamic_insert_f8E5M2(%arg0: f8E5M2, %arg1: vector<4xf8E5M2>, %arg2: i32) -> vector<4xf8E5M2> {
    %0 = spirv.VectorInsertDynamic %arg0, %arg1[%arg2] : vector<4xf8E5M2>, i32
    return %0 : vector<4xf8E5M2>
  }
  func.func @vector_dynamic_insert_f8E4M3FN(%arg0: f8E4M3FN, %arg1: vector<4xf8E4M3FN>, %arg2: i32) -> vector<4xf8E4M3FN> {
    %0 = spirv.VectorInsertDynamic %arg0, %arg1[%arg2] : vector<4xf8E4M3FN>, i32
    return %0 : vector<4xf8E4M3FN>
  }
}

// -----
module {
  func.func @vector_shuffle(%arg0: vector<4xf32>, %arg1: vector<2xf32>) -> vector<3xf32> {
    %0 = spirv.VectorShuffle [1 : i32, 3 : i32, -1 : i32] %arg0, %arg1 : vector<4xf32>, vector<2xf32> -> vector<3xf32>
    return %0 : vector<3xf32>
  }
  func.func @vector_shuffle_bf16(%arg0: vector<4xbf16>, %arg1: vector<2xbf16>) -> vector<3xbf16> {
    %0 = spirv.VectorShuffle [1 : i32, 3 : i32, -1 : i32] %arg0, %arg1 : vector<4xbf16>, vector<2xbf16> -> vector<3xbf16>
    return %0 : vector<3xbf16>
  }
  func.func @vector_shuffle_f8E5M2(%arg0: vector<4xf8E5M2>, %arg1: vector<2xf8E5M2>) -> vector<3xf8E5M2> {
    %0 = spirv.VectorShuffle [1 : i32, 3 : i32, -1 : i32] %arg0, %arg1 : vector<4xf8E5M2>, vector<2xf8E5M2> -> vector<3xf8E5M2>
    return %0 : vector<3xf8E5M2>
  }
  func.func @vector_shuffle_f8E4M3FN(%arg0: vector<4xf8E4M3FN>, %arg1: vector<2xf8E4M3FN>) -> vector<3xf8E4M3FN> {
    %0 = spirv.VectorShuffle [1 : i32, 3 : i32, -1 : i32] %arg0, %arg1 : vector<4xf8E4M3FN>, vector<2xf8E4M3FN> -> vector<3xf8E4M3FN>
    return %0 : vector<3xf8E4M3FN>
  }
}

// -----
// -----
