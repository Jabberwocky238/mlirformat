#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @add_mul_fusion(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?xf32>
    %0 = tensor.empty(%dim, %dim_0) : tensor<?x?xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%0 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_1: f32, %out: f32):
      %3 = arith.addf %in, %in_1 : f32
      linalg.yield %3 : f32
    } -> tensor<?x?xf32>
    %2 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%1, %arg2 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%0 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_1: f32, %out: f32):
      %3 = arith.mulf %in, %in_1 : f32
      linalg.yield %3 : f32
    } -> tensor<?x?xf32>
    return %2 : tensor<?x?xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> ()>
module {
  func.func @scalar_add_mul_fusion(%arg0: tensor<?x?xf32>, %arg1: f32, %arg2: f32) -> tensor<?x?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?xf32>
    %0 = tensor.empty(%dim, %dim_0) : tensor<?x?xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map1, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<?x?xf32>, f32) outs(%0 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_1: f32, %out: f32):
      %3 = arith.addf %in, %in_1 : f32
      linalg.yield %3 : f32
    } -> tensor<?x?xf32>
    %2 = linalg.generic {indexing_maps = [#map, #map1, #map], iterator_types = ["parallel", "parallel"]} ins(%1, %arg2 : tensor<?x?xf32>, f32) outs(%0 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_1: f32, %out: f32):
      %3 = arith.mulf %in, %in_1 : f32
      linalg.yield %3 : f32
    } -> tensor<?x?xf32>
    return %2 : tensor<?x?xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
module {
  func.func @transpose_add_mul_fusion(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?xf32>
    %0 = tensor.empty(%dim, %dim_0) : tensor<?x?xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map1, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%0 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_1: f32, %out: f32):
      %3 = arith.addf %in, %in_1 : f32
      linalg.yield %3 : f32
    } -> tensor<?x?xf32>
    %2 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%1, %arg2 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%0 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_1: f32, %out: f32):
      %3 = arith.mulf %in, %in_1 : f32
      linalg.yield %3 : f32
    } -> tensor<?x?xf32>
    return %2 : tensor<?x?xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
module {
  func.func @add_transpose_mul_fusion(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?xf32>
    %0 = tensor.empty(%dim, %dim_0) : tensor<?x?xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map1, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%0 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_1: f32, %out: f32):
      %3 = arith.addf %in, %in_1 : f32
      linalg.yield %3 : f32
    } -> tensor<?x?xf32>
    %2 = linalg.generic {indexing_maps = [#map1, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%1, %arg2 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%0 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_1: f32, %out: f32):
      %3 = arith.mulf %in, %in_1 : f32
      linalg.yield %3 : f32
    } -> tensor<?x?xf32>
    return %2 : tensor<?x?xf32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d0)>
#map2 = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @add_broadcast_mul_fusion(%arg0: tensor<?xf32>, %arg1: tensor<?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?xf32>
    %0 = tensor.empty(%dim) : tensor<?xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<?xf32>, tensor<?xf32>) outs(%0 : tensor<?xf32>) {
    ^bb0(%in: f32, %in_1: f32, %out: f32):
      %4 = arith.addf %in, %in_1 : f32
      linalg.yield %4 : f32
    } -> tensor<?xf32>
    %dim_0 = tensor.dim %arg2, %c1 : tensor<?x?xf32>
    %2 = tensor.empty(%dim, %dim_0) : tensor<?x?xf32>
    %3 = linalg.generic {indexing_maps = [#map1, #map2, #map2], iterator_types = ["parallel", "parallel"]} ins(%1, %arg2 : tensor<?xf32>, tensor<?x?xf32>) outs(%2 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_1: f32, %out: f32):
      %4 = arith.mulf %in, %in_1 : f32
      linalg.yield %4 : f32
    } -> tensor<?x?xf32>
    return %3 : tensor<?x?xf32>
  }
}

