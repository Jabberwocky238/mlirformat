module {
  func.func @testCreateFunctions(%arg0: tensor<10xf32, !test.smpla>, %arg1: tensor<20xi32>) {
    %0 = "test.no_attributes"(%arg0, %arg0) : (tensor<10xf32, !test.smpla>, tensor<10xf32, !test.smpla>) -> tensor<10xf32, !test.smpla>
    return
  }
}

