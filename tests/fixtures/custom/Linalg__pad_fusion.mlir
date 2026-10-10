#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @dynamic_pad_fusion(%arg0: tensor<?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: f32) -> tensor<?x?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?xf32>
    %0 = tensor.empty(%dim, %dim_0) : tensor<?x?xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0 : tensor<?x?xf32>) outs(%0 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %2 = arith.mulf %in, %in : f32
      linalg.yield %2 : f32
    } -> tensor<?x?xf32>
    %padded = tensor.pad %1 low[%arg1, %arg2] high[%arg3, %arg4] {
    ^bb0(%arg6: index, %arg7: index):
      tensor.yield %arg5 : f32
    } : tensor<?x?xf32> to tensor<?x?xf32>
    return %padded : tensor<?x?xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
module {
  func.func @mixed_pad_fusion(%arg0: tensor<?x42xf32>, %arg1: index, %arg2: index, %arg3: f32) -> tensor<49x?xf32> {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x42xf32>
    %0 = tensor.empty(%dim) : tensor<42x?xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg0 : tensor<?x42xf32>) outs(%0 : tensor<42x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %2 = arith.mulf %in, %in : f32
      linalg.yield %2 : f32
    } -> tensor<42x?xf32>
    %padded = tensor.pad %1 low[3, %arg1] high[4, %arg2] {
    ^bb0(%arg4: index, %arg5: index):
      tensor.yield %arg3 : f32
    } : tensor<42x?xf32> to tensor<49x?xf32>
    return %padded : tensor<49x?xf32>
  }
}

