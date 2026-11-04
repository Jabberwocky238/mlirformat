#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 floordiv 4 : dense, d1 mod 4 : structured[2, 4]) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
module {
  func.func @mul(%arg0: tensor<4x8xf64>, %arg1: tensor<4x8xf64, #sparse>) -> tensor<4x4xf64> {
    %cst = arith.constant dense<0.000000e+00> : tensor<4x4xf64>
    %0 = linalg.generic {doc = "X(i,j) *= A(i,j) * B(j,i)", indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<4x8xf64>, tensor<4x8xf64, #sparse>) outs(%cst : tensor<4x4xf64>) {
    ^bb0(%in: f64, %in_0: f64, %out: f64):
      %1 = arith.mulf %in, %in_0 : f64
      %2 = arith.addf %1, %out : f64
      linalg.yield %2 : f64
    } -> tensor<4x4xf64>
    return %0 : tensor<4x4xf64>
  }
  func.func @mul_24(%arg0: tensor<4x8xf64>, %arg1: tensor<4x8xf64, #sparse1>) -> tensor<4x4xf64> {
    %cst = arith.constant dense<0.000000e+00> : tensor<4x4xf64>
    %0 = linalg.generic {doc = "X(i,j) *= A(i,j) * B(j,i)", indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<4x8xf64>, tensor<4x8xf64, #sparse1>) outs(%cst : tensor<4x4xf64>) {
    ^bb0(%in: f64, %in_0: f64, %out: f64):
      %1 = arith.mulf %in, %in_0 : f64
      %2 = arith.addf %1, %out : f64
      linalg.yield %2 : f64
    } -> tensor<4x4xf64>
    return %0 : tensor<4x4xf64>
  }
  func.func @mul_csr_bsr(%arg0: tensor<4x8xf64, #sparse2>, %arg1: tensor<4x8xf64, #sparse>) -> tensor<4x4xf64> {
    %cst = arith.constant dense<0.000000e+00> : tensor<4x4xf64>
    %0 = linalg.generic {doc = "X(i,j) *= A(i,j) * B(j,i)", indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<4x8xf64, #sparse2>, tensor<4x8xf64, #sparse>) outs(%cst : tensor<4x4xf64>) {
    ^bb0(%in: f64, %in_0: f64, %out: f64):
      %1 = arith.mulf %in, %in_0 : f64
      %2 = arith.addf %1, %out : f64
      linalg.yield %2 : f64
    } -> tensor<4x4xf64>
    return %0 : tensor<4x4xf64>
  }
  func.func @mul_dense(%arg0: tensor<4x8xf64>, %arg1: tensor<4x8xf64>) -> tensor<4x4xf64> {
    %cst = arith.constant dense<0.000000e+00> : tensor<4x4xf64>
    %0 = linalg.generic {doc = "X(i,j) *= A(i,j) * B(j,i)", indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<4x8xf64>, tensor<4x8xf64>) outs(%cst : tensor<4x4xf64>) {
    ^bb0(%in: f64, %in_0: f64, %out: f64):
      %1 = arith.mulf %in, %in_0 : f64
      %2 = arith.addf %1, %out : f64
      linalg.yield %2 : f64
    } -> tensor<4x4xf64>
    return %0 : tensor<4x4xf64>
  }
  func.func @dump_dense_f64(%arg0: tensor<4x4xf64>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant -1.000000e+00 : f64
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst : tensor<4x4xf64>, vector<4x4xf64>
    vector.print %0 : vector<4x4xf64>
    return
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %cst = arith.constant dense<[[1.000000e+00, 2.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 4.000000e+00, 5.000000e+00], [6.000000e+00, 7.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 1.000000e+01, 1.100000e+01], [0.000000e+00, 0.000000e+00, 1.200000e+01, 1.300000e+01, 1.600000e+01, 1.700000e+01, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 1.800000e+01, 1.900000e+01, 2.200000e+01, 2.300000e+01, 0.000000e+00, 0.000000e+00]]> : tensor<4x8xf64>
    %0 = sparse_tensor.convert %cst : tensor<4x8xf64> to tensor<4x8xf64, #sparse>
    %1 = sparse_tensor.convert %cst : tensor<4x8xf64> to tensor<4x8xf64, #sparse1>
    %2 = sparse_tensor.convert %cst : tensor<4x8xf64> to tensor<4x8xf64, #sparse2>
    %3 = call @mul_dense(%cst, %cst) : (tensor<4x8xf64>, tensor<4x8xf64>) -> tensor<4x4xf64>
    %4 = call @mul(%cst, %0) : (tensor<4x8xf64>, tensor<4x8xf64, #sparse>) -> tensor<4x4xf64>
    %5 = call @mul_24(%cst, %1) : (tensor<4x8xf64>, tensor<4x8xf64, #sparse1>) -> tensor<4x4xf64>
    %6 = call @mul_csr_bsr(%2, %0) : (tensor<4x8xf64, #sparse2>, tensor<4x8xf64, #sparse>) -> tensor<4x4xf64>
    call @dump_dense_f64(%3) : (tensor<4x4xf64>) -> ()
    call @dump_dense_f64(%4) : (tensor<4x4xf64>) -> ()
    call @dump_dense_f64(%5) : (tensor<4x4xf64>) -> ()
    call @dump_dense_f64(%6) : (tensor<4x4xf64>) -> ()
    bufferization.dealloc_tensor %0 : tensor<4x8xf64, #sparse>
    bufferization.dealloc_tensor %1 : tensor<4x8xf64, #sparse1>
    bufferization.dealloc_tensor %2 : tensor<4x8xf64, #sparse2>
    bufferization.dealloc_tensor %3 : tensor<4x4xf64>
    bufferization.dealloc_tensor %4 : tensor<4x4xf64>
    bufferization.dealloc_tensor %5 : tensor<4x4xf64>
    bufferization.dealloc_tensor %6 : tensor<4x4xf64>
    return
  }
}

