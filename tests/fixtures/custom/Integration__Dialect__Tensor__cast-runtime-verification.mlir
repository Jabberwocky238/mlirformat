module {
  func.func private @cast_to_static_dim(%arg0: tensor<?xf32>) -> tensor<10xf32> {
    %cast = tensor.cast %arg0 : tensor<?xf32> to tensor<10xf32>
    return %cast : tensor<10xf32>
  }
  func.func private @cast_to_ranked(%arg0: tensor<*xf32>) -> tensor<f32> {
    %cast = tensor.cast %arg0 : tensor<*xf32> to tensor<f32>
    return %cast : tensor<f32>
  }
  func.func private @valid_cast(%arg0: tensor<*xf32>) -> tensor<?xf32> {
    %cast = tensor.cast %arg0 : tensor<*xf32> to tensor<?xf32>
    return %cast : tensor<?xf32>
  }
  func.func @main() {
    %0 = tensor.empty() : tensor<5xf32>
    %cast = tensor.cast %0 : tensor<5xf32> to tensor<?xf32>
    %1 = call @cast_to_static_dim(%cast) : (tensor<?xf32>) -> tensor<10xf32>
    %cast_0 = tensor.cast %0 : tensor<5xf32> to tensor<*xf32>
    %2 = call @cast_to_ranked(%cast_0) : (tensor<*xf32>) -> tensor<f32>
    %3 = call @valid_cast(%cast_0) : (tensor<*xf32>) -> tensor<?xf32>
    return
  }
}

