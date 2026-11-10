module {
  func.func @emitc_call_opaque() {
    %0 = emitc.call_opaque "func_a"()  : () -> i32
    %1 = emitc.call_opaque "func_b"()  : () -> i32
    return
  }
  func.func @emitc_call_opaque_two_results() {
    %0 = "emitc.constant"() <{value = 0 : index}> : () -> index
    %1:2 = emitc.call_opaque "two_results"()  : () -> (i32, i32)
    return
  }
  func.func @emitc_call_opaque_lvalue_arg() {
    %0 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    emitc.call_opaque "func_out"(%0)  : (!emitc.lvalue<i32>) -> ()
    return
  }
  func.func @emitc_member_call(%arg0: !emitc.opaque<"MyClass">, %arg1: !emitc.ptr<!emitc.opaque<"MyClass">>) {
    %0 = emitc.member_call_opaque %arg0 "method"()  : !emitc.opaque<"MyClass">, () -> i32
    %1 = emitc.member_call_opaque %arg1 "ptr_method"()  : !emitc.ptr<!emitc.opaque<"MyClass">>, () -> i32
    return
  }
  func.func @emitc_member_call_args(%arg0: !emitc.opaque<"MyClass">, %arg1: i32) {
    %0 = emitc.member_call_opaque %arg0 "method"(%arg1)  : !emitc.opaque<"MyClass">, (i32) -> i32
    return
  }
  func.func @emitc_member_call_args_reorder(%arg0: !emitc.opaque<"MyClass">, %arg1: i32, %arg2: i32) {
    %0 = emitc.member_call_opaque %arg0 "method"(%arg1, %arg2) <{args = [1 : index, 0 : index]}> : !emitc.opaque<"MyClass">, (i32, i32) -> i32
    return
  }
  func.func @emitc_member_call_template_args(%arg0: !emitc.opaque<"MyClass">) {
    %0 = emitc.member_call_opaque %arg0 "method"() <{template_args = [i32]}> : !emitc.opaque<"MyClass">, () -> i32
    return
  }
  func.func @emitc_member_call_lvalue_arg(%arg0: !emitc.opaque<"MyClass">) {
    %0 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    emitc.member_call_opaque %arg0 "method"(%0)  : !emitc.opaque<"MyClass">, (!emitc.lvalue<i32>) -> ()
    return
  }
}

