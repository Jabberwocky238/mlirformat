module {
  ml_program.global private mutable @global(dense<0> : tensor<i64>) : tensor<i64>
  func.func @global_load_store() -> i64 {
    %c127_i64 = arith.constant 127 : i64
    %global = ml_program.global_load @global : tensor<i64>
    %extracted = tensor.extract %global[] : tensor<i64>
    %0 = arith.muli %extracted, %c127_i64 : i64
    %inserted = tensor.insert %0 into %global[] : tensor<i64>
    ml_program.global_store @global = %inserted : tensor<i64>
    return %0 : i64
  }
}

// -----
module {
  ml_program.global private mutable @global(dense<0> : tensor<i64>) : tensor<i64>
  func.func @raw_hazard() -> i64 {
    %c127_i64 = arith.constant 127 : i64
    %global = ml_program.global_load @global : tensor<i64>
    %global_0 = ml_program.global_load @global : tensor<i64>
    %inserted = tensor.insert %c127_i64 into %global[] : tensor<i64>
    %extracted = tensor.extract %global_0[] : tensor<i64>
    ml_program.global_store @global = %inserted : tensor<i64>
    return %extracted : i64
  }
}

