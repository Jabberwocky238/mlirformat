module {
  func.func @foreach_scalar_no_reduc(%arg0: tensor<i32>) {
    sparse_tensor.foreach in %arg0 : tensor<i32> do {
    ^bb0(%arg1: i32):
    }
    return
  }
  func.func @foreach_scalar_with_reduc(%arg0: tensor<i32>, %arg1: i32) -> i32 {
    %0 = sparse_tensor.foreach in %arg0 init(%arg1) : tensor<i32>, i32 -> i32 do {
    ^bb0(%arg2: i32, %arg3: i32):
      sparse_tensor.yield %arg2 : i32
    }
    return %0 : i32
  }
}

