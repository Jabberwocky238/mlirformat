module {
}

// -----
module {
  func.func @shape_assuming() {
    %0 = shape.const_witness true
    %1 = shape.assuming %0 -> (tensor<2xf16>) {
      %2 = "test.source"() : () -> tensor<2xf16>
      shape.assuming_yield %2 : tensor<2xf16>
    }
    "test.sink"(%1) : (tensor<2xf16>) -> ()
    return
  }
}

