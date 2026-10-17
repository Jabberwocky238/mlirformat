module {
  func.func @coro_id() -> !async.coro.id {
    %0 = async.coro.id
    return %0 : !async.coro.id
  }
  func.func @coro_handle(%arg0: !async.coro.id) -> !async.coro.handle {
    %0 = async.coro.begin %arg0
    return %0 : !async.coro.handle
  }
  func.func @coro_free(%arg0: !async.coro.id, %arg1: !async.coro.handle) {
    async.coro.free %arg0, %arg1
    return
  }
  func.func @coro_end(%arg0: !async.coro.handle) {
    async.coro.end %arg0
    return
  }
  func.func @coro_save(%arg0: !async.coro.handle) -> !async.coro.state {
    %0 = async.coro.save %arg0
    return %0 : !async.coro.state
  }
  func.func @coro_suspend(%arg0: !async.coro.state) {
    async.coro.suspend %arg0, ^bb3, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    return {coro.resume}
  ^bb2:  // pred: ^bb0
    return {coro.cleanup}
  ^bb3:  // pred: ^bb0
    return {coro.suspend}
  }
}

