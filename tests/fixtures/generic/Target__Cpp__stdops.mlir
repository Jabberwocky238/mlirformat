"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "std_call"}> ({
    %5 = "func.call"() <{callee = @one_result}> : () -> i32
    %6 = "func.call"() <{callee = @one_result}> : () -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "std_call_two_results"}> ({
    %3:2 = "func.call"() <{callee = @two_results}> : () -> (i32, f32)
    %4:2 = "func.call"() <{callee = @two_results}> : () -> (i32, f32)
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i32, sym_name = "one_result"}> ({
    %2 = "emitc.constant"() <{value = 0 : i32}> : () -> i32
    "func.return"(%2) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (i32, f32), sym_name = "two_results"}> ({
    %0 = "emitc.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "emitc.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "func.return"(%0, %1) : (i32, f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "single_return_statement"}> ({
  ^bb0(%arg0: i32):
    "func.return"(%arg0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

