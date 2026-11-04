#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>
module {
  llvm.func @mgpuCreateSparseEnv()
  llvm.func @mgpuDestroySparseEnv()
  func.func @matmulCSR(%arg0: tensor<8x8xf32, #sparse>, %arg1: tensor<8x8xf32, #sparse>) -> tensor<8x8xf32, #sparse> {
    %0 = tensor.empty() : tensor<8x8xf32, #sparse>
    %1 = linalg.matmul ins(%arg0, %arg1 : tensor<8x8xf32, #sparse>, tensor<8x8xf32, #sparse>) outs(%0 : tensor<8x8xf32, #sparse>) -> tensor<8x8xf32, #sparse>
    return %1 : tensor<8x8xf32, #sparse>
  }
  func.func @main() {
    llvm.call @mgpuCreateSparseEnv() : () -> ()
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant dense<[[1.000000e+00, 0.000000e+00, 2.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 3.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 4.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 5.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 6.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 7.000000e+00, 8.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 9.000000e+00], [0.000000e+00, 0.000000e+00, 1.000000e+01, 0.000000e+00, 0.000000e+00, 0.000000e+00, 1.100000e+01, 1.200000e+01], [0.000000e+00, 1.300000e+01, 1.400000e+01, 0.000000e+00, 0.000000e+00, 0.000000e+00, 1.500000e+01, 1.600000e+01]]> : tensor<8x8xf32>
    %0 = sparse_tensor.convert %cst_0 : tensor<8x8xf32> to tensor<8x8xf32, #sparse>
    %1 = call @matmulCSR(%0, %0) : (tensor<8x8xf32, #sparse>, tensor<8x8xf32, #sparse>) -> tensor<8x8xf32, #sparse>
    sparse_tensor.print %1 : tensor<8x8xf32, #sparse>
    llvm.call @mgpuDestroySparseEnv() : () -> ()
    return
  }
}

