"builtin.module"() ({
  "func.func"() <{function_type = (tensor<5xf32>) -> index, sym_name = "successful_pass_application"}> ({
  ^bb0(%arg1: tensor<5xf32>):
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "tensor.dim"(%arg1, %2) : (tensor<5xf32>, index) -> index
    "func.return"(%3) : (index) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.apply_registered_pass"(%0) <{options = {}, pass_name = "canonicalize"}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "pass_pipeline"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.apply_registered_pass"(%0) <{options = {}, pass_name = "test-options-pass-pipeline"}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "valid_pass_option"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.apply_registered_pass"(%0) <{options = {"top-down" = false}, pass_name = "canonicalize"}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "valid_pass_options"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.apply_registered_pass"(%0) <{options = {"test-convergence" = true, "top-down" = false}, pass_name = "canonicalize"}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "valid_pass_options_as_list"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.apply_registered_pass"(%0) <{options = {"max-iterations" = 0 : i64, "top-down" = false}, pass_name = "canonicalize"}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "valid_dynamic_pass_options"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.param.constant"() <{value = 10 : i64}> : () -> !transform.any_param
      %2 = "transform.param.constant"() <{value = 1 : i64}> : () -> !transform.any_param
      %3 = "transform.apply_registered_pass"(%0, %1, %2) <{options = {"max-iterations" = #transform.param_operand<index = 0 : i64>, "max-num-rewrites" = #transform.param_operand<index = 1 : i64>, "test-convergence" = true, "top-down" = false}, pass_name = "canonicalize"}> : (!transform.any_op, !transform.any_param, !transform.any_param) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() ({
    "func.func"() <{function_type = () -> (), sym_name = "valid_multiple_values_as_list_option_single_param"}> ({
      "func.return"() : () -> ()
    }) : () -> ()
    "func.func"() <{function_type = () -> (), sym_name = "a"}> ({
      "func.return"() : () -> ()
    }) : () -> ()
    "func.func"() <{function_type = () -> (), sym_name = "b"}> ({
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{deduplicate, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.param.constant"() <{value = "a"}> : () -> !transform.any_param
      %3 = "transform.param.constant"() <{value = "b"}> : () -> !transform.any_param
      %4 = "transform.merge_handles"(%2, %3) : (!transform.any_param, !transform.any_param) -> !transform.any_param
      %5 = "transform.apply_registered_pass"(%1, %4) <{options = {exclude = #transform.param_operand<index = 0 : i64>}, pass_name = "symbol-privatize"}> : (!transform.any_op, !transform.any_param) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() ({
    "func.func"() <{function_type = () -> (), sym_name = "valid_array_attr_as_list_option"}> ({
      "func.return"() : () -> ()
    }) : () -> ()
    "func.func"() <{function_type = () -> (), sym_name = "a"}> ({
      "func.return"() : () -> ()
    }) : () -> ()
    "func.func"() <{function_type = () -> (), sym_name = "b"}> ({
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{deduplicate, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.apply_registered_pass"(%1) <{options = {exclude = ["a", "b"]}, pass_name = "symbol-privatize"}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() ({
    "func.func"() <{function_type = () -> (), sym_name = "valid_array_attr_param_as_list_option"}> ({
      "func.return"() : () -> ()
    }) : () -> ()
    "func.func"() <{function_type = () -> (), sym_name = "a"}> ({
      "func.return"() : () -> ()
    }) : () -> ()
    "func.func"() <{function_type = () -> (), sym_name = "b"}> ({
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{deduplicate, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.param.constant"() <{value = ["a", "b"]}> : () -> !transform.any_param
      %3 = "transform.apply_registered_pass"(%1, %2) <{options = {exclude = #transform.param_operand<index = 0 : i64>}, pass_name = "symbol-privatize"}> : (!transform.any_op, !transform.any_param) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() ({
    "func.func"() <{function_type = () -> (), sym_name = "valid_multiple_params_as_single_list_option"}> ({
      "func.return"() : () -> ()
    }) : () -> ()
    "func.func"() <{function_type = () -> (), sym_name = "a"}> ({
      "func.return"() : () -> ()
    }) : () -> ()
    "func.func"() <{function_type = () -> (), sym_name = "b"}> ({
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{deduplicate, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.param.constant"() <{value = "a"}> : () -> !transform.any_param
      %3 = "transform.param.constant"() <{value = "b"}> : () -> !transform.any_param
      %4 = "transform.apply_registered_pass"(%1, %2, %3) <{options = {exclude = [#transform.param_operand<index = 0 : i64>, #transform.param_operand<index = 1 : i64>]}, pass_name = "symbol-privatize"}> : (!transform.any_op, !transform.any_param, !transform.any_param) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

