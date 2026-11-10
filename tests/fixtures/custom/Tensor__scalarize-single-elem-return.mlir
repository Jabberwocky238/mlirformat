module {
  func.func private @rank0() -> tensor<i64> {
    %cst = arith.constant dense<-1> : tensor<i64>
    return %cst : tensor<i64>
  }
  func.func private @rank1(%arg0: tensor<1xi64>) -> tensor<1xi64> {
    return %arg0 : tensor<1xi64>
  }
  func.func private @rank2_single_element(%arg0: tensor<1x1xi64>) -> tensor<1x1xi64> {
    return %arg0 : tensor<1x1xi64>
  }
  func.func private @non_return_terminator(%arg0: tensor<1xi64>, %arg1: i1) -> tensor<1xi64> {
    cf.cond_br %arg1, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    cf.br ^bb3(%arg0 : tensor<1xi64>)
  ^bb2:  // pred: ^bb0
    %0 = tensor.empty() : tensor<1xi64>
    cf.br ^bb3(%0 : tensor<1xi64>)
  ^bb3(%1: tensor<1xi64>):  // 2 preds: ^bb1, ^bb2
    return %1 : tensor<1xi64>
  }
  func.func private @callee(%arg0: tensor<1xi64>) -> tensor<1xi64> {
    return %arg0 : tensor<1xi64>
  }
  func.func private @caller(%arg0: tensor<1xi64>) -> tensor<1xi64> {
    %0 = call @callee(%arg0) : (tensor<1xi64>) -> tensor<1xi64>
    return %0 : tensor<1xi64>
  }
}

// -----
module {
  func.func private @callee(%arg0: tensor<1xi64>) -> tensor<1xi64> {
    return %arg0 : tensor<1xi64>
  }
  func.func private @non_scalarizable_caller_multiple_dimensions_return(%arg0: tensor<1xi64>) -> tensor<2xi64> {
    %0 = call @callee(%arg0) : (tensor<1xi64>) -> tensor<1xi64>
    %1 = tensor.empty() : tensor<2xi64>
    return %1 : tensor<2xi64>
  }
}

// -----
module {
  func.func private @callee(%arg0: tensor<1xi64>) -> tensor<1xi64> {
    return %arg0 : tensor<1xi64>
  }
  func.func private @non_scalarizeable_caller_with_multiple_returns(%arg0: tensor<1xi64>) -> (tensor<1xi64>, i64) {
    %0 = call @callee(%arg0) : (tensor<1xi64>) -> tensor<1xi64>
    %c7_i64 = arith.constant 7 : i64
    return %0, %c7_i64 : tensor<1xi64>, i64
  }
}

// -----
module {
  func.func private @callee(%arg0: tensor<1xi64>) -> tensor<1xi64> {
    return %arg0 : tensor<1xi64>
  }
  func.func private @non_scalarizeable_caller_expecting_tensor_type(%arg0: tensor<1xi64>, %arg1: tensor<1xi64>) -> tensor<1xi64> {
    %0 = call @callee(%arg0) : (tensor<1xi64>) -> tensor<1xi64>
    %1 = tensor.empty() : tensor<1xi64>
    %mapped = linalg.map { arith.addi {overflowFlags = #arith.overflow<none>} } ins(%0, %arg1 : tensor<1xi64>, tensor<1xi64>) outs(%1 : tensor<1xi64>)
    return %mapped : tensor<1xi64>
  }
}

// -----
module {
  func.func private @callee(%arg0: tensor<1xi64>) -> tensor<1xi64> {
    return %arg0 : tensor<1xi64>
  }
  %0 = tensor.empty() : tensor<1xi64>
  %1 = func.call @callee(%0) : (tensor<1xi64>) -> tensor<1xi64>
}

// -----
module {
  func.func private @callee(%arg0: tensor<1xi64>) -> tensor<1xi64> {
    return %arg0 : tensor<1xi64>
  }
  func.func private @caller_using_constant(%arg0: tensor<1xi64>) -> tensor<1xi64> {
    %f = constant @callee : (tensor<1xi64>) -> tensor<1xi64>
    %0 = call_indirect %f(%arg0) : (tensor<1xi64>) -> tensor<1xi64>
    return %0 : tensor<1xi64>
  }
}

// -----
module {
  func.func private @multiple_elements(%arg0: tensor<2xi64>) -> tensor<2xi64> {
    return %arg0 : tensor<2xi64>
  }
  func.func private @dynamic_shape(%arg0: tensor<?xi64>) -> tensor<?xi64> {
    return %arg0 : tensor<?xi64>
  }
  func.func private @unranked(%arg0: tensor<*xi64>) -> tensor<*xi64> {
    return %arg0 : tensor<*xi64>
  }
  func.func @public_function(%arg0: tensor<1xi64>) -> tensor<1xi64> {
    return %arg0 : tensor<1xi64>
  }
  func.func private @callee(%arg0: tensor<1xi64>) -> tensor<1xi64> {
    return %arg0 : tensor<1xi64>
  }
  func.func @public_caller(%arg0: tensor<1xi64>) -> tensor<1xi64> {
    %0 = call @callee(%arg0) : (tensor<1xi64>) -> tensor<1xi64>
    return %0 : tensor<1xi64>
  }
}

// -----
module {
  func.func private @recursive_a(%arg0: tensor<1xi64>) -> tensor<1xi64> {
    %0 = call @recursive_b(%arg0) : (tensor<1xi64>) -> tensor<1xi64>
    return %0 : tensor<1xi64>
  }
  func.func private @recursive_b(%arg0: tensor<1xi64>) -> tensor<1xi64> {
    %0 = call @recursive_a(%arg0) : (tensor<1xi64>) -> tensor<1xi64>
    return %0 : tensor<1xi64>
  }
}

