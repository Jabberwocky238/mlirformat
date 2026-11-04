module {
  func.func @coro_id() {
    %0 = async.coro.id
    return
  }
  func.func @coro_begin() {
    %0 = async.coro.id
    %1 = async.coro.begin %0
    return
  }
  func.func @coro_free() {
    %0 = async.coro.id
    %1 = async.coro.begin %0
    async.coro.free %0, %1
    return
  }
  func.func @coro_end() {
    %0 = async.coro.id
    %1 = async.coro.begin %0
    async.coro.end %1
    return
  }
  func.func @coro_save() {
    %0 = async.coro.id
    %1 = async.coro.begin %0
    %2 = async.coro.save %1
    return
  }
  func.func @coro_suspend() {
    %0 = async.coro.id
    %1 = async.coro.begin %0
    %2 = async.coro.save %1
    async.coro.suspend %2, ^bb3, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    return {coro.resume}
  ^bb2:  // pred: ^bb0
    return {coro.cleanup}
  ^bb3:  // pred: ^bb0
    return {coro.suspend}
  }
}

