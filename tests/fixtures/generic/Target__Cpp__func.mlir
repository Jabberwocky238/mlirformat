"builtin.module"() ({
  "emitc.func"() <{function_type = (i32) -> (), sym_name = "emitc_func"}> ({
  ^bb0(%arg3: i32):
    "emitc.call_opaque"(%arg3) <{callee = "foo"}> : (i32) -> ()
    "emitc.return"() : () -> ()
  }) : () -> ()
  "emitc.func"() <{function_type = () -> i32, specifiers = ["static", "inline"], sym_name = "return_i32"}> ({
    %7 = "emitc.call_opaque"() <{callee = "foo"}> : () -> i32
    "emitc.return"(%7) : (i32) -> ()
  }) : () -> ()
  "emitc.func"() <{function_type = () -> i32, sym_name = "emitc_call"}> ({
    %6 = "emitc.call"() <{callee = @return_i32}> : () -> i32
    "emitc.return"(%6) : (i32) -> ()
  }) : () -> ()
  "emitc.func"() <{function_type = (i32) -> (), specifiers = ["extern"], sym_name = "extern_func"}> ({
  }) {sym_visibility = "private"} : () -> ()
  "emitc.func"() <{function_type = (!emitc.array<3xi32>) -> (), specifiers = ["extern"], sym_name = "array_arg"}> ({
  }) {sym_visibility = "private"} : () -> ()
  "emitc.class"() <{class_type = 1 : i32, sym_name = "return_i32_i32"}> ({
    "emitc.field"() <{sym_name = "field0", type = i32}> : () -> ()
    "emitc.field"() <{sym_name = "field1", type = i32}> : () -> ()
  }) : () -> ()
  "emitc.func"() <{function_type = (i32, i32) -> !emitc.opaque<"struct return_i32_i32">, sym_name = "return_two"}> ({
  ^bb0(%arg1: i32, %arg2: i32):
    %2 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<!emitc.opaque<"struct return_i32_i32">>
    %3 = "emitc.member"(%2) <{member = "field0"}> : (!emitc.lvalue<!emitc.opaque<"struct return_i32_i32">>) -> !emitc.lvalue<i32>
    "emitc.assign"(%3, %arg1) : (!emitc.lvalue<i32>, i32) -> ()
    %4 = "emitc.member"(%2) <{member = "field1"}> : (!emitc.lvalue<!emitc.opaque<"struct return_i32_i32">>) -> !emitc.lvalue<i32>
    "emitc.assign"(%4, %arg2) : (!emitc.lvalue<i32>, i32) -> ()
    %5 = "emitc.load"(%2) : (!emitc.lvalue<!emitc.opaque<"struct return_i32_i32">>) -> !emitc.opaque<"struct return_i32_i32">
    "emitc.return"(%5) : (!emitc.opaque<"struct return_i32_i32">) -> ()
  }) : () -> ()
  "emitc.func"() <{function_type = (i32) -> i32, sym_name = "call_two"}> ({
  ^bb0(%arg0: i32):
    %0 = "emitc.call"(%arg0, %arg0) <{callee = @return_two}> : (i32, i32) -> !emitc.opaque<"struct return_i32_i32">
    %1 = "emitc.member"(%0) <{member = "field1"}> : (!emitc.opaque<"struct return_i32_i32">) -> i32
    "emitc.return"(%1) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

