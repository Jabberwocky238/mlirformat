#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed), posWidth = 64, crdWidth = 64 }>
module {
  llvm.func @mgpuCreateSparseEnv()
  llvm.func @mgpuDestroySparseEnv()
  func.func @matmulCOO(%arg0: tensor<8x8xf32, #sparse>, %arg1: tensor<8x8xf32>, %arg2: tensor<8x8xf32>) -> tensor<8x8xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<8x8xf32, #sparse>, tensor<8x8xf32>) outs(%arg2 : tensor<8x8xf32>) -> tensor<8x8xf32>
    return %0 : tensor<8x8xf32>
  }
  func.func @matmulCSR(%arg0: tensor<8x8xf32, #sparse1>, %arg1: tensor<8x8xf32>, %arg2: tensor<8x8xf32>) -> tensor<8x8xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<8x8xf32, #sparse1>, tensor<8x8xf32>) outs(%arg2 : tensor<8x8xf32>) -> tensor<8x8xf32>
    return %0 : tensor<8x8xf32>
  }
  func.func @matmulCSC(%arg0: tensor<8x8xf32, #sparse2>, %arg1: tensor<8x8xf32>, %arg2: tensor<8x8xf32>) -> tensor<8x8xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<8x8xf32, #sparse2>, tensor<8x8xf32>) outs(%arg2 : tensor<8x8xf32>) -> tensor<8x8xf32>
    return %0 : tensor<8x8xf32>
  }
  func.func @dump(%arg0: tensor<8x8xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    scf.for %arg1 = %c0 to %c8 step %c1 {
      %0 = vector.transfer_read %arg0[%arg1, %c0], %cst : tensor<8x8xf32>, vector<8xf32>
      vector.print %0 : vector<8xf32>
    }
    return
  }
  func.func @main() {
    llvm.call @mgpuCreateSparseEnv() : () -> ()
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    %generated = tensor.generate  {
    ^bb0(%arg0: index, %arg1: index):
      %9 = arith.addi %arg0, %arg1 : index
      %10 = arith.index_cast %9 : index to i64
      %11 = arith.uitofp %10 : i64 to f32
      tensor.yield %11 : f32
    } : tensor<8x8xf32>
    %0 = sparse_tensor.convert %generated : tensor<8x8xf32> to tensor<8x8xf32, #sparse>
    %1 = sparse_tensor.convert %generated : tensor<8x8xf32> to tensor<8x8xf32, #sparse1>
    %2 = sparse_tensor.convert %generated : tensor<8x8xf32> to tensor<8x8xf32, #sparse2>
    %generated_1 = tensor.generate  {
    ^bb0(%arg0: index, %arg1: index):
      tensor.yield %cst : f32
    } : tensor<8x8xf32>
    %generated_2 = tensor.generate  {
    ^bb0(%arg0: index, %arg1: index):
      tensor.yield %cst_0 : f32
    } : tensor<8x8xf32>
    %3 = call @matmulCOO(%0, %generated, %generated_1) : (tensor<8x8xf32, #sparse>, tensor<8x8xf32>, tensor<8x8xf32>) -> tensor<8x8xf32>
    %4 = call @matmulCSR(%1, %generated, %generated_1) : (tensor<8x8xf32, #sparse1>, tensor<8x8xf32>, tensor<8x8xf32>) -> tensor<8x8xf32>
    %5 = call @matmulCSC(%2, %generated, %generated_1) : (tensor<8x8xf32, #sparse2>, tensor<8x8xf32>, tensor<8x8xf32>) -> tensor<8x8xf32>
    %6 = call @matmulCOO(%0, %generated, %generated_2) : (tensor<8x8xf32, #sparse>, tensor<8x8xf32>, tensor<8x8xf32>) -> tensor<8x8xf32>
    %7 = call @matmulCSR(%1, %generated, %generated_2) : (tensor<8x8xf32, #sparse1>, tensor<8x8xf32>, tensor<8x8xf32>) -> tensor<8x8xf32>
    %8 = call @matmulCSC(%2, %generated, %generated_2) : (tensor<8x8xf32, #sparse2>, tensor<8x8xf32>, tensor<8x8xf32>) -> tensor<8x8xf32>
    call @dump(%3) : (tensor<8x8xf32>) -> ()
    call @dump(%4) : (tensor<8x8xf32>) -> ()
    call @dump(%5) : (tensor<8x8xf32>) -> ()
    call @dump(%6) : (tensor<8x8xf32>) -> ()
    call @dump(%7) : (tensor<8x8xf32>) -> ()
    call @dump(%8) : (tensor<8x8xf32>) -> ()
    bufferization.dealloc_tensor %0 : tensor<8x8xf32, #sparse>
    bufferization.dealloc_tensor %1 : tensor<8x8xf32, #sparse1>
    bufferization.dealloc_tensor %2 : tensor<8x8xf32, #sparse2>
    llvm.call @mgpuDestroySparseEnv() : () -> ()
    return
  }
}

