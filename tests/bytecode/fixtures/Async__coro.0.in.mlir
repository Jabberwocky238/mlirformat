"builtin.module"() ({
  "func.func"() <{function_type = () -> !async.coro.id, sym_name = "coro_id"}> ({
    %2 = "async.coro.id"() : () -> !async.coro.id loc("<stdin>":3:10)
    "func.return"(%2) : (!async.coro.id) -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (!async.coro.id) -> !async.coro.handle, sym_name = "coro_handle"}> ({
  ^bb0(%arg5: !async.coro.id loc("<stdin>":7:8)):
    %1 = "async.coro.begin"(%arg5) : (!async.coro.id) -> !async.coro.handle loc("<stdin>":8:10)
    "func.return"(%1) : (!async.coro.handle) -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = (!async.coro.id, !async.coro.handle) -> (), sym_name = "coro_free"}> ({
  ^bb0(%arg3: !async.coro.id loc("<stdin>":12:8), %arg4: !async.coro.handle loc("<stdin>":12:31)):
    "async.coro.free"(%arg3, %arg4) : (!async.coro.id, !async.coro.handle) -> () loc("<stdin>":13:5)
    "func.return"() : () -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":11:3)
  "func.func"() <{function_type = (!async.coro.handle) -> (), sym_name = "coro_end"}> ({
  ^bb0(%arg2: !async.coro.handle loc("<stdin>":17:8)):
    "async.coro.end"(%arg2) : (!async.coro.handle) -> () loc("<stdin>":18:5)
    "func.return"() : () -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":16:3)
  "func.func"() <{function_type = (!async.coro.handle) -> !async.coro.state, sym_name = "coro_save"}> ({
  ^bb0(%arg1: !async.coro.handle loc("<stdin>":22:8)):
    %0 = "async.coro.save"(%arg1) : (!async.coro.handle) -> !async.coro.state loc("<stdin>":23:10)
    "func.return"(%0) : (!async.coro.state) -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":21:3)
  "func.func"() <{function_type = (!async.coro.state) -> (), sym_name = "coro_suspend"}> ({
  ^bb0(%arg0: !async.coro.state loc("<stdin>":27:8)):
    "async.coro.suspend"(%arg0)[^bb3, ^bb1, ^bb2] : (!async.coro.state) -> () loc("<stdin>":28:5)
  ^bb1:  // pred: ^bb0
    "func.return"() {coro.resume} : () -> () loc("<stdin>":30:5)
  ^bb2:  // pred: ^bb0
    "func.return"() {coro.cleanup} : () -> () loc("<stdin>":32:5)
  ^bb3:  // pred: ^bb0
    "func.return"() {coro.suspend} : () -> () loc("<stdin>":34:5)
  }) : () -> () loc("<stdin>":26:3)
}) : () -> () loc("<stdin>":1:1)
