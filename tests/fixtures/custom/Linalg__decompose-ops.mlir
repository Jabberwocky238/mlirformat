#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
#map2 = affine_map<(d0, d1) -> (d1)>
#map3 = affine_map<(d0, d1) -> (d1, d0)>
module {
  func.func @simple_op(%arg0: tensor<?x?xf32>, %arg1: tensor<?xf32>, %arg2: tensor<?xf32>) -> (tensor<?x?xf32>, tensor<?x?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?xf32>
    %0 = tensor.empty(%dim_0, %dim) : tensor<?x?xf32>
    %1 = tensor.empty(%dim, %dim_0) : tensor<?x?xf32>
    %2:2 = linalg.generic {indexing_maps = [#map, #map1, #map2, #map3, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1, %arg2 : tensor<?x?xf32>, tensor<?xf32>, tensor<?xf32>) outs(%0, %1 : tensor<?x?xf32>, tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_1: f32, %in_2: f32, %out: f32, %out_3: f32):
      %3 = arith.addf %in, %in_1 : f32
      %4 = arith.mulf %3, %in_2 : f32
      linalg.yield %3, %4 : f32, f32
    } -> (tensor<?x?xf32>, tensor<?x?xf32>)
    return %2#0, %2#1 : tensor<?x?xf32>, tensor<?x?xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
#map2 = affine_map<(d0, d1) -> (d1)>
#map3 = affine_map<(d0, d1) -> (d1, d0)>
module {
  func.func @simple_op_permuted_outputs(%arg0: tensor<?x?xf32>, %arg1: tensor<?xf32>, %arg2: tensor<?xf32>) -> (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?xf32>
    %0 = tensor.empty(%dim_0, %dim) : tensor<?x?xf32>
    %1 = tensor.empty(%dim, %dim_0) : tensor<?x?xf32>
    %2:3 = linalg.generic {indexing_maps = [#map, #map1, #map2, #map3, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1, %arg2 : tensor<?x?xf32>, tensor<?xf32>, tensor<?xf32>) outs(%0, %1, %1 : tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_1: f32, %in_2: f32, %out: f32, %out_3: f32, %out_4: f32):
      %3 = arith.addf %in, %in_1 : f32
      %4 = arith.mulf %3, %in_2 : f32
      linalg.yield %3, %4, %3 : f32, f32, f32
    } -> (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>)
    return %2#0, %2#1, %2#2 : tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
#map2 = affine_map<(d0, d1) -> (d1, d0)>
module {
  func.func @multi_statement(%arg0: tensor<10x20xf32>, %arg1: tensor<10xi32>) -> tensor<20x10xf64> {
    %0 = tensor.empty() : tensor<20x10xf64>
    %1 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<10x20xf32>, tensor<10xi32>) outs(%0 : tensor<20x10xf64>) {
    ^bb0(%in: f32, %in_0: i32, %out: f64):
      %2 = arith.sitofp %in_0 : i32 to f64
      %3 = arith.extf %in : f32 to f64
      %4 = arith.addf %2, %3 : f64
      linalg.yield %4 : f64
    } -> tensor<20x10xf64>
    return %1 : tensor<20x10xf64>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d1)>
#map2 = affine_map<(d0, d1) -> (d0, d1)>
#map3 = affine_map<(d0, d1) -> (d1, d0)>
module {
  func.func @destination_passing_style(%arg0: tensor<?xf32>, %arg1: tensor<?xf32>, %arg2: tensor<?x?xf32>, %arg3: tensor<?x?xf32>) -> (tensor<?x?xf32>, tensor<?x?xf32>) {
    %0:2 = linalg.generic {indexing_maps = [#map, #map1, #map2, #map3], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<?xf32>, tensor<?xf32>) outs(%arg2, %arg3 : tensor<?x?xf32>, tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32, %out_1: f32):
      %1 = arith.addf %in, %out : f32
      %2 = arith.mulf %in_0, %out_1 : f32
      linalg.yield %1, %2 : f32, f32
    } -> (tensor<?x?xf32>, tensor<?x?xf32>)
    return %0#0, %0#1 : tensor<?x?xf32>, tensor<?x?xf32>
  }
}

