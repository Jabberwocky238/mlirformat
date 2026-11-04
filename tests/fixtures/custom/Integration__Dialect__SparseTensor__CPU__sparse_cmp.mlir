#map = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
module {
  func.func @cmp_all_dense(%arg0: tensor<4x4xf64>, %arg1: tensor<4x4xf64>, %arg2: tensor<4x4xi8>) -> tensor<4x4xi8> {
    %0 = linalg.generic {doc = "X(i, j) = cmp A(i,j) B(i, j)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<4x4xf64>, tensor<4x4xf64>) outs(%arg2 : tensor<4x4xi8>) {
    ^bb0(%in: f64, %in_0: f64, %out: i8):
      %1 = arith.cmpf ult, %in, %in_0 : f64
      %2 = arith.extui %1 : i1 to i8
      linalg.yield %2 : i8
    } -> tensor<4x4xi8>
    return %0 : tensor<4x4xi8>
  }
  func.func @cmp_lhs_sparse(%arg0: tensor<4x4xf64, #sparse>, %arg1: tensor<4x4xf64>) -> tensor<4x4xi8, #sparse> {
    %0 = tensor.empty() : tensor<4x4xi8, #sparse>
    %1 = linalg.generic {doc = "X(i, j) = cmp A(i,j) B(i, j)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<4x4xf64, #sparse>, tensor<4x4xf64>) outs(%0 : tensor<4x4xi8, #sparse>) {
    ^bb0(%in: f64, %in_0: f64, %out: i8):
      %2 = arith.cmpf ult, %in, %in_0 : f64
      %3 = arith.extui %2 : i1 to i8
      linalg.yield %3 : i8
    } -> tensor<4x4xi8, #sparse>
    return %1 : tensor<4x4xi8, #sparse>
  }
  func.func @cmp_all_sparse(%arg0: tensor<4x4xf64, #sparse>, %arg1: tensor<4x4xf64, #sparse>) -> tensor<4x4xi8, #sparse> {
    %0 = tensor.empty() : tensor<4x4xi8, #sparse>
    %1 = linalg.generic {doc = "X(i, j) = cmp A(i,j) B(i, j)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<4x4xf64, #sparse>, tensor<4x4xf64, #sparse>) outs(%0 : tensor<4x4xi8, #sparse>) {
    ^bb0(%in: f64, %in_0: f64, %out: i8):
      %2 = arith.cmpf ult, %in, %in_0 : f64
      %3 = arith.extui %2 : i1 to i8
      linalg.yield %3 : i8
    } -> tensor<4x4xi8, #sparse>
    return %1 : tensor<4x4xi8, #sparse>
  }
  func.func @main() {
    %c0_i8 = arith.constant 0 : i8
    %c0 = arith.constant 0 : index
    %cst = arith.constant dense<[[0.000000e+00, 0.000000e+00, 1.500000e+00, 1.000000e+00], [0.000000e+00, 3.500000e+00, 0.000000e+00, 0.000000e+00], [1.000000e+00, 5.000000e+00, 2.000000e+00, 0.000000e+00], [1.000000e+00, 5.000000e-01, 0.000000e+00, 0.000000e+00]]> : tensor<4x4xf64>
    %cst_0 = arith.constant dense<[[0.000000e+00, 1.500000e+00, 1.000000e+00, 1.500000e+00], [3.500000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [5.000000e+00, 2.000000e+00, 0.000000e+00, 2.000000e+00], [5.000000e-01, 0.000000e+00, 0.000000e+00, 0.000000e+00]]> : tensor<4x4xf64>
    %0 = sparse_tensor.convert %cst : tensor<4x4xf64> to tensor<4x4xf64, #sparse>
    %1 = sparse_tensor.convert %cst_0 : tensor<4x4xf64> to tensor<4x4xf64, #sparse>
    %cst_1 = arith.constant dense<0> : tensor<4x4xi8>
    %2 = call @cmp_all_dense(%cst, %cst_0, %cst_1) : (tensor<4x4xf64>, tensor<4x4xf64>, tensor<4x4xi8>) -> tensor<4x4xi8>
    %3 = call @cmp_lhs_sparse(%0, %cst_0) : (tensor<4x4xf64, #sparse>, tensor<4x4xf64>) -> tensor<4x4xi8, #sparse>
    %4 = call @cmp_all_sparse(%0, %1) : (tensor<4x4xf64, #sparse>, tensor<4x4xf64, #sparse>) -> tensor<4x4xi8, #sparse>
    %5 = vector.transfer_read %2[%c0, %c0], %c0_i8 : tensor<4x4xi8>, vector<4x4xi8>
    vector.print %5 : vector<4x4xi8>
    sparse_tensor.print %3 : tensor<4x4xi8, #sparse>
    sparse_tensor.print %4 : tensor<4x4xi8, #sparse>
    bufferization.dealloc_tensor %0 : tensor<4x4xf64, #sparse>
    bufferization.dealloc_tensor %1 : tensor<4x4xf64, #sparse>
    bufferization.dealloc_tensor %2 : tensor<4x4xi8>
    bufferization.dealloc_tensor %3 : tensor<4x4xi8, #sparse>
    bufferization.dealloc_tensor %4 : tensor<4x4xi8, #sparse>
    return
  }
}

