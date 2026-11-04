#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
module {
  func.func @matvec(%arg0: tensor<?x?xf64, #sparse>, %arg1: tensor<?xf64>, %arg2: tensor<?xf64>) -> tensor<?xf64> {
    %0 = linalg.matvec ins(%arg0, %arg1 : tensor<?x?xf64, #sparse>, tensor<?xf64>) outs(%arg2 : tensor<?xf64>) -> tensor<?xf64>
    return %0 : tensor<?xf64>
  }
  func.func @main() {
    %cst = arith.constant 0.000000e+00 : f64
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %generated = tensor.generate  {
    ^bb0(%arg0: index, %arg1: index):
      %3 = arith.addi %arg0, %arg1 : index
      %4 = arith.index_cast %3 : index to i64
      %5 = arith.uitofp %4 : i64 to f64
      tensor.yield %5 : f64
    } : tensor<1024x64xf64>
    %0 = sparse_tensor.convert %generated : tensor<1024x64xf64> to tensor<?x?xf64, #sparse>
    %dim = tensor.dim %0, %c1 : tensor<?x?xf64, #sparse>
    %generated_0 = tensor.generate %dim {
    ^bb0(%arg0: index):
      %3 = arith.addi %arg0, %c1 : index
      %4 = arith.index_cast %3 : index to i64
      %5 = arith.uitofp %4 : i64 to f64
      tensor.yield %5 : f64
    } : tensor<?xf64>
    %dim_1 = tensor.dim %0, %c0 : tensor<?x?xf64, #sparse>
    %generated_2 = tensor.generate %dim_1 {
    ^bb0(%arg0: index):
      tensor.yield %cst : f64
    } : tensor<?xf64>
    %1 = call @matvec(%0, %generated_0, %generated_2) : (tensor<?x?xf64, #sparse>, tensor<?xf64>, tensor<?xf64>) -> tensor<?xf64>
    %2 = vector.transfer_read %1[%c0], %cst : tensor<?xf64>, vector<64xf64>
    vector.print %2 : vector<64xf64>
    bufferization.dealloc_tensor %0 : tensor<?x?xf64, #sparse>
    return
  }
}

