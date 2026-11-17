"builtin.module"() ({
  "func.func"() <{function_type = (!async.token) -> (), sym_name = "consume_token", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (!async.token) -> (), sym_name = "cancellable_operations_0"}> ({
  ^bb0(%arg4: !async.token loc("<stdin>":5:8)):
    "async.runtime.add_ref"(%arg4) <{count = 1 : i64}> : (!async.token) -> () loc("<stdin>":6:5)
    "async.runtime.drop_ref"(%arg4) <{count = 1 : i64}> : (!async.token) -> () loc("<stdin>":7:5)
    "func.return"() : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":4:3)
  "func.func"() <{function_type = (!async.token) -> (), sym_name = "cancellable_operations_1"}> ({
  ^bb0(%arg3: !async.token loc("<stdin>":11:8)):
    "async.runtime.add_ref"(%arg3) <{count = 1 : i64}> : (!async.token) -> () loc("<stdin>":12:5)
    "func.call"(%arg3) <{callee = @consume_token}> : (!async.token) -> () loc("<stdin>":13:5)
    "async.runtime.drop_ref"(%arg3) <{count = 1 : i64}> : (!async.token) -> () loc("<stdin>":14:5)
    "func.return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":10:3)
  "func.func"() <{function_type = (!async.token) -> (), sym_name = "cancellable_operations_2"}> ({
  ^bb0(%arg2: !async.token loc("<stdin>":18:8)):
    "async.runtime.add_ref"(%arg2) <{count = 1 : i64}> : (!async.token) -> () loc("<stdin>":19:5)
    "async.runtime.await"(%arg2) : (!async.token) -> () loc("<stdin>":20:5)
    "async.runtime.drop_ref"(%arg2) <{count = 1 : i64}> : (!async.token) -> () loc("<stdin>":21:5)
    "async.runtime.await"(%arg2) : (!async.token) -> () loc("<stdin>":22:5)
    "async.runtime.add_ref"(%arg2) <{count = 1 : i64}> : (!async.token) -> () loc("<stdin>":23:5)
    "async.runtime.await"(%arg2) : (!async.token) -> () loc("<stdin>":24:5)
    "async.runtime.drop_ref"(%arg2) <{count = 1 : i64}> : (!async.token) -> () loc("<stdin>":25:5)
    "func.return"() : () -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (!async.token) -> (), sym_name = "cancellable_operations_3"}> ({
  ^bb0(%arg1: !async.token loc("<stdin>":29:8)):
    "async.runtime.add_ref"(%arg1) <{count = 1 : i64}> : (!async.token) -> () loc("<stdin>":30:5)
    "func.call"(%arg1) <{callee = @consume_token}> : (!async.token) -> () loc("<stdin>":31:5)
    "async.runtime.drop_ref"(%arg1) <{count = 1 : i64}> : (!async.token) -> () loc("<stdin>":32:5)
    "async.runtime.await"(%arg1) : (!async.token) -> () loc("<stdin>":33:5)
    "func.return"() : () -> () loc("<stdin>":34:5)
  }) : () -> () loc("<stdin>":28:3)
  "func.func"() <{function_type = (!async.token) -> (), sym_name = "not_cancellable_operations_0"}> ({
  ^bb0(%arg0: !async.token loc("<stdin>":37:8)):
    "async.runtime.add_ref"(%arg0) <{count = 1 : i64}> : (!async.token) -> () loc("<stdin>":38:5)
    "func.call"(%arg0) <{callee = @consume_token}> : (!async.token) -> () loc("<stdin>":39:5)
    "async.runtime.await"(%arg0) : (!async.token) -> () loc("<stdin>":40:5)
    "async.runtime.drop_ref"(%arg0) <{count = 1 : i64}> : (!async.token) -> () loc("<stdin>":41:5)
    "func.return"() : () -> () loc("<stdin>":42:5)
  }) : () -> () loc("<stdin>":36:3)
}) : () -> () loc("<stdin>":1:1)
