module {
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @sparse_reduction_ori(%arg0: tensor<i13>, %arg1: tensor<?xi13, #sparse>) -> tensor<i13> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["reduction"]} ins(%arg1 : tensor<?xi13, #sparse>) outs(%arg0 : tensor<i13>) {
    ^bb0(%in: i13, %out: i13):
      %1 = arith.ori %out, %in : i13
      linalg.yield %1 : i13
    } -> tensor<i13>
    return %0 : tensor<i13>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @sparse_reduction_ori_accumulator_on_rhs(%arg0: tensor<i13>, %arg1: tensor<?xi13, #sparse>) -> tensor<i13> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["reduction"]} ins(%arg1 : tensor<?xi13, #sparse>) outs(%arg0 : tensor<i13>) {
    ^bb0(%in: i13, %out: i13):
      %1 = arith.ori %in, %out : i13
      linalg.yield %1 : i13
    } -> tensor<i13>
    return %0 : tensor<i13>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @sparse_reduction_subi(%arg0: tensor<i32>, %arg1: tensor<?xi32, #sparse>) -> tensor<i32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["reduction"]} ins(%arg1 : tensor<?xi32, #sparse>) outs(%arg0 : tensor<i32>) {
    ^bb0(%in: i32, %out: i32):
      %1 = arith.subi %out, %in : i32
      linalg.yield %1 : i32
    } -> tensor<i32>
    return %0 : tensor<i32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @sparse_reduction_xor(%arg0: tensor<i32>, %arg1: tensor<?xi32, #sparse>) -> tensor<i32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["reduction"]} ins(%arg1 : tensor<?xi32, #sparse>) outs(%arg0 : tensor<i32>) {
    ^bb0(%in: i32, %out: i32):
      %1 = arith.xori %out, %in : i32
      linalg.yield %1 : i32
    } -> tensor<i32>
    return %0 : tensor<i32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @sparse_reduction_addi(%arg0: tensor<i32>, %arg1: tensor<?xi32, #sparse>) -> tensor<i32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["reduction"]} ins(%arg1 : tensor<?xi32, #sparse>) outs(%arg0 : tensor<i32>) {
    ^bb0(%in: i32, %out: i32):
      %1 = arith.addi %out, %in : i32
      linalg.yield %1 : i32
    } -> tensor<i32>
    return %0 : tensor<i32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @sparse_reduction_subf(%arg0: tensor<f32>, %arg1: tensor<?xf32, #sparse>) -> tensor<f32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["reduction"]} ins(%arg1 : tensor<?xf32, #sparse>) outs(%arg0 : tensor<f32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.subf %out, %in : f32
      linalg.yield %1 : f32
    } -> tensor<f32>
    return %0 : tensor<f32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @sparse_reduction_addf(%arg0: tensor<f32>, %arg1: tensor<?xf32, #sparse>) -> tensor<f32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["reduction"]} ins(%arg1 : tensor<?xf32, #sparse>) outs(%arg0 : tensor<f32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.addf %out, %in : f32
      linalg.yield %1 : f32
    } -> tensor<f32>
    return %0 : tensor<f32>
  }
}

