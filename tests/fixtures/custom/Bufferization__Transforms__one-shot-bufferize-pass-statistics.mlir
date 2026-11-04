module {
  func.func @read_after_write_conflict(%arg0: f32, %arg1: index, %arg2: index) -> (f32, f32) {
    %0 = "test.dummy_op"() : () -> tensor<10xf32>
    %inserted = tensor.insert %arg0 into %0[%arg2] : tensor<10xf32>
    %1 = "test.some_use"(%0) : (tensor<10xf32>) -> f32
    %extracted = tensor.extract %inserted[%arg1] : tensor<10xf32>
    return %1, %extracted : f32, f32
  }
}

