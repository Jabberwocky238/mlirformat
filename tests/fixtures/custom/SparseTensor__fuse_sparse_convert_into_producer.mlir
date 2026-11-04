#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : dense) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed(nonunique), d1 : singleton(nonunique, soa), d2 : singleton(soa)) }>
module {
  func.func @fold_convert(%arg0: tensor<128x32x32x1xf32>, %arg1: tensor<128x32x32x1xf32>, %arg2: tensor<128x32x32x1xf32>) -> tensor<128x32x32x1xf32, #sparse> {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    %cst_1 = arith.constant 1.000000e+00 : f32
    %0 = tensor.empty() : tensor<128x32x32x1xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map, #map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0, %arg1, %arg2 : tensor<128x32x32x1xf32>, tensor<128x32x32x1xf32>, tensor<128x32x32x1xf32>) outs(%0 : tensor<128x32x32x1xf32>) {
    ^bb0(%in: f32, %in_2: f32, %in_3: f32, %out: f32):
      %3 = arith.subf %cst_0, %in_2 : f32
      %4 = arith.mulf %in, %3 : f32
      %5 = arith.mulf %4, %cst_1 : f32
      %6 = arith.addf %5, %in_3 : f32
      %7 = arith.subf %6, %cst_0 : f32
      %8 = arith.cmpf uge, %7, %cst : f32
      %9 = arith.uitofp %8 : i1 to f32
      linalg.yield %9 : f32
    } -> tensor<128x32x32x1xf32>
    %2 = sparse_tensor.convert %1 : tensor<128x32x32x1xf32> to tensor<128x32x32x1xf32, #sparse>
    return %2 : tensor<128x32x32x1xf32, #sparse>
  }
  func.func @fold_convert_multi_use(%arg0: tensor<128x32x32x1xf32>, %arg1: tensor<128x32x32x1xf32>, %arg2: tensor<128x32x32x1xf32>, %arg3: tensor<128x32x32x1xf32>) -> (tensor<128x32x32x1xf32>, tensor<128x32x32x1xf32, #sparse>) {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    %cst_1 = arith.constant 1.000000e+00 : f32
    %0 = tensor.empty() : tensor<128x32x32x1xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : tensor<128x32x32x1xf32>, tensor<128x32x32x1xf32>) outs(%0 : tensor<128x32x32x1xf32>) {
    ^bb0(%in: f32, %in_2: f32, %out: f32):
      %4 = arith.mulf %in, %in_2 : f32
      linalg.yield %4 : f32
    } -> tensor<128x32x32x1xf32>
    %2 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg2, %arg3 : tensor<128x32x32x1xf32>, tensor<128x32x32x1xf32>) outs(%0 : tensor<128x32x32x1xf32>) {
    ^bb0(%in: f32, %in_2: f32, %out: f32):
      %4 = arith.mulf %in, %in_2 : f32
      linalg.yield %4 : f32
    } -> tensor<128x32x32x1xf32>
    %3 = sparse_tensor.convert %2 : tensor<128x32x32x1xf32> to tensor<128x32x32x1xf32, #sparse>
    return %1, %3 : tensor<128x32x32x1xf32>, tensor<128x32x32x1xf32, #sparse>
  }
  func.func @fold_cast(%arg0: tensor<10x20x30xf64, #sparse1>) -> tensor<10x20x30xf64, #sparse1> {
    %cst = arith.constant 0.000000e+00 : f64
    %0 = tensor.empty() : tensor<10x20x30xf64>
    %1 = linalg.generic {indexing_maps = [#map1, #map1], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0 : tensor<10x20x30xf64, #sparse1>) outs(%0 : tensor<10x20x30xf64>) {
    ^bb0(%in: f64, %out: f64):
      %2 = arith.cmpf ugt, %in, %cst : f64
      %3 = arith.select %2, %in, %cst : f64
      linalg.yield %3 : f64
    } -> tensor<10x20x30xf64>
    %cast = tensor.cast %1 : tensor<10x20x30xf64> to tensor<10x20x30xf64, #sparse1>
    return %cast : tensor<10x20x30xf64, #sparse1>
  }
}

