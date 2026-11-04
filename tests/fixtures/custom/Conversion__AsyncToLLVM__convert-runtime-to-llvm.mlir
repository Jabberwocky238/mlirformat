module {
  func.func @create_token() {
    %0 = async.runtime.create : !async.token
    return
  }
  func.func @create_value() {
    %0 = async.runtime.create : !async.value<f32>
    return
  }
  func.func @create_group() {
    %c1 = arith.constant 1 : index
    %0 = async.runtime.create_group %c1 : !async.group
    return
  }
  func.func @set_token_available() {
    %0 = async.runtime.create : !async.token
    async.runtime.set_available %0 : !async.token
    return
  }
  func.func @set_value_available() {
    %0 = async.runtime.create : !async.value<f32>
    async.runtime.set_available %0 : !async.value<f32>
    return
  }
  func.func @is_token_error() -> i1 {
    %0 = async.runtime.create : !async.token
    %1 = async.runtime.is_error %0 : !async.token
    return %1 : i1
  }
  func.func @is_value_error() -> i1 {
    %0 = async.runtime.create : !async.value<f32>
    %1 = async.runtime.is_error %0 : !async.value<f32>
    return %1 : i1
  }
  func.func @await_token() {
    %0 = async.runtime.create : !async.token
    async.runtime.await %0 : !async.token
    return
  }
  func.func @await_value() {
    %0 = async.runtime.create : !async.value<f32>
    async.runtime.await %0 : !async.value<f32>
    return
  }
  func.func @await_group() {
    %c1 = arith.constant 1 : index
    %0 = async.runtime.create_group %c1 : !async.group
    async.runtime.await %0 : !async.group
    return
  }
  func.func @await_and_resume_token() {
    %0 = async.coro.id
    %1 = async.coro.begin %0
    %2 = async.runtime.create : !async.token
    async.runtime.await_and_resume %2, %1 : !async.token
    return
  }
  func.func @await_and_resume_value() {
    %0 = async.coro.id
    %1 = async.coro.begin %0
    %2 = async.runtime.create : !async.value<f32>
    async.runtime.await_and_resume %2, %1 : !async.value<f32>
    return
  }
  func.func @await_and_resume_group() {
    %c1 = arith.constant 1 : index
    %0 = async.coro.id
    %1 = async.coro.begin %0
    %2 = async.runtime.create_group %c1 : !async.group
    async.runtime.await_and_resume %2, %1 : !async.group
    return
  }
  func.func @resume() {
    %0 = async.coro.id
    %1 = async.coro.begin %0
    async.runtime.resume %1
    return
  }
  func.func @store() {
    %cst = arith.constant 1.000000e+00 : f32
    %0 = async.runtime.create : !async.value<f32>
    async.runtime.store %cst, %0 : <f32>
    return
  }
  func.func @load() -> f32 {
    %0 = async.runtime.create : !async.value<f32>
    %1 = async.runtime.load %0 : <f32>
    return %1 : f32
  }
  func.func @add_token_to_group() {
    %c1 = arith.constant 1 : index
    %0 = async.runtime.create : !async.token
    %1 = async.runtime.create_group %c1 : !async.group
    %2 = async.runtime.add_to_group %0, %1 : !async.token
    return
  }
}

