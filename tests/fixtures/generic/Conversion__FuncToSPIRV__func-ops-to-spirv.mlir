"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "return_none_val"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> f32, sym_name = "return_one_val"}> ({
  ^bb0(%arg3: f32):
    "func.return"(%arg3) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> (f32, f32), sym_name = "return_multi_val"}> ({
  ^bb0(%arg2: f32):
    "func.return"(%arg2, %arg2) : (f32, f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> index, sym_name = "return_one_index"}> ({
  ^bb0(%arg1: index):
    "func.return"(%arg1) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> index, sym_name = "call_functions"}> ({
  ^bb0(%arg0: index):
    "func.call"() <{callee = @return_none_val}> : () -> ()
    %0 = "func.call"(%arg0) <{callee = @return_one_index}> : (index) -> index
    "func.return"(%0) : (index) -> ()
  }) : () -> ()
}) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [], []>, #spirv.resource_limits<>>} : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

