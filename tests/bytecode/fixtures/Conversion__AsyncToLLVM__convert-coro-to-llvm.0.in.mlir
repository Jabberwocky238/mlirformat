"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "coro_id"}> ({
    %12 = "async.coro.id"() : () -> !async.coro.id loc("<stdin>":3:11)
    "func.return"() : () -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "coro_begin"}> ({
    %10 = "async.coro.id"() : () -> !async.coro.id loc("<stdin>":7:11)
    %11 = "async.coro.begin"(%10) : (!async.coro.id) -> !async.coro.handle loc("<stdin>":8:11)
    "func.return"() : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = () -> (), sym_name = "coro_free"}> ({
    %8 = "async.coro.id"() : () -> !async.coro.id loc("<stdin>":12:10)
    %9 = "async.coro.begin"(%8) : (!async.coro.id) -> !async.coro.handle loc("<stdin>":13:10)
    "async.coro.free"(%8, %9) : (!async.coro.id, !async.coro.handle) -> () loc("<stdin>":14:5)
    "func.return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":11:3)
  "func.func"() <{function_type = () -> (), sym_name = "coro_end"}> ({
    %6 = "async.coro.id"() : () -> !async.coro.id loc("<stdin>":18:10)
    %7 = "async.coro.begin"(%6) : (!async.coro.id) -> !async.coro.handle loc("<stdin>":19:10)
    "async.coro.end"(%7) : (!async.coro.handle) -> () loc("<stdin>":20:5)
    "func.return"() : () -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = () -> (), sym_name = "coro_save"}> ({
    %3 = "async.coro.id"() : () -> !async.coro.id loc("<stdin>":24:10)
    %4 = "async.coro.begin"(%3) : (!async.coro.id) -> !async.coro.handle loc("<stdin>":25:10)
    %5 = "async.coro.save"(%4) : (!async.coro.handle) -> !async.coro.state loc("<stdin>":26:10)
    "func.return"() : () -> () loc("<stdin>":27:5)
  }) : () -> () loc("<stdin>":23:3)
  "func.func"() <{function_type = () -> (), sym_name = "coro_suspend"}> ({
    %0 = "async.coro.id"() : () -> !async.coro.id loc("<stdin>":30:10)
    %1 = "async.coro.begin"(%0) : (!async.coro.id) -> !async.coro.handle loc("<stdin>":31:10)
    %2 = "async.coro.save"(%1) : (!async.coro.handle) -> !async.coro.state loc("<stdin>":32:10)
    "async.coro.suspend"(%2)[^bb3, ^bb1, ^bb2] : (!async.coro.state) -> () loc("<stdin>":33:5)
  ^bb1:  // pred: ^bb0
    "func.return"() {coro.resume} : () -> () loc("<stdin>":35:5)
  ^bb2:  // pred: ^bb0
    "func.return"() {coro.cleanup} : () -> () loc("<stdin>":37:5)
  ^bb3:  // pred: ^bb0
    "func.return"() {coro.suspend} : () -> () loc("<stdin>":39:5)
  }) : () -> () loc("<stdin>":29:3)
}) : () -> () loc("<stdin>":1:1)
