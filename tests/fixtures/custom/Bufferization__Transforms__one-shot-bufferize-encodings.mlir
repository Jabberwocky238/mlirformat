module {
  func.func @alloc_tesor_with_space_no_encoding() -> tensor<128xf32> {
    %0 = bufferization.alloc_tensor() {memory_space = 1 : i64} : tensor<128xf32>
    return %0 : tensor<128xf32>
  }
}

// -----
module {
  func.func @alloc_tesor_with_space_and_cast() -> tensor<128xf32, 1 : i64> {
    %0 = bufferization.alloc_tensor() {memory_space = 1 : i64} : tensor<128xf32>
    %cast = tensor.cast %0 : tensor<128xf32> to tensor<128xf32, 1 : i64>
    return %cast : tensor<128xf32, 1 : i64>
  }
}

// -----
module {
  func.func @alloc_tesor_with_space_with_encoding() -> tensor<128xf32, 1 : i64> {
    %0 = bufferization.alloc_tensor() {memory_space = 1 : i64} : tensor<128xf32, 1 : i64>
    return %0 : tensor<128xf32, 1 : i64>
  }
}

// -----
module {
  func.func @alloc_tesor_copy_from_default_space(%arg0: tensor<128xf32>) -> tensor<128xf32> {
    %0 = bufferization.alloc_tensor() copy(%arg0) {memory_space = 1 : i64} : tensor<128xf32>
    return %0 : tensor<128xf32>
  }
}

// -----
module {
  func.func @alloc_tesor_copy_from_non_default_space(%arg0: tensor<128xf32, 1 : i64>) -> tensor<128xf32, 2 : i64> {
    %0 = bufferization.alloc_tensor() copy(%arg0) {memory_space = 2 : i64} : tensor<128xf32, 1 : i64>
    %cast = tensor.cast %0 : tensor<128xf32, 1 : i64> to tensor<128xf32, 2 : i64>
    return %cast : tensor<128xf32, 2 : i64>
  }
}

// -----
module {
  func.func @alloc_tesor_copy_from_non_default_space_no_cast(%arg0: tensor<128xf32, 1 : i64>, %arg1: tensor<4xf32, 1 : i64>) -> tensor<128xf32, 1 : i64> {
    %0 = bufferization.alloc_tensor() copy(%arg0) {memory_space = 2 : i64} : tensor<128xf32, 1 : i64>
    %inserted_slice = tensor.insert_slice %arg1 into %arg0[0] [4] [1] : tensor<4xf32, 1 : i64> into tensor<128xf32, 1 : i64>
    return %0 : tensor<128xf32, 1 : i64>
  }
}

// -----
module {
  func.func @materialize_in_destination(%arg0: tensor<128xf32, 1 : i64>) -> tensor<128xf32, 2 : i64> {
    %0 = bufferization.alloc_tensor() {memory_space = 2 : i64} : tensor<128xf32, 2 : i64>
    %1 = bufferization.materialize_in_destination %arg0 in %0 : (tensor<128xf32, 1 : i64>, tensor<128xf32, 2 : i64>) -> tensor<128xf32, 2 : i64>
    return %1 : tensor<128xf32, 2 : i64>
  }
}

