module {
  func.func @token_await(%arg0: !async.token) {
    async.runtime.await %arg0 : !async.token
    return
  }
  func.func @group_await(%arg0: !async.group) {
    async.runtime.await %arg0 : !async.group
    return
  }
  func.func @add_token_to_group(%arg0: !async.group, %arg1: !async.token) {
    %0 = async.runtime.add_to_group %arg1, %arg0 : !async.token
    return
  }
  func.func @value_load(%arg0: !async.value<f32>) {
    %0 = async.runtime.load %arg0 : <f32>
    return
  }
  func.func @error_check(%arg0: !async.token) {
    %0 = async.runtime.is_error %arg0 : !async.token
    return
  }
}

