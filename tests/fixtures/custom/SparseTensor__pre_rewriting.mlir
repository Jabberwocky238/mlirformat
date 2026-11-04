#map = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(?, 1, 1)>, d1 : #sparse_tensor<slice(?, 3, 1)>) -> (d0 : compressed(nonunique), d1 : singleton) }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
module {
  func.func @sparse_nop_cast(%arg0: tensor<?xf32, #sparse>) -> tensor<?xf32, #sparse> {
    %cast = tensor.cast %arg0 : tensor<?xf32, #sparse> to tensor<?xf32, #sparse>
    %cast_0 = tensor.cast %cast : tensor<?xf32, #sparse> to tensor<?xf32, #sparse>
    %cast_1 = tensor.cast %cast_0 : tensor<?xf32, #sparse> to tensor<?xf32, #sparse>
    return %cast_1 : tensor<?xf32, #sparse>
  }
  func.func @sparse_repair_cast(%arg0: tensor<?xf32>) -> tensor<?xf32, #sparse> {
    %cast = tensor.cast %arg0 : tensor<?xf32> to tensor<?xf32, #sparse>
    return %cast : tensor<?xf32, #sparse>
  }
  func.func @sparse_fuse_slice(%arg0: tensor<2x3xi64, #sparse1>) -> tensor<1x3xi64, #sparse1> {
    %extracted_slice = tensor.extract_slice %arg0[1, 0] [1, 3] [1, 1] : tensor<2x3xi64, #sparse1> to tensor<1x3xi64>
    %cast = tensor.cast %extracted_slice : tensor<1x3xi64> to tensor<1x3xi64, #sparse2>
    %0 = sparse_tensor.convert %cast : tensor<1x3xi64, #sparse2> to tensor<1x3xi64, #sparse1>
    return %0 : tensor<1x3xi64, #sparse1>
  }
  func.func @sparse_select(%arg0: tensor<4x4xi1>, %arg1: tensor<4x4xf64, #sparse3>, %arg2: tensor<4x4xf64, #sparse3>) -> tensor<4x4xf64, #sparse3> {
    %0 = tensor.empty() : tensor<4x4xf64, #sparse3>
    %1 = linalg.generic {indexing_maps = [#map, #map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1, %arg2 : tensor<4x4xi1>, tensor<4x4xf64, #sparse3>, tensor<4x4xf64, #sparse3>) outs(%0 : tensor<4x4xf64, #sparse3>) {
    ^bb0(%in: i1, %in_0: f64, %in_1: f64, %out: f64):
      %2 = arith.select %in, %in_0, %in_1 : f64
      linalg.yield %2 : f64
    } -> tensor<4x4xf64, #sparse3>
    return %1 : tensor<4x4xf64, #sparse3>
  }
}

