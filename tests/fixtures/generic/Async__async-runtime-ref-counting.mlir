"builtin.module"() ({
  "func.func"() <{function_type = () -> !async.token, sym_name = "token", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> i1, sym_name = "cond", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (!async.token) -> (), sym_name = "take_token", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (!async.token) -> (), sym_name = "token_arg_no_uses"}> ({
  ^bb0(%arg10: !async.token):
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "token_value_no_uses"}> ({
    %29 = "async.runtime.create"() : () -> !async.token
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "token_returned_no_uses"}> ({
    %28 = "func.call"() <{callee = @token}> : () -> !async.token
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!async.token) -> (), sym_name = "token_arg_to_func"}> ({
  ^bb0(%arg9: !async.token):
    "func.call"(%arg9) <{callee = @take_token}> : (!async.token) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "token_value_to_func"}> ({
    %27 = "async.runtime.create"() : () -> !async.token
    "func.call"(%27) <{callee = @take_token}> : (!async.token) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!async.token, i1) -> (), sym_name = "token_arg_cond_br_await_with_fallthough"}> ({
  ^bb0(%arg7: !async.token, %arg8: i1):
    "cf.cond_br"(%arg8)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    "cf.br"()[^bb2] : () -> ()
  ^bb2:  // 2 preds: ^bb0, ^bb1
    "async.runtime.await"(%arg7) : (!async.token) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> !async.token, sym_name = "token_simple_return"}> ({
    %26 = "async.runtime.create"() : () -> !async.token
    "func.return"(%26) : (!async.token) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> !async.token, sym_name = "token_coro_return"}> ({
    %22 = "async.runtime.create"() : () -> !async.token
    %23 = "async.coro.id"() : () -> !async.coro.id
    %24 = "async.coro.begin"(%23) : (!async.coro.id) -> !async.coro.handle
    %25 = "async.coro.save"(%24) : (!async.coro.handle) -> !async.coro.state
    "async.runtime.resume"(%24) : (!async.coro.handle) -> ()
    "async.coro.suspend"(%25)[^bb3, ^bb1, ^bb2] : (!async.coro.state) -> ()
  ^bb1:  // pred: ^bb0
    "cf.br"()[^bb2] : () -> ()
  ^bb2:  // 2 preds: ^bb0, ^bb1
    "async.coro.free"(%23, %24) : (!async.coro.id, !async.coro.handle) -> ()
    "cf.br"()[^bb3] : () -> ()
  ^bb3:  // 2 preds: ^bb0, ^bb2
    "async.coro.end"(%24) : (!async.coro.handle) -> ()
    "func.return"(%22) : (!async.token) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!async.token) -> !async.token, sym_name = "token_coro_await_and_resume"}> ({
  ^bb0(%arg6: !async.token):
    %18 = "async.runtime.create"() : () -> !async.token
    %19 = "async.coro.id"() : () -> !async.coro.id
    %20 = "async.coro.begin"(%19) : (!async.coro.id) -> !async.coro.handle
    %21 = "async.coro.save"(%20) : (!async.coro.handle) -> !async.coro.state
    "async.runtime.await_and_resume"(%arg6, %20) : (!async.token, !async.coro.handle) -> ()
    "async.coro.suspend"(%21)[^bb3, ^bb1, ^bb2] : (!async.coro.state) -> ()
  ^bb1:  // pred: ^bb0
    "cf.br"()[^bb2] : () -> ()
  ^bb2:  // 2 preds: ^bb0, ^bb1
    "async.coro.free"(%19, %20) : (!async.coro.id, !async.coro.handle) -> ()
    "cf.br"()[^bb3] : () -> ()
  ^bb3:  // 2 preds: ^bb0, ^bb2
    "async.coro.end"(%20) : (!async.coro.handle) -> ()
    "func.return"(%18) : (!async.token) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!async.value<f32>) -> !async.token, sym_name = "value_coro_await_and_resume"}> ({
  ^bb0(%arg5: !async.value<f32>):
    %12 = "async.runtime.create"() : () -> !async.token
    %13 = "async.coro.id"() : () -> !async.coro.id
    %14 = "async.coro.begin"(%13) : (!async.coro.id) -> !async.coro.handle
    %15 = "async.coro.save"(%14) : (!async.coro.handle) -> !async.coro.state
    "async.runtime.await_and_resume"(%arg5, %14) : (!async.value<f32>, !async.coro.handle) -> ()
    "async.coro.suspend"(%15)[^bb3, ^bb1, ^bb2] : (!async.coro.state) -> ()
  ^bb1:  // pred: ^bb0
    %16 = "async.runtime.load"(%arg5) : (!async.value<f32>) -> f32
    %17 = "arith.addf"(%16, %16) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "cf.br"()[^bb2] : () -> ()
  ^bb2:  // 2 preds: ^bb0, ^bb1
    "async.coro.free"(%13, %14) : (!async.coro.id, !async.coro.handle) -> ()
    "cf.br"()[^bb3] : () -> ()
  ^bb3:  // 2 preds: ^bb0, ^bb2
    "async.coro.end"(%14) : (!async.coro.handle) -> ()
    "func.return"(%12) : (!async.token) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!async.token) -> !async.token, sym_name = "outlined_async_execute", sym_visibility = "private"}> ({
  ^bb0(%arg4: !async.token):
    %7 = "async.runtime.create"() : () -> !async.token
    %8 = "async.coro.id"() : () -> !async.coro.id
    %9 = "async.coro.begin"(%8) : (!async.coro.id) -> !async.coro.handle
    %10 = "async.coro.save"(%9) : (!async.coro.handle) -> !async.coro.state
    "async.runtime.resume"(%9) : (!async.coro.handle) -> ()
    "async.coro.suspend"(%10)[^bb4, ^bb1, ^bb3] : (!async.coro.state) -> ()
  ^bb1:  // pred: ^bb0
    %11 = "async.coro.save"(%9) : (!async.coro.handle) -> !async.coro.state
    "async.runtime.await_and_resume"(%arg4, %9) : (!async.token, !async.coro.handle) -> ()
    "async.coro.suspend"(%11)[^bb4, ^bb2, ^bb3] : (!async.coro.state) -> ()
  ^bb2:  // pred: ^bb1
    "async.runtime.set_available"(%7) : (!async.token) -> ()
    "cf.br"()[^bb3] : () -> ()
  ^bb3:  // 3 preds: ^bb0, ^bb1, ^bb2
    "async.coro.free"(%8, %9) : (!async.coro.id, !async.coro.handle) -> ()
    "cf.br"()[^bb4] : () -> ()
  ^bb4:  // 3 preds: ^bb0, ^bb1, ^bb3
    "async.coro.end"(%9) : (!async.coro.handle) -> ()
    "func.return"(%7) : (!async.token) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> (), sym_name = "token_await_inside_nested_region"}> ({
  ^bb0(%arg3: i1):
    %6 = "func.call"() <{callee = @token}> : () -> !async.token
    "scf.if"(%arg3) ({
      "async.runtime.await"(%6) : (!async.token) -> ()
      "scf.yield"() : () -> ()
    }, {
    }) : (i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "token_defined_in_the_loop"}> ({
    "cf.br"()[^bb1] : () -> ()
  ^bb1:  // 2 preds: ^bb0, ^bb1
    %4 = "func.call"() <{callee = @token}> : () -> !async.token
    "async.runtime.await"(%4) : (!async.token) -> ()
    %5 = "func.call"() <{callee = @cond}> : () -> i1
    "cf.cond_br"(%5)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb2:  // pred: ^bb1
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> (), sym_name = "divergent_liveness_one_token"}> ({
  ^bb0(%arg2: i1):
    %3 = "func.call"() <{callee = @token}> : () -> !async.token
    "cf.cond_br"(%arg2)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    "async.runtime.await"(%3) : (!async.token) -> ()
    "cf.br"()[^bb2] : () -> ()
  ^bb2:  // 2 preds: ^bb0, ^bb1
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> (), sym_name = "divergent_liveness_unique_predecessor"}> ({
  ^bb0(%arg1: i1):
    %2 = "func.call"() <{callee = @token}> : () -> !async.token
    "cf.cond_br"(%arg1)[^bb2, ^bb1] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    "cf.br"()[^bb3] : () -> ()
  ^bb2:  // pred: ^bb0
    "async.runtime.await"(%2) : (!async.token) -> ()
    "cf.br"()[^bb3] : () -> ()
  ^bb3:  // 2 preds: ^bb1, ^bb2
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> (), sym_name = "divergent_liveness_two_tokens"}> ({
  ^bb0(%arg0: i1):
    %0 = "func.call"() <{callee = @token}> : () -> !async.token
    %1 = "func.call"() <{callee = @token}> : () -> !async.token
    "cf.cond_br"(%arg0)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    "async.runtime.await"(%0) : (!async.token) -> ()
    "cf.br"()[^bb3] : () -> ()
  ^bb2:  // pred: ^bb0
    "async.runtime.await"(%1) : (!async.token) -> ()
    "cf.br"()[^bb3] : () -> ()
  ^bb3:  // 2 preds: ^bb1, ^bb2
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

