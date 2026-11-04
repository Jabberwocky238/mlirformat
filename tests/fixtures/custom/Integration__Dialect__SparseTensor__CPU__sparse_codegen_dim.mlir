#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
module {
  func.func @main() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %0 = tensor.empty() : tensor<4x5xf64, #sparse>
    %1 = tensor.empty(%c2, %c3) : tensor<?x?xf64, #sparse>
    %dim = tensor.dim %0, %c0 : tensor<4x5xf64, #sparse>
    %dim_0 = tensor.dim %1, %c0 : tensor<?x?xf64, #sparse>
    %dim_1 = tensor.dim %0, %c1 : tensor<4x5xf64, #sparse>
    %dim_2 = tensor.dim %1, %c1 : tensor<?x?xf64, #sparse>
    vector.print %dim : index
    vector.print %dim_0 : index
    vector.print %dim_1 : index
    vector.print %dim_2 : index
    bufferization.dealloc_tensor %0 : tensor<4x5xf64, #sparse>
    bufferization.dealloc_tensor %1 : tensor<?x?xf64, #sparse>
    return
  }
}

