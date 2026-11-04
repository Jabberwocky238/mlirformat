"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "emitc_call_opaque"}> ({
    %2 = "emitc.call_opaque"() <{callee = "func_a"}> : () -> i32
    %3 = "emitc.call_opaque"() <{callee = "func_b"}> : () -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "emitc_call_opaque_two_results"}> ({
    %0 = "emitc.constant"() <{value = 0 : index}> : () -> index
    %1:2 = "emitc.call_opaque"() <{callee = "two_results"}> : () -> (i32, i32)
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

