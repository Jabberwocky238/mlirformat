"builtin.module"() ({
  "func.func"() <{function_type = (!async.token) -> (), sym_name = "token_await"}> ({
  ^bb0(%arg5: !async.token loc("<stdin>":3:8)):
    "async.runtime.await"(%arg5) : (!async.token) -> () loc("<stdin>":4:5)
    "func.return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (!async.group) -> (), sym_name = "group_await"}> ({
  ^bb0(%arg4: !async.group loc("<stdin>":8:8)):
    "async.runtime.await"(%arg4) : (!async.group) -> () loc("<stdin>":9:5)
    "func.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (!async.group, !async.token) -> (), sym_name = "add_token_to_group"}> ({
  ^bb0(%arg2: !async.group loc("<stdin>":13:8), %arg3: !async.token loc("<stdin>":13:29)):
    %2 = "async.runtime.add_to_group"(%arg3, %arg2) : (!async.token, !async.group) -> index loc("<stdin>":14:10)
    "func.return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (!async.value<f32>) -> (), sym_name = "value_load"}> ({
  ^bb0(%arg1: !async.value<f32> loc("<stdin>":18:8)):
    %1 = "async.runtime.load"(%arg1) : (!async.value<f32>) -> f32 loc("<stdin>":19:10)
    "func.return"() : () -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (!async.token) -> (), sym_name = "error_check"}> ({
  ^bb0(%arg0: !async.token loc("<stdin>":23:8)):
    %0 = "async.runtime.is_error"(%arg0) : (!async.token) -> i1 loc("<stdin>":24:10)
    "func.return"() : () -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":22:3)
}) : () -> () loc("<stdin>":1:1)
