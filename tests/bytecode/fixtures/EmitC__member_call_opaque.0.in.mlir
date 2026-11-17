"builtin.module"() ({
  "func.func"() <{function_type = (!emitc.opaque<"MyClass">) -> (), sym_name = "member_call"}> ({
  ^bb0(%arg8: !emitc.opaque<"MyClass"> loc("<stdin>":3:8)):
    %4 = "emitc.member_call_opaque"(%arg8) <{callee = "method"}> : (!emitc.opaque<"MyClass">) -> i32 loc("<stdin>":4:10)
    "func.return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (!emitc.opaque<"MyClass">, i32) -> (), sym_name = "member_call_args"}> ({
  ^bb0(%arg6: !emitc.opaque<"MyClass"> loc("<stdin>":8:8), %arg7: i32 loc("<stdin>":8:41)):
    %3 = "emitc.member_call_opaque"(%arg6, %arg7) <{callee = "method"}> : (!emitc.opaque<"MyClass">, i32) -> i32 loc("<stdin>":9:10)
    "func.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (!emitc.opaque<"MyClass">) -> (), sym_name = "member_call_template_args"}> ({
  ^bb0(%arg5: !emitc.opaque<"MyClass"> loc("<stdin>":13:8)):
    %2 = "emitc.member_call_opaque"(%arg5) <{callee = "method", template_args = [i32]}> : (!emitc.opaque<"MyClass">) -> i32 loc("<stdin>":14:10)
    "func.return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (!emitc.opaque<"MyClass">, i32, i32) -> (), sym_name = "member_call_reorder"}> ({
  ^bb0(%arg2: !emitc.opaque<"MyClass"> loc("<stdin>":18:8), %arg3: i32 loc("<stdin>":18:41), %arg4: i32 loc("<stdin>":18:53)):
    %1 = "emitc.member_call_opaque"(%arg2, %arg3, %arg4) <{args = [1 : index, 0 : index], callee = "method"}> : (!emitc.opaque<"MyClass">, i32, i32) -> i32 loc("<stdin>":19:10)
    "func.return"() : () -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (!emitc.opaque<"MyClass">, !emitc.lvalue<i32>) -> (), sym_name = "member_call_lvalue_arg"}> ({
  ^bb0(%arg0: !emitc.opaque<"MyClass"> loc("<stdin>":23:8), %arg1: !emitc.lvalue<i32> loc("<stdin>":23:41)):
    %0 = "emitc.member_call_opaque"(%arg0, %arg1) <{callee = "method"}> : (!emitc.opaque<"MyClass">, !emitc.lvalue<i32>) -> i32 loc("<stdin>":24:10)
    "func.return"() : () -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":22:3)
}) : () -> () loc("<stdin>":1:1)
