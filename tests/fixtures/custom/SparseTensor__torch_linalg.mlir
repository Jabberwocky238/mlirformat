#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
module {
  func.func @main(%arg0: tensor<64x64xf32, #sparse>, %arg1: tensor<64x64xf32>) -> tensor<64x64xf32> attributes {llvm.emit_c_interface} {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<64x64xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<64x64xf32>) -> tensor<64x64xf32>
    %2 = linalg.matmul ins(%arg0, %arg1 : tensor<64x64xf32, #sparse>, tensor<64x64xf32>) outs(%1 : tensor<64x64xf32>) -> tensor<64x64xf32>
    return %2 : tensor<64x64xf32>
  }
}

