#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
module {
  func.func @matvec(%arg0: tensor<1024x64xf64, #sparse>, %arg1: tensor<64xf64>, %arg2: tensor<1024xf64>) -> tensor<1024xf64> {
    %0 = linalg.matvec ins(%arg0, %arg1 : tensor<1024x64xf64, #sparse>, tensor<64xf64>) outs(%arg2 : tensor<1024xf64>) -> tensor<1024xf64>
    return %0 : tensor<1024xf64>
  }
  memref.global "private" constant @__constant_64xf64 : memref<64xf64> = dense<1.000000e+00> {alignment = 64 : i64}
  func.func @main() {
    %cst = arith.constant 0.000000e+00 : f64
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %generated = tensor.generate  {
    ^bb0(%arg0: index, %arg1: index):
      %5 = arith.addi %arg0, %arg1 : index
      %6 = arith.index_cast %5 : index to i64
      %7 = arith.uitofp %6 : i64 to f64
      tensor.yield %7 : f64
    } : tensor<1024x64xf64>
    %0 = sparse_tensor.convert %generated : tensor<1024x64xf64> to tensor<1024x64xf64, #sparse>
    %generated_0 = tensor.generate  {
    ^bb0(%arg0: index):
      tensor.yield %cst : f64
    } : tensor<1024xf64>
    %1 = memref.get_global @__constant_64xf64 : memref<64xf64>
    %2 = bufferization.to_tensor %1 restrict : memref<64xf64> to tensor<64xf64>
    %3 = call @matvec(%0, %2, %generated_0) : (tensor<1024x64xf64, #sparse>, tensor<64xf64>, tensor<1024xf64>) -> tensor<1024xf64>
    %4 = vector.transfer_read %3[%c0], %cst : tensor<1024xf64>, vector<64xf64>
    vector.print %4 : vector<64xf64>
    bufferization.dealloc_tensor %0 : tensor<1024x64xf64, #sparse>
    return
  }
}

