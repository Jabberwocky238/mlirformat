"builtin.module"() ({
  "func.func"() <{function_type = (!async.token) -> (), sym_name = "token_await"}> ({
  ^bb0(%arg5: !async.token):
    "async.runtime.await"(%arg5) : (!async.token) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!async.group) -> (), sym_name = "group_await"}> ({
  ^bb0(%arg4: !async.group):
    "async.runtime.await"(%arg4) : (!async.group) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!async.group, !async.token) -> (), sym_name = "add_token_to_group"}> ({
  ^bb0(%arg2: !async.group, %arg3: !async.token):
    %2 = "async.runtime.add_to_group"(%arg3, %arg2) : (!async.token, !async.group) -> index
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!async.value<f32>) -> (), sym_name = "value_load"}> ({
  ^bb0(%arg1: !async.value<f32>):
    %1 = "async.runtime.load"(%arg1) : (!async.value<f32>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!async.token) -> (), sym_name = "error_check"}> ({
  ^bb0(%arg0: !async.token):
    %0 = "async.runtime.is_error"(%arg0) : (!async.token) -> i1
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

