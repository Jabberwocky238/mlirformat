module {
  ml_program.global private @global(dense<4> : tensor<4xi32>) : tensor<4xi32>
  func.func @inline_into() -> tensor<4xi32> {
    %0 = call @inline_from() : () -> tensor<4xi32>
    return %0 : tensor<4xi32>
  }
  func.func @inline_from() -> tensor<4xi32> {
    %global = ml_program.global_load_const @global : tensor<4xi32>
    return %global : tensor<4xi32>
  }
}

