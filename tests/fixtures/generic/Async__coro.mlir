"builtin.module"() ({
  "func.func"() <{function_type = () -> !async.coro.id, sym_name = "coro_id"}> ({
    %2 = "async.coro.id"() : () -> !async.coro.id
    "func.return"(%2) : (!async.coro.id) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!async.coro.id) -> !async.coro.handle, sym_name = "coro_handle"}> ({
  ^bb0(%arg5: !async.coro.id):
    %1 = "async.coro.begin"(%arg5) : (!async.coro.id) -> !async.coro.handle
    "func.return"(%1) : (!async.coro.handle) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!async.coro.id, !async.coro.handle) -> (), sym_name = "coro_free"}> ({
  ^bb0(%arg3: !async.coro.id, %arg4: !async.coro.handle):
    "async.coro.free"(%arg3, %arg4) : (!async.coro.id, !async.coro.handle) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!async.coro.handle) -> (), sym_name = "coro_end"}> ({
  ^bb0(%arg2: !async.coro.handle):
    "async.coro.end"(%arg2) : (!async.coro.handle) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!async.coro.handle) -> !async.coro.state, sym_name = "coro_save"}> ({
  ^bb0(%arg1: !async.coro.handle):
    %0 = "async.coro.save"(%arg1) : (!async.coro.handle) -> !async.coro.state
    "func.return"(%0) : (!async.coro.state) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!async.coro.state) -> (), sym_name = "coro_suspend"}> ({
  ^bb0(%arg0: !async.coro.state):
    "async.coro.suspend"(%arg0)[^bb3, ^bb1, ^bb2] : (!async.coro.state) -> ()
  ^bb1:  // pred: ^bb0
    "func.return"() {coro.resume} : () -> ()
  ^bb2:  // pred: ^bb0
    "func.return"() {coro.cleanup} : () -> ()
  ^bb3:  // pred: ^bb0
    "func.return"() {coro.suspend} : () -> ()
  }) : () -> ()
}) : () -> ()

