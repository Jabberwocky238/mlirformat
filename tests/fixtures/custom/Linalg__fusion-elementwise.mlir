#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @drop_unused_producer_result(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0:2 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0 : tensor<?x?xf32>) outs(%arg0, %arg0 : tensor<?x?xf32>, tensor<?x?xf32>) {
    ^bb0(%in: f32, %out: f32, %out_0: f32):
      %2 = arith.addf %in, %in : f32
      %3 = arith.mulf %in, %in : f32
      linalg.yield %2, %3 : f32, f32
    } -> (tensor<?x?xf32>, tensor<?x?xf32>)
    %1 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%0#0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg0 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %2 = arith.subf %in, %in_0 : f32
      linalg.yield %2 : f32
    } -> tensor<?x?xf32>
    return %1 : tensor<?x?xf32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @handle_unused_operands(%arg0: tensor<8xf32>, %arg1: tensor<8xf32>) -> tensor<8xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    %0:2 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} outs(%arg0, %arg1 : tensor<8xf32>, tensor<8xf32>) {
    ^bb0(%out: f32, %out_1: f32):
      %1 = linalg.index 0 : index
      %2 = arith.index_cast %1 : index to i64
      %3 = arith.sitofp %2 : i64 to f32
      %4 = arith.divf %3, %cst : f32
      linalg.yield %3, %4 : f32, f32
    } -> (tensor<8xf32>, tensor<8xf32>)
    linalg.generic {indexing_maps = [#map], iterator_types = ["parallel"]} ins(%0#1 : tensor<8xf32>) {
    ^bb0(%in: f32):
      %1 = arith.cmpf one, %in, %cst_0 : f32
      cf.assert %1, "Side effect op"
      linalg.yield
    }
    return %arg1 : tensor<8xf32>
  }
}

