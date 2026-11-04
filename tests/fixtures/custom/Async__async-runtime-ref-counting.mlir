module {
  func.func private @token() -> !async.token
  func.func private @cond() -> i1
  func.func private @take_token(!async.token)
  func.func @token_arg_no_uses(%arg0: !async.token) {
    return
  }
  func.func @token_value_no_uses() {
    %0 = async.runtime.create : !async.token
    return
  }
  func.func @token_returned_no_uses() {
    %0 = call @token() : () -> !async.token
    return
  }
  func.func @token_arg_to_func(%arg0: !async.token) {
    call @take_token(%arg0) : (!async.token) -> ()
    return
  }
  func.func @token_value_to_func() {
    %0 = async.runtime.create : !async.token
    call @take_token(%0) : (!async.token) -> ()
    return
  }
  func.func @token_arg_cond_br_await_with_fallthough(%arg0: !async.token, %arg1: i1) {
    cf.cond_br %arg1, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    cf.br ^bb2
  ^bb2:  // 2 preds: ^bb0, ^bb1
    async.runtime.await %arg0 : !async.token
    return
  }
  func.func @token_simple_return() -> !async.token {
    %0 = async.runtime.create : !async.token
    return %0 : !async.token
  }
  func.func @token_coro_return() -> !async.token {
    %0 = async.runtime.create : !async.token
    %1 = async.coro.id
    %2 = async.coro.begin %1
    %3 = async.coro.save %2
    async.runtime.resume %2
    async.coro.suspend %3, ^bb3, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    cf.br ^bb2
  ^bb2:  // 2 preds: ^bb0, ^bb1
    async.coro.free %1, %2
    cf.br ^bb3
  ^bb3:  // 2 preds: ^bb0, ^bb2
    async.coro.end %2
    return %0 : !async.token
  }
  func.func @token_coro_await_and_resume(%arg0: !async.token) -> !async.token {
    %0 = async.runtime.create : !async.token
    %1 = async.coro.id
    %2 = async.coro.begin %1
    %3 = async.coro.save %2
    async.runtime.await_and_resume %arg0, %2 : !async.token
    async.coro.suspend %3, ^bb3, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    cf.br ^bb2
  ^bb2:  // 2 preds: ^bb0, ^bb1
    async.coro.free %1, %2
    cf.br ^bb3
  ^bb3:  // 2 preds: ^bb0, ^bb2
    async.coro.end %2
    return %0 : !async.token
  }
  func.func @value_coro_await_and_resume(%arg0: !async.value<f32>) -> !async.token {
    %0 = async.runtime.create : !async.token
    %1 = async.coro.id
    %2 = async.coro.begin %1
    %3 = async.coro.save %2
    async.runtime.await_and_resume %arg0, %2 : !async.value<f32>
    async.coro.suspend %3, ^bb3, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    %4 = async.runtime.load %arg0 : <f32>
    %5 = arith.addf %4, %4 : f32
    cf.br ^bb2
  ^bb2:  // 2 preds: ^bb0, ^bb1
    async.coro.free %1, %2
    cf.br ^bb3
  ^bb3:  // 2 preds: ^bb0, ^bb2
    async.coro.end %2
    return %0 : !async.token
  }
  func.func private @outlined_async_execute(%arg0: !async.token) -> !async.token {
    %0 = async.runtime.create : !async.token
    %1 = async.coro.id
    %2 = async.coro.begin %1
    %3 = async.coro.save %2
    async.runtime.resume %2
    async.coro.suspend %3, ^bb4, ^bb1, ^bb3
  ^bb1:  // pred: ^bb0
    %4 = async.coro.save %2
    async.runtime.await_and_resume %arg0, %2 : !async.token
    async.coro.suspend %4, ^bb4, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    async.runtime.set_available %0 : !async.token
    cf.br ^bb3
  ^bb3:  // 3 preds: ^bb0, ^bb1, ^bb2
    async.coro.free %1, %2
    cf.br ^bb4
  ^bb4:  // 3 preds: ^bb0, ^bb1, ^bb3
    async.coro.end %2
    return %0 : !async.token
  }
  func.func @token_await_inside_nested_region(%arg0: i1) {
    %0 = call @token() : () -> !async.token
    scf.if %arg0 {
      async.runtime.await %0 : !async.token
    }
    return
  }
  func.func @token_defined_in_the_loop() {
    cf.br ^bb1
  ^bb1:  // 2 preds: ^bb0, ^bb1
    %0 = call @token() : () -> !async.token
    async.runtime.await %0 : !async.token
    %1 = call @cond() : () -> i1
    cf.cond_br %1, ^bb1, ^bb2
  ^bb2:  // pred: ^bb1
    return
  }
  func.func @divergent_liveness_one_token(%arg0: i1) {
    %0 = call @token() : () -> !async.token
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    async.runtime.await %0 : !async.token
    cf.br ^bb2
  ^bb2:  // 2 preds: ^bb0, ^bb1
    return
  }
  func.func @divergent_liveness_unique_predecessor(%arg0: i1) {
    %0 = call @token() : () -> !async.token
    cf.cond_br %arg0, ^bb2, ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb3
  ^bb2:  // pred: ^bb0
    async.runtime.await %0 : !async.token
    cf.br ^bb3
  ^bb3:  // 2 preds: ^bb1, ^bb2
    return
  }
  func.func @divergent_liveness_two_tokens(%arg0: i1) {
    %0 = call @token() : () -> !async.token
    %1 = call @token() : () -> !async.token
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    async.runtime.await %0 : !async.token
    cf.br ^bb3
  ^bb2:  // pred: ^bb0
    async.runtime.await %1 : !async.token
    cf.br ^bb3
  ^bb3:  // 2 preds: ^bb1, ^bb2
    return
  }
}

