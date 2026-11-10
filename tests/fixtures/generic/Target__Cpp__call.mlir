"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "emitc_call_opaque"}> ({
    %9 = "emitc.call_opaque"() <{callee = "func_a"}> : () -> i32
    %10 = "emitc.call_opaque"() <{callee = "func_b"}> : () -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "emitc_call_opaque_two_results"}> ({
    %7 = "emitc.constant"() <{value = 0 : index}> : () -> index
    %8:2 = "emitc.call_opaque"() <{callee = "two_results"}> : () -> (i32, i32)
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "emitc_call_opaque_lvalue_arg"}> ({
    %6 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    "emitc.call_opaque"(%6) <{callee = "func_out"}> : (!emitc.lvalue<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!emitc.opaque<"MyClass">, !emitc.ptr<!emitc.opaque<"MyClass">>) -> (), sym_name = "emitc_member_call"}> ({
  ^bb0(%arg7: !emitc.opaque<"MyClass">, %arg8: !emitc.ptr<!emitc.opaque<"MyClass">>):
    %4 = "emitc.member_call_opaque"(%arg7) <{callee = "method"}> : (!emitc.opaque<"MyClass">) -> i32
    %5 = "emitc.member_call_opaque"(%arg8) <{callee = "ptr_method"}> : (!emitc.ptr<!emitc.opaque<"MyClass">>) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!emitc.opaque<"MyClass">, i32) -> (), sym_name = "emitc_member_call_args"}> ({
  ^bb0(%arg5: !emitc.opaque<"MyClass">, %arg6: i32):
    %3 = "emitc.member_call_opaque"(%arg5, %arg6) <{callee = "method"}> : (!emitc.opaque<"MyClass">, i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!emitc.opaque<"MyClass">, i32, i32) -> (), sym_name = "emitc_member_call_args_reorder"}> ({
  ^bb0(%arg2: !emitc.opaque<"MyClass">, %arg3: i32, %arg4: i32):
    %2 = "emitc.member_call_opaque"(%arg2, %arg3, %arg4) <{args = [1 : index, 0 : index], callee = "method"}> : (!emitc.opaque<"MyClass">, i32, i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!emitc.opaque<"MyClass">) -> (), sym_name = "emitc_member_call_template_args"}> ({
  ^bb0(%arg1: !emitc.opaque<"MyClass">):
    %1 = "emitc.member_call_opaque"(%arg1) <{callee = "method", template_args = [i32]}> : (!emitc.opaque<"MyClass">) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!emitc.opaque<"MyClass">) -> (), sym_name = "emitc_member_call_lvalue_arg"}> ({
  ^bb0(%arg0: !emitc.opaque<"MyClass">):
    %0 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    "emitc.member_call_opaque"(%arg0, %0) <{callee = "method"}> : (!emitc.opaque<"MyClass">, !emitc.lvalue<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

