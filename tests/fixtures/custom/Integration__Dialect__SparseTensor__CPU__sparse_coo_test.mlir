#map = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>
module {
  func.func @add_coo_csr(%arg0: tensor<8x8xf32, #sparse>, %arg1: tensor<8x8xf32, #sparse1>) -> tensor<8x8xf32> {
    %0 = tensor.empty() : tensor<8x8xf32>
    %cst = arith.constant 0.000000e+00 : f32
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<8x8xf32>) -> tensor<8x8xf32>
    %2 = linalg.generic {doc = "X(i,j) = A(i,j) + B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<8x8xf32, #sparse>, tensor<8x8xf32, #sparse1>) outs(%1 : tensor<8x8xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %3 = arith.addf %in, %in_0 : f32
      linalg.yield %3 : f32
    } -> tensor<8x8xf32>
    return %2 : tensor<8x8xf32>
  }
  func.func @add_coo_coo(%arg0: tensor<8x8xf32, #sparse2>, %arg1: tensor<8x8xf32, #sparse1>) -> tensor<8x8xf32> {
    %0 = tensor.empty() : tensor<8x8xf32>
    %cst = arith.constant 0.000000e+00 : f32
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<8x8xf32>) -> tensor<8x8xf32>
    %2 = linalg.generic {doc = "X(i,j) = A(i,j) + B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<8x8xf32, #sparse2>, tensor<8x8xf32, #sparse1>) outs(%1 : tensor<8x8xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %3 = arith.addf %in, %in_0 : f32
      linalg.yield %3 : f32
    } -> tensor<8x8xf32>
    return %2 : tensor<8x8xf32>
  }
  func.func @add_coo_coo_out_coo(%arg0: tensor<8x8xf32, #sparse2>, %arg1: tensor<8x8xf32, #sparse1>) -> tensor<8x8xf32, #sparse1> {
    %0 = tensor.empty() : tensor<8x8xf32, #sparse1>
    %1 = linalg.generic {doc = "X(i,j) = A(i,j) + B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<8x8xf32, #sparse2>, tensor<8x8xf32, #sparse1>) outs(%0 : tensor<8x8xf32, #sparse1>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %2 = arith.addf %in, %in_0 : f32
      linalg.yield %2 : f32
    } -> tensor<8x8xf32, #sparse1>
    return %1 : tensor<8x8xf32, #sparse1>
  }
  func.func @add_coo_dense(%arg0: tensor<8x8xf32>, %arg1: tensor<8x8xf32, #sparse1>) -> tensor<8x8xf32> {
    %0 = tensor.empty() : tensor<8x8xf32>
    %cst = arith.constant 0.000000e+00 : f32
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<8x8xf32>) -> tensor<8x8xf32>
    %2 = linalg.generic {doc = "X(i,j) = A(i,j) + B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<8x8xf32>, tensor<8x8xf32, #sparse1>) outs(%1 : tensor<8x8xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %3 = arith.addf %in, %in_0 : f32
      linalg.yield %3 : f32
    } -> tensor<8x8xf32>
    return %2 : tensor<8x8xf32>
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    %cst = arith.constant dense<[[1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00], [1.100000e+00, 2.100000e+00, 3.100000e+00, 4.100000e+00, 5.100000e+00, 6.100000e+00, 7.100000e+00, 8.100000e+00], [2.200000e+00, 2.200000e+00, 3.200000e+00, 4.200000e+00, 5.200000e+00, 6.1999998, 7.1999998, 8.1999998], [3.300000e+00, 2.300000e+00, 3.300000e+00, 4.300000e+00, 5.300000e+00, 6.300000e+00, 7.300000e+00, 8.300000e+00], [4.400000e+00, 2.400000e+00, 3.400000e+00, 4.400000e+00, 5.400000e+00, 6.400000e+00, 7.400000e+00, 8.39999961], [5.500000e+00, 2.500000e+00, 3.500000e+00, 4.500000e+00, 5.500000e+00, 6.500000e+00, 7.500000e+00, 8.500000e+00], [6.600000e+00, 2.600000e+00, 3.600000e+00, 4.600000e+00, 5.600000e+00, 6.600000e+00, 7.600000e+00, 8.600000e+00], [7.6999998, 2.700000e+00, 3.700000e+00, 4.700000e+00, 5.700000e+00, 6.6999998, 7.6999998, 8.6999998]]> : tensor<8x8xf32>
    %cst_0 = arith.constant dense<[[7.800000e+00, 2.800000e+00, 3.800000e+00, 8.000000e-01, 3.800000e+00, 1.000000e-01, 7.800000e+00, 8.800000e+00], [3.300000e+00, 2.300000e+00, 1.300000e+00, 4.300000e+00, 3.300000e+00, 6.300000e+00, 9.300000e+00, 8.300000e+00], [6.600000e+00, 2.600000e+00, 3.600000e+00, 4.600000e+00, 3.600000e+00, 6.600000e+00, 7.600000e+00, 7.600000e+00], [1.000000e+00, 3.000000e+00, 3.000000e+00, 4.000000e+00, 3.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00], [1.000000e-01, 2.100000e+00, 3.100000e+00, 4.100000e+00, 3.100000e+00, 6.100000e+00, 7.100000e+00, 8.100000e+00], [4.400000e+00, 2.400000e+00, 3.400000e+00, 4.400000e+00, 3.400000e+00, 6.400000e+00, 8.39999961, 8.39999961], [5.500000e+00, 3.500000e+00, 1.500000e+00, 4.500000e+00, 3.500000e+00, 6.500000e+00, 7.500000e+00, 8.500000e+00], [7.6999998, 2.700000e+00, 3.700000e+00, 0.699999988, 5.700000e+00, 3.700000e+00, 3.700000e+00, 0.699999988]]> : tensor<8x8xf32>
    %0 = sparse_tensor.convert %cst : tensor<8x8xf32> to tensor<8x8xf32, #sparse>
    %1 = sparse_tensor.convert %cst : tensor<8x8xf32> to tensor<8x8xf32, #sparse2>
    %2 = sparse_tensor.convert %cst_0 : tensor<8x8xf32> to tensor<8x8xf32, #sparse1>
    %3 = call @add_coo_dense(%cst, %2) : (tensor<8x8xf32>, tensor<8x8xf32, #sparse1>) -> tensor<8x8xf32>
    %4 = call @add_coo_csr(%0, %2) : (tensor<8x8xf32, #sparse>, tensor<8x8xf32, #sparse1>) -> tensor<8x8xf32>
    %5 = call @add_coo_coo(%1, %2) : (tensor<8x8xf32, #sparse2>, tensor<8x8xf32, #sparse1>) -> tensor<8x8xf32>
    %6 = call @add_coo_coo_out_coo(%1, %2) : (tensor<8x8xf32, #sparse2>, tensor<8x8xf32, #sparse1>) -> tensor<8x8xf32, #sparse1>
    %7 = sparse_tensor.convert %6 : tensor<8x8xf32, #sparse1> to tensor<8x8xf32>
    %cst_1 = arith.constant 0.000000e+00 : f32
    scf.for %arg0 = %c0 to %c8 step %c1 {
      %8 = vector.transfer_read %3[%arg0, %c0], %cst_1 : tensor<8x8xf32>, vector<8xf32>
      %9 = vector.transfer_read %4[%arg0, %c0], %cst_1 : tensor<8x8xf32>, vector<8xf32>
      %10 = vector.transfer_read %5[%arg0, %c0], %cst_1 : tensor<8x8xf32>, vector<8xf32>
      %11 = vector.transfer_read %7[%arg0, %c0], %cst_1 : tensor<8x8xf32>, vector<8xf32>
      vector.print %8 : vector<8xf32>
      vector.print %9 : vector<8xf32>
      vector.print %10 : vector<8xf32>
      vector.print %11 : vector<8xf32>
    }
    sparse_tensor.print %6 : tensor<8x8xf32, #sparse1>
    bufferization.dealloc_tensor %3 : tensor<8x8xf32>
    bufferization.dealloc_tensor %4 : tensor<8x8xf32>
    bufferization.dealloc_tensor %5 : tensor<8x8xf32>
    bufferization.dealloc_tensor %7 : tensor<8x8xf32>
    bufferization.dealloc_tensor %0 : tensor<8x8xf32, #sparse>
    bufferization.dealloc_tensor %1 : tensor<8x8xf32, #sparse2>
    bufferization.dealloc_tensor %2 : tensor<8x8xf32, #sparse1>
    bufferization.dealloc_tensor %6 : tensor<8x8xf32, #sparse1>
    return
  }
}

