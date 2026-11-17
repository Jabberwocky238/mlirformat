"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "return_none_val"}> ({
    "func.return"() : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (f32) -> f32, sym_name = "return_one_val"}> ({
  ^bb0(%arg3: f32 loc("<stdin>":6:8)):
    "func.return"(%arg3) : (f32) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = (f32) -> (f32, f32), sym_name = "return_multi_val"}> ({
  ^bb0(%arg2: f32 loc("<stdin>":10:8)):
    "func.return"(%arg2, %arg2) : (f32, f32) -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":9:3)
  "func.func"() <{function_type = (index) -> index, sym_name = "return_one_index"}> ({
  ^bb0(%arg1: index loc("<stdin>":14:8)):
    "func.return"(%arg1) : (index) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":13:3)
  "func.func"() <{function_type = (index) -> index, sym_name = "call_functions"}> ({
  ^bb0(%arg0: index loc("<stdin>":18:8)):
    "func.call"() <{callee = @return_none_val}> : () -> () loc("<stdin>":19:5)
    %0 = "func.call"(%arg0) <{callee = @return_one_index}> : (index) -> index loc("<stdin>":20:10)
    "func.return"(%0) : (index) -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":17:3)
}) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [], []>, #spirv.resource_limits<>>} : () -> () loc("<stdin>":1:1)
