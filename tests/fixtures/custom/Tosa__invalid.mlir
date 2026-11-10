module {
  func.func @test_non_tosa_ops() {
    %c6 = arith.constant 6 : index
    %0 = tensor.empty(%c6) : tensor<?x27xi64>
    return
  }
}