// -----
#map = affine_map<() -> ()>
module {
  func.func @add_mul_scalar_fusion(%arg0: tensor<f32>, %arg1: tensor<f32>, %arg2: tensor<f32>) -> tensor<f32> {
    %0 = tensor.empty() : tensor<f32>
    %1 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = []} ins(%arg0, %arg1 : tensor<f32>, tensor<f32>) outs(%0 : tensor<f32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %3 = arith.addf %in, %in_0 : f32
      linalg.yield %3 : f32
    } -> tensor<f32>
    %2 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = []} ins(%1, %arg2 : tensor<f32>, tensor<f32>) outs(%0 : tensor<f32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %3 = arith.mulf %in, %in_0 : f32
      linalg.yield %3 : f32
    } -> tensor<f32>
    return %2 : tensor<f32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
module {
  func.func @generic_op_constant_fusion(%arg0: tensor<5x?x?xf32>) -> tensor<5x?x?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %cst = arith.constant dense<4.200000e+01> : tensor<5xf32>
    %dim = tensor.dim %arg0, %c1 : tensor<5x?x?xf32>
    %dim_0 = tensor.dim %arg0, %c2 : tensor<5x?x?xf32>
    %0 = tensor.empty(%dim, %dim_0) : tensor<5x?x?xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map1, #map1], iterator_types = ["parallel", "parallel", "parallel"]} ins(%cst, %arg0 : tensor<5xf32>, tensor<5x?x?xf32>) outs(%0 : tensor<5x?x?xf32>) {
    ^bb0(%in: f32, %in_1: f32, %out: f32):
      %2 = arith.mulf %in, %in_1 : f32
      linalg.yield %2 : f32
    } -> tensor<5x?x?xf32>
    return %1 : tensor<5x?x?xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> ()>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
