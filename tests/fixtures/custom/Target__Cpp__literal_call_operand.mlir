module {
  func.func @emitc_call_operand() {
    %0 = emitc.literal "M_PI" : f32
    %1 = emitc.call_opaque "foo"(%0) : (f32) -> f32
    return
  }
  func.func @emitc_call_operand_arg() {
    %0 = emitc.literal "M_PI" : f32
    %1 = emitc.call_opaque "bar"(%0) {args = [42 : i32, 0 : index]} : (f32) -> f32
    return
  }
}

