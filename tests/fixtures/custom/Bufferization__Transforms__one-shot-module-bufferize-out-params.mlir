module {
  func.func private @callee(%arg0: tensor<5xf32>) -> (tensor<5xf32>, tensor<5xf32>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 8.000000e+00 : f32
    %inserted = tensor.insert %cst into %arg0[%c0] : tensor<5xf32>
    return %arg0, %inserted : tensor<5xf32>, tensor<5xf32>
  }
  func.func @main(%arg0: tensor<5xf32>) -> (f32, f32) {
    %c0 = arith.constant 0 : index
    %0:2 = call @callee(%arg0) : (tensor<5xf32>) -> (tensor<5xf32>, tensor<5xf32>)
    %extracted = tensor.extract %0#0[%c0] : tensor<5xf32>
    %extracted_0 = tensor.extract %0#1[%c0] : tensor<5xf32>
    return %extracted, %extracted_0 : f32, f32
  }
}

// -----
module {
  func.func private @callee(%arg0: index) -> tensor<2x5xf32> {
    %0 = bufferization.alloc_tensor() : tensor<10x20xf32>
    %extracted_slice = tensor.extract_slice %0[%arg0, %arg0] [2, 5] [1, 1] : tensor<10x20xf32> to tensor<2x5xf32>
    return %extracted_slice : tensor<2x5xf32>
  }
  func.func @main(%arg0: index) -> f32 {
    %c0 = arith.constant 0 : index
    %0 = call @callee(%arg0) : (index) -> tensor<2x5xf32>
    %extracted = tensor.extract %0[%c0, %c0] : tensor<2x5xf32>
    return %extracted : f32
  }
}

