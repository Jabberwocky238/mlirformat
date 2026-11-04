#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 floordiv 4 : dense, d1 mod 4 : structured[2, 4]) }>
module {
  llvm.func @mgpuCreateSparseLtEnv()
  llvm.func @mgpuDestroySparseLtEnv()
  func.func @matmul24(%arg0: tensor<16x32xf16>, %arg1: tensor<32x16xf16>, %arg2: tensor<16x16xf16>) -> tensor<16x16xf16> {
    %0 = sparse_tensor.convert %arg0 : tensor<16x32xf16> to tensor<16x32xf16, #sparse>
    %1 = linalg.matmul ins(%0, %arg1 : tensor<16x32xf16, #sparse>, tensor<32x16xf16>) outs(%arg2 : tensor<16x16xf16>) -> tensor<16x16xf16>
    return %1 : tensor<16x16xf16>
  }
  func.func @main() {
    llvm.call @mgpuCreateSparseLtEnv() : () -> ()
    %cst = arith.constant 0.000000e+00 : f16
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c8 = arith.constant 8 : index
    %c16 = arith.constant 16 : index
    %c32 = arith.constant 32 : index
    %c64 = arith.constant 64 : index
    %generated = tensor.generate  {
    ^bb0(%arg0: index, %arg1: index):
      %cst_4 = arith.constant 0.000000e+00 : f16
      %cst_5 = arith.constant 1.000000e+00 : f16
      %1 = arith.floordivsi %arg1, %c2 : index
      %2 = arith.remsi %arg1, %c2 : index
      %3 = arith.addi %arg0, %1 : index
      %4 = arith.index_cast %3 : index to i64
      %5 = arith.uitofp %4 : i64 to f16
      %6 = arith.addf %5, %cst_5 : f16
      %7 = arith.cmpi eq, %2, %c0 : index
      %8 = arith.select %7, %6, %cst_4 : f16
      tensor.yield %8 : f16
    } : tensor<16x32xf16>
    %generated_0 = tensor.generate  {
    ^bb0(%arg0: index, %arg1: index):
      %1 = arith.cmpi sge, %arg1, %c8 : index
      %2 = arith.subi %arg1, %c8 : index
      %3 = arith.select %1, %2, %arg1 : index
      %4 = arith.subi %3, %arg0 : index
      %5 = arith.index_cast %4 : index to i64
      %6 = arith.sitofp %5 : i64 to f16
      tensor.yield %6 : f16
    } : tensor<32x16xf16>
    %generated_1 = tensor.generate  {
    ^bb0(%arg0: index, %arg1: index):
      %cst_4 = arith.constant 0.000000e+00 : f16
      tensor.yield %cst_4 : f16
    } : tensor<16x16xf16>
    scf.for %arg0 = %c0 to %c16 step %c1 {
      %1 = vector.transfer_read %generated[%arg0, %c0], %cst : tensor<16x32xf16>, vector<32xf16>
      vector.print %1 : vector<32xf16>
    }
    scf.for %arg0 = %c0 to %c32 step %c1 {
      %1 = vector.transfer_read %generated_0[%arg0, %c0], %cst : tensor<32x16xf16>, vector<16xf16>
      vector.print %1 : vector<16xf16>
    }
    %c1_2 = arith.constant 1 : index
    %c32_3 = arith.constant 32 : index
    %0 = call @matmul24(%generated, %generated_0, %generated_1) : (tensor<16x32xf16>, tensor<32x16xf16>, tensor<16x16xf16>) -> tensor<16x16xf16>
    scf.for %arg0 = %c0 to %c16 step %c1 {
      %1 = vector.transfer_read %0[%arg0, %c0], %cst : tensor<16x16xf16>, vector<16xf16>
      vector.print %1 : vector<16xf16>
    }
    llvm.call @mgpuDestroySparseLtEnv() : () -> ()
    return
  }
}

