"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "matcher"}> ({
    ^bb0(%arg1: !pdl.operation):
      "pdl_interp.apply_constraint"(%arg1, %arg1)[^bb1, ^bb3] <{isNegated = false, name = "multi_entity_constraint"}> : (!pdl.operation, !pdl.operation) -> ()
    ^bb1:  // pred: ^bb0
      "pdl_interp.apply_constraint"(%arg1)[^bb2, ^bb3] <{isNegated = false, name = "single_entity_constraint"}> : (!pdl.operation) -> ()
    ^bb2:  // pred: ^bb1
      "pdl_interp.record_match"(%arg1, %arg1)[^bb3] <{benefit = 1 : i16, operandSegmentSizes = array<i32: 1, 1>, rewriter = @rewriters::@success}> : (!pdl.operation, !pdl.operation) -> ()
    ^bb3:  // 3 preds: ^bb0, ^bb1, ^bb2
      "pdl_interp.finalize"() : () -> ()
    }) : () -> ()
    "builtin.module"() <{sym_name = "rewriters"}> ({
      "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "success"}> ({
      ^bb0(%arg0: !pdl.operation):
        %0 = "pdl_interp.create_operation"() <{inputAttributeNames = [], name = "test.replaced_by_pattern", operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> !pdl.operation
        "pdl_interp.erase"(%arg0) : (!pdl.operation) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    "test.op"() {test_attr} : () -> ()
  }) {test.apply_constraint_1} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "matcher"}> ({
    ^bb0(%arg1: !pdl.operation):
      %2 = "pdl_interp.get_results"(%arg1) : (!pdl.operation) -> !pdl.range<value>
      %3 = "pdl_interp.get_value_type"(%2) : (!pdl.range<value>) -> !pdl.range<type>
      "pdl_interp.apply_constraint"(%2, %3)[^bb1, ^bb2] <{isNegated = false, name = "multi_entity_var_constraint"}> : (!pdl.range<value>, !pdl.range<type>) -> ()
    ^bb1:  // pred: ^bb0
      "pdl_interp.record_match"(%arg1, %arg1)[^bb2] <{benefit = 1 : i16, operandSegmentSizes = array<i32: 1, 1>, rewriter = @rewriters::@success}> : (!pdl.operation, !pdl.operation) -> ()
    ^bb2:  // 2 preds: ^bb0, ^bb1
      "pdl_interp.finalize"() : () -> ()
    }) : () -> ()
    "builtin.module"() <{sym_name = "rewriters"}> ({
      "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "success"}> ({
      ^bb0(%arg0: !pdl.operation):
        %1 = "pdl_interp.create_operation"() <{inputAttributeNames = [], name = "test.replaced_by_pattern", operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> !pdl.operation
        "pdl_interp.erase"(%arg0) : (!pdl.operation) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    "test.failure_op"() {test_attr} : () -> ()
    %0:2 = "test.success_op"() : () -> (i32, i64)
  }) {test.apply_constraint_2} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "matcher"}> ({
    ^bb0(%arg1: !pdl.operation):
      %1 = "pdl_interp.create_attribute"() <{value}> : () -> !pdl.attribute
      %2 = "pdl_interp.get_attribute"(%arg1) <{name = "test_attr"}> : (!pdl.operation) -> !pdl.attribute
      "pdl_interp.are_equal"(%1, %2)[^bb1, ^bb3] : (!pdl.attribute, !pdl.attribute) -> ()
    ^bb1:  // pred: ^bb0
      "pdl_interp.apply_constraint"(%arg1)[^bb2, ^bb3] <{isNegated = true, name = "single_entity_constraint"}> : (!pdl.operation) -> ()
    ^bb2:  // pred: ^bb1
      "pdl_interp.record_match"(%arg1, %arg1)[^bb3] <{benefit = 1 : i16, operandSegmentSizes = array<i32: 1, 1>, rewriter = @rewriters::@success}> : (!pdl.operation, !pdl.operation) -> ()
    ^bb3:  // 3 preds: ^bb0, ^bb1, ^bb2
      "pdl_interp.finalize"() : () -> ()
    }) : () -> ()
    "builtin.module"() <{sym_name = "rewriters"}> ({
      "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "success"}> ({
      ^bb0(%arg0: !pdl.operation):
        %0 = "pdl_interp.create_operation"() <{inputAttributeNames = [], name = "test.replaced_by_pattern", operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> !pdl.operation
        "pdl_interp.erase"(%arg0) : (!pdl.operation) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    "test.foo"() {test_attr} : () -> ()
    "test.op"() {test_attr} : () -> ()
  }) {test.apply_constraint_3} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "matcher"}> ({
    ^bb0(%arg2: !pdl.operation):
      "pdl_interp.check_operation_name"(%arg2)[^bb1, ^bb3] <{name = "test.success_op"}> : (!pdl.operation) -> ()
    ^bb1:  // pred: ^bb0
      %1 = "pdl_interp.apply_constraint"(%arg2)[^bb2, ^bb3] <{isNegated = false, name = "op_constr_return_type"}> : (!pdl.operation) -> !pdl.type
    ^bb2:  // pred: ^bb1
      "pdl_interp.record_match"(%arg2, %1, %arg2)[^bb3] <{benefit = 1 : i16, operandSegmentSizes = array<i32: 2, 1>, rewriter = @rewriters::@success}> : (!pdl.operation, !pdl.type, !pdl.operation) -> ()
    ^bb3:  // 3 preds: ^bb0, ^bb1, ^bb2
      "pdl_interp.finalize"() : () -> ()
    }) : () -> ()
    "builtin.module"() <{sym_name = "rewriters"}> ({
      "pdl_interp.func"() <{function_type = (!pdl.operation, !pdl.type) -> (), sym_name = "success"}> ({
      ^bb0(%arg0: !pdl.operation, %arg1: !pdl.type):
        %0 = "pdl_interp.create_operation"(%arg1) <{inputAttributeNames = [], name = "test.replaced_by_pattern", operandSegmentSizes = array<i32: 0, 0, 1>}> : (!pdl.type) -> !pdl.operation
        "pdl_interp.erase"(%arg0) : (!pdl.operation) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    "test.failure_op"() : () -> ()
    "test.success_op"() : () -> ()
  }) {test.apply_constraint_4} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "matcher"}> ({
    ^bb0(%arg2: !pdl.operation):
      %1:2 = "pdl_interp.apply_constraint"(%arg2)[^bb1, ^bb2] <{isNegated = false, name = "op_multiple_returns_failure"}> : (!pdl.operation) -> (!pdl.type, !pdl.type)
    ^bb1:  // pred: ^bb0
      "pdl_interp.record_match"(%arg2, %1#0, %arg2)[^bb2] <{benefit = 1 : i16, operandSegmentSizes = array<i32: 2, 1>, rewriter = @rewriters::@success}> : (!pdl.operation, !pdl.type, !pdl.operation) -> ()
    ^bb2:  // 2 preds: ^bb0, ^bb1
      "pdl_interp.finalize"() : () -> ()
    }) : () -> ()
    "builtin.module"() <{sym_name = "rewriters"}> ({
      "pdl_interp.func"() <{function_type = (!pdl.operation, !pdl.type) -> (), sym_name = "success"}> ({
      ^bb0(%arg0: !pdl.operation, %arg1: !pdl.type):
        %0 = "pdl_interp.create_operation"(%arg1) <{inputAttributeNames = [], name = "test.replaced_by_pattern", operandSegmentSizes = array<i32: 0, 0, 1>}> : (!pdl.type) -> !pdl.operation
        "pdl_interp.erase"(%arg0) : (!pdl.operation) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    "test.success_op"() : () -> ()
  }) {test.apply_constraint_multi_result_failure} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "matcher"}> ({
    ^bb0(%arg2: !pdl.operation):
      "pdl_interp.check_operation_name"(%arg2)[^bb1, ^bb3] <{name = "test.success_op"}> : (!pdl.operation) -> ()
    ^bb1:  // pred: ^bb0
      %1 = "pdl_interp.create_attribute"() <{value = 2 : i32}> : () -> !pdl.attribute
      %2 = "pdl_interp.apply_constraint"(%arg2, %1)[^bb2, ^bb3] <{isNegated = false, name = "op_constr_return_type_range"}> : (!pdl.operation, !pdl.attribute) -> !pdl.range<type>
    ^bb2:  // pred: ^bb1
      "pdl_interp.record_match"(%arg2, %2, %arg2)[^bb3] <{benefit = 1 : i16, operandSegmentSizes = array<i32: 2, 1>, rewriter = @rewriters::@success}> : (!pdl.operation, !pdl.range<type>, !pdl.operation) -> ()
    ^bb3:  // 3 preds: ^bb0, ^bb1, ^bb2
      "pdl_interp.finalize"() : () -> ()
    }) : () -> ()
    "builtin.module"() <{sym_name = "rewriters"}> ({
      "pdl_interp.func"() <{function_type = (!pdl.operation, !pdl.range<type>) -> (), sym_name = "success"}> ({
      ^bb0(%arg0: !pdl.operation, %arg1: !pdl.range<type>):
        %0 = "pdl_interp.create_operation"(%arg1) <{inputAttributeNames = [], name = "test.replaced_by_pattern", operandSegmentSizes = array<i32: 0, 0, 1>}> : (!pdl.range<type>) -> !pdl.operation
        "pdl_interp.erase"(%arg0) : (!pdl.operation) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    "test.failure_op"() : () -> ()
    "test.success_op"() : () -> ()
  }) {test.apply_constraint_5} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "matcher"}> ({
    ^bb0(%arg1: !pdl.operation):
      "pdl_interp.check_operation_name"(%arg1)[^bb1, ^bb2] <{name = "test.op"}> : (!pdl.operation) -> ()
    ^bb1:  // pred: ^bb0
      "pdl_interp.record_match"(%arg1, %arg1)[^bb2] <{benefit = 1 : i16, operandSegmentSizes = array<i32: 1, 1>, rewriter = @rewriters::@success}> : (!pdl.operation, !pdl.operation) -> ()
    ^bb2:  // 2 preds: ^bb0, ^bb1
      "pdl_interp.finalize"() : () -> ()
    }) : () -> ()
    "builtin.module"() <{sym_name = "rewriters"}> ({
      "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "success"}> ({
      ^bb0(%arg0: !pdl.operation):
        %1 = "pdl_interp.get_operand"(%arg0) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
        "pdl_interp.apply_rewrite"(%arg0, %1) <{name = "rewriter"}> : (!pdl.operation, !pdl.value) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    %0 = "test.op_input"() : () -> i32
    "test.op"(%0) : (i32) -> ()
  }) {test.apply_rewrite_1} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "matcher"}> ({
    ^bb0(%arg1: !pdl.operation):
      "pdl_interp.check_operation_name"(%arg1)[^bb1, ^bb2] <{name = "test.op"}> : (!pdl.operation) -> ()
    ^bb1:  // pred: ^bb0
      "pdl_interp.record_match"(%arg1, %arg1)[^bb2] <{benefit = 1 : i16, operandSegmentSizes = array<i32: 1, 1>, rewriter = @rewriters::@success}> : (!pdl.operation, !pdl.operation) -> ()
    ^bb2:  // 2 preds: ^bb0, ^bb1
      "pdl_interp.finalize"() : () -> ()
    }) : () -> ()
    "builtin.module"() <{sym_name = "rewriters"}> ({
      "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "success"}> ({
      ^bb0(%arg0: !pdl.operation):
        %0 = "pdl_interp.apply_rewrite"(%arg0) <{name = "creator"}> : (!pdl.operation) -> !pdl.operation
        "pdl_interp.erase"(%arg0) : (!pdl.operation) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    "test.op"() : () -> ()
  }) {test.apply_rewrite_2} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "matcher"}> ({
    ^bb0(%arg1: !pdl.operation):
      "pdl_interp.check_operation_name"(%arg1)[^bb1, ^bb2] <{name = "test.op"}> : (!pdl.operation) -> ()
    ^bb1:  // pred: ^bb0
      "pdl_interp.record_match"(%arg1, %arg1)[^bb2] <{benefit = 1 : i16, operandSegmentSizes = array<i32: 1, 1>, rewriter = @rewriters::@success}> : (!pdl.operation, !pdl.operation) -> ()
    ^bb2:  // 2 preds: ^bb0, ^bb1
      "pdl_interp.finalize"() : () -> ()
    }) : () -> ()
    "builtin.module"() <{sym_name = "rewriters"}> ({
      "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "success"}> ({
      ^bb0(%arg0: !pdl.operation):
        %2:2 = "pdl_interp.apply_rewrite"(%arg0) <{name = "var_creator"}> : (!pdl.operation) -> (!pdl.range<value>, !pdl.range<type>)
        %3 = "pdl_interp.create_operation"(%2#0, %2#1) <{inputAttributeNames = [], name = "test.success", operandSegmentSizes = array<i32: 1, 0, 1>}> : (!pdl.range<value>, !pdl.range<type>) -> !pdl.operation
        "pdl_interp.replace"(%arg0, %2#0) : (!pdl.operation, !pdl.range<value>) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    %0 = "test.producer"() : () -> i32
    %1 = "test.op"(%0) : (i32) -> i32
    "test.consumer"(%1) : (i32) -> ()
  }) {test.apply_rewrite_3} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "matcher"}> ({
    ^bb0(%arg1: !pdl.operation):
      "pdl_interp.check_operation_name"(%arg1)[^bb1, ^bb2] <{name = "test.op"}> : (!pdl.operation) -> ()
    ^bb1:  // pred: ^bb0
      "pdl_interp.record_match"(%arg1, %arg1)[^bb2] <{benefit = 1 : i16, operandSegmentSizes = array<i32: 1, 1>, rewriter = @rewriters::@success}> : (!pdl.operation, !pdl.operation) -> ()
    ^bb2:  // 2 preds: ^bb0, ^bb1
      "pdl_interp.finalize"() : () -> ()
    }) : () -> ()
    "builtin.module"() <{sym_name = "rewriters"}> ({
      "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "success"}> ({
      ^bb0(%arg0: !pdl.operation):
        %0 = "pdl_interp.apply_rewrite"() <{name = "str_creator"}> : () -> !pdl.attribute
        %1 = "pdl_interp.apply_rewrite"() <{name = "type_creator"}> : () -> !pdl.type
        %2 = "pdl_interp.create_operation"(%0, %1) <{inputAttributeNames = ["attr"], name = "test.success", operandSegmentSizes = array<i32: 0, 1, 1>}> : (!pdl.attribute, !pdl.type) -> !pdl.operation
        "pdl_interp.erase"(%arg0) : (!pdl.operation) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    "test.op"() : () -> ()
  }) {test.apply_rewrite_4} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "matcher"}> ({
    ^bb0(%arg1: !pdl.operation):
      %1 = "pdl_interp.create_attribute"() <{value}> : () -> !pdl.attribute
      %2 = "pdl_interp.get_attribute"(%arg1) <{name = "test_attr"}> : (!pdl.operation) -> !pdl.attribute
      "pdl_interp.are_equal"(%1, %2)[^bb1, ^bb2] : (!pdl.attribute, !pdl.attribute) -> ()
    ^bb1:  // pred: ^bb0
      "pdl_interp.record_match"(%arg1, %arg1)[^bb2] <{benefit = 1 : i16, operandSegmentSizes = array<i32: 1, 1>, rewriter = @rewriters::@success}> : (!pdl.operation, !pdl.operation) -> ()
    ^bb2:  // 2 preds: ^bb0, ^bb1
      "pdl_interp.finalize"() : () -> ()
    }) : () -> ()
    "builtin.module"() <{sym_name = "rewriters"}> ({
      "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "success"}> ({
      ^bb0(%arg0: !pdl.operation):
        %0 = "pdl_interp.create_operation"() <{inputAttributeNames = [], name = "test.success", operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> !pdl.operation
        "pdl_interp.erase"(%arg0) : (!pdl.operation) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    "test.op"() {test_attr} : () -> ()
  }) {test.are_equal_1} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "matcher"}> ({
    ^bb0(%arg1: !pdl.operation):
      %3 = "pdl_interp.create_types"() <{value = [i32, i64]}> : () -> !pdl.range<type>
      %4 = "pdl_interp.get_results"(%arg1) : (!pdl.operation) -> !pdl.range<value>
      %5 = "pdl_interp.get_value_type"(%4) : (!pdl.range<value>) -> !pdl.range<type>
      "pdl_interp.are_equal"(%5, %3)[^bb1, ^bb2] : (!pdl.range<type>, !pdl.range<type>) -> ()
    ^bb1:  // pred: ^bb0
      "pdl_interp.record_match"(%arg1, %arg1)[^bb2] <{benefit = 1 : i16, operandSegmentSizes = array<i32: 1, 1>, rewriter = @rewriters::@success}> : (!pdl.operation, !pdl.operation) -> ()
    ^bb2:  // 2 preds: ^bb0, ^bb1
      "pdl_interp.finalize"() : () -> ()
    }) : () -> ()
    "builtin.module"() <{sym_name = "rewriters"}> ({
      "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "success"}> ({
      ^bb0(%arg0: !pdl.operation):
        %2 = "pdl_interp.create_operation"() <{inputAttributeNames = [], name = "test.success", operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> !pdl.operation
        "pdl_interp.erase"(%arg0) : (!pdl.operation) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    %0 = "test.not_equal"() : () -> i32
    %1:2 = "test.op"() : () -> (i32, i64)
  }) {test.are_equal_2} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "matcher"}> ({
    ^bb0(%arg1: !pdl.operation):
      "pdl_interp.check_operation_name"(%arg1)[^bb1, ^bb3] <{name = "test.op"}> : (!pdl.operation) -> ()
    ^bb1:  // pred: ^bb0
      "pdl_interp.branch"()[^bb2] : () -> ()
    ^bb2:  // pred: ^bb1
      "pdl_interp.record_match"(%arg1, %arg1)[^bb3] <{benefit = 2 : i16, operandSegmentSizes = array<i32: 1, 1>, rewriter = @rewriters::@success}> : (!pdl.operation, !pdl.operation) -> ()
    ^bb3:  // 2 preds: ^bb0, ^bb2
      "pdl_interp.finalize"() : () -> ()
    }) : () -> ()
    "builtin.module"() <{sym_name = "rewriters"}> ({
      "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "success"}> ({
      ^bb0(%arg0: !pdl.operation):
        %0 = "pdl_interp.create_operation"() <{inputAttributeNames = [], name = "test.success", operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> !pdl.operation
        "pdl_interp.erase"(%arg0) : (!pdl.operation) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    "test.op"() : () -> ()
  }) {test.branch_1} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "matcher"}> ({
    ^bb0(%arg1: !pdl.operation):
      %1 = "pdl_interp.get_attribute"(%arg1) <{name = "test_attr"}> : (!pdl.operation) -> !pdl.attribute
      "pdl_interp.check_attribute"(%1)[^bb1, ^bb2] <{constantValue}> : (!pdl.attribute) -> ()
    ^bb1:  // pred: ^bb0
      "pdl_interp.record_match"(%arg1, %arg1)[^bb2] <{benefit = 1 : i16, operandSegmentSizes = array<i32: 1, 1>, rewriter = @rewriters::@success}> : (!pdl.operation, !pdl.operation) -> ()
    ^bb2:  // 2 preds: ^bb0, ^bb1
      "pdl_interp.finalize"() : () -> ()
    }) : () -> ()
    "builtin.module"() <{sym_name = "rewriters"}> ({
      "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "success"}> ({
      ^bb0(%arg0: !pdl.operation):
        %0 = "pdl_interp.create_operation"() <{inputAttributeNames = [], name = "test.success", operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> !pdl.operation
        "pdl_interp.erase"(%arg0) : (!pdl.operation) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    "test.op"() {test_attr} : () -> ()
  }) {test.check_attribute_1} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "matcher"}> ({
    ^bb0(%arg1: !pdl.operation):
      "pdl_interp.check_operand_count"(%arg1)[^bb1, ^bb3] <{compareAtLeast, count = 1 : i32}> : (!pdl.operation) -> ()
    ^bb1:  // pred: ^bb0
      "pdl_interp.check_operand_count"(%arg1)[^bb2, ^bb3] <{count = 2 : i32}> : (!pdl.operation) -> ()
    ^bb2:  // pred: ^bb1
      "pdl_interp.record_match"(%arg1, %arg1)[^bb3] <{benefit = 1 : i16, operandSegmentSizes = array<i32: 1, 1>, rewriter = @rewriters::@success}> : (!pdl.operation, !pdl.operation) -> ()
    ^bb3:  // 3 preds: ^bb0, ^bb1, ^bb2
      "pdl_interp.finalize"() : () -> ()
    }) : () -> ()
    "builtin.module"() <{sym_name = "rewriters"}> ({
      "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "success"}> ({
      ^bb0(%arg0: !pdl.operation):
        %1 = "pdl_interp.create_operation"() <{inputAttributeNames = [], name = "test.success", operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> !pdl.operation
        "pdl_interp.erase"(%arg0) : (!pdl.operation) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    %0 = "test.op"() : () -> i32
    "test.op"(%0, %0) : (i32, i32) -> ()
  }) {test.check_operand_count_1} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "matcher"}> ({
    ^bb0(%arg1: !pdl.operation):
      "pdl_interp.check_operation_name"(%arg1)[^bb1, ^bb2] <{name = "test.op"}> : (!pdl.operation) -> ()
    ^bb1:  // pred: ^bb0
      "pdl_interp.record_match"(%arg1, %arg1)[^bb2] <{benefit = 1 : i16, operandSegmentSizes = array<i32: 1, 1>, rewriter = @rewriters::@success}> : (!pdl.operation, !pdl.operation) -> ()
    ^bb2:  // 2 preds: ^bb0, ^bb1
      "pdl_interp.finalize"() : () -> ()
    }) : () -> ()
    "builtin.module"() <{sym_name = "rewriters"}> ({
      "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "success"}> ({
      ^bb0(%arg0: !pdl.operation):
        %0 = "pdl_interp.create_operation"() <{inputAttributeNames = [], name = "test.success", operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> !pdl.operation
        "pdl_interp.erase"(%arg0) : (!pdl.operation) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    "test.op"() : () -> ()
  }) {test.check_operation_name_1} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "matcher"}> ({
    ^bb0(%arg1: !pdl.operation):
      "pdl_interp.check_result_count"(%arg1)[^bb1, ^bb3] <{compareAtLeast, count = 1 : i32}> : (!pdl.operation) -> ()
    ^bb1:  // pred: ^bb0
      "pdl_interp.check_result_count"(%arg1)[^bb2, ^bb3] <{count = 2 : i32}> : (!pdl.operation) -> ()
    ^bb2:  // pred: ^bb1
      "pdl_interp.record_match"(%arg1, %arg1)[^bb3] <{benefit = 1 : i16, operandSegmentSizes = array<i32: 1, 1>, rewriter = @rewriters::@success}> : (!pdl.operation, !pdl.operation) -> ()
    ^bb3:  // 3 preds: ^bb0, ^bb1, ^bb2
      "pdl_interp.finalize"() : () -> ()
    }) : () -> ()
    "builtin.module"() <{sym_name = "rewriters"}> ({
      "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "success"}> ({
      ^bb0(%arg0: !pdl.operation):
        %2 = "pdl_interp.create_operation"() <{inputAttributeNames = [], name = "test.success", operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> !pdl.operation
        "pdl_interp.erase"(%arg0) : (!pdl.operation) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    %0 = "test.op"() : () -> i32
    %1:2 = "test.op"() : () -> (i32, i32)
  }) {test.check_result_count_1} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "matcher"}> ({
    ^bb0(%arg1: !pdl.operation):
      %1 = "pdl_interp.get_attribute"(%arg1) <{name = "test_attr"}> : (!pdl.operation) -> !pdl.attribute
      "pdl_interp.is_not_null"(%1)[^bb1, ^bb3] : (!pdl.attribute) -> ()
    ^bb1:  // pred: ^bb0
      %2 = "pdl_interp.get_attribute_type"(%1) : (!pdl.attribute) -> !pdl.type
      "pdl_interp.check_type"(%2)[^bb2, ^bb3] <{type = i32}> : (!pdl.type) -> ()
    ^bb2:  // pred: ^bb1
      "pdl_interp.record_match"(%arg1, %arg1)[^bb3] <{benefit = 1 : i16, operandSegmentSizes = array<i32: 1, 1>, rewriter = @rewriters::@success}> : (!pdl.operation, !pdl.operation) -> ()
    ^bb3:  // 3 preds: ^bb0, ^bb1, ^bb2
      "pdl_interp.finalize"() : () -> ()
    }) : () -> ()
    "builtin.module"() <{sym_name = "rewriters"}> ({
      "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "success"}> ({
      ^bb0(%arg0: !pdl.operation):
        %0 = "pdl_interp.create_operation"() <{inputAttributeNames = [], name = "test.success", operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> !pdl.operation
        "pdl_interp.erase"(%arg0) : (!pdl.operation) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    "test.op"() {test_attr = 10 : i32} : () -> ()
  }) {test.check_type_1} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "matcher"}> ({
    ^bb0(%arg1: !pdl.operation):
      %3 = "pdl_interp.get_results"(%arg1) : (!pdl.operation) -> !pdl.range<value>
      %4 = "pdl_interp.get_value_type"(%3) : (!pdl.range<value>) -> !pdl.range<type>
      "pdl_interp.check_types"(%4)[^bb1, ^bb2] <{types = [i32]}> : (!pdl.range<type>) -> ()
    ^bb1:  // pred: ^bb0
      "pdl_interp.record_match"(%arg1, %arg1)[^bb2] <{benefit = 1 : i16, operandSegmentSizes = array<i32: 1, 1>, rewriter = @rewriters::@success}> : (!pdl.operation, !pdl.operation) -> ()
    ^bb2:  // 2 preds: ^bb0, ^bb1
      "pdl_interp.finalize"() : () -> ()
    }) : () -> ()
    "builtin.module"() <{sym_name = "rewriters"}> ({
      "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "success"}> ({
      ^bb0(%arg0: !pdl.operation):
        %2 = "pdl_interp.create_operation"() <{inputAttributeNames = [], name = "test.success", operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> !pdl.operation
        "pdl_interp.erase"(%arg0) : (!pdl.operation) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    %0:2 = "test.op"() : () -> (i32, i64)
    %1 = "test.op"() : () -> i32
  }) {test.check_types_1} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  %0 = "arith.constant"() <{value = 10 : i64}> : () -> i64
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "matcher"}> ({
    ^bb0(%arg1: !pdl.operation):
      "pdl_interp.check_operation_name"(%arg1)[^bb1, ^bb2] <{name = "test.op"}> : (!pdl.operation) -> ()
    ^bb1:  // pred: ^bb0
      "pdl_interp.record_match"(%arg1, %arg1)[^bb2] <{benefit = 1 : i16, operandSegmentSizes = array<i32: 1, 1>, rewriter = @rewriters::@success}> : (!pdl.operation, !pdl.operation) -> ()
    ^bb2:  // 2 preds: ^bb0, ^bb1
      "pdl_interp.finalize"() : () -> ()
    }) : () -> ()
    "builtin.module"() <{sym_name = "rewriters"}> ({
      "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "success"}> ({
      ^bb0(%arg0: !pdl.operation):
        %2 = "pdl_interp.create_attribute"() <{value = true}> : () -> !pdl.attribute
        %3 = "pdl_interp.create_operation"(%2) <{inferredResultTypes, inputAttributeNames = ["value"], name = "arith.constant", operandSegmentSizes = array<i32: 0, 1, 0>}> : (!pdl.attribute) -> !pdl.operation
        %4 = "pdl_interp.get_results"(%3) : (!pdl.operation) -> !pdl.range<value>
        %5 = "pdl_interp.create_operation"(%4) <{inputAttributeNames = [], name = "test.success", operandSegmentSizes = array<i32: 1, 0, 0>}> : (!pdl.range<value>) -> !pdl.operation
        "pdl_interp.erase"(%arg0) : (!pdl.operation) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    %1:2 = "test.op"() : () -> (i64, i64)
  }) {test.create_op_infer_results} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "matcher"}> ({
    ^bb0(%arg1: !pdl.operation):
      "pdl_interp.check_operand_count"(%arg1)[^bb1, ^bb2] <{count = 2 : i32}> : (!pdl.operation) -> ()
    ^bb1:  // pred: ^bb0
      "pdl_interp.record_match"(%arg1, %arg1)[^bb2] <{benefit = 1 : i16, operandSegmentSizes = array<i32: 1, 1>, rewriter = @rewriters::@success}> : (!pdl.operation, !pdl.operation) -> ()
    ^bb2:  // 2 preds: ^bb0, ^bb1
      "pdl_interp.finalize"() : () -> ()
    }) : () -> ()
    "builtin.module"() <{sym_name = "rewriters"}> ({
      "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "success"}> ({
      ^bb0(%arg0: !pdl.operation):
        %1 = "pdl_interp.get_operand"(%arg0) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
        %2 = "pdl_interp.get_operands"(%arg0) : (!pdl.operation) -> !pdl.range<value>
        %3 = "pdl_interp.create_range"(%1, %2) : (!pdl.value, !pdl.range<value>) -> !pdl.range<value>
        %4 = "pdl_interp.get_value_type"(%1) : (!pdl.value) -> !pdl.type
        %5 = "pdl_interp.get_value_type"(%2) : (!pdl.range<value>) -> !pdl.range<type>
        %6 = "pdl_interp.create_range"(%4, %5) : (!pdl.type, !pdl.range<type>) -> !pdl.range<type>
        %7 = "pdl_interp.create_operation"(%3, %6) <{inputAttributeNames = [], name = "test.success", operandSegmentSizes = array<i32: 1, 0, 1>}> : (!pdl.range<value>, !pdl.range<type>) -> !pdl.operation
        "pdl_interp.erase"(%arg0) : (!pdl.operation) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    %0:2 = "test.input"() : () -> (i32, i32)
    "test.op"(%0#0, %0#1) : (i32, i32) -> ()
  }) {test.create_range_1} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "matcher"}> ({
    ^bb0(%arg1: !pdl.operation):
      %1 = "pdl_interp.get_attribute"(%arg1) <{name = "test_attr"}> : (!pdl.operation) -> !pdl.attribute
      "pdl_interp.is_not_null"(%1)[^bb1, ^bb3] : (!pdl.attribute) -> ()
    ^bb1:  // pred: ^bb0
      %2 = "pdl_interp.create_type"() <{value = i32}> : () -> !pdl.type
      %3 = "pdl_interp.get_attribute_type"(%1) : (!pdl.attribute) -> !pdl.type
      "pdl_interp.are_equal"(%3, %2)[^bb2, ^bb3] : (!pdl.type, !pdl.type) -> ()
    ^bb2:  // pred: ^bb1
      "pdl_interp.record_match"(%arg1, %arg1)[^bb3] <{benefit = 1 : i16, operandSegmentSizes = array<i32: 1, 1>, rewriter = @rewriters::@success}> : (!pdl.operation, !pdl.operation) -> ()
    ^bb3:  // 3 preds: ^bb0, ^bb1, ^bb2
      "pdl_interp.finalize"() : () -> ()
    }) : () -> ()
    "builtin.module"() <{sym_name = "rewriters"}> ({
      "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "success"}> ({
      ^bb0(%arg0: !pdl.operation):
        %0 = "pdl_interp.create_operation"() <{inputAttributeNames = [], name = "test.success", operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> !pdl.operation
        "pdl_interp.erase"(%arg0) : (!pdl.operation) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    "test.op"() {test_attr = 0 : i32} : () -> ()
  }) {test.create_type_1} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "matcher"}> ({
    ^bb0(%arg1: !pdl.operation):
      %4 = "pdl_interp.get_result"(%arg1) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
      %5 = "pdl_interp.get_users"(%4) : (!pdl.value) -> !pdl.range<operation>
      %6 = "pdl_interp.extract"(%5) <{index = 1 : i32}> : (!pdl.range<operation>) -> !pdl.operation
      "pdl_interp.is_not_null"(%6)[^bb1, ^bb2] : (!pdl.operation) -> ()
    ^bb1:  // pred: ^bb0
      "pdl_interp.record_match"(%6, %arg1)[^bb2] <{benefit = 1 : i16, operandSegmentSizes = array<i32: 1, 1>, rewriter = @rewriters::@success}> : (!pdl.operation, !pdl.operation) -> ()
    ^bb2:  // 2 preds: ^bb0, ^bb1
      "pdl_interp.finalize"() : () -> ()
    }) : () -> ()
    "builtin.module"() <{sym_name = "rewriters"}> ({
      "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "success"}> ({
      ^bb0(%arg0: !pdl.operation):
        %3 = "pdl_interp.create_operation"() <{inputAttributeNames = [], name = "test.success", operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> !pdl.operation
        "pdl_interp.erase"(%arg0) : (!pdl.operation) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    %0 = "test.op"() : () -> i32
    %1 = "test.op"(%0) : (i32) -> i32
    %2 = "test.op"(%0, %0) : (i32, i32) -> i32
  }) {test.extract_op} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "matcher"}> ({
    ^bb0(%arg1: !pdl.operation):
      %4 = "pdl_interp.get_results"(%arg1) : (!pdl.operation) -> !pdl.range<value>
      %5 = "pdl_interp.get_value_type"(%4) : (!pdl.range<value>) -> !pdl.range<type>
      %6 = "pdl_interp.extract"(%5) <{index = 1 : i32}> : (!pdl.range<type>) -> !pdl.type
      "pdl_interp.is_not_null"(%6)[^bb1, ^bb2] : (!pdl.type) -> ()
    ^bb1:  // pred: ^bb0
      "pdl_interp.record_match"(%arg1, %arg1)[^bb2] <{benefit = 1 : i16, operandSegmentSizes = array<i32: 1, 1>, rewriter = @rewriters::@success}> : (!pdl.operation, !pdl.operation) -> ()
    ^bb2:  // 2 preds: ^bb0, ^bb1
      "pdl_interp.finalize"() : () -> ()
    }) : () -> ()
    "builtin.module"() <{sym_name = "rewriters"}> ({
      "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "success"}> ({
      ^bb0(%arg0: !pdl.operation):
        %3 = "pdl_interp.create_operation"() <{inputAttributeNames = [], name = "test.success", operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> !pdl.operation
        "pdl_interp.erase"(%arg0) : (!pdl.operation) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    %0 = "test.op"() : () -> i32
    %1:2 = "test.op"(%0) : (i32) -> (i32, i32)
    %2 = "test.op"(%0) : (i32) -> i32
  }) {test.extract_type} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "matcher"}> ({
    ^bb0(%arg1: !pdl.operation):
      %4 = "pdl_interp.get_results"(%arg1) : (!pdl.operation) -> !pdl.range<value>
      %5 = "pdl_interp.extract"(%4) <{index = 1 : i32}> : (!pdl.range<value>) -> !pdl.value
      "pdl_interp.is_not_null"(%5)[^bb1, ^bb2] : (!pdl.value) -> ()
    ^bb1:  // pred: ^bb0
      "pdl_interp.record_match"(%arg1, %arg1)[^bb2] <{benefit = 1 : i16, operandSegmentSizes = array<i32: 1, 1>, rewriter = @rewriters::@success}> : (!pdl.operation, !pdl.operation) -> ()
    ^bb2:  // 2 preds: ^bb0, ^bb1
      "pdl_interp.finalize"() : () -> ()
    }) : () -> ()
    "builtin.module"() <{sym_name = "rewriters"}> ({
      "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "success"}> ({
      ^bb0(%arg0: !pdl.operation):
        %3 = "pdl_interp.create_operation"() <{inputAttributeNames = [], name = "test.success", operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> !pdl.operation
        "pdl_interp.erase"(%arg0) : (!pdl.operation) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    %0 = "test.op"() : () -> i32
    %1:2 = "test.op"(%0) : (i32) -> (i32, i32)
    %2 = "test.op"(%0) : (i32) -> i32
  }) {test.extract_value} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "matcher"}> ({
    ^bb0(%arg1: !pdl.operation):
      %8 = "pdl_interp.get_result"(%arg1) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
      %9 = "pdl_interp.get_users"(%8) : (!pdl.value) -> !pdl.range<operation>
      "pdl_interp.foreach"(%9)[^bb1] ({
      ^bb0(%arg2: !pdl.operation):
        %10 = "pdl_interp.get_result"(%arg2) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
        %11 = "pdl_interp.get_users"(%10) : (!pdl.value) -> !pdl.range<operation>
        "pdl_interp.foreach"(%11)[^bb1] ({
        ^bb0(%arg3: !pdl.operation):
          "pdl_interp.record_match"(%arg3, %arg1)[^bb1] <{benefit = 1 : i16, operandSegmentSizes = array<i32: 1, 1>, rewriter = @rewriters::@success}> : (!pdl.operation, !pdl.operation) -> ()
        ^bb1:  // pred: ^bb0
          "pdl_interp.continue"() : () -> ()
        }) : (!pdl.range<operation>) -> ()
      ^bb1:  // pred: ^bb0
        "pdl_interp.continue"() : () -> ()
      }) : (!pdl.range<operation>) -> ()
    ^bb1:  // pred: ^bb0
      "pdl_interp.finalize"() : () -> ()
    }) : () -> ()
    "builtin.module"() <{sym_name = "rewriters"}> ({
      "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "success"}> ({
      ^bb0(%arg0: !pdl.operation):
        %7 = "pdl_interp.create_operation"() <{inputAttributeNames = [], name = "test.success", operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> !pdl.operation
        "pdl_interp.erase"(%arg0) : (!pdl.operation) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    %0 = "test.op"() : () -> i32
    %1 = "test.op"(%0) : (i32) -> i32
    %2 = "test.op"(%1) : (i32) -> i32
    %3 = "test.op"(%1) : (i32) -> i32
    %4 = "test.op"(%0) : (i32) -> i32
    %5 = "test.op"(%4) : (i32) -> i32
    %6 = "test.op"(%4) : (i32) -> i32
  }) {test.foreach} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "matcher"}> ({
    ^bb0(%arg1: !pdl.operation):
      %4 = "pdl_interp.get_result"(%arg1) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
      %5 = "pdl_interp.get_users"(%4) : (!pdl.value) -> !pdl.range<operation>
      "pdl_interp.foreach"(%5)[^bb1] ({
      ^bb0(%arg2: !pdl.operation):
        "pdl_interp.record_match"(%arg2, %arg1)[^bb1] <{benefit = 1 : i16, operandSegmentSizes = array<i32: 1, 1>, rewriter = @rewriters::@success}> : (!pdl.operation, !pdl.operation) -> ()
      ^bb1:  // pred: ^bb0
        "pdl_interp.continue"() : () -> ()
      }) : (!pdl.range<operation>) -> ()
    ^bb1:  // pred: ^bb0
      "pdl_interp.finalize"() : () -> ()
    }) : () -> ()
    "builtin.module"() <{sym_name = "rewriters"}> ({
      "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "success"}> ({
      ^bb0(%arg0: !pdl.operation):
        %3 = "pdl_interp.create_operation"() <{inputAttributeNames = [], name = "test.success", operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> !pdl.operation
        "pdl_interp.erase"(%arg0) : (!pdl.operation) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    %0 = "test.op"() : () -> i32
    %1 = "test.op"(%0) : (i32) -> i32
    %2 = "test.op"(%0, %0) : (i32, i32) -> i32
  }) {test.get_users_of_value} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "matcher"}> ({
    ^bb0(%arg1: !pdl.operation):
      "pdl_interp.check_result_count"(%arg1)[^bb1, ^bb2] <{compareAtLeast, count = 2 : i32}> : (!pdl.operation) -> ()
    ^bb1:  // pred: ^bb0
      %4 = "pdl_interp.get_results"(%arg1) : (!pdl.operation) -> !pdl.range<value>
      %5 = "pdl_interp.get_users"(%4) : (!pdl.range<value>) -> !pdl.range<operation>
      "pdl_interp.foreach"(%5)[^bb2] ({
      ^bb0(%arg2: !pdl.operation):
        "pdl_interp.record_match"(%arg2, %arg1)[^bb1] <{benefit = 1 : i16, operandSegmentSizes = array<i32: 1, 1>, rewriter = @rewriters::@success}> : (!pdl.operation, !pdl.operation) -> ()
      ^bb1:  // pred: ^bb0
        "pdl_interp.continue"() : () -> ()
      }) : (!pdl.range<operation>) -> ()
    ^bb2:  // 2 preds: ^bb0, ^bb1
      "pdl_interp.finalize"() : () -> ()
    }) : () -> ()
    "builtin.module"() <{sym_name = "rewriters"}> ({
      "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "success"}> ({
      ^bb0(%arg0: !pdl.operation):
        %3 = "pdl_interp.create_operation"() <{inputAttributeNames = [], name = "test.success", operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> !pdl.operation
        "pdl_interp.erase"(%arg0) : (!pdl.operation) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    %0:2 = "test.op"() : () -> (i32, i32)
    %1 = "test.op"(%0#0) : (i32) -> i32
    %2 = "test.op"(%0#1) : (i32) -> i32
  }) {test.get_all_users_of_range} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "matcher"}> ({
    ^bb0(%arg1: !pdl.operation):
      "pdl_interp.check_result_count"(%arg1)[^bb1, ^bb2] <{compareAtLeast, count = 2 : i32}> : (!pdl.operation) -> ()
    ^bb1:  // pred: ^bb0
      %4 = "pdl_interp.get_results"(%arg1) : (!pdl.operation) -> !pdl.range<value>
      %5 = "pdl_interp.extract"(%4) <{index = 0 : i32}> : (!pdl.range<value>) -> !pdl.value
      %6 = "pdl_interp.get_users"(%5) : (!pdl.value) -> !pdl.range<operation>
      "pdl_interp.foreach"(%6)[^bb2] ({
      ^bb0(%arg2: !pdl.operation):
        "pdl_interp.record_match"(%arg2, %arg1)[^bb1] <{benefit = 1 : i16, operandSegmentSizes = array<i32: 1, 1>, rewriter = @rewriters::@success}> : (!pdl.operation, !pdl.operation) -> ()
      ^bb1:  // pred: ^bb0
        "pdl_interp.continue"() : () -> ()
      }) : (!pdl.range<operation>) -> ()
    ^bb2:  // 2 preds: ^bb0, ^bb1
      "pdl_interp.finalize"() : () -> ()
    }) : () -> ()
    "builtin.module"() <{sym_name = "rewriters"}> ({
      "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "success"}> ({
      ^bb0(%arg0: !pdl.operation):
        %3 = "pdl_interp.create_operation"() <{inputAttributeNames = [], name = "test.success", operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> !pdl.operation
        "pdl_interp.erase"(%arg0) : (!pdl.operation) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    %0:2 = "test.op"() : () -> (i32, i32)
    %1 = "test.op"(%0#0) : (i32) -> i32
    %2 = "test.op"(%0#1) : (i32) -> i32
  }) {test.get_first_users_of_range} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "matcher"}> ({
    ^bb0(%arg1: !pdl.operation):
      "pdl_interp.check_operand_count"(%arg1)[^bb1, ^bb3] <{count = 5 : i32}> : (!pdl.operation) -> ()
    ^bb1:  // pred: ^bb0
      %3 = "pdl_interp.get_operand"(%arg1) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
      %4 = "pdl_interp.get_operand"(%arg1) <{index = 4 : i32}> : (!pdl.operation) -> !pdl.value
      %5 = "pdl_interp.get_defining_op"(%3) : (!pdl.value) -> !pdl.operation
      %6 = "pdl_interp.get_defining_op"(%4) : (!pdl.value) -> !pdl.operation
      "pdl_interp.are_equal"(%5, %6)[^bb2, ^bb3] : (!pdl.operation, !pdl.operation) -> ()
    ^bb2:  // pred: ^bb1
      "pdl_interp.record_match"(%arg1, %arg1)[^bb3] <{benefit = 1 : i16, operandSegmentSizes = array<i32: 1, 1>, rewriter = @rewriters::@success}> : (!pdl.operation, !pdl.operation) -> ()
    ^bb3:  // 3 preds: ^bb0, ^bb1, ^bb2
      "pdl_interp.finalize"() : () -> ()
    }) : () -> ()
    "builtin.module"() <{sym_name = "rewriters"}> ({
      "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "success"}> ({
      ^bb0(%arg0: !pdl.operation):
        %2 = "pdl_interp.create_operation"() <{inputAttributeNames = [], name = "test.success", operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> !pdl.operation
        "pdl_interp.erase"(%arg0) : (!pdl.operation) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    %0 = "test.op"() : () -> i32
    %1 = "test.op"() : () -> i32
    "test.op"(%0, %0, %0, %0, %0) : (i32, i32, i32, i32, i32) -> ()
    "test.op"(%0, %0, %0, %0, %1) : (i32, i32, i32, i32, i32) -> ()
  }) {test.get_defining_op_1} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "matcher"}> ({
    ^bb0(%arg1: !pdl.operation):
      "pdl_interp.check_operand_count"(%arg1)[^bb1, ^bb3] <{count = 2 : i32}> : (!pdl.operation) -> ()
    ^bb1:  // pred: ^bb0
      %2 = "pdl_interp.get_operands"(%arg1) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.range<value>
      %3 = "pdl_interp.get_operands"(%arg1) : (!pdl.operation) -> !pdl.range<value>
      "pdl_interp.are_equal"(%2, %3)[^bb2, ^bb3] : (!pdl.range<value>, !pdl.range<value>) -> ()
    ^bb2:  // pred: ^bb1
      "pdl_interp.record_match"(%arg1, %arg1)[^bb3] <{benefit = 1 : i16, operandSegmentSizes = array<i32: 1, 1>, rewriter = @rewriters::@success}> : (!pdl.operation, !pdl.operation) -> ()
    ^bb3:  // 3 preds: ^bb0, ^bb1, ^bb2
      "pdl_interp.finalize"() : () -> ()
    }) : () -> ()
    "builtin.module"() <{sym_name = "rewriters"}> ({
      "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "success"}> ({
      ^bb0(%arg0: !pdl.operation):
        %1 = "pdl_interp.create_operation"() <{inputAttributeNames = [], name = "test.success", operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> !pdl.operation
        "pdl_interp.erase"(%arg0) : (!pdl.operation) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    %0:2 = "test.producer"() : () -> (i32, i32)
    "test.op"(%0#0, %0#1) : (i32, i32) -> ()
  }) {test.get_operands_1} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "matcher"}> ({
    ^bb0(%arg5: !pdl.operation):
      "pdl_interp.check_operation_name"(%arg5)[^bb1, ^bb9] <{name = "test.attr_sized_operands"}> : (!pdl.operation) -> ()
    ^bb1:  // pred: ^bb0
      %5 = "pdl_interp.get_operands"(%arg5) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.range<value>
      "pdl_interp.is_not_null"(%5)[^bb2, ^bb9] : (!pdl.range<value>) -> ()
    ^bb2:  // pred: ^bb1
      %6 = "pdl_interp.get_operands"(%arg5) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
      "pdl_interp.is_not_null"(%6)[^bb9, ^bb3] : (!pdl.value) -> ()
    ^bb3:  // pred: ^bb2
      %7 = "pdl_interp.get_operands"(%arg5) <{index = 1 : i32}> : (!pdl.operation) -> !pdl.range<value>
      "pdl_interp.is_not_null"(%7)[^bb4, ^bb9] : (!pdl.range<value>) -> ()
    ^bb4:  // pred: ^bb3
      %8 = "pdl_interp.get_operands"(%arg5) <{index = 1 : i32}> : (!pdl.operation) -> !pdl.value
      "pdl_interp.is_not_null"(%8)[^bb9, ^bb5] : (!pdl.value) -> ()
    ^bb5:  // pred: ^bb4
      %9 = "pdl_interp.get_operands"(%arg5) <{index = 2 : i32}> : (!pdl.operation) -> !pdl.range<value>
      "pdl_interp.is_not_null"(%9)[^bb6, ^bb9] : (!pdl.range<value>) -> ()
    ^bb6:  // pred: ^bb5
      %10 = "pdl_interp.get_operands"(%arg5) <{index = 2 : i32}> : (!pdl.operation) -> !pdl.value
      "pdl_interp.is_not_null"(%10)[^bb7, ^bb9] : (!pdl.value) -> ()
    ^bb7:  // pred: ^bb6
      %11 = "pdl_interp.get_operands"(%arg5) <{index = 50 : i32}> : (!pdl.operation) -> !pdl.value
      "pdl_interp.is_not_null"(%11)[^bb9, ^bb8] : (!pdl.value) -> ()
    ^bb8:  // pred: ^bb7
      "pdl_interp.record_match"(%arg5, %5, %7, %9, %10, %arg5)[^bb9] <{benefit = 1 : i16, operandSegmentSizes = array<i32: 5, 1>, rewriter = @rewriters::@success}> : (!pdl.operation, !pdl.range<value>, !pdl.range<value>, !pdl.range<value>, !pdl.value, !pdl.operation) -> ()
    ^bb9:  // 9 preds: ^bb0, ^bb1, ^bb2, ^bb3, ^bb4, ^bb5, ^bb6, ^bb7, ^bb8
      "pdl_interp.finalize"() : () -> ()
    }) : () -> ()
    "builtin.module"() <{sym_name = "rewriters"}> ({
      "pdl_interp.func"() <{function_type = (!pdl.operation, !pdl.range<value>, !pdl.range<value>, !pdl.range<value>, !pdl.value) -> (), sym_name = "success"}> ({
      ^bb0(%arg0: !pdl.operation, %arg1: !pdl.range<value>, %arg2: !pdl.range<value>, %arg3: !pdl.range<value>, %arg4: !pdl.value):
        %1 = "pdl_interp.create_operation"(%arg1) <{inputAttributeNames = [], name = "test.success", operandSegmentSizes = array<i32: 1, 0, 0>}> : (!pdl.range<value>) -> !pdl.operation
        %2 = "pdl_interp.create_operation"(%arg2) <{inputAttributeNames = [], name = "test.success", operandSegmentSizes = array<i32: 1, 0, 0>}> : (!pdl.range<value>) -> !pdl.operation
        %3 = "pdl_interp.create_operation"(%arg3) <{inputAttributeNames = [], name = "test.success", operandSegmentSizes = array<i32: 1, 0, 0>}> : (!pdl.range<value>) -> !pdl.operation
        %4 = "pdl_interp.create_operation"(%arg4) <{inputAttributeNames = [], name = "test.success", operandSegmentSizes = array<i32: 1, 0, 0>}> : (!pdl.value) -> !pdl.operation
        "pdl_interp.erase"(%arg0) : (!pdl.operation) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    %0:5 = "test.producer"() : () -> (i32, i32, i32, i32, i32)
    "test.attr_sized_operands"(%0#0, %0#1, %0#2, %0#3, %0#4) <{operandSegmentSizes = array<i32: 0, 4, 1, 0>}> : (i32, i32, i32, i32, i32) -> ()
  }) {test.get_operands_2} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "matcher"}> ({
    ^bb0(%arg1: !pdl.operation):
      "pdl_interp.check_result_count"(%arg1)[^bb1, ^bb3] <{count = 5 : i32}> : (!pdl.operation) -> ()
    ^bb1:  // pred: ^bb0
      %3 = "pdl_interp.get_result"(%arg1) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
      %4 = "pdl_interp.get_result"(%arg1) <{index = 4 : i32}> : (!pdl.operation) -> !pdl.value
      %5 = "pdl_interp.get_value_type"(%3) : (!pdl.value) -> !pdl.type
      %6 = "pdl_interp.get_value_type"(%4) : (!pdl.value) -> !pdl.type
      "pdl_interp.are_equal"(%5, %6)[^bb2, ^bb3] : (!pdl.type, !pdl.type) -> ()
    ^bb2:  // pred: ^bb1
      "pdl_interp.record_match"(%arg1, %arg1)[^bb3] <{benefit = 1 : i16, operandSegmentSizes = array<i32: 1, 1>, rewriter = @rewriters::@success}> : (!pdl.operation, !pdl.operation) -> ()
    ^bb3:  // 3 preds: ^bb0, ^bb1, ^bb2
      "pdl_interp.finalize"() : () -> ()
    }) : () -> ()
    "builtin.module"() <{sym_name = "rewriters"}> ({
      "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "success"}> ({
      ^bb0(%arg0: !pdl.operation):
        %2 = "pdl_interp.create_operation"() <{inputAttributeNames = [], name = "test.success", operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> !pdl.operation
        "pdl_interp.erase"(%arg0) : (!pdl.operation) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    %0:5 = "test.op"() : () -> (i32, i32, i32, i32, i32)
    %1:5 = "test.op"() : () -> (i32, i32, i32, i32, i64)
  }) {test.get_result_1} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "matcher"}> ({
    ^bb0(%arg1: !pdl.operation):
      "pdl_interp.check_result_count"(%arg1)[^bb1, ^bb3] <{count = 5 : i32}> : (!pdl.operation) -> ()
    ^bb1:  // pred: ^bb0
      %2 = "pdl_interp.get_results"(%arg1) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.range<value>
      %3 = "pdl_interp.get_results"(%arg1) : (!pdl.operation) -> !pdl.range<value>
      "pdl_interp.are_equal"(%2, %3)[^bb2, ^bb3] : (!pdl.range<value>, !pdl.range<value>) -> ()
    ^bb2:  // pred: ^bb1
      "pdl_interp.record_match"(%arg1, %arg1)[^bb3] <{benefit = 1 : i16, operandSegmentSizes = array<i32: 1, 1>, rewriter = @rewriters::@success}> : (!pdl.operation, !pdl.operation) -> ()
    ^bb3:  // 3 preds: ^bb0, ^bb1, ^bb2
      "pdl_interp.finalize"() : () -> ()
    }) : () -> ()
    "builtin.module"() <{sym_name = "rewriters"}> ({
      "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "success"}> ({
      ^bb0(%arg0: !pdl.operation):
        %1 = "pdl_interp.create_operation"() <{inputAttributeNames = [], name = "test.success", operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> !pdl.operation
        "pdl_interp.erase"(%arg0) : (!pdl.operation) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    %0:5 = "test.producer"() : () -> (i32, i32, i32, i32, i32)
  }) {test.get_results_1} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "matcher"}> ({
    ^bb0(%arg5: !pdl.operation):
      "pdl_interp.check_operation_name"(%arg5)[^bb1, ^bb9] <{name = "test.attr_sized_results"}> : (!pdl.operation) -> ()
    ^bb1:  // pred: ^bb0
      %12 = "pdl_interp.get_results"(%arg5) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.range<value>
      "pdl_interp.is_not_null"(%12)[^bb2, ^bb9] : (!pdl.range<value>) -> ()
    ^bb2:  // pred: ^bb1
      %13 = "pdl_interp.get_results"(%arg5) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
      "pdl_interp.is_not_null"(%13)[^bb9, ^bb3] : (!pdl.value) -> ()
    ^bb3:  // pred: ^bb2
      %14 = "pdl_interp.get_results"(%arg5) <{index = 1 : i32}> : (!pdl.operation) -> !pdl.range<value>
      "pdl_interp.is_not_null"(%14)[^bb4, ^bb9] : (!pdl.range<value>) -> ()
    ^bb4:  // pred: ^bb3
      %15 = "pdl_interp.get_results"(%arg5) <{index = 1 : i32}> : (!pdl.operation) -> !pdl.value
      "pdl_interp.is_not_null"(%15)[^bb9, ^bb5] : (!pdl.value) -> ()
    ^bb5:  // pred: ^bb4
      %16 = "pdl_interp.get_results"(%arg5) <{index = 2 : i32}> : (!pdl.operation) -> !pdl.range<value>
      "pdl_interp.is_not_null"(%16)[^bb6, ^bb9] : (!pdl.range<value>) -> ()
    ^bb6:  // pred: ^bb5
      %17 = "pdl_interp.get_results"(%arg5) <{index = 2 : i32}> : (!pdl.operation) -> !pdl.value
      "pdl_interp.is_not_null"(%17)[^bb7, ^bb9] : (!pdl.value) -> ()
    ^bb7:  // pred: ^bb6
      %18 = "pdl_interp.get_results"(%arg5) <{index = 50 : i32}> : (!pdl.operation) -> !pdl.value
      "pdl_interp.is_not_null"(%18)[^bb9, ^bb8] : (!pdl.value) -> ()
    ^bb8:  // pred: ^bb7
      "pdl_interp.record_match"(%arg5, %12, %14, %16, %17, %arg5)[^bb9] <{benefit = 1 : i16, operandSegmentSizes = array<i32: 5, 1>, rewriter = @rewriters::@success}> : (!pdl.operation, !pdl.range<value>, !pdl.range<value>, !pdl.range<value>, !pdl.value, !pdl.operation) -> ()
    ^bb9:  // 9 preds: ^bb0, ^bb1, ^bb2, ^bb3, ^bb4, ^bb5, ^bb6, ^bb7, ^bb8
      "pdl_interp.finalize"() : () -> ()
    }) : () -> ()
    "builtin.module"() <{sym_name = "rewriters"}> ({
      "pdl_interp.func"() <{function_type = (!pdl.operation, !pdl.range<value>, !pdl.range<value>, !pdl.range<value>, !pdl.value) -> (), sym_name = "success"}> ({
      ^bb0(%arg0: !pdl.operation, %arg1: !pdl.range<value>, %arg2: !pdl.range<value>, %arg3: !pdl.range<value>, %arg4: !pdl.value):
        %1 = "pdl_interp.get_value_type"(%arg1) : (!pdl.range<value>) -> !pdl.range<type>
        %2 = "pdl_interp.get_value_type"(%arg2) : (!pdl.range<value>) -> !pdl.range<type>
        %3 = "pdl_interp.get_value_type"(%arg3) : (!pdl.range<value>) -> !pdl.range<type>
        %4 = "pdl_interp.get_value_type"(%arg4) : (!pdl.value) -> !pdl.type
        %5 = "pdl_interp.create_operation"(%1) <{inputAttributeNames = [], name = "test.success", operandSegmentSizes = array<i32: 0, 0, 1>}> : (!pdl.range<type>) -> !pdl.operation
        %6 = "pdl_interp.create_operation"(%2) <{inputAttributeNames = [], name = "test.success", operandSegmentSizes = array<i32: 0, 0, 1>}> : (!pdl.range<type>) -> !pdl.operation
        %7 = "pdl_interp.create_operation"(%3) <{inputAttributeNames = [], name = "test.success", operandSegmentSizes = array<i32: 0, 0, 1>}> : (!pdl.range<type>) -> !pdl.operation
        %8 = "pdl_interp.create_operation"(%4) <{inputAttributeNames = [], name = "test.success", operandSegmentSizes = array<i32: 0, 0, 1>}> : (!pdl.type) -> !pdl.operation
        %9 = "pdl_interp.get_results"(%5) : (!pdl.operation) -> !pdl.range<value>
        %10 = "pdl_interp.get_results"(%6) : (!pdl.operation) -> !pdl.range<value>
        %11 = "pdl_interp.get_results"(%7) : (!pdl.operation) -> !pdl.range<value>
        "pdl_interp.replace"(%arg0, %9, %10, %11) : (!pdl.operation, !pdl.range<value>, !pdl.range<value>, !pdl.range<value>) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    %0:5 = "test.attr_sized_results"() <{resultSegmentSizes = array<i32: 0, 4, 1, 0>}> : () -> (i32, i32, i32, i32, i32)
    "test.consumer"(%0#0, %0#1, %0#2, %0#3, %0#4) : (i32, i32, i32, i32, i32) -> ()
  }) {test.get_results_2} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "matcher"}> ({
    ^bb0(%arg2: !pdl.operation):
      "pdl_interp.check_operation_name"(%arg2)[^bb1, ^bb3] <{name = "test.op"}> : (!pdl.operation) -> ()
    ^bb1:  // pred: ^bb0
      "pdl_interp.record_match"(%arg2, %arg2)[^bb2] <{benefit = 1 : i16, operandSegmentSizes = array<i32: 1, 1>, rewriter = @rewriters::@failure}> : (!pdl.operation, !pdl.operation) -> ()
    ^bb2:  // pred: ^bb1
      "pdl_interp.record_match"(%arg2, %arg2)[^bb3] <{benefit = 2 : i16, operandSegmentSizes = array<i32: 1, 1>, rewriter = @rewriters::@success}> : (!pdl.operation, !pdl.operation) -> ()
    ^bb3:  // 2 preds: ^bb0, ^bb2
      "pdl_interp.finalize"() : () -> ()
    }) : () -> ()
    "builtin.module"() <{sym_name = "rewriters"}> ({
      "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "failure"}> ({
      ^bb0(%arg1: !pdl.operation):
        "pdl_interp.erase"(%arg1) : (!pdl.operation) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
      "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "success"}> ({
      ^bb0(%arg0: !pdl.operation):
        %0 = "pdl_interp.create_operation"() <{inputAttributeNames = [], name = "test.success", operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> !pdl.operation
        "pdl_interp.erase"(%arg0) : (!pdl.operation) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    "test.op"() : () -> ()
  }) {test.record_match_1} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "matcher"}> ({
    ^bb0(%arg3: !pdl.operation):
      "pdl_interp.check_operation_name"(%arg3)[^bb1, ^bb2] <{name = "test.op"}> : (!pdl.operation) -> ()
    ^bb1:  // pred: ^bb0
      %4 = "pdl_interp.get_operands"(%arg3) : (!pdl.operation) -> !pdl.range<value>
      %5 = "pdl_interp.get_results"(%arg3) : (!pdl.operation) -> !pdl.range<value>
      %6 = "pdl_interp.get_value_type"(%5) : (!pdl.range<value>) -> !pdl.range<type>
      "pdl_interp.record_match"(%4, %6, %arg3, %arg3)[^bb2] <{benefit = 1 : i16, operandSegmentSizes = array<i32: 3, 1>, rewriter = @rewriters::@success}> : (!pdl.range<value>, !pdl.range<type>, !pdl.operation, !pdl.operation) -> ()
    ^bb2:  // 2 preds: ^bb0, ^bb1
      "pdl_interp.finalize"() : () -> ()
    }) : () -> ()
    "builtin.module"() <{sym_name = "rewriters"}> ({
      "pdl_interp.func"() <{function_type = (!pdl.range<value>, !pdl.range<type>, !pdl.operation) -> (), sym_name = "success"}> ({
      ^bb0(%arg0: !pdl.range<value>, %arg1: !pdl.range<type>, %arg2: !pdl.operation):
        %2 = "pdl_interp.create_operation"(%arg0, %arg1) <{inputAttributeNames = [], name = "test.success", operandSegmentSizes = array<i32: 1, 0, 1>}> : (!pdl.range<value>, !pdl.range<type>) -> !pdl.operation
        %3 = "pdl_interp.get_results"(%2) : (!pdl.operation) -> !pdl.range<value>
        "pdl_interp.replace"(%arg2, %3) : (!pdl.operation, !pdl.range<value>) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    %0 = "test.producer"() : () -> i32
    %1:2 = "test.op"(%0) : (i32) -> (i64, i32)
    "test.consumer"(%1#0, %1#1) : (i64, i32) -> ()
  }) {test.record_match_2} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "matcher"}> ({
    ^bb0(%arg1: !pdl.operation):
      "pdl_interp.check_operation_name"(%arg1)[^bb1, ^bb2] <{name = "test.op"}> : (!pdl.operation) -> ()
    ^bb1:  // pred: ^bb0
      "pdl_interp.record_match"(%arg1, %arg1)[^bb2] <{benefit = 1 : i16, operandSegmentSizes = array<i32: 1, 1>, rewriter = @rewriters::@success}> : (!pdl.operation, !pdl.operation) -> ()
    ^bb2:  // 2 preds: ^bb0, ^bb1
      "pdl_interp.finalize"() : () -> ()
    }) : () -> ()
    "builtin.module"() <{sym_name = "rewriters"}> ({
      "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "success"}> ({
      ^bb0(%arg0: !pdl.operation):
        %2 = "pdl_interp.get_operand"(%arg0) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
        "pdl_interp.replace"(%arg0, %2) : (!pdl.operation, !pdl.value) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    %0 = "test.op_input"() : () -> i32
    %1 = "test.op"(%0) : (i32) -> i32
    "test.op_consumer"(%1) : (i32) -> ()
  }) {test.replace_op_1} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "matcher"}> ({
    ^bb0(%arg1: !pdl.operation):
      %1 = "pdl_interp.get_attribute"(%arg1) <{name = "test_attr"}> : (!pdl.operation) -> !pdl.attribute
      "pdl_interp.switch_attribute"(%1)[^bb3, ^bb3, ^bb1] <{caseValues = [0, unit]}> : (!pdl.attribute) -> ()
    ^bb1:  // pred: ^bb0
      %2 = "pdl_interp.get_attribute"(%arg1) <{name = "test_attr_2"}> : (!pdl.operation) -> !pdl.attribute
      "pdl_interp.switch_attribute"(%2)[^bb2, ^bb3, ^bb3] <{caseValues = [0, unit]}> : (!pdl.attribute) -> ()
    ^bb2:  // pred: ^bb1
      "pdl_interp.record_match"(%arg1, %arg1)[^bb3] <{benefit = 1 : i16, operandSegmentSizes = array<i32: 1, 1>, rewriter = @rewriters::@success}> : (!pdl.operation, !pdl.operation) -> ()
    ^bb3:  // 5 preds: ^bb0, ^bb0, ^bb1, ^bb1, ^bb2
      "pdl_interp.finalize"() : () -> ()
    }) : () -> ()
    "builtin.module"() <{sym_name = "rewriters"}> ({
      "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "success"}> ({
      ^bb0(%arg0: !pdl.operation):
        %0 = "pdl_interp.create_operation"() <{inputAttributeNames = [], name = "test.success", operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> !pdl.operation
        "pdl_interp.erase"(%arg0) : (!pdl.operation) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    "test.op"() {test_attr} : () -> ()
  }) {test.switch_attribute_1} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "matcher"}> ({
    ^bb0(%arg1: !pdl.operation):
      "pdl_interp.switch_operand_count"(%arg1)[^bb3, ^bb3, ^bb1] <{caseValues = dense<[0, 1]> : vector<2xi32>}> : (!pdl.operation) -> ()
    ^bb1:  // pred: ^bb0
      "pdl_interp.switch_operand_count"(%arg1)[^bb2, ^bb3, ^bb3] <{caseValues = dense<[0, 2]> : vector<2xi32>}> : (!pdl.operation) -> ()
    ^bb2:  // pred: ^bb1
      "pdl_interp.record_match"(%arg1, %arg1)[^bb3] <{benefit = 1 : i16, operandSegmentSizes = array<i32: 1, 1>, rewriter = @rewriters::@success}> : (!pdl.operation, !pdl.operation) -> ()
    ^bb3:  // 5 preds: ^bb0, ^bb0, ^bb1, ^bb1, ^bb2
      "pdl_interp.finalize"() : () -> ()
    }) : () -> ()
    "builtin.module"() <{sym_name = "rewriters"}> ({
      "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "success"}> ({
      ^bb0(%arg0: !pdl.operation):
        %1 = "pdl_interp.create_operation"() <{inputAttributeNames = [], name = "test.success", operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> !pdl.operation
        "pdl_interp.erase"(%arg0) : (!pdl.operation) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    %0 = "test.op_input"() : () -> i32
    "test.op"(%0) : (i32) -> ()
  }) {test.switch_operand_1} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "matcher"}> ({
    ^bb0(%arg1: !pdl.operation):
      "pdl_interp.switch_operation_name"(%arg1)[^bb3, ^bb3, ^bb1] <{caseValues = ["foo.op", "test.op"]}> : (!pdl.operation) -> ()
    ^bb1:  // pred: ^bb0
      "pdl_interp.switch_operation_name"(%arg1)[^bb2, ^bb3, ^bb3] <{caseValues = ["foo.op", "bar.op"]}> : (!pdl.operation) -> ()
    ^bb2:  // pred: ^bb1
      "pdl_interp.record_match"(%arg1, %arg1)[^bb3] <{benefit = 1 : i16, operandSegmentSizes = array<i32: 1, 1>, rewriter = @rewriters::@success}> : (!pdl.operation, !pdl.operation) -> ()
    ^bb3:  // 5 preds: ^bb0, ^bb0, ^bb1, ^bb1, ^bb2
      "pdl_interp.finalize"() : () -> ()
    }) : () -> ()
    "builtin.module"() <{sym_name = "rewriters"}> ({
      "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "success"}> ({
      ^bb0(%arg0: !pdl.operation):
        %0 = "pdl_interp.create_operation"() <{inputAttributeNames = [], name = "test.success", operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> !pdl.operation
        "pdl_interp.erase"(%arg0) : (!pdl.operation) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    "test.op"() : () -> ()
  }) {test.switch_operation_name_1} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "matcher"}> ({
    ^bb0(%arg1: !pdl.operation):
      "pdl_interp.switch_result_count"(%arg1)[^bb3, ^bb3, ^bb1] <{caseValues = dense<[0, 1]> : vector<2xi32>}> : (!pdl.operation) -> ()
    ^bb1:  // pred: ^bb0
      "pdl_interp.switch_result_count"(%arg1)[^bb2, ^bb3, ^bb3] <{caseValues = dense<[0, 2]> : vector<2xi32>}> : (!pdl.operation) -> ()
    ^bb2:  // pred: ^bb1
      "pdl_interp.record_match"(%arg1, %arg1)[^bb3] <{benefit = 1 : i16, operandSegmentSizes = array<i32: 1, 1>, rewriter = @rewriters::@success}> : (!pdl.operation, !pdl.operation) -> ()
    ^bb3:  // 5 preds: ^bb0, ^bb0, ^bb1, ^bb1, ^bb2
      "pdl_interp.finalize"() : () -> ()
    }) : () -> ()
    "builtin.module"() <{sym_name = "rewriters"}> ({
      "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "success"}> ({
      ^bb0(%arg0: !pdl.operation):
        %1 = "pdl_interp.create_operation"() <{inputAttributeNames = [], name = "test.success", operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> !pdl.operation
        "pdl_interp.erase"(%arg0) : (!pdl.operation) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    %0 = "test.op"() : () -> i32
  }) {test.switch_result_1} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "matcher"}> ({
    ^bb0(%arg1: !pdl.operation):
      %1 = "pdl_interp.get_attribute"(%arg1) <{name = "test_attr"}> : (!pdl.operation) -> !pdl.attribute
      "pdl_interp.is_not_null"(%1)[^bb1, ^bb4] : (!pdl.attribute) -> ()
    ^bb1:  // pred: ^bb0
      %2 = "pdl_interp.get_attribute_type"(%1) : (!pdl.attribute) -> !pdl.type
      "pdl_interp.switch_type"(%2)[^bb4, ^bb2, ^bb4] <{caseValues = [i32, i64]}> : (!pdl.type) -> ()
    ^bb2:  // pred: ^bb1
      "pdl_interp.switch_type"(%2)[^bb3, ^bb4, ^bb4] <{caseValues = [i16, i64]}> : (!pdl.type) -> ()
    ^bb3:  // pred: ^bb2
      "pdl_interp.record_match"(%arg1, %arg1)[^bb4] <{benefit = 1 : i16, operandSegmentSizes = array<i32: 1, 1>, rewriter = @rewriters::@success}> : (!pdl.operation, !pdl.operation) -> ()
    ^bb4:  // 6 preds: ^bb0, ^bb1, ^bb1, ^bb2, ^bb2, ^bb3
      "pdl_interp.finalize"() : () -> ()
    }) : () -> ()
    "builtin.module"() <{sym_name = "rewriters"}> ({
      "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "success"}> ({
      ^bb0(%arg0: !pdl.operation):
        %0 = "pdl_interp.create_operation"() <{inputAttributeNames = [], name = "test.success", operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> !pdl.operation
        "pdl_interp.erase"(%arg0) : (!pdl.operation) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    "test.op"() {test_attr = 10 : i32} : () -> ()
  }) {test.switch_type_1} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "matcher"}> ({
    ^bb0(%arg1: !pdl.operation):
      %2 = "pdl_interp.get_results"(%arg1) : (!pdl.operation) -> !pdl.range<value>
      %3 = "pdl_interp.get_value_type"(%2) : (!pdl.range<value>) -> !pdl.range<type>
      "pdl_interp.switch_types"(%3)[^bb3, ^bb1, ^bb3] <{caseValues = [[i64, i64], [i32]]}> : (!pdl.range<type>) -> ()
    ^bb1:  // pred: ^bb0
      "pdl_interp.switch_types"(%3)[^bb2, ^bb3, ^bb3] <{caseValues = [[i32], [i64, i32]]}> : (!pdl.range<type>) -> ()
    ^bb2:  // pred: ^bb1
      "pdl_interp.record_match"(%arg1, %arg1)[^bb3] <{benefit = 1 : i16, operandSegmentSizes = array<i32: 1, 1>, rewriter = @rewriters::@success}> : (!pdl.operation, !pdl.operation) -> ()
    ^bb3:  // 5 preds: ^bb0, ^bb0, ^bb1, ^bb1, ^bb2
      "pdl_interp.finalize"() : () -> ()
    }) : () -> ()
    "builtin.module"() <{sym_name = "rewriters"}> ({
      "pdl_interp.func"() <{function_type = (!pdl.operation) -> (), sym_name = "success"}> ({
      ^bb0(%arg0: !pdl.operation):
        %1 = "pdl_interp.create_operation"() <{inputAttributeNames = [], name = "test.success", operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> !pdl.operation
        "pdl_interp.erase"(%arg0) : (!pdl.operation) -> ()
        "pdl_interp.finalize"() : () -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    %0:2 = "test.op"() : () -> (i64, i64)
  }) {test.switch_types_1} : () -> ()
}) : () -> ()

