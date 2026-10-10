module {
  func.func @generalize_matmul_tensor_f16f64f32(%arg0: tensor<16x8xf16>, %arg1: tensor<8x32xf64>, %arg2: tensor<16x32xf32>) -> tensor<16x32xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<16x8xf16>, tensor<8x32xf64>) outs(%arg2 : tensor<16x32xf32>) -> tensor<16x32xf32>
    return %0 : tensor<16x32xf32>
  }
}

// -----
module {
  func.func @generalize_matmul_tensor_i16i64i32(%arg0: tensor<16x8xi16>, %arg1: tensor<8x32xi64>, %arg2: tensor<16x32xi32>) -> tensor<16x32xi32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<16x8xi16>, tensor<8x32xi64>) outs(%arg2 : tensor<16x32xi32>) -> tensor<16x32xi32>
    return %0 : tensor<16x32xi32>
  }
}

// -----
module {
  func.func @generalize_matmul_tensor_i16i64i32_unsigned(%arg0: tensor<16x8xi16>, %arg1: tensor<8x32xi64>, %arg2: tensor<16x32xi32>) -> tensor<16x32xi32> {
    %0 = linalg.matmul {cast = #linalg.type_fn<cast_unsigned>} ins(%arg0, %arg1 : tensor<16x8xi16>, tensor<8x32xi64>) outs(%arg2 : tensor<16x32xi32>) -> tensor<16x32xi32>
    return %0 : tensor<16x32xi32>
  }
}

// -----
module {
  func.func @generalize_matmul_tensor_i16i64f32(%arg0: tensor<16x8xi16>, %arg1: tensor<8x32xi64>, %arg2: tensor<16x32xf32>) -> tensor<16x32xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<16x8xi16>, tensor<8x32xi64>) outs(%arg2 : tensor<16x32xf32>) -> tensor<16x32xf32>
    return %0 : tensor<16x32xf32>
  }
}

// -----
module {
  func.func @generalize_matmul_tensor_f16f64i32(%arg0: tensor<16x8xf16>, %arg1: tensor<8x32xf64>, %arg2: tensor<16x32xi32>) -> tensor<16x32xi32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<16x8xf16>, tensor<8x32xf64>) outs(%arg2 : tensor<16x32xi32>) -> tensor<16x32xi32>
    return %0 : tensor<16x32xi32>
  }
}