module {
  func.func @generic_op_zero_dim_constant_fusion(%arg0: tensor<5x?x?xf32>) -> tensor<5x?x?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %cst = arith.constant dense<4.200000e+01> : tensor<f32>
    %dim = tensor.dim %arg0, %c1 : tensor<5x?x?xf32>
    %dim_0 = tensor.dim %arg0, %c2 : tensor<5x?x?xf32>
    %0 = tensor.empty(%dim, %dim_0) : tensor<5x?x?xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map1, #map1], iterator_types = ["parallel", "parallel", "parallel"]} ins(%cst, %arg0 : tensor<f32>, tensor<5x?x?xf32>) outs(%0 : tensor<5x?x?xf32>) {
    ^bb0(%in: f32, %in_1: f32, %out: f32):
      %2 = arith.mulf %in, %in_1 : f32
      linalg.yield %2 : f32
    } -> tensor<5x?x?xf32>
    return %1 : tensor<5x?x?xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @producer_indexed_consumer_fusion(%arg0: tensor<?x?xi32>, %arg1: tensor<?x?xi32>) -> tensor<?x?xi32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xi32>
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?xi32>
    %0 = tensor.empty(%dim, %dim_0) : tensor<?x?xi32>
    %1 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<?x?xi32>, tensor<?x?xi32>) outs(%0 : tensor<?x?xi32>) {
    ^bb0(%in: i32, %in_1: i32, %out: i32):
      %3 = arith.addi %in, %in_1 : i32
      linalg.yield %3 : i32
    } -> tensor<?x?xi32>
    %2 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel"]} ins(%1 : tensor<?x?xi32>) outs(%0 : tensor<?x?xi32>) {
    ^bb0(%in: i32, %out: i32):
      %3 = linalg.index 0 : index
      %4 = linalg.index 1 : index
      %5 = arith.index_cast %3 : index to i32
      %6 = arith.index_cast %4 : index to i32
      %7 = arith.addi %in, %5 : i32
      %8 = arith.subi %7, %6 : i32
      linalg.yield %8 : i32
    } -> tensor<?x?xi32>
    return %2 : tensor<?x?xi32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @indexed_producer_consumer_fusion(%arg0: tensor<?x?xi32>) -> tensor<?x?xi32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xi32>
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?xi32>
    %0 = tensor.empty(%dim, %dim_0) : tensor<?x?xi32>
    %1 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0 : tensor<?x?xi32>) outs(%0 : tensor<?x?xi32>) {
    ^bb0(%in: i32, %out: i32):
      %3 = linalg.index 0 : index
      %4 = linalg.index 1 : index
      %5 = arith.index_cast %3 : index to i32
      %6 = arith.index_cast %4 : index to i32
      %7 = arith.addi %in, %5 : i32
      %8 = arith.subi %7, %6 : i32
      linalg.yield %8 : i32
    } -> tensor<?x?xi32>
    %2 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%1, %arg0 : tensor<?x?xi32>, tensor<?x?xi32>) outs(%0 : tensor<?x?xi32>) {
    ^bb0(%in: i32, %in_1: i32, %out: i32):
      %3 = arith.addi %in, %in_1 : i32
      linalg.yield %3 : i32
    } -> tensor<?x?xi32>
    return %2 : tensor<?x?xi32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @indexed_producer_indexed_consumer_fusion(%arg0: tensor<?x?xi32>) -> tensor<?x?xi32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xi32>
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?xi32>
    %0 = tensor.empty(%dim, %dim_0) : tensor<?x?xi32>
    %1 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0 : tensor<?x?xi32>) outs(%0 : tensor<?x?xi32>) {
    ^bb0(%in: i32, %out: i32):
      %3 = linalg.index 0 : index
      %4 = linalg.index 1 : index
      %5 = arith.index_cast %3 : index to i32
      %6 = arith.index_cast %4 : index to i32
      %7 = arith.addi %in, %5 : i32
      %8 = arith.subi %6, %7 : i32
      linalg.yield %8 : i32
    } -> tensor<?x?xi32>
    %2 = linalg.generic {indexing_maps = [#map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%1 : tensor<?x?xi32>) outs(%0 : tensor<?x?xi32>) {
    ^bb0(%in: i32, %out: i32):
      %3 = linalg.index 0 : index
      %4 = linalg.index 1 : index
      %5 = arith.index_cast %3 : index to i32
      %6 = arith.index_cast %4 : index to i32
      %7 = arith.addi %in, %5 : i32
      %8 = arith.subi %7, %6 : i32
      linalg.yield %8 : i32
    } -> tensor<?x?xi32>
    return %2 : tensor<?x?xi32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<(d0, d1) -> (d1)>
module {
  func.func @one_dim_indexed_producer_consumer_fusion(%arg0: tensor<?xi32>, %arg1: tensor<?x?xi32>) -> tensor<?x?xi32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?xi32>
    %0 = tensor.empty(%dim) : tensor<?xi32>
    %1 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<?xi32>) outs(%0 : tensor<?xi32>) {
    ^bb0(%in: i32, %out: i32):
      %4 = linalg.index 0 : index
      %5 = arith.index_cast %4 : index to i32
      %6 = arith.addi %in, %5 : i32
      linalg.yield %6 : i32
    } -> tensor<?xi32>
    %dim_0 = tensor.dim %arg1, %c0 : tensor<?x?xi32>
    %dim_1 = tensor.dim %arg1, %c1 : tensor<?x?xi32>
    %2 = tensor.empty(%dim_0, %dim_1) : tensor<?x?xi32>
    %3 = linalg.generic {indexing_maps = [#map1, #map2, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg1, %1 : tensor<?x?xi32>, tensor<?xi32>) outs(%2 : tensor<?x?xi32>) {
    ^bb0(%in: i32, %in_2: i32, %out: i32):
      %4 = arith.addi %in, %in_2 : i32
      linalg.yield %4 : i32
    } -> tensor<?x?xi32>
    return %3 : tensor<?x?xi32>
  }
}

