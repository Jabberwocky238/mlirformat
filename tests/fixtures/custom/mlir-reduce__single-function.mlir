module {
  func.func @test() {
    "test.op_crash"() : () -> ()
    return
  }
}

