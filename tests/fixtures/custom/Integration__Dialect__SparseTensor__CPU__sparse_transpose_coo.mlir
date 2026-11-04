#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>
module {
  func.func @transpose_coo(%arg0: tensor<10x5xf32, #sparse>) -> tensor<5x10xf32, #sparse> {
    %0 = tensor.empty() : tensor<5x10xf32, #sparse>
    %1 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg0 : tensor<10x5xf32, #sparse>) outs(%0 : tensor<5x10xf32, #sparse>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<5x10xf32, #sparse>
    return %1 : tensor<5x10xf32, #sparse>
  }
  func.func @main() {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst_0 = arith.constant dense<[[1.000000e+01, 2.000000e+01, 3.000000e+01, 4.000000e+01, 5.000000e+01], [1.100000e+01, 2.100000e+01, 3.100000e+01, 4.100000e+01, 5.100000e+01], [1.200000e+01, 2.200000e+01, 3.200000e+01, 4.200000e+01, 5.200000e+01], [1.300000e+01, 2.300000e+01, 3.300000e+01, 4.300000e+01, 5.300000e+01], [1.400000e+01, 2.400000e+01, 3.400000e+01, 4.400000e+01, 5.400000e+01], [1.500000e+01, 2.500000e+01, 3.500000e+01, 4.500000e+01, 5.500000e+01], [1.600000e+01, 2.600000e+01, 3.600000e+01, 4.600000e+01, 5.600000e+01], [1.700000e+01, 2.700000e+01, 3.700000e+01, 4.700000e+01, 5.700000e+01], [1.800000e+01, 2.800000e+01, 3.800000e+01, 4.800000e+01, 5.800000e+01], [1.900000e+01, 2.900000e+01, 3.900000e+01, 4.900000e+01, 5.900000e+01]]> : tensor<10x5xf32>
    %0 = sparse_tensor.convert %cst_0 : tensor<10x5xf32> to tensor<10x5xf32, #sparse>
    %1 = call @transpose_coo(%0) : (tensor<10x5xf32, #sparse>) -> tensor<5x10xf32, #sparse>
    sparse_tensor.print %0 : tensor<10x5xf32, #sparse>
    sparse_tensor.print %1 : tensor<5x10xf32, #sparse>
    bufferization.dealloc_tensor %0 : tensor<10x5xf32, #sparse>
    bufferization.dealloc_tensor %1 : tensor<5x10xf32, #sparse>
    return
  }
}

