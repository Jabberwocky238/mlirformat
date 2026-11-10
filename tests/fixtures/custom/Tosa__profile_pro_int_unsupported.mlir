module {
}

// -----
module {
  func.func @test_const_i1() -> tensor<3x11x11x3xi1> {
    %0 = "tosa.const"() <{values = dense<false> : tensor<3x11x11x3xi1>}> : () -> tensor<3x11x11x3xi1>
    return %0 : tensor<3x11x11x3xi1>
  }
}

// -----
module {
  func.func @test_const_i32() -> tensor<3x11x11x3xi32> {
    %0 = "tosa.const"() <{values = dense<0> : tensor<3x11x11x3xi32>}> : () -> tensor<3x11x11x3xi32>
    return %0 : tensor<3x11x11x3xi32>
  }
}

