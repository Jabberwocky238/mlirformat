module {
  func.func @test() {
    return
  }
}

// -----
module {
  func.func @test() {
    %cst = arith.constant 1.500000e+00 : f32
    return
  }
}

