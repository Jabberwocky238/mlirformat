module {
  func.func @test_i1_splat_true() -> tensor<100xi1> {
    %cst = arith.constant dense<true> : tensor<100xi1>
    return %cst : tensor<100xi1>
  }
  func.func @test_i1_splat_false() -> tensor<100xi1> {
    %cst = arith.constant dense<false> : tensor<100xi1>
    return %cst : tensor<100xi1>
  }
  func.func @test_8xi1_splat_true() -> tensor<8xi1> {
    %cst = arith.constant dense<true> : tensor<8xi1>
    return %cst : tensor<8xi1>
  }
  func.func @test_8xi1_splat_false() -> tensor<8xi1> {
    %cst = arith.constant dense<false> : tensor<8xi1>
    return %cst : tensor<8xi1>
  }
  func.func @test_i8_mixed() {
    %cst = arith.constant dense<[true, false, true, false, true, false, true, false]> : tensor<8xi1>
    return
  }
  func.func @test_i9_mixed() {
    %cst = arith.constant dense<[true, false, true, false, true, false, true, false, true]> : tensor<9xi1>
    return
  }
  func.func public @test_in_memory_repr() -> (tensor<32xi32> {jax.result_info = "result"}) {
    %cst = arith.constant dense<true> : tensor<32xi1>
    %0 = arith.extui %cst : tensor<32xi1> to tensor<32xi32>
    return %0 : tensor<32xi32>
  }
}

