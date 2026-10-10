module {
  func.func @test() {
    "test.emit_error"() {attr = "emit_error"} : () -> ()
    "test.do_not_emit_error"() {attr = "do_not_emit_error"} : () -> ()
    return
  }
}

