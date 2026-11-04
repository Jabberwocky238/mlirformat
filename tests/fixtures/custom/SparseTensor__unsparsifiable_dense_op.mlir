#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d1, 0)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map3 = affine_map<(d0, d1, d2, d3) -> (d2, d3)>
#map4 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 32, crdWidth = 32 }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton), posWidth = 32, crdWidth = 32 }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed), posWidth = 32, crdWidth = 32 }>
module {
  func.func @dense_op_without_sp_dep(%arg0: tensor<2x10x8xf32>, %arg1: tensor<2x10x1xf32>, %arg2: tensor<2x10x1xf32>, %arg3: tensor<2x10x1xf32>, %arg4: tensor<8xf32, #sparse>, %arg5: tensor<8xf32, #sparse>, %arg6: tensor<100x8xf32, #sparse1>) -> tensor<2x10x100xf32> {
    %cst = arith.constant -3.40282347E+38 : f32
    %0 = tensor.empty() : tensor<2x10x100xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map1, #map1, #map1, #map2, #map2, #map3, #map4], iterator_types = ["parallel", "parallel", "parallel", "reduction"]} ins(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5, %arg6 : tensor<2x10x8xf32>, tensor<2x10x1xf32>, tensor<2x10x1xf32>, tensor<2x10x1xf32>, tensor<8xf32, #sparse>, tensor<8xf32, #sparse>, tensor<100x8xf32, #sparse1>) outs(%0 : tensor<2x10x100xf32>) {
    ^bb0(%in: f32, %in_0: f32, %in_1: f32, %in_2: f32, %in_3: f32, %in_4: f32, %in_5: f32, %out: f32):
      %2 = arith.mulf %in_2, %in_2 : f32
      %3 = arith.mulf %in_1, %cst : f32
      %4 = arith.subf %3, %2 : f32
      %5 = arith.maximumf %4, %cst : f32
      %6 = arith.addf %5, %cst : f32
      %7 = math.rsqrt %6 : f32
      %8 = arith.mulf %7, %in_3 : f32
      %9 = arith.subf %in, %in_0 : f32
      %10 = arith.mulf %9, %8 : f32
      %11 = arith.addf %10, %in_4 : f32
      %12 = arith.mulf %11, %in_5 : f32
      %13 = arith.addf %out, %12 : f32
      linalg.yield %13 : f32
    } -> tensor<2x10x100xf32>
    return %1 : tensor<2x10x100xf32>
  }
  func.func @dense_op_with_sp_dep(%arg0: tensor<2x10x8xf32>, %arg1: tensor<2x10x1xf32, #sparse2>, %arg2: tensor<2x10x1xf32, #sparse2>, %arg3: tensor<2x10x1xf32, #sparse2>, %arg4: tensor<8xf32, #sparse>, %arg5: tensor<8xf32, #sparse>, %arg6: tensor<100x8xf32, #sparse1>) -> tensor<2x10x100xf32> {
    %cst = arith.constant -3.40282347E+38 : f32
    %0 = tensor.empty() : tensor<2x10x100xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map1, #map1, #map1, #map2, #map2, #map3, #map4], iterator_types = ["parallel", "parallel", "parallel", "reduction"]} ins(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5, %arg6 : tensor<2x10x8xf32>, tensor<2x10x1xf32, #sparse2>, tensor<2x10x1xf32, #sparse2>, tensor<2x10x1xf32, #sparse2>, tensor<8xf32, #sparse>, tensor<8xf32, #sparse>, tensor<100x8xf32, #sparse1>) outs(%0 : tensor<2x10x100xf32>) {
    ^bb0(%in: f32, %in_0: f32, %in_1: f32, %in_2: f32, %in_3: f32, %in_4: f32, %in_5: f32, %out: f32):
      %2 = arith.mulf %in_2, %in_2 : f32
      %3 = arith.mulf %in_1, %cst : f32
      %4 = arith.subf %3, %2 : f32
      %5 = arith.maximumf %4, %cst : f32
      %6 = arith.addf %5, %cst : f32
      %7 = math.rsqrt %6 : f32
      %8 = arith.mulf %7, %in_3 : f32
      %9 = arith.subf %in, %in_0 : f32
      %10 = arith.mulf %9, %8 : f32
      %11 = arith.addf %10, %in_4 : f32
      %12 = arith.mulf %11, %in_5 : f32
      %13 = arith.addf %out, %12 : f32
      linalg.yield %13 : f32
    } -> tensor<2x10x100xf32>
    return %1 : tensor<2x10x100xf32>
  }
}

