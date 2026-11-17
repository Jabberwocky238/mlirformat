"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "std_call"}> ({
    %5 = "func.call"() <{callee = @one_result}> : () -> i32 loc("<stdin>":3:10)
    %6 = "func.call"() <{callee = @one_result}> : () -> i32 loc("<stdin>":4:10)
    "func.return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "std_call_two_results"}> ({
    %3:2 = "func.call"() <{callee = @two_results}> : () -> (i32, f32) loc("<stdin>":8:12)
    %4:2 = "func.call"() <{callee = @two_results}> : () -> (i32, f32) loc("<stdin>":9:12)
    "func.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = () -> i32, sym_name = "one_result"}> ({
    %2 = "emitc.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":13:10)
    "func.return"(%2) : (i32) -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = () -> (i32, f32), sym_name = "two_results"}> ({
    %0 = "emitc.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":17:10)
    %1 = "emitc.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":18:10)
    "func.return"(%0, %1) : (i32, f32) -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":16:3)
  "func.func"() <{function_type = (i32) -> i32, sym_name = "single_return_statement"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":22:8)):
    "func.return"(%arg0) : (i32) -> () loc("<stdin>":23:5)
  }) : () -> () loc("<stdin>":21:3)
}) : () -> () loc("<stdin>":1:1)
