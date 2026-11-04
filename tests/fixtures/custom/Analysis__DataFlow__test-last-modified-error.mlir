module {
  func.func @test() {
    %c0_i32 = arith.constant {always_fail} 0 : i32
    return
  }
}

