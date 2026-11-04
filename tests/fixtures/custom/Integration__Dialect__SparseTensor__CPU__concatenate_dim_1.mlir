#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
module {
  func.func private @printMemrefF64(tensor<*xf64>)
  func.func private @printMemref1dF64(memref<?xf64>) attributes {llvm.emit_c_interface}
  func.func @concat_sparse_sparse_dim1(%arg0: tensor<4x2xf64, #sparse>, %arg1: tensor<4x3xf64, #sparse1>, %arg2: tensor<4x4xf64, #sparse2>) -> tensor<4x9xf64, #sparse> {
    %0 = sparse_tensor.concatenate %arg0, %arg1, %arg2 {dimension = 1 : index} : tensor<4x2xf64, #sparse>, tensor<4x3xf64, #sparse1>, tensor<4x4xf64, #sparse2> to tensor<4x9xf64, #sparse>
    return %0 : tensor<4x9xf64, #sparse>
  }
  func.func @concat_sparse_dense_dim1(%arg0: tensor<4x2xf64, #sparse>, %arg1: tensor<4x3xf64, #sparse1>, %arg2: tensor<4x4xf64, #sparse2>) -> tensor<4x9xf64> {
    %0 = sparse_tensor.concatenate %arg0, %arg1, %arg2 {dimension = 1 : index} : tensor<4x2xf64, #sparse>, tensor<4x3xf64, #sparse1>, tensor<4x4xf64, #sparse2> to tensor<4x9xf64>
    return %0 : tensor<4x9xf64>
  }
  func.func @concat_mix_sparse_dim1(%arg0: tensor<4x2xf64>, %arg1: tensor<4x3xf64, #sparse1>, %arg2: tensor<4x4xf64, #sparse2>) -> tensor<4x9xf64, #sparse> {
    %0 = sparse_tensor.concatenate %arg0, %arg1, %arg2 {dimension = 1 : index} : tensor<4x2xf64>, tensor<4x3xf64, #sparse1>, tensor<4x4xf64, #sparse2> to tensor<4x9xf64, #sparse>
    return %0 : tensor<4x9xf64, #sparse>
  }
  func.func @concat_mix_dense_dim1(%arg0: tensor<4x2xf64>, %arg1: tensor<4x3xf64, #sparse1>, %arg2: tensor<4x4xf64, #sparse2>) -> tensor<4x9xf64> {
    %0 = sparse_tensor.concatenate %arg0, %arg1, %arg2 {dimension = 1 : index} : tensor<4x2xf64>, tensor<4x3xf64, #sparse1>, tensor<4x4xf64, #sparse2> to tensor<4x9xf64>
    return %0 : tensor<4x9xf64>
  }
  func.func @dump_mat_dense_4x9(%arg0: tensor<4x9xf64>) {
    %cast = tensor.cast %arg0 : tensor<4x9xf64> to tensor<*xf64>
    call @printMemrefF64(%cast) : (tensor<*xf64>) -> ()
    return
  }
  func.func @main() {
    %cst = arith.constant dense<[[1.000000e+00, 0.000000e+00], [3.100000e+00, 0.000000e+00], [0.000000e+00, 2.000000e+00], [0.000000e+00, 0.000000e+00]]> : tensor<4x2xf64>
    %cst_0 = arith.constant dense<[[1.000000e+00, 0.000000e+00, 1.000000e+00], [1.000000e+00, 0.000000e+00, 5.000000e-01], [0.000000e+00, 0.000000e+00, 1.000000e+00], [5.000000e+00, 2.000000e+00, 0.000000e+00]]> : tensor<4x3xf64>
    %cst_1 = arith.constant dense<[[0.000000e+00, 0.000000e+00, 1.500000e+00, 1.000000e+00], [0.000000e+00, 3.500000e+00, 0.000000e+00, 0.000000e+00], [1.000000e+00, 5.000000e+00, 2.000000e+00, 0.000000e+00], [1.000000e+00, 5.000000e-01, 0.000000e+00, 0.000000e+00]]> : tensor<4x4xf64>
    %0 = sparse_tensor.convert %cst : tensor<4x2xf64> to tensor<4x2xf64, #sparse>
    %1 = sparse_tensor.convert %cst_0 : tensor<4x3xf64> to tensor<4x3xf64, #sparse1>
    %2 = sparse_tensor.convert %cst_1 : tensor<4x4xf64> to tensor<4x4xf64, #sparse2>
    %3 = call @concat_sparse_sparse_dim1(%0, %1, %2) : (tensor<4x2xf64, #sparse>, tensor<4x3xf64, #sparse1>, tensor<4x4xf64, #sparse2>) -> tensor<4x9xf64, #sparse>
    sparse_tensor.print %3 : tensor<4x9xf64, #sparse>
    %4 = call @concat_sparse_dense_dim1(%0, %1, %2) : (tensor<4x2xf64, #sparse>, tensor<4x3xf64, #sparse1>, tensor<4x4xf64, #sparse2>) -> tensor<4x9xf64>
    call @dump_mat_dense_4x9(%4) : (tensor<4x9xf64>) -> ()
    %5 = call @concat_mix_sparse_dim1(%cst, %1, %2) : (tensor<4x2xf64>, tensor<4x3xf64, #sparse1>, tensor<4x4xf64, #sparse2>) -> tensor<4x9xf64, #sparse>
    sparse_tensor.print %5 : tensor<4x9xf64, #sparse>
    %6 = call @concat_mix_dense_dim1(%cst, %1, %2) : (tensor<4x2xf64>, tensor<4x3xf64, #sparse1>, tensor<4x4xf64, #sparse2>) -> tensor<4x9xf64>
    call @dump_mat_dense_4x9(%6) : (tensor<4x9xf64>) -> ()
    bufferization.dealloc_tensor %0 : tensor<4x2xf64, #sparse>
    bufferization.dealloc_tensor %1 : tensor<4x3xf64, #sparse1>
    bufferization.dealloc_tensor %2 : tensor<4x4xf64, #sparse2>
    bufferization.dealloc_tensor %3 : tensor<4x9xf64, #sparse>
    bufferization.dealloc_tensor %4 : tensor<4x9xf64>
    bufferization.dealloc_tensor %5 : tensor<4x9xf64, #sparse>
    bufferization.dealloc_tensor %6 : tensor<4x9xf64>
    return
  }
}

