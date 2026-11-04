"builtin.module"() ({
  "emitc.func"() <{function_type = (i32, i32) -> i32, sym_name = "lvalue_variables"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "emitc.mul"(%arg0, %arg1) : (i32, i32) -> i32
    %1 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    "emitc.assign"(%1, %0) : (!emitc.lvalue<i32>, i32) -> ()
    %2 = "emitc.apply"(%1) <{applicableOperator = "&"}> : (!emitc.lvalue<i32>) -> !emitc.ptr<i32>
    "emitc.call"(%2) <{callee = @zero}> : (!emitc.ptr<i32>) -> ()
    %3 = "emitc.load"(%1) : (!emitc.lvalue<i32>) -> i32
    %4 = "emitc.constant"() <{value = -1 : i32}> : () -> i32
    "emitc.assign"(%1, %4) : (!emitc.lvalue<i32>, i32) -> ()
    "emitc.return"(%3) : (i32) -> ()
  }) : () -> ()
  "emitc.func"() <{function_type = (!emitc.ptr<i32>) -> (), specifiers = ["extern"], sym_name = "zero"}> ({
  }) : () -> ()
}) : () -> ()

