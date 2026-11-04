#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
module {
  func.func private @printMemrefF64(tensor<*xf64>)
  func.func private @printMemref1dF64(memref<?xf64>) attributes {llvm.emit_c_interface}
  func.func @matmul1(%arg0: tensor<4x8xf64>, %arg1: tensor<8x4xf64>, %arg2: tensor<4x4xf64>) -> tensor<4x4xf64> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<4x8xf64>, tensor<8x4xf64>) outs(%arg2 : tensor<4x4xf64>) -> tensor<4x4xf64>
    return %0 : tensor<4x4xf64>
  }
  func.func @matmul2(%arg0: tensor<4x8xf64, #sparse>, %arg1: tensor<8x4xf64, #sparse>) -> tensor<4x4xf64, #sparse> {
    %0 = tensor.empty() : tensor<4x4xf64, #sparse>
    %1 = linalg.matmul ins(%arg0, %arg1 : tensor<4x8xf64, #sparse>, tensor<8x4xf64, #sparse>) outs(%0 : tensor<4x4xf64, #sparse>) -> tensor<4x4xf64, #sparse>
    return %1 : tensor<4x4xf64, #sparse>
  }
  func.func @matmul3(%arg0: tensor<4x8xf64, #sparse1>, %arg1: tensor<8x4xf64, #sparse1>) -> tensor<4x4xf64, #sparse1> {
    %0 = tensor.empty() : tensor<4x4xf64, #sparse1>
    %1 = linalg.matmul ins(%arg0, %arg1 : tensor<4x8xf64, #sparse1>, tensor<8x4xf64, #sparse1>) outs(%0 : tensor<4x4xf64, #sparse1>) -> tensor<4x4xf64, #sparse1>
    return %1 : tensor<4x4xf64, #sparse1>
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %cst = arith.constant dense<[[1.100000e+00, 2.100000e+00, 3.100000e+00, 4.100000e+00, 5.100000e+00, 6.100000e+00, 7.100000e+00, 8.100000e+00], [1.200000e+00, 2.200000e+00, 3.200000e+00, 4.200000e+00, 5.200000e+00, 6.200000e+00, 7.200000e+00, 8.1999999999999993], [1.300000e+00, 2.300000e+00, 3.300000e+00, 4.300000e+00, 5.300000e+00, 6.300000e+00, 7.300000e+00, 8.300000e+00], [1.400000e+00, 2.400000e+00, 3.400000e+00, 4.400000e+00, 5.400000e+00, 6.400000e+00, 7.400000e+00, 8.400000e+00]]> : tensor<4x8xf64>
    %cst_0 = arith.constant dense<[[1.010000e+01, 1.110000e+01, 1.210000e+01, 1.310000e+01], [1.020000e+01, 1.120000e+01, 1.220000e+01, 1.320000e+01], [1.030000e+01, 1.130000e+01, 1.230000e+01, 1.330000e+01], [1.040000e+01, 1.140000e+01, 1.240000e+01, 1.340000e+01], [1.050000e+01, 1.150000e+01, 1.250000e+01, 1.350000e+01], [1.060000e+01, 1.160000e+01, 1.260000e+01, 1.360000e+01], [1.070000e+01, 1.170000e+01, 1.270000e+01, 1.370000e+01], [1.080000e+01, 1.180000e+01, 1.280000e+01, 1.380000e+01]]> : tensor<8x4xf64>
    %cst_1 = arith.constant dense<[[0.000000e+00, 2.100000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 6.100000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 2.300000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 1.000000e+00]]> : tensor<4x8xf64>
    %cst_2 = arith.constant dense<[[0.000000e+00, 0.000000e+00, 0.000000e+00, 1.000000e+00], [0.000000e+00, 0.000000e+00, 2.000000e+00, 0.000000e+00], [0.000000e+00, 3.000000e+00, 0.000000e+00, 0.000000e+00], [4.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 5.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 6.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 7.000000e+00, 8.000000e+00]]> : tensor<8x4xf64>
    %cst_3 = arith.constant dense<0.000000e+00> : tensor<4x4xf64>
    %0 = sparse_tensor.convert %cst : tensor<4x8xf64> to tensor<4x8xf64, #sparse>
    %1 = sparse_tensor.convert %cst : tensor<4x8xf64> to tensor<4x8xf64, #sparse1>
    %2 = sparse_tensor.convert %cst_1 : tensor<4x8xf64> to tensor<4x8xf64, #sparse>
    %3 = sparse_tensor.convert %cst_1 : tensor<4x8xf64> to tensor<4x8xf64, #sparse1>
    %4 = sparse_tensor.convert %cst_0 : tensor<8x4xf64> to tensor<8x4xf64, #sparse>
    %5 = sparse_tensor.convert %cst_0 : tensor<8x4xf64> to tensor<8x4xf64, #sparse1>
    %6 = sparse_tensor.convert %cst_2 : tensor<8x4xf64> to tensor<8x4xf64, #sparse>
    %7 = sparse_tensor.convert %cst_2 : tensor<8x4xf64> to tensor<8x4xf64, #sparse1>
    sparse_tensor.print %0 : tensor<4x8xf64, #sparse>
    sparse_tensor.print %1 : tensor<4x8xf64, #sparse1>
    sparse_tensor.print %2 : tensor<4x8xf64, #sparse>
    sparse_tensor.print %3 : tensor<4x8xf64, #sparse1>
    sparse_tensor.print %4 : tensor<8x4xf64, #sparse>
    sparse_tensor.print %5 : tensor<8x4xf64, #sparse1>
    sparse_tensor.print %6 : tensor<8x4xf64, #sparse>
    sparse_tensor.print %7 : tensor<8x4xf64, #sparse1>
    %8 = call @matmul1(%cst, %cst_0, %cst_3) : (tensor<4x8xf64>, tensor<8x4xf64>, tensor<4x4xf64>) -> tensor<4x4xf64>
    %9 = call @matmul2(%0, %4) : (tensor<4x8xf64, #sparse>, tensor<8x4xf64, #sparse>) -> tensor<4x4xf64, #sparse>
    %10 = call @matmul3(%1, %5) : (tensor<4x8xf64, #sparse1>, tensor<8x4xf64, #sparse1>) -> tensor<4x4xf64, #sparse1>
    %11 = call @matmul1(%cst_1, %cst_0, %cst_3) : (tensor<4x8xf64>, tensor<8x4xf64>, tensor<4x4xf64>) -> tensor<4x4xf64>
    %12 = call @matmul2(%2, %4) : (tensor<4x8xf64, #sparse>, tensor<8x4xf64, #sparse>) -> tensor<4x4xf64, #sparse>
    %13 = call @matmul3(%3, %5) : (tensor<4x8xf64, #sparse1>, tensor<8x4xf64, #sparse1>) -> tensor<4x4xf64, #sparse1>
    %14 = call @matmul1(%cst_1, %cst_2, %cst_3) : (tensor<4x8xf64>, tensor<8x4xf64>, tensor<4x4xf64>) -> tensor<4x4xf64>
    %15 = call @matmul2(%2, %6) : (tensor<4x8xf64, #sparse>, tensor<8x4xf64, #sparse>) -> tensor<4x4xf64, #sparse>
    %16 = call @matmul3(%3, %7) : (tensor<4x8xf64, #sparse1>, tensor<8x4xf64, #sparse1>) -> tensor<4x4xf64, #sparse1>
    %cast = tensor.cast %8 : tensor<4x4xf64> to tensor<*xf64>
    call @printMemrefF64(%cast) : (tensor<*xf64>) -> ()
    sparse_tensor.print %9 : tensor<4x4xf64, #sparse>
    sparse_tensor.print %10 : tensor<4x4xf64, #sparse1>
    %cast_4 = tensor.cast %11 : tensor<4x4xf64> to tensor<*xf64>
    call @printMemrefF64(%cast_4) : (tensor<*xf64>) -> ()
    sparse_tensor.print %12 : tensor<4x4xf64, #sparse>
    sparse_tensor.print %13 : tensor<4x4xf64, #sparse1>
    %cast_5 = tensor.cast %14 : tensor<4x4xf64> to tensor<*xf64>
    call @printMemrefF64(%cast_5) : (tensor<*xf64>) -> ()
    sparse_tensor.print %15 : tensor<4x4xf64, #sparse>
    sparse_tensor.print %16 : tensor<4x4xf64, #sparse1>
    bufferization.dealloc_tensor %0 : tensor<4x8xf64, #sparse>
    bufferization.dealloc_tensor %1 : tensor<4x8xf64, #sparse1>
    bufferization.dealloc_tensor %2 : tensor<4x8xf64, #sparse>
    bufferization.dealloc_tensor %3 : tensor<4x8xf64, #sparse1>
    bufferization.dealloc_tensor %4 : tensor<8x4xf64, #sparse>
    bufferization.dealloc_tensor %5 : tensor<8x4xf64, #sparse1>
    bufferization.dealloc_tensor %6 : tensor<8x4xf64, #sparse>
    bufferization.dealloc_tensor %7 : tensor<8x4xf64, #sparse1>
    bufferization.dealloc_tensor %8 : tensor<4x4xf64>
    bufferization.dealloc_tensor %9 : tensor<4x4xf64, #sparse>
    bufferization.dealloc_tensor %10 : tensor<4x4xf64, #sparse1>
    bufferization.dealloc_tensor %11 : tensor<4x4xf64>
    bufferization.dealloc_tensor %12 : tensor<4x4xf64, #sparse>
    bufferization.dealloc_tensor %13 : tensor<4x4xf64, #sparse1>
    bufferization.dealloc_tensor %14 : tensor<4x4xf64>
    bufferization.dealloc_tensor %15 : tensor<4x4xf64, #sparse>
    bufferization.dealloc_tensor %16 : tensor<4x4xf64, #sparse1>
    return
  }
}

