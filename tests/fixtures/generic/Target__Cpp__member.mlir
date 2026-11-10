"builtin.module"() ({
  "func.func"() <{function_type = (!emitc.opaque<"mystruct">, i32, index) -> (), sym_name = "member"}> ({
  ^bb0(%arg3: !emitc.opaque<"mystruct">, %arg4: i32, %arg5: index):
    %10 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<!emitc.opaque<"mystruct">>
    "emitc.assign"(%10, %arg3) : (!emitc.lvalue<!emitc.opaque<"mystruct">>, !emitc.opaque<"mystruct">) -> ()
    %11 = "emitc.member"(%10) <{member = "a"}> : (!emitc.lvalue<!emitc.opaque<"mystruct">>) -> !emitc.lvalue<i32>
    "emitc.assign"(%11, %arg4) : (!emitc.lvalue<i32>, i32) -> ()
    %12 = "emitc.member"(%10) <{member = "b"}> : (!emitc.lvalue<!emitc.opaque<"mystruct">>) -> !emitc.lvalue<i32>
    %13 = "emitc.load"(%12) : (!emitc.lvalue<i32>) -> i32
    %14 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    "emitc.assign"(%14, %13) : (!emitc.lvalue<i32>, i32) -> ()
    %15 = "emitc.member"(%10) <{member = "c"}> : (!emitc.lvalue<!emitc.opaque<"mystruct">>) -> !emitc.array<2xi32>
    %16 = "emitc.subscript"(%15, %arg5) : (!emitc.array<2xi32>, index) -> !emitc.lvalue<i32>
    %17 = "emitc.load"(%16) : (!emitc.lvalue<i32>) -> i32
    "emitc.assign"(%14, %17) : (!emitc.lvalue<i32>, i32) -> ()
    %18 = "emitc.member"(%10) <{member = "d"}> : (!emitc.lvalue<!emitc.opaque<"mystruct">>) -> !emitc.array<2xi32>
    %19 = "emitc.subscript"(%18, %arg5) : (!emitc.array<2xi32>, index) -> !emitc.lvalue<i32>
    "emitc.assign"(%19, %arg4) : (!emitc.lvalue<i32>, i32) -> ()
    %20 = "emitc.member"(%arg3) <{member = "a"}> : (!emitc.opaque<"mystruct">) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!emitc.ptr<!emitc.opaque<"mystruct">>, i32, index) -> (), sym_name = "member_of_pointer"}> ({
  ^bb0(%arg0: !emitc.ptr<!emitc.opaque<"mystruct">>, %arg1: i32, %arg2: index):
    %0 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>
    "emitc.assign"(%0, %arg0) : (!emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>, !emitc.ptr<!emitc.opaque<"mystruct">>) -> ()
    %1 = "emitc.member_of_ptr"(%0) <{member = "a"}> : (!emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>) -> !emitc.lvalue<i32>
    "emitc.assign"(%1, %arg1) : (!emitc.lvalue<i32>, i32) -> ()
    %2 = "emitc.member_of_ptr"(%0) <{member = "b"}> : (!emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>) -> !emitc.lvalue<i32>
    %3 = "emitc.load"(%2) : (!emitc.lvalue<i32>) -> i32
    %4 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    "emitc.assign"(%4, %3) : (!emitc.lvalue<i32>, i32) -> ()
    %5 = "emitc.member_of_ptr"(%0) <{member = "c"}> : (!emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>) -> !emitc.array<2xi32>
    %6 = "emitc.subscript"(%5, %arg2) : (!emitc.array<2xi32>, index) -> !emitc.lvalue<i32>
    %7 = "emitc.load"(%6) : (!emitc.lvalue<i32>) -> i32
    "emitc.assign"(%4, %7) : (!emitc.lvalue<i32>, i32) -> ()
    %8 = "emitc.member_of_ptr"(%0) <{member = "d"}> : (!emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>) -> !emitc.array<2xi32>
    %9 = "emitc.subscript"(%8, %arg2) : (!emitc.array<2xi32>, index) -> !emitc.lvalue<i32>
    "emitc.assign"(%9, %arg1) : (!emitc.lvalue<i32>, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

