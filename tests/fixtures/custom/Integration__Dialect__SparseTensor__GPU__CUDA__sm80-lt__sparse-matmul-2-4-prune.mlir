#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 floordiv 4 : dense, d1 mod 4 : structured[2, 4]) }>
module {
  llvm.func @mgpuCreateSparseLtEnv()
  llvm.func @mgpuDestroySparseLtEnv()
  func.func @matmul24(%arg0: tensor<16x16xf16>, %arg1: tensor<16x16xf16>, %arg2: tensor<16x16xf16>) -> tensor<16x16xf16> {
    %0 = sparse_tensor.convert %arg0 : tensor<16x16xf16> to tensor<16x16xf16, #sparse>
    %1 = linalg.matmul ins(%0, %arg1 : tensor<16x16xf16, #sparse>, tensor<16x16xf16>) outs(%arg2 : tensor<16x16xf16>) -> tensor<16x16xf16>
    return %1 : tensor<16x16xf16>
  }
  func.func @main() {
    llvm.call @mgpuCreateSparseLtEnv() : () -> ()
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %cst = arith.constant 0.000000e+00 : f16
    %cst_0 = arith.constant 1.000000e+00 : f16
    %cst_1 = arith.constant 4.000000e+00 : f16
    %generated = tensor.generate  {
    ^bb0(%arg0: index, %arg1: index):
      %1 = arith.andi %arg1, %c1 : index
      %2 = arith.cmpi eq, %1, %c0 : index
      %3 = arith.select %2, %cst_1, %cst_0 : f16
      tensor.yield %3 : f16
    } : tensor<16x16xf16>
    %generated_2 = tensor.generate  {
    ^bb0(%arg0: index, %arg1: index):
      %1 = arith.cmpi eq, %arg0, %arg1 : index
      %2 = arith.select %1, %cst_0, %cst : f16
      tensor.yield %2 : f16
    } : tensor<16x16xf16>
    %generated_3 = tensor.generate  {
    ^bb0(%arg0: index, %arg1: index):
      tensor.yield %cst : f16
    } : tensor<16x16xf16>
    %0 = call @matmul24(%generated, %generated_2, %generated_3) : (tensor<16x16xf16>, tensor<16x16xf16>, tensor<16x16xf16>) -> tensor<16x16xf16>
    scf.for %arg0 = %c0 to %c16 step %c1 {
      %1 = vector.transfer_read %generated[%arg0, %c0], %cst : tensor<16x16xf16>, vector<16xf16>
      vector.print %1 : vector<16xf16>
    }
    scf.for %arg0 = %c0 to %c16 step %c1 {
      %1 = vector.transfer_read %0[%arg0, %c0], %cst : tensor<16x16xf16>, vector<16xf16>
      vector.print %1 : vector<16xf16>
    }
    llvm.call @mgpuDestroySparseLtEnv() : () -> ()
    return
  }
}

