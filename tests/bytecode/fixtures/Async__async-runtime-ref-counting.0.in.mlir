"builtin.module"() ({
  "func.func"() <{function_type = () -> !async.token, sym_name = "token", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> i1, sym_name = "cond", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":4:3)
  "func.func"() <{function_type = (!async.token) -> (), sym_name = "take_token", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = (!async.token) -> (), sym_name = "token_arg_no_uses"}> ({
  ^bb0(%arg10: !async.token loc("<stdin>":9:8)):
    "func.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = () -> (), sym_name = "token_value_no_uses"}> ({
    %29 = "async.runtime.create"() : () -> !async.token loc("<stdin>":13:11)
    "func.return"() : () -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = () -> (), sym_name = "token_returned_no_uses"}> ({
    %28 = "func.call"() <{callee = @token}> : () -> !async.token loc("<stdin>":17:11)
    "func.return"() : () -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":16:3)
  "func.func"() <{function_type = (!async.token) -> (), sym_name = "token_arg_to_func"}> ({
  ^bb0(%arg9: !async.token loc("<stdin>":21:8)):
    "func.call"(%arg9) <{callee = @take_token}> : (!async.token) -> () loc("<stdin>":22:5)
    "func.return"() : () -> () loc("<stdin>":23:5)
  }) : () -> () loc("<stdin>":20:3)
  "func.func"() <{function_type = () -> (), sym_name = "token_value_to_func"}> ({
    %27 = "async.runtime.create"() : () -> !async.token loc("<stdin>":26:11)
    "func.call"(%27) <{callee = @take_token}> : (!async.token) -> () loc("<stdin>":27:5)
    "func.return"() : () -> () loc("<stdin>":28:5)
  }) : () -> () loc("<stdin>":25:3)
  "func.func"() <{function_type = (!async.token, i1) -> (), sym_name = "token_arg_cond_br_await_with_fallthough"}> ({
  ^bb0(%arg7: !async.token loc("<stdin>":31:8), %arg8: i1 loc("<stdin>":31:29)):
    "cf.cond_br"(%arg8)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":32:5)
  ^bb1:  // pred: ^bb0
    "cf.br"()[^bb2] : () -> () loc("<stdin>":34:5)
  ^bb2:  // 2 preds: ^bb0, ^bb1
    "async.runtime.await"(%arg7) : (!async.token) -> () loc("<stdin>":36:5)
    "func.return"() : () -> () loc("<stdin>":37:5)
  }) : () -> () loc("<stdin>":30:3)
  "func.func"() <{function_type = () -> !async.token, sym_name = "token_simple_return"}> ({
    %26 = "async.runtime.create"() : () -> !async.token loc("<stdin>":40:11)
    "func.return"(%26) : (!async.token) -> () loc("<stdin>":41:5)
  }) : () -> () loc("<stdin>":39:3)
  "func.func"() <{function_type = () -> !async.token, sym_name = "token_coro_return"}> ({
    %22 = "async.runtime.create"() : () -> !async.token loc("<stdin>":44:11)
    %23 = "async.coro.id"() : () -> !async.coro.id loc("<stdin>":45:11)
    %24 = "async.coro.begin"(%23) : (!async.coro.id) -> !async.coro.handle loc("<stdin>":46:11)
    %25 = "async.coro.save"(%24) : (!async.coro.handle) -> !async.coro.state loc("<stdin>":47:11)
    "async.runtime.resume"(%24) : (!async.coro.handle) -> () loc("<stdin>":48:5)
    "async.coro.suspend"(%25)[^bb3, ^bb1, ^bb2] : (!async.coro.state) -> () loc("<stdin>":49:5)
  ^bb1:  // pred: ^bb0
    "cf.br"()[^bb2] : () -> () loc("<stdin>":51:5)
  ^bb2:  // 2 preds: ^bb0, ^bb1
    "async.coro.free"(%23, %24) : (!async.coro.id, !async.coro.handle) -> () loc("<stdin>":53:5)
    "cf.br"()[^bb3] : () -> () loc("<stdin>":54:5)
  ^bb3:  // 2 preds: ^bb0, ^bb2
    "async.coro.end"(%24) : (!async.coro.handle) -> () loc("<stdin>":56:5)
    "func.return"(%22) : (!async.token) -> () loc("<stdin>":57:5)
  }) : () -> () loc("<stdin>":43:3)
  "func.func"() <{function_type = (!async.token) -> !async.token, sym_name = "token_coro_await_and_resume"}> ({
  ^bb0(%arg6: !async.token loc("<stdin>":60:8)):
    %18 = "async.runtime.create"() : () -> !async.token loc("<stdin>":61:11)
    %19 = "async.coro.id"() : () -> !async.coro.id loc("<stdin>":62:11)
    %20 = "async.coro.begin"(%19) : (!async.coro.id) -> !async.coro.handle loc("<stdin>":63:11)
    %21 = "async.coro.save"(%20) : (!async.coro.handle) -> !async.coro.state loc("<stdin>":64:11)
    "async.runtime.await_and_resume"(%arg6, %20) : (!async.token, !async.coro.handle) -> () loc("<stdin>":65:5)
    "async.coro.suspend"(%21)[^bb3, ^bb1, ^bb2] : (!async.coro.state) -> () loc("<stdin>":66:5)
  ^bb1:  // pred: ^bb0
    "cf.br"()[^bb2] : () -> () loc("<stdin>":68:5)
  ^bb2:  // 2 preds: ^bb0, ^bb1
    "async.coro.free"(%19, %20) : (!async.coro.id, !async.coro.handle) -> () loc("<stdin>":70:5)
    "cf.br"()[^bb3] : () -> () loc("<stdin>":71:5)
  ^bb3:  // 2 preds: ^bb0, ^bb2
    "async.coro.end"(%20) : (!async.coro.handle) -> () loc("<stdin>":73:5)
    "func.return"(%18) : (!async.token) -> () loc("<stdin>":74:5)
  }) : () -> () loc("<stdin>":59:3)
  "func.func"() <{function_type = (!async.value<f32>) -> !async.token, sym_name = "value_coro_await_and_resume"}> ({
  ^bb0(%arg5: !async.value<f32> loc("<stdin>":77:8)):
    %12 = "async.runtime.create"() : () -> !async.token loc("<stdin>":78:11)
    %13 = "async.coro.id"() : () -> !async.coro.id loc("<stdin>":79:11)
    %14 = "async.coro.begin"(%13) : (!async.coro.id) -> !async.coro.handle loc("<stdin>":80:11)
    %15 = "async.coro.save"(%14) : (!async.coro.handle) -> !async.coro.state loc("<stdin>":81:11)
    "async.runtime.await_and_resume"(%arg5, %14) : (!async.value<f32>, !async.coro.handle) -> () loc("<stdin>":82:5)
    "async.coro.suspend"(%15)[^bb3, ^bb1, ^bb2] : (!async.coro.state) -> () loc("<stdin>":83:5)
  ^bb1:  // pred: ^bb0
    %16 = "async.runtime.load"(%arg5) : (!async.value<f32>) -> f32 loc("<stdin>":85:11)
    %17 = "arith.addf"(%16, %16) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":86:11)
    "cf.br"()[^bb2] : () -> () loc("<stdin>":87:5)
  ^bb2:  // 2 preds: ^bb0, ^bb1
    "async.coro.free"(%13, %14) : (!async.coro.id, !async.coro.handle) -> () loc("<stdin>":89:5)
    "cf.br"()[^bb3] : () -> () loc("<stdin>":90:5)
  ^bb3:  // 2 preds: ^bb0, ^bb2
    "async.coro.end"(%14) : (!async.coro.handle) -> () loc("<stdin>":92:5)
    "func.return"(%12) : (!async.token) -> () loc("<stdin>":93:5)
  }) : () -> () loc("<stdin>":76:3)
  "func.func"() <{function_type = (!async.token) -> !async.token, sym_name = "outlined_async_execute", sym_visibility = "private"}> ({
  ^bb0(%arg4: !async.token loc("<stdin>":96:8)):
    %7 = "async.runtime.create"() : () -> !async.token loc("<stdin>":97:10)
    %8 = "async.coro.id"() : () -> !async.coro.id loc("<stdin>":98:10)
    %9 = "async.coro.begin"(%8) : (!async.coro.id) -> !async.coro.handle loc("<stdin>":99:10)
    %10 = "async.coro.save"(%9) : (!async.coro.handle) -> !async.coro.state loc("<stdin>":100:11)
    "async.runtime.resume"(%9) : (!async.coro.handle) -> () loc("<stdin>":101:5)
    "async.coro.suspend"(%10)[^bb4, ^bb1, ^bb3] : (!async.coro.state) -> () loc("<stdin>":102:5)
  ^bb1:  // pred: ^bb0
    %11 = "async.coro.save"(%9) : (!async.coro.handle) -> !async.coro.state loc("<stdin>":104:11)
    "async.runtime.await_and_resume"(%arg4, %9) : (!async.token, !async.coro.handle) -> () loc("<stdin>":105:5)
    "async.coro.suspend"(%11)[^bb4, ^bb2, ^bb3] : (!async.coro.state) -> () loc("<stdin>":106:5)
  ^bb2:  // pred: ^bb1
    "async.runtime.set_available"(%7) : (!async.token) -> () loc("<stdin>":108:5)
    "cf.br"()[^bb3] : () -> () loc("<stdin>":109:5)
  ^bb3:  // 3 preds: ^bb0, ^bb1, ^bb2
    "async.coro.free"(%8, %9) : (!async.coro.id, !async.coro.handle) -> () loc("<stdin>":111:5)
    "cf.br"()[^bb4] : () -> () loc("<stdin>":112:5)
  ^bb4:  // 3 preds: ^bb0, ^bb1, ^bb3
    "async.coro.end"(%9) : (!async.coro.handle) -> () loc("<stdin>":114:5)
    "func.return"(%7) : (!async.token) -> () loc("<stdin>":115:5)
  }) : () -> () loc("<stdin>":95:3)
  "func.func"() <{function_type = (i1) -> (), sym_name = "token_await_inside_nested_region"}> ({
  ^bb0(%arg3: i1 loc("<stdin>":118:8)):
    %6 = "func.call"() <{callee = @token}> : () -> !async.token loc("<stdin>":119:10)
    "scf.if"(%arg3) ({
      "async.runtime.await"(%6) : (!async.token) -> () loc("<stdin>":121:7)
      "scf.yield"() : () -> () loc("<stdin>":122:7)
    }, {
    }) : (i1) -> () loc("<stdin>":120:5)
    "func.return"() : () -> () loc("<stdin>":125:5)
  }) : () -> () loc("<stdin>":117:3)
  "func.func"() <{function_type = () -> (), sym_name = "token_defined_in_the_loop"}> ({
    "cf.br"()[^bb1] : () -> () loc("<stdin>":128:5)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    %4 = "func.call"() <{callee = @token}> : () -> !async.token loc("<stdin>":130:10)
    "async.runtime.await"(%4) : (!async.token) -> () loc("<stdin>":131:5)
    %5 = "func.call"() <{callee = @cond}> : () -> i1 loc("<stdin>":132:10)
    "cf.cond_br"(%5)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":133:5)
  ^bb2:  // pred: ^bb1
    "func.return"() : () -> () loc("<stdin>":135:5)
  }) : () -> () loc("<stdin>":127:3)
  "func.func"() <{function_type = (i1) -> (), sym_name = "divergent_liveness_one_token"}> ({
  ^bb0(%arg2: i1 loc("<stdin>":138:8)):
    %3 = "func.call"() <{callee = @token}> : () -> !async.token loc("<stdin>":139:10)
    "cf.cond_br"(%arg2)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":140:5)
  ^bb1:  // pred: ^bb0
    "async.runtime.await"(%3) : (!async.token) -> () loc("<stdin>":142:5)
    "cf.br"()[^bb2] : () -> () loc("<stdin>":143:5)
  ^bb2:  // 2 preds: ^bb0, ^bb1
    "func.return"() : () -> () loc("<stdin>":145:5)
  }) : () -> () loc("<stdin>":137:3)
  "func.func"() <{function_type = (i1) -> (), sym_name = "divergent_liveness_unique_predecessor"}> ({
  ^bb0(%arg1: i1 loc("<stdin>":148:8)):
    %2 = "func.call"() <{callee = @token}> : () -> !async.token loc("<stdin>":149:10)
    "cf.cond_br"(%arg1)[^bb2, ^bb1] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":150:5)
  ^bb1:  // pred: ^bb0
    "cf.br"()[^bb3] : () -> () loc("<stdin>":152:5)
  ^bb2:  // pred: ^bb0
    "async.runtime.await"(%2) : (!async.token) -> () loc("<stdin>":154:5)
    "cf.br"()[^bb3] : () -> () loc("<stdin>":155:5)
  ^bb3:  // 2 preds: ^bb1, ^bb2
    "func.return"() : () -> () loc("<stdin>":157:5)
  }) : () -> () loc("<stdin>":147:3)
  "func.func"() <{function_type = (i1) -> (), sym_name = "divergent_liveness_two_tokens"}> ({
  ^bb0(%arg0: i1 loc("<stdin>":160:8)):
    %0 = "func.call"() <{callee = @token}> : () -> !async.token loc("<stdin>":161:10)
    %1 = "func.call"() <{callee = @token}> : () -> !async.token loc("<stdin>":162:10)
    "cf.cond_br"(%arg0)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":163:5)
  ^bb1:  // pred: ^bb0
    "async.runtime.await"(%0) : (!async.token) -> () loc("<stdin>":165:5)
    "cf.br"()[^bb3] : () -> () loc("<stdin>":166:5)
  ^bb2:  // pred: ^bb0
    "async.runtime.await"(%1) : (!async.token) -> () loc("<stdin>":168:5)
    "cf.br"()[^bb3] : () -> () loc("<stdin>":169:5)
  ^bb3:  // 2 preds: ^bb1, ^bb2
    "func.return"() : () -> () loc("<stdin>":171:5)
  }) : () -> () loc("<stdin>":159:3)
}) : () -> () loc("<stdin>":1:1)
