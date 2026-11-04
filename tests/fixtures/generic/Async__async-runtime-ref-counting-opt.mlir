"builtin.module"() ({
  "func.func"() <{function_type = (!async.token) -> (), sym_name = "consume_token", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (!async.token) -> (), sym_name = "cancellable_operations_0"}> ({
  ^bb0(%arg4: !async.token):
    "async.runtime.add_ref"(%arg4) <{count = 1 : i64}> : (!async.token) -> ()
    "async.runtime.drop_ref"(%arg4) <{count = 1 : i64}> : (!async.token) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!async.token) -> (), sym_name = "cancellable_operations_1"}> ({
  ^bb0(%arg3: !async.token):
    "async.runtime.add_ref"(%arg3) <{count = 1 : i64}> : (!async.token) -> ()
    "func.call"(%arg3) <{callee = @consume_token}> : (!async.token) -> ()
    "async.runtime.drop_ref"(%arg3) <{count = 1 : i64}> : (!async.token) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!async.token) -> (), sym_name = "cancellable_operations_2"}> ({
  ^bb0(%arg2: !async.token):
    "async.runtime.add_ref"(%arg2) <{count = 1 : i64}> : (!async.token) -> ()
    "async.runtime.await"(%arg2) : (!async.token) -> ()
    "async.runtime.drop_ref"(%arg2) <{count = 1 : i64}> : (!async.token) -> ()
    "async.runtime.await"(%arg2) : (!async.token) -> ()
    "async.runtime.add_ref"(%arg2) <{count = 1 : i64}> : (!async.token) -> ()
    "async.runtime.await"(%arg2) : (!async.token) -> ()
    "async.runtime.drop_ref"(%arg2) <{count = 1 : i64}> : (!async.token) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!async.token) -> (), sym_name = "cancellable_operations_3"}> ({
  ^bb0(%arg1: !async.token):
    "async.runtime.add_ref"(%arg1) <{count = 1 : i64}> : (!async.token) -> ()
    "func.call"(%arg1) <{callee = @consume_token}> : (!async.token) -> ()
    "async.runtime.drop_ref"(%arg1) <{count = 1 : i64}> : (!async.token) -> ()
    "async.runtime.await"(%arg1) : (!async.token) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!async.token) -> (), sym_name = "not_cancellable_operations_0"}> ({
  ^bb0(%arg0: !async.token):
    "async.runtime.add_ref"(%arg0) <{count = 1 : i64}> : (!async.token) -> ()
    "func.call"(%arg0) <{callee = @consume_token}> : (!async.token) -> ()
    "async.runtime.await"(%arg0) : (!async.token) -> ()
    "async.runtime.drop_ref"(%arg0) <{count = 1 : i64}> : (!async.token) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

