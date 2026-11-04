module {
  func.func @create_tensor() -> tensor<10xf32> {
    %0 = bufferization.alloc_tensor() : tensor<10xf32>
    return %0 : tensor<10xf32>
  }
  func.func @caller(%arg0: index) -> f32 {
    %0 = call @create_tensor() : () -> tensor<10xf32>
    %extracted = tensor.extract %0[%arg0] : tensor<10xf32>
    return %extracted : f32
  }
}

// -----
module {
  func.func @return_slice(%arg0: tensor<?xf32>, %arg1: index) -> tensor<?xf32> {
    %extracted_slice = tensor.extract_slice %arg0[4] [%arg1] [1] : tensor<?xf32> to tensor<?xf32>
    return %extracted_slice : tensor<?xf32>
  }
  func.func @main(%arg0: tensor<?xf32>, %arg1: index, %arg2: index) -> (f32, f32) {
    %cst = arith.constant 1.000000e+00 : f32
    %0 = call @return_slice(%arg0, %arg1) : (tensor<?xf32>, index) -> tensor<?xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%arg0 : tensor<?xf32>) -> tensor<?xf32>
    %extracted = tensor.extract %0[%arg2] : tensor<?xf32>
    %extracted_0 = tensor.extract %1[%arg2] : tensor<?xf32>
    return %extracted, %extracted_0 : f32, f32
  }
}

// -----
module {
  func.func private @return_arg(%arg0: tensor<?xf32>) -> tensor<?xf32> {
    return %arg0 : tensor<?xf32>
  }
}

