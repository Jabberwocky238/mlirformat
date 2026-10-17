module {
  func.func @create_token() -> !async.token {
    %0 = async.runtime.create : !async.token
    return %0 : !async.token
  }
  func.func @create_value() -> !async.value<f32> {
    %0 = async.runtime.create : !async.value<f32>
    return %0 : !async.value<f32>
  }
  func.func @create_group() -> !async.group {
    %c10 = arith.constant 10 : index
    %0 = async.runtime.create_group %c10 : !async.group
    return %0 : !async.group
  }
  func.func @set_token_available(%arg0: !async.token) {
    async.runtime.set_available %arg0 : !async.token
    return
  }
  func.func @set_value_available(%arg0: !async.value<f32>) {
    async.runtime.set_available %arg0 : !async.value<f32>
    return
  }
  func.func @set_token_error(%arg0: !async.token) {
    async.runtime.set_error %arg0 : !async.token
    return
  }
  func.func @set_value_error(%arg0: !async.value<f32>) {
    async.runtime.set_error %arg0 : !async.value<f32>
    return
  }
  func.func @is_token_error(%arg0: !async.token) -> i1 {
    %0 = async.runtime.is_error %arg0 : !async.token
    return %0 : i1
  }
  func.func @is_value_error(%arg0: !async.value<f32>) -> i1 {
    %0 = async.runtime.is_error %arg0 : !async.value<f32>
    return %0 : i1
  }
  func.func @is_group_error(%arg0: !async.group) -> i1 {
    %0 = async.runtime.is_error %arg0 : !async.group
    return %0 : i1
  }
  func.func @await_token(%arg0: !async.token) {
    async.runtime.await %arg0 : !async.token
    return
  }
  func.func @await_value(%arg0: !async.value<f32>) {
    async.runtime.await %arg0 : !async.value<f32>
    return
  }
  func.func @await_group(%arg0: !async.group) {
    async.runtime.await %arg0 : !async.group
    return
  }
  func.func @await_and_resume_token(%arg0: !async.token, %arg1: !async.coro.handle) {
    async.runtime.await_and_resume %arg0, %arg1 : !async.token
    return
  }
  func.func @await_and_resume_value(%arg0: !async.value<f32>, %arg1: !async.coro.handle) {
    async.runtime.await_and_resume %arg0, %arg1 : !async.value<f32>
    return
  }
  func.func @await_and_resume_group(%arg0: !async.group, %arg1: !async.coro.handle) {
    async.runtime.await_and_resume %arg0, %arg1 : !async.group
    return
  }
  func.func @resume(%arg0: !async.coro.handle) {
    async.runtime.resume %arg0
    return
  }
  func.func @store(%arg0: f32, %arg1: !async.value<f32>) {
    async.runtime.store %arg0, %arg1 : <f32>
    return
  }
  func.func @load(%arg0: !async.value<f32>) -> f32 {
    %0 = async.runtime.load %arg0 : <f32>
    return %0 : f32
  }
  func.func @add_to_group(%arg0: !async.token, %arg1: !async.value<f32>, %arg2: !async.group) {
    %0 = async.runtime.add_to_group %arg0, %arg2 : !async.token
    %1 = async.runtime.add_to_group %arg1, %arg2 : !async.value<f32>
    return
  }
  func.func @add_ref(%arg0: !async.token) {
    async.runtime.add_ref %arg0 {count = 1 : i64} : !async.token
    return
  }
  func.func @drop_ref(%arg0: !async.token) {
    async.runtime.drop_ref %arg0 {count = 1 : i64} : !async.token
    return
  }
}

