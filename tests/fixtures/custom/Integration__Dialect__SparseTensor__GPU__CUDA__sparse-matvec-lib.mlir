#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed), posWidth = 64, crdWidth = 64 }>
module {
  llvm.func @mgpuCreateSparseEnv()
  llvm.func @mgpuDestroySparseEnv()
  func.func @matvecCOO(%arg0: tensor<?x?xf64, #sparse>, %arg1: tensor<?xf64>, %arg2: tensor<?xf64>) -> tensor<?xf64> {
    %0 = linalg.matvec ins(%arg0, %arg1 : tensor<?x?xf64, #sparse>, tensor<?xf64>) outs(%arg2 : tensor<?xf64>) -> tensor<?xf64>
    return %0 : tensor<?xf64>
  }
  func.func @matvecCSR(%arg0: tensor<?x?xf64, #sparse1>, %arg1: tensor<?xf64>, %arg2: tensor<?xf64>) -> tensor<?xf64> {
    %0 = linalg.matvec ins(%arg0, %arg1 : tensor<?x?xf64, #sparse1>, tensor<?xf64>) outs(%arg2 : tensor<?xf64>) -> tensor<?xf64>
    return %0 : tensor<?xf64>
  }
  func.func @matvecCSC(%arg0: tensor<?x?xf64, #sparse2>, %arg1: tensor<?xf64>, %arg2: tensor<?xf64>) -> tensor<?xf64> {
    %0 = linalg.matvec ins(%arg0, %arg1 : tensor<?x?xf64, #sparse2>, tensor<?xf64>) outs(%arg2 : tensor<?xf64>) -> tensor<?xf64>
    return %0 : tensor<?xf64>
  }
  func.func @main() {
    llvm.call @mgpuCreateSparseEnv() : () -> ()
    %cst = arith.constant 0.000000e+00 : f64
    %cst_0 = arith.constant 1.000000e+00 : f64
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %generated = tensor.generate  {
    ^bb0(%arg0: index, %arg1: index):
      %15 = arith.addi %arg0, %arg1 : index
      %16 = arith.index_cast %15 : index to i64
      %17 = arith.uitofp %16 : i64 to f64
      tensor.yield %17 : f64
    } : tensor<64x64xf64>
    %0 = sparse_tensor.convert %generated : tensor<64x64xf64> to tensor<?x?xf64, #sparse>
    %1 = sparse_tensor.convert %generated : tensor<64x64xf64> to tensor<?x?xf64, #sparse1>
    %2 = sparse_tensor.convert %generated : tensor<64x64xf64> to tensor<?x?xf64, #sparse2>
    %dim = tensor.dim %0, %c1 : tensor<?x?xf64, #sparse>
    %generated_1 = tensor.generate %dim {
    ^bb0(%arg0: index):
      %15 = arith.addi %arg0, %c1 : index
      %16 = arith.index_cast %15 : index to i64
      %17 = arith.uitofp %16 : i64 to f64
      tensor.yield %17 : f64
    } : tensor<?xf64>
    %dim_2 = tensor.dim %0, %c0 : tensor<?x?xf64, #sparse>
    %generated_3 = tensor.generate %dim_2 {
    ^bb0(%arg0: index):
      tensor.yield %cst : f64
    } : tensor<?xf64>
    %generated_4 = tensor.generate %dim_2 {
    ^bb0(%arg0: index):
      tensor.yield %cst_0 : f64
    } : tensor<?xf64>
    %3 = call @matvecCOO(%0, %generated_1, %generated_3) : (tensor<?x?xf64, #sparse>, tensor<?xf64>, tensor<?xf64>) -> tensor<?xf64>
    %4 = call @matvecCSR(%1, %generated_1, %generated_3) : (tensor<?x?xf64, #sparse1>, tensor<?xf64>, tensor<?xf64>) -> tensor<?xf64>
    %5 = call @matvecCSC(%2, %generated_1, %generated_3) : (tensor<?x?xf64, #sparse2>, tensor<?xf64>, tensor<?xf64>) -> tensor<?xf64>
    %6 = call @matvecCOO(%0, %generated_1, %generated_4) : (tensor<?x?xf64, #sparse>, tensor<?xf64>, tensor<?xf64>) -> tensor<?xf64>
    %7 = call @matvecCSR(%1, %generated_1, %generated_4) : (tensor<?x?xf64, #sparse1>, tensor<?xf64>, tensor<?xf64>) -> tensor<?xf64>
    %8 = call @matvecCSC(%2, %generated_1, %generated_4) : (tensor<?x?xf64, #sparse2>, tensor<?xf64>, tensor<?xf64>) -> tensor<?xf64>
    %9 = vector.transfer_read %3[%c0], %cst : tensor<?xf64>, vector<64xf64>
    vector.print %9 : vector<64xf64>
    %10 = vector.transfer_read %4[%c0], %cst : tensor<?xf64>, vector<64xf64>
    vector.print %10 : vector<64xf64>
    %11 = vector.transfer_read %5[%c0], %cst : tensor<?xf64>, vector<64xf64>
    vector.print %11 : vector<64xf64>
    %12 = vector.transfer_read %6[%c0], %cst : tensor<?xf64>, vector<64xf64>
    vector.print %12 : vector<64xf64>
    %13 = vector.transfer_read %7[%c0], %cst : tensor<?xf64>, vector<64xf64>
    vector.print %13 : vector<64xf64>
    %14 = vector.transfer_read %8[%c0], %cst : tensor<?xf64>, vector<64xf64>
    vector.print %14 : vector<64xf64>
    bufferization.dealloc_tensor %0 : tensor<?x?xf64, #sparse>
    bufferization.dealloc_tensor %1 : tensor<?x?xf64, #sparse1>
    bufferization.dealloc_tensor %2 : tensor<?x?xf64, #sparse2>
    llvm.call @mgpuDestroySparseEnv() : () -> ()
    return
  }
}

