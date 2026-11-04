#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : compressed) }>
module {
  func.func @collapse_dense(%arg0: tensor<3x4xf64>) -> tensor<12xf64> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1]] : tensor<3x4xf64> into tensor<12xf64>
    return %collapsed : tensor<12xf64>
  }
  func.func @collapse_from_sparse(%arg0: tensor<3x4xf64, #sparse>) -> tensor<12xf64> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1]] : tensor<3x4xf64, #sparse> into tensor<12xf64>
    return %collapsed : tensor<12xf64>
  }
  func.func @collapse_to_sparse(%arg0: tensor<3x4xf64>) -> tensor<12xf64, #sparse1> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1]] : tensor<3x4xf64> into tensor<12xf64, #sparse1>
    return %collapsed : tensor<12xf64, #sparse1>
  }
  func.func @collapse_sparse2sparse(%arg0: tensor<3x4xf64, #sparse>) -> tensor<12xf64, #sparse1> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1]] : tensor<3x4xf64, #sparse> into tensor<12xf64, #sparse1>
    return %collapsed : tensor<12xf64, #sparse1>
  }
  func.func @collapse_dense_6x10(%arg0: tensor<2x3x5x2xf64>) -> tensor<6x10xf64> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1], [2, 3]] : tensor<2x3x5x2xf64> into tensor<6x10xf64>
    return %collapsed : tensor<6x10xf64>
  }
  func.func @collapse_from_sparse_6x10(%arg0: tensor<2x3x5x2xf64, #sparse2>) -> tensor<6x10xf64> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1], [2, 3]] : tensor<2x3x5x2xf64, #sparse2> into tensor<6x10xf64>
    return %collapsed : tensor<6x10xf64>
  }
  func.func @collapse_to_sparse_6x10(%arg0: tensor<2x3x5x2xf64>) -> tensor<6x10xf64, #sparse> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1], [2, 3]] : tensor<2x3x5x2xf64> into tensor<6x10xf64, #sparse>
    return %collapsed : tensor<6x10xf64, #sparse>
  }
  func.func @collapse_sparse2sparse_6x10(%arg0: tensor<2x3x5x2xf64, #sparse2>) -> tensor<6x10xf64, #sparse> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1], [2, 3]] : tensor<2x3x5x2xf64, #sparse2> into tensor<6x10xf64, #sparse>
    return %collapsed : tensor<6x10xf64, #sparse>
  }
  func.func @collapse_dense_dyn(%arg0: tensor<?x?x?x?xf64>) -> tensor<?x?xf64> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1], [2, 3]] : tensor<?x?x?x?xf64> into tensor<?x?xf64>
    return %collapsed : tensor<?x?xf64>
  }
  func.func @collapse_from_sparse_dyn(%arg0: tensor<?x?x?x?xf64, #sparse2>) -> tensor<?x?xf64> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1], [2, 3]] : tensor<?x?x?x?xf64, #sparse2> into tensor<?x?xf64>
    return %collapsed : tensor<?x?xf64>
  }
  func.func @collapse_to_sparse_dyn(%arg0: tensor<?x?x?x?xf64>) -> tensor<?x?xf64, #sparse> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1], [2, 3]] : tensor<?x?x?x?xf64> into tensor<?x?xf64, #sparse>
    return %collapsed : tensor<?x?xf64, #sparse>
  }
  func.func @collapse_sparse2sparse_dyn(%arg0: tensor<?x?x?x?xf64, #sparse2>) -> tensor<?x?xf64, #sparse> {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1], [2, 3]] : tensor<?x?x?x?xf64, #sparse2> into tensor<?x?xf64, #sparse>
    return %collapsed : tensor<?x?xf64, #sparse>
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %cst = arith.constant -1.000000e+00 : f64
    %cst_0 = arith.constant dense<[[1.100000e+00, 0.000000e+00, 1.300000e+00, 0.000000e+00], [2.100000e+00, 0.000000e+00, 2.300000e+00, 0.000000e+00], [3.100000e+00, 0.000000e+00, 3.300000e+00, 0.000000e+00]]> : tensor<3x4xf64>
    %cst_1 = arith.constant dense<[[[[1.000000e+00, 0.000000e+00], [3.000000e+00, 0.000000e+00], [5.000000e+00, 0.000000e+00], [7.000000e+00, 0.000000e+00], [9.000000e+00, 0.000000e+00]], [[0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00]], [[2.100000e+01, 0.000000e+00], [2.300000e+01, 0.000000e+00], [2.500000e+01, 0.000000e+00], [2.700000e+01, 0.000000e+00], [2.900000e+01, 0.000000e+00]]], [[[0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00]], [[4.100000e+01, 0.000000e+00], [4.300000e+01, 0.000000e+00], [4.500000e+01, 0.000000e+00], [4.700000e+01, 0.000000e+00], [4.900000e+01, 0.000000e+00]], [[0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00]]]]> : tensor<2x3x5x2xf64>
    %0 = sparse_tensor.convert %cst_0 : tensor<3x4xf64> to tensor<3x4xf64, #sparse>
    %1 = sparse_tensor.convert %cst_1 : tensor<2x3x5x2xf64> to tensor<2x3x5x2xf64, #sparse2>
    %cast = tensor.cast %cst_0 : tensor<3x4xf64> to tensor<?x?xf64>
    %cast_2 = tensor.cast %cst_1 : tensor<2x3x5x2xf64> to tensor<?x?x?x?xf64>
    %2 = sparse_tensor.convert %cast_2 : tensor<?x?x?x?xf64> to tensor<?x?x?x?xf64, #sparse2>
    %3 = call @collapse_dense(%cst_0) : (tensor<3x4xf64>) -> tensor<12xf64>
    %4 = call @collapse_from_sparse(%0) : (tensor<3x4xf64, #sparse>) -> tensor<12xf64>
    %5 = call @collapse_to_sparse(%cst_0) : (tensor<3x4xf64>) -> tensor<12xf64, #sparse1>
    %6 = call @collapse_sparse2sparse(%0) : (tensor<3x4xf64, #sparse>) -> tensor<12xf64, #sparse1>
    %7 = call @collapse_dense_6x10(%cst_1) : (tensor<2x3x5x2xf64>) -> tensor<6x10xf64>
    %8 = call @collapse_from_sparse_6x10(%1) : (tensor<2x3x5x2xf64, #sparse2>) -> tensor<6x10xf64>
    %9 = call @collapse_to_sparse_6x10(%cst_1) : (tensor<2x3x5x2xf64>) -> tensor<6x10xf64, #sparse>
    %10 = call @collapse_sparse2sparse_6x10(%1) : (tensor<2x3x5x2xf64, #sparse2>) -> tensor<6x10xf64, #sparse>
    %11 = call @collapse_dense_dyn(%cast_2) : (tensor<?x?x?x?xf64>) -> tensor<?x?xf64>
    %12 = call @collapse_from_sparse_dyn(%2) : (tensor<?x?x?x?xf64, #sparse2>) -> tensor<?x?xf64>
    %13 = call @collapse_to_sparse_dyn(%cast_2) : (tensor<?x?x?x?xf64>) -> tensor<?x?xf64, #sparse>
    %14 = call @collapse_sparse2sparse_dyn(%2) : (tensor<?x?x?x?xf64, #sparse2>) -> tensor<?x?xf64, #sparse>
    %15 = vector.transfer_read %3[%c0], %cst : tensor<12xf64>, vector<12xf64>
    vector.print %15 : vector<12xf64>
    %16 = vector.transfer_read %4[%c0], %cst : tensor<12xf64>, vector<12xf64>
    vector.print %16 : vector<12xf64>
    sparse_tensor.print %5 : tensor<12xf64, #sparse1>
    sparse_tensor.print %6 : tensor<12xf64, #sparse1>
    %17 = vector.transfer_read %7[%c0, %c0], %cst : tensor<6x10xf64>, vector<6x10xf64>
    vector.print %17 : vector<6x10xf64>
    %18 = vector.transfer_read %8[%c0, %c0], %cst : tensor<6x10xf64>, vector<6x10xf64>
    vector.print %18 : vector<6x10xf64>
    sparse_tensor.print %9 : tensor<6x10xf64, #sparse>
    sparse_tensor.print %10 : tensor<6x10xf64, #sparse>
    %19 = vector.transfer_read %11[%c0, %c0], %cst : tensor<?x?xf64>, vector<6x10xf64>
    vector.print %19 : vector<6x10xf64>
    %20 = vector.transfer_read %12[%c0, %c0], %cst : tensor<?x?xf64>, vector<6x10xf64>
    vector.print %20 : vector<6x10xf64>
    sparse_tensor.print %13 : tensor<?x?xf64, #sparse>
    sparse_tensor.print %14 : tensor<?x?xf64, #sparse>
    bufferization.dealloc_tensor %0 : tensor<3x4xf64, #sparse>
    bufferization.dealloc_tensor %1 : tensor<2x3x5x2xf64, #sparse2>
    bufferization.dealloc_tensor %2 : tensor<?x?x?x?xf64, #sparse2>
    bufferization.dealloc_tensor %5 : tensor<12xf64, #sparse1>
    bufferization.dealloc_tensor %6 : tensor<12xf64, #sparse1>
    bufferization.dealloc_tensor %9 : tensor<6x10xf64, #sparse>
    bufferization.dealloc_tensor %10 : tensor<6x10xf64, #sparse>
    bufferization.dealloc_tensor %13 : tensor<?x?xf64, #sparse>
    bufferization.dealloc_tensor %14 : tensor<?x?xf64, #sparse>
    bufferization.dealloc_tensor %4 : tensor<12xf64>
    bufferization.dealloc_tensor %8 : tensor<6x10xf64>
    bufferization.dealloc_tensor %12 : tensor<?x?xf64>
    return
  }
}