// -----
module {
  func.func @generalize_matmul_unsigned_tensor_i16i64i32(%arg0: tensor<16x8xi16>, %arg1: tensor<8x32xi64>, %arg2: tensor<16x32xi32>) -> tensor<16x32xi32> {
    %0 = linalg.matmul {cast = #linalg.type_fn<cast_unsigned>} ins(%arg0, %arg1 : tensor<16x8xi16>, tensor<8x32xi64>) outs(%arg2 : tensor<16x32xi32>) -> tensor<16x32xi32>
    return %0 : tensor<16x32xi32>
  }
}

// -----
module {
  func.func @generalize_matmul_unsigned_tensor_i16i64f32(%arg0: tensor<16x8xi16>, %arg1: tensor<8x32xi64>, %arg2: tensor<16x32xf32>) -> tensor<16x32xf32> {
    %0 = linalg.matmul {cast = #linalg.type_fn<cast_unsigned>} ins(%arg0, %arg1 : tensor<16x8xi16>, tensor<8x32xi64>) outs(%arg2 : tensor<16x32xf32>) -> tensor<16x32xf32>
    return %0 : tensor<16x32xf32>
  }
}

// -----
module {
  func.func @generalize_matmul_unsigned_tensor_f16f64i32(%arg0: tensor<16x8xf16>, %arg1: tensor<8x32xf64>, %arg2: tensor<16x32xi32>) -> tensor<16x32xi32> {
    %0 = linalg.matmul {cast = #linalg.type_fn<cast_unsigned>} ins(%arg0, %arg1 : tensor<16x8xf16>, tensor<8x32xf64>) outs(%arg2 : tensor<16x32xi32>) -> tensor<16x32xi32>
    return %0 : tensor<16x32xi32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @generalize_matmul_as_contraction_tensor_f16f64f32(%arg0: tensor<16x8xf16>, %arg1: tensor<8x32xf64>, %arg2: tensor<16x32xf32>) -> tensor<16x32xf32> {
    %0 = linalg.contract indexing_maps = [#map, #map1, #map2] ins(%arg0, %arg1 : tensor<16x8xf16>, tensor<8x32xf64>) outs(%arg2 : tensor<16x32xf32>) -> tensor<16x32xf32>
    return %0 : tensor<16x32xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @generalize_matmul_as_contract_with_ext_and_trunc(%arg0: tensor<24x12xf16>, %arg1: tensor<12x25xf16>, %arg2: tensor<24x25xf32>) -> tensor<24x25xf16> {
    %0 = linalg.contract indexing_maps = [#map, #map1, #map2] ins(%arg0, %arg1 : tensor<24x12xf16>, tensor<12x25xf16>) outs(%arg2 : tensor<24x25xf32>) -> tensor<24x25xf32>
    %1 = arith.truncf %0 : tensor<24x25xf32> to tensor<24x25xf16>
    return %1 : tensor<24x25xf16>
  }
}

// -----
module {
  func.func @generalize_pooling_nhwc_max_f32(%arg0: tensor<1x4x16x1xf32>, %arg1: tensor<2x2xf32>, %arg2: tensor<1x2x4x1xf32>) -> tensor<1x2x4x1xf32> {
    %0 = linalg.pooling_nhwc_max {dilations = dense<[1, 2]> : tensor<2xi64>, strides = dense<[2, 4]> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<1x4x16x1xf32>, tensor<2x2xf32>) outs(%arg2 : tensor<1x2x4x1xf32>) -> tensor<1x2x4x1xf32>
    return %0 : tensor<1x2x4x1xf32>
  }
}

// -----
module {
  func.func @generalize_pooling_nwc_max_f32(%arg0: tensor<1x16x1xf32>, %arg1: tensor<2xf32>, %arg2: tensor<1x4x1xf32>) -> tensor<1x4x1xf32> {
    %0 = linalg.pooling_nwc_max {dilations = dense<2> : tensor<1xi64>, strides = dense<4> : tensor<1xi64>} ins(%arg0, %arg1 : tensor<1x16x1xf32>, tensor<2xf32>) outs(%arg2 : tensor<1x4x1xf32>) -> tensor<1x4x1xf32>
    return %0 : tensor<1x4x1xf32>
  }
}

// -----
module {
  func.func @generalize_pooling_nhwc_max_i32(%arg0: tensor<1x4x16x1xi32>, %arg1: tensor<2x2xi32>, %arg2: tensor<1x2x4x1xi32>) -> tensor<1x2x4x1xi32> {
    %0 = linalg.pooling_nhwc_max {dilations = dense<[1, 2]> : tensor<2xi64>, strides = dense<[2, 4]> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<1x4x16x1xi32>, tensor<2x2xi32>) outs(%arg2 : tensor<1x2x4x1xi32>) -> tensor<1x2x4x1xi32>
    return %0 : tensor<1x2x4x1xi32>
  }
}

// -----
module {
  func.func @generalize_pooling_nwc_max_i32(%arg0: tensor<1x16x1xi32>, %arg1: tensor<2xi32>, %arg2: tensor<1x4x1xi32>) -> tensor<1x4x1xi32> {
    %0 = linalg.pooling_nwc_max {dilations = dense<2> : tensor<1xi64>, strides = dense<4> : tensor<1xi64>} ins(%arg0, %arg1 : tensor<1x16x1xi32>, tensor<2xi32>) outs(%arg2 : tensor<1x4x1xi32>) -> tensor<1x4x1xi32>
    return %0 : tensor<1x4x1xi32>
  }
}

// -----
module {
  func.func @generalize_pooling_nhwc_max_unsigned_i32(%arg0: tensor<1x4x16x1xi32>, %arg1: tensor<2x2xi32>, %arg2: tensor<1x2x4x1xi32>) -> tensor<1x2x4x1xi32> {
    %0 = linalg.pooling_nhwc_max_unsigned {dilations = dense<[1, 2]> : tensor<2xi64>, strides = dense<[2, 4]> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<1x4x16x1xi32>, tensor<2x2xi32>) outs(%arg2 : tensor<1x2x4x1xi32>) -> tensor<1x2x4x1xi32>
    return %0 : tensor<1x2x4x1xi32>
  }
}

// -----
module {
  func.func @generalize_pooling_nwc_max_unsigned_i32(%arg0: tensor<1x16x1xi32>, %arg1: tensor<2xi32>, %arg2: tensor<1x4x1xi32>) -> tensor<1x4x1xi32> {
    %0 = linalg.pooling_nwc_max_unsigned {dilations = dense<2> : tensor<1xi64>, strides = dense<4> : tensor<1xi64>} ins(%arg0, %arg1 : tensor<1x16x1xi32>, tensor<2xi32>) outs(%arg2 : tensor<1x4x1xi32>) -> tensor<1x4x1xi32>
    return %0 : tensor<1x4x1xi32>
  }
}

// -----
module {
  func.func @generalize_pooling_nhwc_min_f32(%arg0: tensor<1x4x16x1xf32>, %arg1: tensor<2x2xf32>, %arg2: tensor<1x2x4x1xf32>) -> tensor<1x2x4x1xf32> {
    %0 = linalg.pooling_nhwc_min {dilations = dense<[1, 2]> : tensor<2xi64>, strides = dense<[2, 4]> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<1x4x16x1xf32>, tensor<2x2xf32>) outs(%arg2 : tensor<1x2x4x1xf32>) -> tensor<1x2x4x1xf32>
    return %0 : tensor<1x2x4x1xf32>
  }
}

// -----
module {
  func.func @generalize_pooling_nwc_min_f32(%arg0: tensor<1x16x1xf32>, %arg1: tensor<2xf32>, %arg2: tensor<1x4x1xf32>) -> tensor<1x4x1xf32> {
    %0 = linalg.pooling_nwc_min {dilations = dense<2> : tensor<1xi64>, strides = dense<4> : tensor<1xi64>} ins(%arg0, %arg1 : tensor<1x16x1xf32>, tensor<2xf32>) outs(%arg2 : tensor<1x4x1xf32>) -> tensor<1x4x1xf32>
    return %0 : tensor<1x4x1xf32>
  }
}

// -----
module {
  func.func @generalize_pooling_nhwc_min_i32(%arg0: tensor<1x4x16x1xi32>, %arg1: tensor<2x2xi32>, %arg2: tensor<1x2x4x1xi32>) -> tensor<1x2x4x1xi32> {
    %0 = linalg.pooling_nhwc_min {dilations = dense<[1, 2]> : tensor<2xi64>, strides = dense<[2, 4]> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<1x4x16x1xi32>, tensor<2x2xi32>) outs(%arg2 : tensor<1x2x4x1xi32>) -> tensor<1x2x4x1xi32>
    return %0 : tensor<1x2x4x1xi32>
  }
}

// -----
module {
  func.func @generalize_pooling_nwc_min_i32(%arg0: tensor<1x16x1xi32>, %arg1: tensor<2xi32>, %arg2: tensor<1x4x1xi32>) -> tensor<1x4x1xi32> {
    %0 = linalg.pooling_nwc_min {dilations = dense<2> : tensor<1xi64>, strides = dense<4> : tensor<1xi64>} ins(%arg0, %arg1 : tensor<1x16x1xi32>, tensor<2xi32>) outs(%arg2 : tensor<1x4x1xi32>) -> tensor<1x4x1xi32>
    return %0 : tensor<1x4x1xi32>
  }
}

// -----
module {
  func.func @generalize_pooling_nhwc_min_unsigned_i32(%arg0: tensor<1x4x16x1xi32>, %arg1: tensor<2x2xi32>, %arg2: tensor<1x2x4x1xi32>) -> tensor<1x2x4x1xi32> {
    %0 = linalg.pooling_nhwc_min_unsigned {dilations = dense<[1, 2]> : tensor<2xi64>, strides = dense<[2, 4]> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<1x4x16x1xi32>, tensor<2x2xi32>) outs(%arg2 : tensor<1x2x4x1xi32>) -> tensor<1x2x4x1xi32>
    return %0 : tensor<1x2x4x1xi32>
  }
}

// -----
module {
  func.func @generalize_pooling_nwc_min_unsigned_i32(%arg0: tensor<1x16x1xi32>, %arg1: tensor<2xi32>, %arg2: tensor<1x4x1xi32>) -> tensor<1x4x1xi32> {
    %0 = linalg.pooling_nwc_min_unsigned {dilations = dense<2> : tensor<1xi64>, strides = dense<4> : tensor<1xi64>} ins(%arg0, %arg1 : tensor<1x16x1xi32>, tensor<2xi32>) outs(%arg2 : tensor<1x4x1xi32>) -> tensor<1x4x1xi32>
    return %0 : tensor<1x4x1xi32>
  }
}

// -----
module {
  func.func @generalize_pooling_nhwc_sum_f32(%arg0: tensor<1x4x16x1xf32>, %arg1: tensor<2x2xf32>, %arg2: tensor<1x2x4x1xf32>) -> tensor<1x2x4x1xf32> {
    %0 = linalg.pooling_nhwc_sum {dilations = dense<[1, 2]> : tensor<2xi64>, strides = dense<[2, 4]> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<1x4x16x1xf32>, tensor<2x2xf32>) outs(%arg2 : tensor<1x2x4x1xf32>) -> tensor<1x2x4x1xf32>
    return %0 : tensor<1x2x4x1xf32>
  }
}

// -----
module {
  func.func @generalize_pooling_nwc_sum_f32(%arg0: tensor<1x16x1xf32>, %arg1: tensor<2xf32>, %arg2: tensor<1x4x1xf32>) -> tensor<1x4x1xf32> {
    %0 = linalg.pooling_nwc_sum {dilations = dense<2> : tensor<1xi64>, strides = dense<4> : tensor<1xi64>} ins(%arg0, %arg1 : tensor<1x16x1xf32>, tensor<2xf32>) outs(%arg2 : tensor<1x4x1xf32>) -> tensor<1x4x1xf32>
    return %0 : tensor<1x4x1xf32>
  }
}

// -----
module {
  func.func @generalize_pooling_nhwc_sum_i32(%arg0: tensor<1x4x16x1xi32>, %arg1: tensor<2x2xi32>, %arg2: tensor<1x2x4x1xi32>) -> tensor<1x2x4x1xi32> {
    %0 = linalg.pooling_nhwc_sum {dilations = dense<[1, 2]> : tensor<2xi64>, strides = dense<[2, 4]> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<1x4x16x1xi32>, tensor<2x2xi32>) outs(%arg2 : tensor<1x2x4x1xi32>) -> tensor<1x2x4x1xi32>
    return %0 : tensor<1x2x4x1xi32>
  }
}

// -----
module {
  func.func @generalize_pooling_nwc_sum_i32(%arg0: tensor<1x16x1xi32>, %arg1: tensor<2xi32>, %arg2: tensor<1x4x1xi32>) -> tensor<1x4x1xi32> {
    %0 = linalg.pooling_nwc_sum {dilations = dense<2> : tensor<1xi64>, strides = dense<4> : tensor<1xi64>} ins(%arg0, %arg1 : tensor<1x16x1xi32>, tensor<2xi32>) outs(%arg2 : tensor<1x4x1xi32>) -> tensor<1x4x1xi32>
    return %0 : tensor<1x4x1xi32>
  }
}

// -----
module {
  func.func @generalize_fill_0d(%arg0: f32, %arg1: tensor<f32>) -> tensor<f32> {
    %0 = linalg.fill ins(%arg0 : f32) outs(%arg1 : tensor<f32>) -> tensor<f32>
    return %0 : tensor<f32>
  }
}

// -----
module {
  func.func @generalize_fill_2d(%arg0: f32, %arg1: memref<16x32xf32>) {
    linalg.fill ins(%arg0 : f32) outs(%arg1 : memref<16x32xf32>)
    return
  }
}

// -----
module {
  func.func @generalize_index(%arg0: f64, %arg1: f64, %arg2: i32, %arg3: tensor<16x32xf32>) -> tensor<16x32xf32> {
    %0 = linalg.fill_rng_2d ins(%arg0, %arg1, %arg2 : f64, f64, i32) outs(%arg3 : tensor<16x32xf32>) -> tensor<16x32xf32>
    return %0 : tensor<16x32xf32>
  }
}

// -----
module {
  func.func @generalize_const(%arg0: f64, %arg1: f64, %arg2: i32, %arg3: tensor<16x32xf32>) -> tensor<16x32xf32> {
    %0 = linalg.fill_rng_2d ins(%arg0, %arg1, %arg2 : f64, f64, i32) outs(%arg3 : tensor<16x32xf32>) -> tensor<16x32xf32>
    return %0 : tensor<16x32xf32>
  }
}

// -----
module {
  func.func @generalize_copy(%arg0: tensor<4x8xf32>, %arg1: tensor<4x8xf32>) -> tensor<4x8xf32> {
    %0 = linalg.copy ins(%arg0 : tensor<4x8xf32>) outs(%arg1 : tensor<4x8xf32>) -> tensor<4x8xf32>
    return %0 : tensor<4x8xf32>
  }
}

