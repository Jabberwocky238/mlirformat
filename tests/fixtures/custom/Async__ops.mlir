module {
  func.func @identity_token(%arg0: !async.token) -> !async.token {
    return %arg0 : !async.token
  }
  func.func @identity_value(%arg0: !async.value<f32>) -> !async.value<f32> {
    return %arg0 : !async.value<f32>
  }
  func.func @empty_async_execute() -> !async.token {
    %token = async.execute {
      async.yield
    }
    return %token : !async.token
  }
  func.func @return_async_value() -> !async.value<f32> {
    %token, %bodyResults = async.execute -> !async.value<f32> {
      %cst = arith.constant 1.000000e+00 : f32
      async.yield %cst : f32
    }
    return %bodyResults : !async.value<f32>
  }
  func.func @return_captured_value() -> !async.token {
    %cst = arith.constant 1.000000e+00 : f32
    %token, %bodyResults = async.execute -> !async.value<f32> {
      async.yield %cst : f32
    }
    return %token : !async.token
  }
  func.func @return_async_values() -> (!async.value<f32>, !async.value<f32>) {
    %token, %bodyResults:2 = async.execute -> (!async.value<f32>, !async.value<f32>) {
      %cst = arith.constant 1.000000e+00 : f32
      %cst_0 = arith.constant 2.000000e+00 : f32
      async.yield %cst, %cst_0 : f32, f32
    }
    return %bodyResults#0, %bodyResults#1 : !async.value<f32>, !async.value<f32>
  }
  func.func @async_token_dependencies(%arg0: !async.token) -> !async.token {
    %token = async.execute [%arg0] {
      async.yield
    }
    return %token : !async.token
  }
  func.func @async_value_operands(%arg0: !async.value<f32>) -> !async.token {
    %token, %bodyResults = async.execute (%arg0 as %arg1: !async.value<f32>) -> !async.value<f32> {
      async.yield %arg1 : f32
    }
    return %token : !async.token
  }
  func.func @async_token_and_value_operands(%arg0: !async.token, %arg1: !async.value<f32>) -> !async.token {
    %token, %bodyResults = async.execute [%arg0] (%arg1 as %arg2: !async.value<f32>) -> !async.value<f32> {
      async.yield %arg2 : f32
    }
    return %token : !async.token
  }
  func.func @empty_tokens_or_values_operands() {
    %token = async.execute {
      async.yield
    }
    %token_0 = async.execute {
      async.yield
    }
    %token_1 = async.execute {
      async.yield
    }
    %token_2 = async.execute {
      async.yield
    }
    %token_3 = async.execute {
      async.yield
    }
    return
  }
  func.func @await_token(%arg0: !async.token) {
    async.await %arg0 : !async.token
    return
  }
  func.func @await_value(%arg0: !async.value<f32>) -> f32 {
    %0 = async.await %arg0 : !async.value<f32>
    return %0 : f32
  }
  func.func @create_group_and_await_all(%arg0: !async.token, %arg1: !async.value<f32>) -> index {
    %c2 = arith.constant 2 : index
    %0 = async.create_group %c2 : !async.group
    %1 = async.add_to_group %arg0, %0 : !async.token
    %2 = async.add_to_group %arg1, %0 : !async.value<f32>
    async.await_all %0
    %3 = arith.addi %1, %2 : index
    return %3 : index
  }
  async.func @async_func_return_token() -> !async.token {
    return
  }
  async.func @async_func_return_value() -> !async.value<i32> {
    %c42_i32 = arith.constant 42 : i32
    return %c42_i32 : i32
  }
  async.func @async_func_return_optional_token() -> (!async.token, !async.value<i32>) {
    %c42_i32 = arith.constant 42 : i32
    return %c42_i32 : i32
  }
  func.func @async_call() {
    %0 = async.call @async_func_return_token() : () -> !async.token
    %1 = async.call @async_func_return_value() : () -> !async.value<i32>
    %2:2 = async.call @async_func_return_optional_token() : () -> (!async.token, !async.value<i32>)
    return
  }
}

