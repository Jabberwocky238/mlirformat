module {
  func.func @single_concat(%arg0: tensor<1x1x7x7xf32>) -> tensor<1x2x7x7xf32> {
    %0 = tosa.concat %arg0, %arg0 {axis = 1 : i32} : (tensor<1x1x7x7xf32>, tensor<1x1x7x7xf32>) -> tensor<1x2x7x7xf32>
    return %0 : tensor<1x2x7x7xf32>
  }
}

// -----
module {
  func.func @concat_different_axis(%arg0: tensor<1x1x7x7xf32>) -> tensor<2x2x7x7xf32> {
    %0 = tosa.concat %arg0, %arg0 {axis = 1 : i32} : (tensor<1x1x7x7xf32>, tensor<1x1x7x7xf32>) -> tensor<1x2x7x7xf32>
    %1 = tosa.concat %0, %0 {axis = 0 : i32} : (tensor<1x2x7x7xf32>, tensor<1x2x7x7xf32>) -> tensor<2x2x7x7xf32>
    return %1 : tensor<2x2x7x7xf32>
  }
}

// -----
module {
  func.func @fold_concats(%arg0: tensor<1x1x7x7xf32>) -> tensor<1x4x7x7xf32> {
    %0 = tensor.empty() : tensor<1x1x7x7xf32>
    %1 = tosa.concat %arg0, %arg0 {axis = 1 : i32} : (tensor<1x1x7x7xf32>, tensor<1x1x7x7xf32>) -> tensor<1x2x7x7xf32>
    %2 = tosa.concat %0, %1, %0 {axis = 1 : i32} : (tensor<1x1x7x7xf32>, tensor<1x2x7x7xf32>, tensor<1x1x7x7xf32>) -> tensor<1x4x7x7xf32>
    return %2 : tensor<1x4x7x7xf32>
  }
}

// -----
module {
  func.func @nested_fold(%arg0: tensor<1x1x7x7xf32>) -> tensor<1x8x7x7xf32> {
    %0 = tensor.empty() : tensor<1x1x7x7xf32>
    %1 = tosa.concat %arg0, %arg0 {axis = 1 : i32} : (tensor<1x1x7x7xf32>, tensor<1x1x7x7xf32>) -> tensor<1x2x7x7xf32>
    %2 = tosa.concat %0, %1, %0 {axis = 1 : i32} : (tensor<1x1x7x7xf32>, tensor<1x2x7x7xf32>, tensor<1x1x7x7xf32>) -> tensor<1x4x7x7xf32>
    %3 = tosa.concat %2, %2 {axis = 1 : i32} : (tensor<1x4x7x7xf32>, tensor<1x4x7x7xf32>) -> tensor<1x8x7x7xf32>
    return %3 : tensor<1x8x7x7xf32>
  }
}

// -----
module {
  func.func @wide_fold(%arg0: tensor<1x1x7x7xf32>, %arg1: tensor<1x1x7x7xf32>) -> tensor<1x4x7x7xf32> {
    %0 = tosa.concat %arg0, %arg0 {axis = 1 : i32} : (tensor<1x1x7x7xf32>, tensor<1x1x7x7xf32>) -> tensor<1x2x7x7xf32>
    %1 = tosa.concat %arg1, %arg1 {axis = 1 : i32} : (tensor<1x1x7x7xf32>, tensor<1x1x7x7xf32>) -> tensor<1x2x7x7xf32>
    %2 = tosa.concat %0, %1 {axis = 1 : i32} : (tensor<1x2x7x7xf32>, tensor<1x2x7x7xf32>) -> tensor<1x4x7x7xf32>
    return %2 : tensor<1x4x7x7xf32>
  }
}

// -----
module {
  func.func @partially_foldable(%arg0: tensor<1x1x8x8xf32>, %arg1: tensor<1x2x4x8xf32>) -> tensor<1x4x8x8xf32> {
    %0 = tosa.concat %arg0, %arg0 {axis = 1 : i32} : (tensor<1x1x8x8xf32>, tensor<1x1x8x8xf32>) -> tensor<1x2x8x8xf32>
    %1 = tosa.concat %arg1, %arg1 {axis = 2 : i32} : (tensor<1x2x4x8xf32>, tensor<1x2x4x8xf32>) -> tensor<1x2x8x8xf32>
    %2 = tosa.concat %0, %1 {axis = 1 : i32} : (tensor<1x2x8x8xf32>, tensor<1x2x8x8xf32>) -> tensor<1x4x8x8xf32>
    return %2 : tensor<1x4x8x8xf32>
  }
}

