module {
  func.func @test_vscale_constant_names() {
    %vscale = vector.vscale
    %c8 = arith.constant 8 : index
    %c8_vscale = arith.muli %vscale, %c8 : index
    %c10 = arith.constant 10 : index
    %c10_vscale = arith.muli %c10, %vscale : index
    return
  }
}

