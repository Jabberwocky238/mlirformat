"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "emitc_call_opaque"}> ({
    %9 = "emitc.call_opaque"() <{callee = "func_a"}> : () -> i32 loc("<stdin>":3:10)
    %10 = "emitc.call_opaque"() <{callee = "func_b"}> : () -> i32 loc("<stdin>":4:11)
    "func.return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "emitc_call_opaque_two_results"}> ({
    %7 = "emitc.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":8:10)
    %8:2 = "emitc.call_opaque"() <{callee = "two_results"}> : () -> (i32, i32) loc("<stdin>":9:12)
    "func.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = () -> (), sym_name = "emitc_call_opaque_lvalue_arg"}> ({
    %6 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32> loc("<stdin>":13:10)
    "emitc.call_opaque"(%6) <{callee = "func_out"}> : (!emitc.lvalue<i32>) -> () loc("<stdin>":14:5)
    "func.return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (!emitc.opaque<"MyClass">, !emitc.ptr<!emitc.opaque<"MyClass">>) -> (), sym_name = "emitc_member_call"}> ({
  ^bb0(%arg7: !emitc.opaque<"MyClass"> loc("<stdin>":18:8), %arg8: !emitc.ptr<!emitc.opaque<"MyClass">> loc("<stdin>":18:41)):
    %4 = "emitc.member_call_opaque"(%arg7) <{callee = "method"}> : (!emitc.opaque<"MyClass">) -> i32 loc("<stdin>":19:10)
    %5 = "emitc.member_call_opaque"(%arg8) <{callee = "ptr_method"}> : (!emitc.ptr<!emitc.opaque<"MyClass">>) -> i32 loc("<stdin>":20:10)
    "func.return"() : () -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (!emitc.opaque<"MyClass">, i32) -> (), sym_name = "emitc_member_call_args"}> ({
  ^bb0(%arg5: !emitc.opaque<"MyClass"> loc("<stdin>":24:8), %arg6: i32 loc("<stdin>":24:41)):
    %3 = "emitc.member_call_opaque"(%arg5, %arg6) <{callee = "method"}> : (!emitc.opaque<"MyClass">, i32) -> i32 loc("<stdin>":25:10)
    "func.return"() : () -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":23:3)
  "func.func"() <{function_type = (!emitc.opaque<"MyClass">, i32, i32) -> (), sym_name = "emitc_member_call_args_reorder"}> ({
  ^bb0(%arg2: !emitc.opaque<"MyClass"> loc("<stdin>":29:8), %arg3: i32 loc("<stdin>":29:41), %arg4: i32 loc("<stdin>":29:53)):
    %2 = "emitc.member_call_opaque"(%arg2, %arg3, %arg4) <{args = [1 : index, 0 : index], callee = "method"}> : (!emitc.opaque<"MyClass">, i32, i32) -> i32 loc("<stdin>":30:10)
    "func.return"() : () -> () loc("<stdin>":31:5)
  }) : () -> () loc("<stdin>":28:3)
  "func.func"() <{function_type = (!emitc.opaque<"MyClass">) -> (), sym_name = "emitc_member_call_template_args"}> ({
  ^bb0(%arg1: !emitc.opaque<"MyClass"> loc("<stdin>":34:8)):
    %1 = "emitc.member_call_opaque"(%arg1) <{callee = "method", template_args = [i32]}> : (!emitc.opaque<"MyClass">) -> i32 loc("<stdin>":35:10)
    "func.return"() : () -> () loc("<stdin>":36:5)
  }) : () -> () loc("<stdin>":33:3)
  "func.func"() <{function_type = (!emitc.opaque<"MyClass">) -> (), sym_name = "emitc_member_call_lvalue_arg"}> ({
  ^bb0(%arg0: !emitc.opaque<"MyClass"> loc("<stdin>":39:8)):
    %0 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32> loc("<stdin>":40:10)
    "emitc.member_call_opaque"(%arg0, %0) <{callee = "method"}> : (!emitc.opaque<"MyClass">, !emitc.lvalue<i32>) -> () loc("<stdin>":41:5)
    "func.return"() : () -> () loc("<stdin>":42:5)
  }) : () -> () loc("<stdin>":38:3)
}) : () -> () loc("<stdin>":1:1)
