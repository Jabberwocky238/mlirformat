module {
  func.func @successful_pass_application(%arg0: tensor<5xf32>) -> index {
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %arg0, %c0 : tensor<5xf32>
    return %dim : index
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.apply_registered_pass "canonicalize" to %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pass_pipeline() {
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.apply_registered_pass "test-options-pass-pipeline" to %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @valid_pass_option() {
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.apply_registered_pass "canonicalize" with options = {"top-down" = false} to %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @valid_pass_options() {
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.apply_registered_pass "canonicalize" with options = {"test-convergence" = true, "top-down" = false} to %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @valid_pass_options_as_list() {
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.apply_registered_pass "canonicalize" with options = {"max-iterations" = 0 : i64, "top-down" = false} to %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @valid_dynamic_pass_options() {
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.param.constant 10 : i64 -> !transform.any_param
      %2 = transform.param.constant 1 : i64 -> !transform.any_param
      %3 = transform.apply_registered_pass "canonicalize" with options = {"max-iterations" = %1, "max-num-rewrites" = %2, "test-convergence" = true, "top-down" = false} to %0 : (!transform.any_op, !transform.any_param, !transform.any_param) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  module {
    func.func @valid_multiple_values_as_list_option_single_param() {
      return
    }
    func.func @a() {
      return
    }
    func.func @b() {
      return
    }
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {deduplicate} : (!transform.any_op) -> !transform.any_op
      %2 = transform.param.constant "a" -> !transform.any_param
      %3 = transform.param.constant "b" -> !transform.any_param
      %4 = transform.merge_handles %2, %3 : !transform.any_param
      %5 = transform.apply_registered_pass "symbol-privatize" with options = {"exclude" = %4} to %1 : (!transform.any_op, !transform.any_param) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  module {
    func.func @valid_array_attr_as_list_option() {
      return
    }
    func.func @a() {
      return
    }
    func.func @b() {
      return
    }
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {deduplicate} : (!transform.any_op) -> !transform.any_op
      %2 = transform.apply_registered_pass "symbol-privatize" with options = {"exclude" = ["a", "b"]} to %1 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  module {
    func.func @valid_array_attr_param_as_list_option() {
      return
    }
    func.func @a() {
      return
    }
    func.func @b() {
      return
    }
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {deduplicate} : (!transform.any_op) -> !transform.any_op
      %2 = transform.param.constant ["a", "b"] -> !transform.any_param
      %3 = transform.apply_registered_pass "symbol-privatize" with options = {"exclude" = %2} to %1 : (!transform.any_op, !transform.any_param) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  module {
    func.func @valid_multiple_params_as_single_list_option() {
      return
    }
    func.func @a() {
      return
    }
    func.func @b() {
      return
    }
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {deduplicate} : (!transform.any_op) -> !transform.any_op
      %2 = transform.param.constant "a" -> !transform.any_param
      %3 = transform.param.constant "b" -> !transform.any_param
      %4 = transform.apply_registered_pass "symbol-privatize" with options = {"exclude" = [%2, %3]} to %1 : (!transform.any_op, !transform.any_param, !transform.any_param) -> !transform.any_op
      transform.yield 
    }
  }
}

