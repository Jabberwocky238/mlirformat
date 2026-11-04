module {
  func.func @emitc_call_opaque() {
    %0 = emitc.call_opaque "func_a"() : () -> i32
    %1 = emitc.call_opaque "func_b"() : () -> i32
    return
  }
  func.func @emitc_call_opaque_two_results() {
    %0 = "emitc.constant"() <{value = 0 : index}> : () -> index
    %1:2 = emitc.call_opaque "two_results"() : () -> (i32, i32)
    return
  }
}

