#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>
module {
  func.func @expand_dense(%arg0: tensor<12xf64>) -> tensor<3x4xf64> {
    %expanded = tensor.expand_shape %arg0 [[0, 1]] output_shape [3, 4] : tensor<12xf64> into tensor<3x4xf64>
    return %expanded : tensor<3x4xf64>
  }
  func.func @expand_from_sparse(%arg0: tensor<12xf64, #sparse>) -> tensor<3x4xf64> {
    %expanded = tensor.expand_shape %arg0 [[0, 1]] output_shape [3, 4] : tensor<12xf64, #sparse> into tensor<3x4xf64>
    return %expanded : tensor<3x4xf64>
  }
  func.func @expand_to_sparse(%arg0: tensor<12xf64>) -> tensor<3x4xf64, #sparse1> {
    %expanded = tensor.expand_shape %arg0 [[0, 1]] output_shape [3, 4] : tensor<12xf64> into tensor<3x4xf64, #sparse1>
    return %expanded : tensor<3x4xf64, #sparse1>
  }
  func.func @expand_sparse2sparse(%arg0: tensor<12xf64, #sparse>) -> tensor<3x4xf64, #sparse1> {
    %expanded = tensor.expand_shape %arg0 [[0, 1]] output_shape [3, 4] : tensor<12xf64, #sparse> into tensor<3x4xf64, #sparse1>
    return %expanded : tensor<3x4xf64, #sparse1>
  }
  func.func @expand_dense_3x2x2(%arg0: tensor<3x4xf64>) -> tensor<3x2x2xf64> {
    %expanded = tensor.expand_shape %arg0 [[0], [1, 2]] output_shape [3, 2, 2] : tensor<3x4xf64> into tensor<3x2x2xf64>
    return %expanded : tensor<3x2x2xf64>
  }
  func.func @expand_from_sparse_3x2x2(%arg0: tensor<3x4xf64, #sparse1>) -> tensor<3x2x2xf64> {
    %expanded = tensor.expand_shape %arg0 [[0], [1, 2]] output_shape [3, 2, 2] : tensor<3x4xf64, #sparse1> into tensor<3x2x2xf64>
    return %expanded : tensor<3x2x2xf64>
  }
  func.func @expand_to_sparse_3x2x2(%arg0: tensor<3x4xf64>) -> tensor<3x2x2xf64, #sparse2> {
    %expanded = tensor.expand_shape %arg0 [[0], [1, 2]] output_shape [3, 2, 2] : tensor<3x4xf64> into tensor<3x2x2xf64, #sparse2>
    return %expanded : tensor<3x2x2xf64, #sparse2>
  }
  func.func @expand_sparse2sparse_3x2x2(%arg0: tensor<3x4xf64, #sparse1>) -> tensor<3x2x2xf64, #sparse2> {
    %expanded = tensor.expand_shape %arg0 [[0], [1, 2]] output_shape [3, 2, 2] : tensor<3x4xf64, #sparse1> into tensor<3x2x2xf64, #sparse2>
    return %expanded : tensor<3x2x2xf64, #sparse2>
  }
  func.func @expand_dense_dyn(%arg0: tensor<?x?xf64>) -> tensor<?x2x?xf64> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf64>
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?xf64>
    %0 = arith.divui %dim_0, %c2 : index
    %expanded = tensor.expand_shape %arg0 [[0], [1, 2]] output_shape [%dim, 2, %0] : tensor<?x?xf64> into tensor<?x2x?xf64>
    return %expanded : tensor<?x2x?xf64>
  }
  func.func @expand_from_sparse_dyn(%arg0: tensor<?x?xf64, #sparse1>) -> tensor<?x2x?xf64> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf64, #sparse1>
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?xf64, #sparse1>
    %0 = arith.divui %dim_0, %c2 : index
    %expanded = tensor.expand_shape %arg0 [[0], [1, 2]] output_shape [%dim, 2, %0] : tensor<?x?xf64, #sparse1> into tensor<?x2x?xf64>
    return %expanded : tensor<?x2x?xf64>
  }
  func.func @expand_to_sparse_dyn(%arg0: tensor<?x?xf64>) -> tensor<?x2x?xf64, #sparse2> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf64>
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?xf64>
    %0 = arith.divui %dim_0, %c2 : index
    %expanded = tensor.expand_shape %arg0 [[0], [1, 2]] output_shape [%dim, 2, %0] : tensor<?x?xf64> into tensor<?x2x?xf64, #sparse2>
    return %expanded : tensor<?x2x?xf64, #sparse2>
  }
  func.func @expand_sparse2sparse_dyn(%arg0: tensor<?x?xf64, #sparse1>) -> tensor<?x2x?xf64, #sparse2> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf64, #sparse1>
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?xf64, #sparse1>
    %0 = arith.divui %dim_0, %c2 : index
    %expanded = tensor.expand_shape %arg0 [[0], [1, 2]] output_shape [%dim, 2, %0] : tensor<?x?xf64, #sparse1> into tensor<?x2x?xf64, #sparse2>
    return %expanded : tensor<?x2x?xf64, #sparse2>
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %cst = arith.constant -1.000000e+00 : f64
    %cst_0 = arith.constant dense<[1.000000e+00, 0.000000e+00, 3.000000e+00, 0.000000e+00, 5.000000e+00, 0.000000e+00, 7.000000e+00, 0.000000e+00, 9.000000e+00, 0.000000e+00, 1.100000e+01, 0.000000e+00]> : tensor<12xf64>
    %cst_1 = arith.constant dense<[[1.100000e+00, 1.200000e+00, 1.300000e+00, 1.400000e+00], [2.100000e+00, 2.200000e+00, 2.300000e+00, 2.400000e+00], [3.100000e+00, 3.200000e+00, 3.300000e+00, 3.400000e+00]]> : tensor<3x4xf64>
    %0 = sparse_tensor.convert %cst_0 : tensor<12xf64> to tensor<12xf64, #sparse>
    %1 = sparse_tensor.convert %cst_1 : tensor<3x4xf64> to tensor<3x4xf64, #sparse1>
    %cast = tensor.cast %cst_1 : tensor<3x4xf64> to tensor<?x?xf64>
    %2 = sparse_tensor.convert %cast : tensor<?x?xf64> to tensor<?x?xf64, #sparse1>
    %3 = call @expand_dense(%cst_0) : (tensor<12xf64>) -> tensor<3x4xf64>
    %4 = call @expand_from_sparse(%0) : (tensor<12xf64, #sparse>) -> tensor<3x4xf64>
    %5 = call @expand_to_sparse(%cst_0) : (tensor<12xf64>) -> tensor<3x4xf64, #sparse1>
    %6 = call @expand_sparse2sparse(%0) : (tensor<12xf64, #sparse>) -> tensor<3x4xf64, #sparse1>
    %7 = call @expand_dense_3x2x2(%cst_1) : (tensor<3x4xf64>) -> tensor<3x2x2xf64>
    %8 = call @expand_from_sparse_3x2x2(%1) : (tensor<3x4xf64, #sparse1>) -> tensor<3x2x2xf64>
    %9 = call @expand_to_sparse_3x2x2(%cst_1) : (tensor<3x4xf64>) -> tensor<3x2x2xf64, #sparse2>
    %10 = call @expand_sparse2sparse_3x2x2(%1) : (tensor<3x4xf64, #sparse1>) -> tensor<3x2x2xf64, #sparse2>
    %11 = call @expand_dense_dyn(%cast) : (tensor<?x?xf64>) -> tensor<?x2x?xf64>
    %12 = call @expand_from_sparse_dyn(%2) : (tensor<?x?xf64, #sparse1>) -> tensor<?x2x?xf64>
    %13 = call @expand_to_sparse_dyn(%cast) : (tensor<?x?xf64>) -> tensor<?x2x?xf64, #sparse2>
    %14 = call @expand_sparse2sparse_dyn(%2) : (tensor<?x?xf64, #sparse1>) -> tensor<?x2x?xf64, #sparse2>
    %15 = vector.transfer_read %3[%c0, %c0], %cst : tensor<3x4xf64>, vector<3x4xf64>
    vector.print %15 : vector<3x4xf64>
    %16 = vector.transfer_read %4[%c0, %c0], %cst : tensor<3x4xf64>, vector<3x4xf64>
    vector.print %16 : vector<3x4xf64>
    %17 = vector.transfer_read %7[%c0, %c0, %c0], %cst : tensor<3x2x2xf64>, vector<3x2x2xf64>
    vector.print %17 : vector<3x2x2xf64>
    %18 = vector.transfer_read %8[%c0, %c0, %c0], %cst : tensor<3x2x2xf64>, vector<3x2x2xf64>
    vector.print %18 : vector<3x2x2xf64>
    %19 = vector.transfer_read %11[%c0, %c0, %c0], %cst : tensor<?x2x?xf64>, vector<3x2x2xf64>
    vector.print %19 : vector<3x2x2xf64>
    %20 = vector.transfer_read %12[%c0, %c0, %c0], %cst : tensor<?x2x?xf64>, vector<3x2x2xf64>
    vector.print %20 : vector<3x2x2xf64>
    sparse_tensor.print %5 : tensor<3x4xf64, #sparse1>
    sparse_tensor.print %6 : tensor<3x4xf64, #sparse1>
    sparse_tensor.print %9 : tensor<3x2x2xf64, #sparse2>
    sparse_tensor.print %10 : tensor<3x2x2xf64, #sparse2>
    sparse_tensor.print %13 : tensor<?x2x?xf64, #sparse2>
    sparse_tensor.print %14 : tensor<?x2x?xf64, #sparse2>
    bufferization.dealloc_tensor %0 : tensor<12xf64, #sparse>
    bufferization.dealloc_tensor %1 : tensor<3x4xf64, #sparse1>
    bufferization.dealloc_tensor %2 : tensor<?x?xf64, #sparse1>
    bufferization.dealloc_tensor %5 : tensor<3x4xf64, #sparse1>
    bufferization.dealloc_tensor %6 : tensor<3x4xf64, #sparse1>
    bufferization.dealloc_tensor %9 : tensor<3x2x2xf64, #sparse2>
    bufferization.dealloc_tensor %10 : tensor<3x2x2xf64, #sparse2>
    bufferization.dealloc_tensor %13 : tensor<?x2x?xf64, #sparse2>
    bufferization.dealloc_tensor %14 : tensor<?x2x?xf64, #sparse2>
    bufferization.dealloc_tensor %4 : tensor<3x4xf64>
    bufferization.dealloc_tensor %8 : tensor<3x2x2xf64>
    bufferization.dealloc_tensor %12 : tensor<?x2x?xf64>
    return
  }
}