// -----
#map = affine_map<() -> ()>
#map1 = affine_map<(d0) -> ()>
#map2 = affine_map<(d0) -> (d0)>
module {
  func.func @scalar_generic_fusion(%arg0: tensor<5x1x1xf32>, %arg1: tensor<i32>) -> tensor<10xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant dense<1.000000e+00> : tensor<10xf32>
    %0 = tensor.empty() : tensor<f32>
    %1 = linalg.generic {indexing_maps = [#map, #map], iterator_types = []} ins(%arg1 : tensor<i32>) outs(%0 : tensor<f32>) {
    ^bb0(%in: i32, %out: f32):
      %4 = arith.index_cast %in : i32 to index
      %extracted = tensor.extract %arg0[%4, %c0, %c0] : tensor<5x1x1xf32>
      linalg.yield %extracted : f32
    } -> tensor<f32>
    %2 = tensor.empty() : tensor<10xf32>
    %3 = linalg.generic {indexing_maps = [#map1, #map2, #map2], iterator_types = ["parallel"]} ins(%1, %cst : tensor<f32>, tensor<10xf32>) outs(%2 : tensor<10xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %4 = arith.mulf %in, %in_0 : f32
      linalg.yield %4 : f32
    } -> tensor<10xf32>
    return %3 : tensor<10xf32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @constant_fusion(%arg0: tensor<4xf32>) -> tensor<4xf32> {
    %cst = arith.constant dense<1.000000e+00> : tensor<4xf32>
    %0 = tensor.empty() : tensor<4xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %cst : tensor<4xf32>, tensor<4xf32>) outs(%0 : tensor<4xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %2 = arith.addf %in, %in_0 : f32
      linalg.yield %2 : f32
    } -> tensor<4xf32>
    return %1 : tensor<4xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0) -> (0, d0)>
#map2 = affine_map<(d0) -> (0)>
module {
  func.func @consumer_with_reduction(%arg0: tensor<1x10xf32>, %arg1: tensor<1x10xf32>, %arg2: tensor<1xf32>) -> tensor<1xf32> {
    %0 = tensor.empty() : tensor<1x10xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<1x10xf32>, tensor<1x10xf32>) outs(%0 : tensor<1x10xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %3 = arith.addf %in, %in_0 : f32
      linalg.yield %3 : f32
    } -> tensor<1x10xf32>
    %2 = linalg.generic {indexing_maps = [#map1, #map2], iterator_types = ["reduction"]} ins(%1 : tensor<1x10xf32>) outs(%arg2 : tensor<1xf32>) {
    ^bb0(%in: f32, %out: f32):
      %3 = arith.addf %in, %out : f32
      linalg.yield %3 : f32
    } -> tensor<1xf32>
    return %2 : tensor<1xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @sigmoid_dynamic_dim(%arg0: tensor<?x1xf32>) -> tensor<?x1xf32> {
    %cst = arith.constant 5.000000e-01 : f32
    %c0 = arith.constant 0 : index
    %0 = shape.shape_of %arg0 : tensor<?x1xf32> -> tensor<?xindex>
    %1 = shape.to_extent_tensor %0 : tensor<?xindex> -> tensor<2xindex>
    %extracted = tensor.extract %1[%c0] : tensor<2xindex>
    %2 = tensor.empty(%extracted) : tensor<?x1xf32>
    %3 = linalg.generic {indexing_maps = [#map], iterator_types = ["parallel", "parallel"]} outs(%2 : tensor<?x1xf32>) {
    ^bb0(%out: f32):
      linalg.yield %cst : f32
    } -> tensor<?x1xf32>
    %dim = tensor.dim %arg0, %c0 : tensor<?x1xf32>
    %4 = tensor.empty(%dim) : tensor<?x1xf32>
    %5 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %3 : tensor<?x1xf32>, tensor<?x1xf32>) outs(%4 : tensor<?x1xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %6 = arith.mulf %in, %in_0 : f32
      linalg.yield %6 : f32
    } -> tensor<?x1xf32>
    return %5 : tensor<?x1xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func private @compute1(f64) -> f64
  func.func private @compute2(f64, i32) -> i32
  func.func @generic_index_op2(%arg0: tensor<1x8xf64>, %arg1: tensor<1x8xi32>) -> tensor<1x8xi32> {
    %0 = linalg.generic {indexing_maps = [#map], iterator_types = ["parallel", "parallel"]} outs(%arg0 : tensor<1x8xf64>) {
    ^bb0(%out: f64):
      %2 = func.call @compute1(%out) : (f64) -> f64
      linalg.yield %2 : f64
    } -> tensor<1x8xf64>
    %1 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel"]} ins(%0 : tensor<1x8xf64>) outs(%arg1 : tensor<1x8xi32>) {
    ^bb0(%in: f64, %out: i32):
      %2 = func.call @compute2(%in, %out) : (f64, i32) -> i32
      linalg.yield %2 : i32
    } -> tensor<1x8xi32>
    return %1 : tensor<1x8xi32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
module {
  func.func @no_fuse_constant_with_reduction() -> tensor<3xf32> {
    %cst = arith.constant dense<3.000000e+00> : tensor<3x2xf32>
    %0 = tensor.empty() : tensor<3xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "reduction"]} ins(%cst : tensor<3x2xf32>) outs(%0 : tensor<3xf32>) {
    ^bb0(%in: f32, %out: f32):
      %2 = arith.addf %in, %out : f32
      linalg.yield %2 : f32
    } -> tensor<3xf32>
    return %1 : tensor<3xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @break_outs_dependency(%arg0: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0 : tensor<?x?xf32>) outs(%arg0 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %2 = arith.addf %in, %in : f32
      linalg.yield %2 : f32
    } -> tensor<?x?xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel"]} ins(%0 : tensor<?x?xf32>) outs(%0 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %2 = arith.mulf %in, %in : f32
      linalg.yield %2 : f32
    } -> tensor<?x?xf32>
    return %1 : tensor<?x?xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> ()>
module {
  func.func @fuse_scalar_constant(%arg0: tensor<?x?xf32>) -> (tensor<?x?xf32>, tensor<?x?xi32>) {
    %cst = arith.constant 4.000000e+00 : f32
    %c42_i32 = arith.constant 42 : i32
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?xf32>
    %0 = tensor.empty(%dim, %dim_0) : tensor<?x?xf32>
    %1 = tensor.empty(%dim, %dim_0) : tensor<?x?xi32>
    %2:2 = linalg.generic {indexing_maps = [#map, #map1, #map1, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %cst, %c42_i32 : tensor<?x?xf32>, f32, i32) outs(%0, %1 : tensor<?x?xf32>, tensor<?x?xi32>) {
    ^bb0(%in: f32, %in_1: f32, %in_2: i32, %out: f32, %out_3: i32):
      %3 = arith.addf %in, %in_1 : f32
      linalg.yield %3, %in_2 : f32, i32
    } -> (tensor<?x?xf32>, tensor<?x?xi32>)
    return %2#0, %2#1 : tensor<?x?xf32>, tensor<?x?xi32>
  }
}

// -----
#map = affine_map<(d0, d1) -> ()>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<(d0, d1) -> (d1, d0)>
#map3 = affine_map<(d0, d1) -> (d0)>
module {
  func.func @no_fusion_missing_reduction_shape(%arg0: tensor<f32>, %arg1: index) -> tensor<?xf32> {
    %cst = arith.constant 0xFF800000 : f32
    %0 = tensor.empty(%arg1, %arg1) : tensor<?x?xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg0 : tensor<f32>) outs(%0 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<?x?xf32>
    %2 = tensor.empty(%arg1) : tensor<?xf32>
    %3 = linalg.fill ins(%cst : f32) outs(%2 : tensor<?xf32>) -> tensor<?xf32>
    %4 = linalg.generic {indexing_maps = [#map2, #map3], iterator_types = ["parallel", "reduction"]} ins(%1 : tensor<?x?xf32>) outs(%3 : tensor<?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %5 = arith.maximumf %in, %out : f32
      linalg.yield %5 : f32
    } -> tensor<?xf32>
    return %4 : tensor<?xf32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d0)>
#map2 = affine_map<(d0, d1) -> (d1)>
module {
  func.func @fusion_different_axes(%arg0: tensor<5000xi64>, %arg1: tensor<5000xi32>) -> tensor<5000xi32> {
    %c1_i32 = arith.constant 1 : i32
    %0 = linalg.generic {indexing_maps = [#map], iterator_types = ["parallel"]} outs(%arg0 : tensor<5000xi64>) {
    ^bb0(%out: i64):
      %3 = linalg.index 0 : index
      %4 = arith.index_cast %3 : index to i64
      linalg.yield %4 : i64
    } -> tensor<5000xi64>
    %1 = tensor.empty() : tensor<5000xi32>
    %2 = linalg.generic {indexing_maps = [#map1, #map2], iterator_types = ["parallel", "parallel"]} ins(%0 : tensor<5000xi64>) outs(%1 : tensor<5000xi32>) {
    ^bb0(%in: i64, %out: i32):
      %3 = arith.index_cast %in : i64 to index
      %extracted = tensor.extract %arg1[%3] : tensor<5000xi32>
      linalg.yield %extracted : i32
    } -> tensor<5000xi32>
    return %2 : tensor<5000xi32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0) -> (d0, 1)>
#map2 = affine_map<(d0) -> (d0)>
module {
  func.func @fusion_different_axes_indexed(%arg0: tensor<2x2xi32>) -> tensor<2xi32> {
    %0 = tensor.empty() : tensor<2x2xi32>
    %1 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0 : tensor<2x2xi32>) outs(%0 : tensor<2x2xi32>) {
    ^bb0(%in: i32, %out: i32):
      %4 = linalg.index 1 : index
      %5 = arith.index_cast %4 : index to i32
      linalg.yield %5 : i32
    } -> tensor<2x2xi32>
    %2 = tensor.empty() : tensor<2xi32>
    %3 = linalg.generic {indexing_maps = [#map1, #map2], iterator_types = ["parallel"]} ins(%1 : tensor<2x2xi32>) outs(%2 : tensor<2xi32>) {
    ^bb0(%in: i32, %out: i32):
      linalg.yield %in : i32
    } -> tensor<2xi32>
    return %3 : tensor<2xi32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @fold_fill_generic_basic(%arg0: tensor<?xf32>) -> tensor<?xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 7.000000e+00 : f32
    %dim = tensor.dim %arg0, %c0 : tensor<?xf32>
    %0 = tensor.empty(%dim) : tensor<?xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<?xf32>) -> tensor<?xf32>
    %2 = tensor.empty(%dim) : tensor<?xf32>
    %3 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %1 : tensor<?xf32>, tensor<?xf32>) outs(%2 : tensor<?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %4 = arith.addf %in, %in_0 : f32
      linalg.yield %4 : f32
    } -> tensor<?xf32>
    return %3 : tensor<?xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
module {
  func.func @fold_fill_generic_mixedaccess(%arg0: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %c0 = arith.constant 0 : index
    %c0_0 = arith.constant 0 : index
    %cst = arith.constant 7.000000e+00 : f32
    %cst_1 = arith.constant 6.000000e+00 : f32
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf32>
    %dim_2 = tensor.dim %arg0, %c0_0 : tensor<?x?xf32>
    %0 = tensor.empty(%dim, %dim_2) : tensor<?x?xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %2 = tensor.empty(%dim_2, %dim) : tensor<?x?xf32>
    %3 = linalg.fill ins(%cst_1 : f32) outs(%2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %4 = tensor.empty(%dim, %dim_2) : tensor<?x?xf32>
    %5 = linalg.generic {indexing_maps = [#map, #map1, #map], iterator_types = ["parallel", "parallel"]} ins(%1, %3 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%4 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_3: f32, %out: f32):
      %6 = arith.divf %in, %in_3 : f32
      linalg.yield %6 : f32
    } -> tensor<?x?xf32>
    return %5 : tensor<?x?xf32>
  }
}

// -----
#map = affine_map<() -> ()>
module {
  func.func @fuse_multi_result_producer(%arg0: tensor<f32>, %arg1: tensor<f32>, %arg2: tensor<f32>, %arg3: tensor<f32>, %arg4: tensor<f32>) -> tensor<f32> {
    %0 = tensor.empty() : tensor<f32>
    %1 = tensor.empty() : tensor<f32>
    %2:2 = linalg.generic {indexing_maps = [#map, #map, #map, #map, #map], iterator_types = []} ins(%arg0, %arg1, %arg1 : tensor<f32>, tensor<f32>, tensor<f32>) outs(%0, %1 : tensor<f32>, tensor<f32>) {
    ^bb0(%in: f32, %in_0: f32, %in_1: f32, %out: f32, %out_2: f32):
      %4 = arith.addf %in, %in_0 : f32
      %5 = arith.addf %4, %in_1 : f32
      linalg.yield %4, %5 : f32, f32
    } -> (tensor<f32>, tensor<f32>)
    %3 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = []} ins(%2#1, %arg1 : tensor<f32>, tensor<f32>) outs(%arg4 : tensor<f32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %4 = arith.addf %in, %in_0 : f32
      %5 = arith.addf %4, %in_0 : f32
      linalg.yield %5 : f32
    } -> tensor<f32>
    return %3 : tensor<f32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0 * 4 + d1 * 2 + d2 + d3, 0, 0, 0)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d6)>
#map3 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d3, d4, d5, d6)>
#map4 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3, d4, d5)>
module {
  func.func @fuse_only_as_long_as_result_map_is_permutation(%arg0: tensor<1x1x2x1xf32>, %arg1: tensor<1x1x2x1xf32>) -> tensor<1x1x2x4xf32> {
    %c2 = arith.constant 2 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %0 = tensor.empty() : tensor<1x2x2x1xf32>
    %1 = linalg.generic {indexing_maps = [#map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} outs(%0 : tensor<1x2x2x1xf32>) {
    ^bb0(%out: f32):
      %6 = linalg.index 1 : index
      %7 = linalg.index 2 : index
      %8 = arith.cmpi ult, %6, %c1 : index
      %9 = arith.cmpi ult, %7, %c2 : index
      %10 = arith.andi %8, %9 : i1
      %11 = scf.if %10 -> (f32) {
        %extracted = tensor.extract %arg1[%c0, %6, %7, %c0] : tensor<1x1x2x1xf32>
        scf.yield %extracted : f32
      } else {
        scf.yield %cst : f32
      }
      linalg.yield %11 : f32
    } -> tensor<1x2x2x1xf32>
    %2 = tensor.empty() : tensor<4x1x1x1xf32>
    %3 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%1 : tensor<1x2x2x1xf32>) outs(%2 : tensor<4x1x1x1xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<4x1x1x1xf32>
    %4 = tensor.empty() : tensor<1x1x2x4xf32>
    %expanded = tensor.expand_shape %4 [[0], [1], [2], [3, 4, 5]] output_shape [1, 1, 2, 4, 1, 1] : tensor<1x1x2x4xf32> into tensor<1x1x2x4x1x1xf32>
    %5 = linalg.generic {indexing_maps = [#map2, #map3, #map4], iterator_types = ["parallel", "parallel", "parallel", "parallel", "parallel", "parallel", "reduction"]} ins(%arg0, %3 : tensor<1x1x2x1xf32>, tensor<4x1x1x1xf32>) outs(%expanded : tensor<1x1x2x4x1x1xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %6 = arith.mulf %in, %in_0 : f32
      %7 = arith.addf %6, %out : f32
      linalg.yield %7 : f32
    } -> tensor<1x1x2x4x1x1xf32>
    %collapsed = tensor.collapse_shape %5 [[0], [1], [2], [3, 4, 5]] : tensor<1x1x2x4x1x1xf32> into tensor<1x1x2x4xf32>
    return %collapsed : tensor<1x1x2x4xf32>
  }
}

