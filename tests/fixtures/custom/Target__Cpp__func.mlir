module {
  emitc.func @emitc_func(%arg0: i32) {
    call_opaque "foo"(%arg0) : (i32) -> ()
    return
  }
  emitc.func @return_i32() -> i32 attributes {specifiers = ["static", "inline"]} {
    %0 = call_opaque "foo"() : () -> i32
    return %0 : i32
  }
  emitc.func @emitc_call() -> i32 {
    %0 = call @return_i32() : () -> i32
    return %0 : i32
  }
  emitc.func private @extern_func(i32) attributes {specifiers = ["extern"]}
  emitc.func private @array_arg(!emitc.array<3xi32>) attributes {specifiers = ["extern"]}
}

