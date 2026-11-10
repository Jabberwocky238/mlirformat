module {
  emitc.func @emitc_func(%arg0: i32) {
    call_opaque "foo"(%arg0)  : (i32) -> ()
    return
  }
  emitc.func @return_i32() -> i32 attributes {specifiers = ["static", "inline"]} {
    %0 = call_opaque "foo"()  : () -> i32
    return %0 : i32
  }
  emitc.func @emitc_call() -> i32 {
    %0 = call @return_i32() : () -> i32
    return %0 : i32
  }
  emitc.func private @extern_func(i32) attributes {specifiers = ["extern"]}
  emitc.func private @array_arg(!emitc.array<3xi32>) attributes {specifiers = ["extern"]}
  emitc.class struct @return_i32_i32 {
    emitc.field @field0 : i32
    emitc.field @field1 : i32
  }
  emitc.func @return_two(%arg0: i32, %arg1: i32) -> !emitc.opaque<"struct return_i32_i32"> {
    %0 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<!emitc.opaque<"struct return_i32_i32">>
    %1 = "emitc.member"(%0) <{member = "field0"}> : (!emitc.lvalue<!emitc.opaque<"struct return_i32_i32">>) -> !emitc.lvalue<i32>
    assign %arg0 : i32 to %1 : <i32>
    %2 = "emitc.member"(%0) <{member = "field1"}> : (!emitc.lvalue<!emitc.opaque<"struct return_i32_i32">>) -> !emitc.lvalue<i32>
    assign %arg1 : i32 to %2 : <i32>
    %3 = load %0 : <!emitc.opaque<"struct return_i32_i32">>
    return %3 : !emitc.opaque<"struct return_i32_i32">
  }
  emitc.func @call_two(%arg0: i32) -> i32 {
    %0 = call @return_two(%arg0, %arg0) : (i32, i32) -> !emitc.opaque<"struct return_i32_i32">
    %1 = "emitc.member"(%0) <{member = "field1"}> : (!emitc.opaque<"struct return_i32_i32">) -> i32
    return %1 : i32
  }
}

