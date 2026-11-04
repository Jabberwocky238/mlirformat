module {
  func.func @out_of_place_bufferization(%arg0: tensor<?xf32>) -> (f32, f32) {
    %cst = arith.constant 0.000000e+00 : f32
    %c5 = arith.constant 5 : index
    %inserted = tensor.insert %cst into %arg0[%c5] : tensor<?xf32>
    %extracted = tensor.extract %arg0[%c5] : tensor<?xf32>
    %extracted_0 = tensor.extract %inserted[%c5] : tensor<?xf32>
    return %extracted, %extracted_0 : f32, f32
  }
}

