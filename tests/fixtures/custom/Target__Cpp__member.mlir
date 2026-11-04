module {
  func.func @member(%arg0: !emitc.opaque<"mystruct">, %arg1: i32, %arg2: index) {
    %0 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<!emitc.opaque<"mystruct">>
    emitc.assign %arg0 : !emitc.opaque<"mystruct"> to %0 : <!emitc.opaque<"mystruct">>
    %1 = "emitc.member"(%0) <{member = "a"}> : (!emitc.lvalue<!emitc.opaque<"mystruct">>) -> !emitc.lvalue<i32>
    emitc.assign %arg1 : i32 to %1 : <i32>
    %2 = "emitc.member"(%0) <{member = "b"}> : (!emitc.lvalue<!emitc.opaque<"mystruct">>) -> !emitc.lvalue<i32>
    %3 = emitc.load %2 : <i32>
    %4 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    emitc.assign %3 : i32 to %4 : <i32>
    %5 = "emitc.member"(%0) <{member = "c"}> : (!emitc.lvalue<!emitc.opaque<"mystruct">>) -> !emitc.array<2xi32>
    %6 = emitc.subscript %5[%arg2] : (!emitc.array<2xi32>, index) -> !emitc.lvalue<i32>
    %7 = emitc.load %6 : <i32>
    emitc.assign %7 : i32 to %4 : <i32>
    %8 = "emitc.member"(%0) <{member = "d"}> : (!emitc.lvalue<!emitc.opaque<"mystruct">>) -> !emitc.array<2xi32>
    %9 = emitc.subscript %8[%arg2] : (!emitc.array<2xi32>, index) -> !emitc.lvalue<i32>
    emitc.assign %arg1 : i32 to %9 : <i32>
    return
  }
  func.func @member_of_pointer(%arg0: !emitc.ptr<!emitc.opaque<"mystruct">>, %arg1: i32, %arg2: index) {
    %0 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>
    emitc.assign %arg0 : !emitc.ptr<!emitc.opaque<"mystruct">> to %0 : <!emitc.ptr<!emitc.opaque<"mystruct">>>
    %1 = "emitc.member_of_ptr"(%0) <{member = "a"}> : (!emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>) -> !emitc.lvalue<i32>
    emitc.assign %arg1 : i32 to %1 : <i32>
    %2 = "emitc.member_of_ptr"(%0) <{member = "b"}> : (!emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>) -> !emitc.lvalue<i32>
    %3 = emitc.load %2 : <i32>
    %4 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    emitc.assign %3 : i32 to %4 : <i32>
    %5 = "emitc.member_of_ptr"(%0) <{member = "c"}> : (!emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>) -> !emitc.array<2xi32>
    %6 = emitc.subscript %5[%arg2] : (!emitc.array<2xi32>, index) -> !emitc.lvalue<i32>
    %7 = emitc.load %6 : <i32>
    emitc.assign %7 : i32 to %4 : <i32>
    %8 = "emitc.member_of_ptr"(%0) <{member = "d"}> : (!emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>) -> !emitc.array<2xi32>
    %9 = emitc.subscript %8[%arg2] : (!emitc.array<2xi32>, index) -> !emitc.lvalue<i32>
    emitc.assign %arg1 : i32 to %9 : <i32>
    return
  }
}

