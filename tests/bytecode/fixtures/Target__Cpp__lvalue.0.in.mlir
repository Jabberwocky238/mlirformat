"builtin.module"() ({
  "emitc.func"() <{function_type = (i32, i32) -> i32, sym_name = "lvalue_variables"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":3:8), %arg1: i32 loc("<stdin>":3:20)):
    %0 = "emitc.mul"(%arg0, %arg1) : (i32, i32) -> i32 loc("<stdin>":4:10)
    %1 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32> loc("<stdin>":5:10)
    "emitc.assign"(%1, %0) : (!emitc.lvalue<i32>, i32) -> () loc("<stdin>":6:5)
    %2 = "emitc.address_of"(%1) : (!emitc.lvalue<i32>) -> !emitc.ptr<i32> loc("<stdin>":7:10)
    "emitc.call"(%2) <{callee = @zero}> : (!emitc.ptr<i32>) -> () loc("<stdin>":8:5)
    %3 = "emitc.load"(%1) : (!emitc.lvalue<i32>) -> i32 loc("<stdin>":9:10)
    %4 = "emitc.constant"() <{value = -1 : i32}> : () -> i32 loc("<stdin>":10:10)
    "emitc.assign"(%1, %4) : (!emitc.lvalue<i32>, i32) -> () loc("<stdin>":11:5)
    "emitc.return"(%3) : (i32) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":2:3)
  "emitc.func"() <{function_type = (!emitc.ptr<i32>) -> (), specifiers = ["extern"], sym_name = "zero"}> ({
  }) : () -> () loc("<stdin>":14:3)
}) : () -> () loc("<stdin>":1:1)
