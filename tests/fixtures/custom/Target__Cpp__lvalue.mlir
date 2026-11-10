module {
  emitc.func @lvalue_variables(%arg0: i32, %arg1: i32) -> i32 {
    %0 = mul %arg0, %arg1 : (i32, i32) -> i32
    %1 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    assign %0 : i32 to %1 : <i32>
    %2 = address_of %1 : !emitc.lvalue<i32>
    call @zero(%2) : (!emitc.ptr<i32>) -> ()
    %3 = load %1 : <i32>
    %4 = "emitc.constant"() <{value = -1 : i32}> : () -> i32
    assign %4 : i32 to %1 : <i32>
    return %3 : i32
  }
  emitc.func @zero(!emitc.ptr<i32>) attributes {specifiers = ["extern"]}
}

