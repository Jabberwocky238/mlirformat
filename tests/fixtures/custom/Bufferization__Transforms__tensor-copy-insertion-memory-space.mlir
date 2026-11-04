module {
  func.func @unknown_op_copy() -> (tensor<10xf32>, tensor<10xf32>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = "test.dummy_op"() : () -> tensor<10xf32>
    %inserted = tensor.insert %cst into %0[%c0] : tensor<10xf32>
    return %inserted, %0 : tensor<10xf32>, tensor<10xf32>
  }
}

// -----
module {
  func.func @alloc_tensor_copy() -> (tensor<10xf32>, tensor<10xf32>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = bufferization.alloc_tensor() {memory_space = 1 : ui64} : tensor<10xf32>
    %inserted = tensor.insert %cst into %0[%c0] : tensor<10xf32>
    return %inserted, %0 : tensor<10xf32>, tensor<10xf32>
  }
}

