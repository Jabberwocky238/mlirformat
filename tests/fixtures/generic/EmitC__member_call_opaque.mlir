"builtin.module"() ({
  "func.func"() <{function_type = (!emitc.opaque<"MyClass">) -> (), sym_name = "member_call"}> ({
  ^bb0(%arg8: !emitc.opaque<"MyClass">):
    %4 = "emitc.member_call_opaque"(%arg8) <{callee = "method"}> : (!emitc.opaque<"MyClass">) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!emitc.opaque<"MyClass">, i32) -> (), sym_name = "member_call_args"}> ({
  ^bb0(%arg6: !emitc.opaque<"MyClass">, %arg7: i32):
    %3 = "emitc.member_call_opaque"(%arg6, %arg7) <{callee = "method"}> : (!emitc.opaque<"MyClass">, i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!emitc.opaque<"MyClass">) -> (), sym_name = "member_call_template_args"}> ({
  ^bb0(%arg5: !emitc.opaque<"MyClass">):
    %2 = "emitc.member_call_opaque"(%arg5) <{callee = "method", template_args = [i32]}> : (!emitc.opaque<"MyClass">) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!emitc.opaque<"MyClass">, i32, i32) -> (), sym_name = "member_call_reorder"}> ({
  ^bb0(%arg2: !emitc.opaque<"MyClass">, %arg3: i32, %arg4: i32):
    %1 = "emitc.member_call_opaque"(%arg2, %arg3, %arg4) <{args = [1 : index, 0 : index], callee = "method"}> : (!emitc.opaque<"MyClass">, i32, i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!emitc.opaque<"MyClass">, !emitc.lvalue<i32>) -> (), sym_name = "member_call_lvalue_arg"}> ({
  ^bb0(%arg0: !emitc.opaque<"MyClass">, %arg1: !emitc.lvalue<i32>):
    %0 = "emitc.member_call_opaque"(%arg0, %arg1) <{callee = "method"}> : (!emitc.opaque<"MyClass">, !emitc.lvalue<i32>) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

