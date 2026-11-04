module {
  func.func @builtin_unranked(%arg0: tensor<*xf32>) -> memref<*xf32> {
    %0 = bufferization.to_buffer %arg0 : tensor<*xf32> to memref<*xf32>
    return %0 : memref<*xf32>
  }
}

// -----
module {
  func.func @builtin_ranked(%arg0: tensor<42xf32>) -> memref<42xf32> {
    %0 = bufferization.to_buffer %arg0 : tensor<42xf32> to memref<42xf32>
    return %0 : memref<42xf32>
  }
}

// -----
module {
  func.func @custom_tensor(%arg0: !test.test_tensor<[42], f32>) {
    return
  }
}

// -----
module {
  func.func @custom_memref(%arg0: !test.test_memref<[42], f32>) {
    return
  }
}

