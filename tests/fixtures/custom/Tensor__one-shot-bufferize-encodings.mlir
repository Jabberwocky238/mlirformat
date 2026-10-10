module {
  func.func @from_elements(%arg0: f32, %arg1: f32, %arg2: index) -> tensor<3xf32, 1 : i64> {
    %from_elements = tensor.from_elements %arg0, %arg0, %arg0 : tensor<3xf32, 1 : i64>
    %inserted = tensor.insert %arg1 into %from_elements[%arg2] : tensor<3xf32, 1 : i64>
    return %inserted : tensor<3xf32, 1 : i64>
  }
}

