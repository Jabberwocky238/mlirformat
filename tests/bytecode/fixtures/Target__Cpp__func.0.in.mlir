"builtin.module"() ({
  "emitc.func"() <{function_type = (i32) -> (), sym_name = "emitc_func"}> ({
  ^bb0(%arg3: i32 loc("<stdin>":3:8)):
    "emitc.call_opaque"(%arg3) <{callee = "foo"}> : (i32) -> () loc("<stdin>":4:5)
    "emitc.return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "emitc.func"() <{function_type = () -> i32, specifiers = ["static", "inline"], sym_name = "return_i32"}> ({
    %7 = "emitc.call_opaque"() <{callee = "foo"}> : () -> i32 loc("<stdin>":8:10)
    "emitc.return"(%7) : (i32) -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":7:3)
  "emitc.func"() <{function_type = () -> i32, sym_name = "emitc_call"}> ({
    %6 = "emitc.call"() <{callee = @return_i32}> : () -> i32 loc("<stdin>":12:10)
    "emitc.return"(%6) : (i32) -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":11:3)
  "emitc.func"() <{function_type = (i32) -> (), specifiers = ["extern"], sym_name = "extern_func"}> ({
  }) {sym_visibility = "private"} : () -> () loc("<stdin>":15:3)
  "emitc.func"() <{function_type = (!emitc.array<3xi32>) -> (), specifiers = ["extern"], sym_name = "array_arg"}> ({
  }) {sym_visibility = "private"} : () -> () loc("<stdin>":17:3)
  "emitc.class"() <{class_type = 1 : i32, sym_name = "return_i32_i32"}> ({
    "emitc.field"() <{sym_name = "field0", type = i32}> : () -> () loc("<stdin>":20:5)
    "emitc.field"() <{sym_name = "field1", type = i32}> : () -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":19:3)
  "emitc.func"() <{function_type = (i32, i32) -> !emitc.opaque<"struct return_i32_i32">, sym_name = "return_two"}> ({
  ^bb0(%arg1: i32 loc("<stdin>":24:8), %arg2: i32 loc("<stdin>":24:20)):
    %2 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<!emitc.opaque<"struct return_i32_i32">> loc("<stdin>":25:10)
    %3 = "emitc.member"(%2) <{member = "field0"}> : (!emitc.lvalue<!emitc.opaque<"struct return_i32_i32">>) -> !emitc.lvalue<i32> loc("<stdin>":26:10)
    "emitc.assign"(%3, %arg1) : (!emitc.lvalue<i32>, i32) -> () loc("<stdin>":27:5)
    %4 = "emitc.member"(%2) <{member = "field1"}> : (!emitc.lvalue<!emitc.opaque<"struct return_i32_i32">>) -> !emitc.lvalue<i32> loc("<stdin>":28:10)
    "emitc.assign"(%4, %arg2) : (!emitc.lvalue<i32>, i32) -> () loc("<stdin>":29:5)
    %5 = "emitc.load"(%2) : (!emitc.lvalue<!emitc.opaque<"struct return_i32_i32">>) -> !emitc.opaque<"struct return_i32_i32"> loc("<stdin>":30:10)
    "emitc.return"(%5) : (!emitc.opaque<"struct return_i32_i32">) -> () loc("<stdin>":31:5)
  }) : () -> () loc("<stdin>":23:3)
  "emitc.func"() <{function_type = (i32) -> i32, sym_name = "call_two"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":34:8)):
    %0 = "emitc.call"(%arg0, %arg0) <{callee = @return_two}> : (i32, i32) -> !emitc.opaque<"struct return_i32_i32"> loc("<stdin>":35:10)
    %1 = "emitc.member"(%0) <{member = "field1"}> : (!emitc.opaque<"struct return_i32_i32">) -> i32 loc("<stdin>":36:10)
    "emitc.return"(%1) : (i32) -> () loc("<stdin>":37:5)
  }) : () -> () loc("<stdin>":33:3)
}) : () -> () loc("<stdin>":1:1)
