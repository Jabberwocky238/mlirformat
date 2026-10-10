module {
  func.func @extract_slice(%arg0: tensor<?xf32>, %arg1: index, %arg2: f32) -> (tensor<5xf32>, tensor<?xf32>) {
    %extracted_slice = tensor.extract_slice %arg0[10] [5] [1] : tensor<?xf32> to tensor<5xf32>
    %inserted = tensor.insert %arg2 into %extracted_slice[%arg1] : tensor<5xf32>
    return %inserted, %arg0 : tensor<5xf32>, tensor<?xf32>
  }
}

