module {
  func.func @block_matmul_padding(%arg0: tensor<123x125xf32>, %arg1: tensor<125x124xf32>, %arg2: tensor<123x124xf32>) -> tensor<123x124xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<123x125xf32>, tensor<125x124xf32>) outs(%arg2 : tensor<123x124xf32>) -> tensor<123x124xf32>
    return %0 : tensor<123x124xf32>
  }
}

