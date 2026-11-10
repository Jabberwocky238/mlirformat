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

// -----
module {
  ml_program.global private mutable @state_tensor(dense<0.000000e+00> : tensor<4x75xf32>) : tensor<4x75xf32>
  func.func @global_load_store_tensor() -> tensor<4x75xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 1.000000e+00 : f32
    %state_tensor = ml_program.global_load @state_tensor : tensor<4x75xf32>
    %extracted = tensor.extract %state_tensor[%c0, %c0] : tensor<4x75xf32>
    %0 = arith.addf %extracted, %cst : f32
    %inserted = tensor.insert %0 into %state_tensor[%c0, %c0] : tensor<4x75xf32>
    ml_program.global_store @state_tensor = %inserted : tensor<4x75xf32>
    return %inserted : tensor<4x75xf32>
  }
}

