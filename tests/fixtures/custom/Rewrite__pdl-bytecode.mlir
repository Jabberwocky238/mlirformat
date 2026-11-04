module {
  module @patterns {
    pdl_interp.func @matcher(%arg0: !pdl.operation) {
      pdl_interp.apply_constraint "multi_entity_constraint"(%arg0, %arg0 : !pdl.operation, !pdl.operation) -> ^bb1, ^bb3
    ^bb1:  // pred: ^bb0
      pdl_interp.apply_constraint "single_entity_constraint"(%arg0 : !pdl.operation) -> ^bb2, ^bb3
    ^bb2:  // pred: ^bb1
      pdl_interp.record_match @rewriters::@success(%arg0 : !pdl.operation) : benefit(1), loc([%arg0]) -> ^bb3
    ^bb3:  // 3 preds: ^bb0, ^bb1, ^bb2
      pdl_interp.finalize
    }
    module @rewriters {
      pdl_interp.func @success(%arg0: !pdl.operation) {
        %0 = pdl_interp.create_operation "test.replaced_by_pattern" 
        pdl_interp.erase %arg0
        pdl_interp.finalize
      }
    }
  }
  module @ir attributes {test.apply_constraint_1} {
    "test.op"() {test_attr} : () -> ()
  }
}

// -----
module {
  module @patterns {
    pdl_interp.func @matcher(%arg0: !pdl.operation) {
      %0 = pdl_interp.get_results of %arg0 : !pdl.range<value>
      %1 = pdl_interp.get_value_type of %0 : !pdl.range<type>
      pdl_interp.apply_constraint "multi_entity_var_constraint"(%0, %1 : !pdl.range<value>, !pdl.range<type>) -> ^bb1, ^bb2
    ^bb1:  // pred: ^bb0
      pdl_interp.record_match @rewriters::@success(%arg0 : !pdl.operation) : benefit(1), loc([%arg0]) -> ^bb2
    ^bb2:  // 2 preds: ^bb0, ^bb1
      pdl_interp.finalize
    }
    module @rewriters {
      pdl_interp.func @success(%arg0: !pdl.operation) {
        %0 = pdl_interp.create_operation "test.replaced_by_pattern" 
        pdl_interp.erase %arg0
        pdl_interp.finalize
      }
    }
  }
  module @ir attributes {test.apply_constraint_2} {
    "test.failure_op"() {test_attr} : () -> ()
    %0:2 = "test.success_op"() : () -> (i32, i64)
  }
}

// -----
module {
  module @patterns {
    pdl_interp.func @matcher(%arg0: !pdl.operation) {
      %0 = pdl_interp.create_attribute unit
      %1 = pdl_interp.get_attribute "test_attr" of %arg0
      pdl_interp.are_equal %0, %1 : !pdl.attribute -> ^bb1, ^bb3
    ^bb1:  // pred: ^bb0
      pdl_interp.apply_constraint "single_entity_constraint"(%arg0 : !pdl.operation) {isNegated = true} -> ^bb2, ^bb3
    ^bb2:  // pred: ^bb1
      pdl_interp.record_match @rewriters::@success(%arg0 : !pdl.operation) : benefit(1), loc([%arg0]) -> ^bb3
    ^bb3:  // 3 preds: ^bb0, ^bb1, ^bb2
      pdl_interp.finalize
    }
    module @rewriters {
      pdl_interp.func @success(%arg0: !pdl.operation) {
        %0 = pdl_interp.create_operation "test.replaced_by_pattern" 
        pdl_interp.erase %arg0
        pdl_interp.finalize
      }
    }
  }
  module @ir attributes {test.apply_constraint_3} {
    "test.foo"() {test_attr} : () -> ()
    "test.op"() {test_attr} : () -> ()
  }
}

// -----
module {
  module @patterns {
    pdl_interp.func @matcher(%arg0: !pdl.operation) {
      pdl_interp.check_operation_name of %arg0 is "test.success_op" -> ^bb1, ^bb3
    ^bb1:  // pred: ^bb0
      %0 = pdl_interp.apply_constraint "op_constr_return_type"(%arg0 : !pdl.operation) : !pdl.type -> ^bb2, ^bb3
    ^bb2:  // pred: ^bb1
      pdl_interp.record_match @rewriters::@success(%arg0, %0 : !pdl.operation, !pdl.type) : benefit(1), loc([%arg0]) -> ^bb3
    ^bb3:  // 3 preds: ^bb0, ^bb1, ^bb2
      pdl_interp.finalize
    }
    module @rewriters {
      pdl_interp.func @success(%arg0: !pdl.operation, %arg1: !pdl.type) {
        %0 = pdl_interp.create_operation "test.replaced_by_pattern"  -> (%arg1 : !pdl.type)
        pdl_interp.erase %arg0
        pdl_interp.finalize
      }
    }
  }
  module @ir attributes {test.apply_constraint_4} {
    "test.failure_op"() : () -> ()
    "test.success_op"() : () -> ()
  }
}

// -----
module {
  module @patterns {
    pdl_interp.func @matcher(%arg0: !pdl.operation) {
      %0:2 = pdl_interp.apply_constraint "op_multiple_returns_failure"(%arg0 : !pdl.operation) : !pdl.type, !pdl.type -> ^bb1, ^bb2
    ^bb1:  // pred: ^bb0
      pdl_interp.record_match @rewriters::@success(%arg0, %0#0 : !pdl.operation, !pdl.type) : benefit(1), loc([%arg0]) -> ^bb2
    ^bb2:  // 2 preds: ^bb0, ^bb1
      pdl_interp.finalize
    }
    module @rewriters {
      pdl_interp.func @success(%arg0: !pdl.operation, %arg1: !pdl.type) {
        %0 = pdl_interp.create_operation "test.replaced_by_pattern"  -> (%arg1 : !pdl.type)
        pdl_interp.erase %arg0
        pdl_interp.finalize
      }
    }
  }
  module @ir attributes {test.apply_constraint_multi_result_failure} {
    "test.success_op"() : () -> ()
  }
}

// -----
module {
  module @patterns {
    pdl_interp.func @matcher(%arg0: !pdl.operation) {
      pdl_interp.check_operation_name of %arg0 is "test.success_op" -> ^bb1, ^bb3
    ^bb1:  // pred: ^bb0
      %0 = pdl_interp.create_attribute 2 : i32
      %1 = pdl_interp.apply_constraint "op_constr_return_type_range"(%arg0, %0 : !pdl.operation, !pdl.attribute) : !pdl.range<type> -> ^bb2, ^bb3
    ^bb2:  // pred: ^bb1
      pdl_interp.record_match @rewriters::@success(%arg0, %1 : !pdl.operation, !pdl.range<type>) : benefit(1), loc([%arg0]) -> ^bb3
    ^bb3:  // 3 preds: ^bb0, ^bb1, ^bb2
      pdl_interp.finalize
    }
    module @rewriters {
      pdl_interp.func @success(%arg0: !pdl.operation, %arg1: !pdl.range<type>) {
        %0 = pdl_interp.create_operation "test.replaced_by_pattern"  -> (%arg1 : !pdl.range<type>)
        pdl_interp.erase %arg0
        pdl_interp.finalize
      }
    }
  }
  module @ir attributes {test.apply_constraint_5} {
    "test.failure_op"() : () -> ()
    "test.success_op"() : () -> ()
  }
}

// -----
module {
  module @patterns {
    pdl_interp.func @matcher(%arg0: !pdl.operation) {
      pdl_interp.check_operation_name of %arg0 is "test.op" -> ^bb1, ^bb2
    ^bb1:  // pred: ^bb0
      pdl_interp.record_match @rewriters::@success(%arg0 : !pdl.operation) : benefit(1), loc([%arg0]) -> ^bb2
    ^bb2:  // 2 preds: ^bb0, ^bb1
      pdl_interp.finalize
    }
    module @rewriters {
      pdl_interp.func @success(%arg0: !pdl.operation) {
        %0 = pdl_interp.get_operand 0 of %arg0
        pdl_interp.apply_rewrite "rewriter"(%arg0, %0 : !pdl.operation, !pdl.value)
        pdl_interp.finalize
      }
    }
  }
  module @ir attributes {test.apply_rewrite_1} {
    %0 = "test.op_input"() : () -> i32
    "test.op"(%0) : (i32) -> ()
  }
}

// -----
module {
  module @patterns {
    pdl_interp.func @matcher(%arg0: !pdl.operation) {
      pdl_interp.check_operation_name of %arg0 is "test.op" -> ^bb1, ^bb2
    ^bb1:  // pred: ^bb0
      pdl_interp.record_match @rewriters::@success(%arg0 : !pdl.operation) : benefit(1), loc([%arg0]) -> ^bb2
    ^bb2:  // 2 preds: ^bb0, ^bb1
      pdl_interp.finalize
    }
    module @rewriters {
      pdl_interp.func @success(%arg0: !pdl.operation) {
        %0 = pdl_interp.apply_rewrite "creator"(%arg0 : !pdl.operation) : !pdl.operation
        pdl_interp.erase %arg0
        pdl_interp.finalize
      }
    }
  }
  module @ir attributes {test.apply_rewrite_2} {
    "test.op"() : () -> ()
  }
}

// -----
module {
  module @patterns {
    pdl_interp.func @matcher(%arg0: !pdl.operation) {
      pdl_interp.check_operation_name of %arg0 is "test.op" -> ^bb1, ^bb2
    ^bb1:  // pred: ^bb0
      pdl_interp.record_match @rewriters::@success(%arg0 : !pdl.operation) : benefit(1), loc([%arg0]) -> ^bb2
    ^bb2:  // 2 preds: ^bb0, ^bb1
      pdl_interp.finalize
    }
    module @rewriters {
      pdl_interp.func @success(%arg0: !pdl.operation) {
        %0:2 = pdl_interp.apply_rewrite "var_creator"(%arg0 : !pdl.operation) : !pdl.range<value>, !pdl.range<type>
        %1 = pdl_interp.create_operation "test.success"(%0#0 : !pdl.range<value>)  -> (%0#1 : !pdl.range<type>)
        pdl_interp.replace %arg0 with (%0#0 : !pdl.range<value>)
        pdl_interp.finalize
      }
    }
  }
  module @ir attributes {test.apply_rewrite_3} {
    %0 = "test.producer"() : () -> i32
    %1 = "test.op"(%0) : (i32) -> i32
    "test.consumer"(%1) : (i32) -> ()
  }
}

// -----
module {
  module @patterns {
    pdl_interp.func @matcher(%arg0: !pdl.operation) {
      pdl_interp.check_operation_name of %arg0 is "test.op" -> ^bb1, ^bb2
    ^bb1:  // pred: ^bb0
      pdl_interp.record_match @rewriters::@success(%arg0 : !pdl.operation) : benefit(1), loc([%arg0]) -> ^bb2
    ^bb2:  // 2 preds: ^bb0, ^bb1
      pdl_interp.finalize
    }
    module @rewriters {
      pdl_interp.func @success(%arg0: !pdl.operation) {
        %0 = pdl_interp.apply_rewrite "str_creator" : !pdl.attribute
        %1 = pdl_interp.apply_rewrite "type_creator" : !pdl.type
        %2 = pdl_interp.create_operation "test.success" {"attr" = %0}  -> (%1 : !pdl.type)
        pdl_interp.erase %arg0
        pdl_interp.finalize
      }
    }
  }
  module @ir attributes {test.apply_rewrite_4} {
    "test.op"() : () -> ()
  }
}

// -----
module {
  module @patterns {
    pdl_interp.func @matcher(%arg0: !pdl.operation) {
      %0 = pdl_interp.create_attribute unit
      %1 = pdl_interp.get_attribute "test_attr" of %arg0
      pdl_interp.are_equal %0, %1 : !pdl.attribute -> ^bb1, ^bb2
    ^bb1:  // pred: ^bb0
      pdl_interp.record_match @rewriters::@success(%arg0 : !pdl.operation) : benefit(1), loc([%arg0]) -> ^bb2
    ^bb2:  // 2 preds: ^bb0, ^bb1
      pdl_interp.finalize
    }
    module @rewriters {
      pdl_interp.func @success(%arg0: !pdl.operation) {
        %0 = pdl_interp.create_operation "test.success" 
        pdl_interp.erase %arg0
        pdl_interp.finalize
      }
    }
  }
  module @ir attributes {test.are_equal_1} {
    "test.op"() {test_attr} : () -> ()
  }
}

// -----
module {
  module @patterns {
    pdl_interp.func @matcher(%arg0: !pdl.operation) {
      %0 = pdl_interp.create_types [i32, i64]
      %1 = pdl_interp.get_results of %arg0 : !pdl.range<value>
      %2 = pdl_interp.get_value_type of %1 : !pdl.range<type>
      pdl_interp.are_equal %2, %0 : !pdl.range<type> -> ^bb1, ^bb2
    ^bb1:  // pred: ^bb0
      pdl_interp.record_match @rewriters::@success(%arg0 : !pdl.operation) : benefit(1), loc([%arg0]) -> ^bb2
    ^bb2:  // 2 preds: ^bb0, ^bb1
      pdl_interp.finalize
    }
    module @rewriters {
      pdl_interp.func @success(%arg0: !pdl.operation) {
        %0 = pdl_interp.create_operation "test.success" 
        pdl_interp.erase %arg0
        pdl_interp.finalize
      }
    }
  }
  module @ir attributes {test.are_equal_2} {
    %0 = "test.not_equal"() : () -> i32
    %1:2 = "test.op"() : () -> (i32, i64)
  }
}

// -----
module {
  module @patterns {
    pdl_interp.func @matcher(%arg0: !pdl.operation) {
      pdl_interp.check_operation_name of %arg0 is "test.op" -> ^bb1, ^bb3
    ^bb1:  // pred: ^bb0
      pdl_interp.branch ^bb2
    ^bb2:  // pred: ^bb1
      pdl_interp.record_match @rewriters::@success(%arg0 : !pdl.operation) : benefit(2), loc([%arg0]) -> ^bb3
    ^bb3:  // 2 preds: ^bb0, ^bb2
      pdl_interp.finalize
    }
    module @rewriters {
      pdl_interp.func @success(%arg0: !pdl.operation) {
        %0 = pdl_interp.create_operation "test.success" 
        pdl_interp.erase %arg0
        pdl_interp.finalize
      }
    }
  }
  module @ir attributes {test.branch_1} {
    "test.op"() : () -> ()
  }
}

// -----
module {
  module @patterns {
    pdl_interp.func @matcher(%arg0: !pdl.operation) {
      %0 = pdl_interp.get_attribute "test_attr" of %arg0
      pdl_interp.check_attribute %0 is unit -> ^bb1, ^bb2
    ^bb1:  // pred: ^bb0
      pdl_interp.record_match @rewriters::@success(%arg0 : !pdl.operation) : benefit(1), loc([%arg0]) -> ^bb2
    ^bb2:  // 2 preds: ^bb0, ^bb1
      pdl_interp.finalize
    }
    module @rewriters {
      pdl_interp.func @success(%arg0: !pdl.operation) {
        %0 = pdl_interp.create_operation "test.success" 
        pdl_interp.erase %arg0
        pdl_interp.finalize
      }
    }
  }
  module @ir attributes {test.check_attribute_1} {
    "test.op"() {test_attr} : () -> ()
  }
}

// -----
module {
  module @patterns {
    pdl_interp.func @matcher(%arg0: !pdl.operation) {
      pdl_interp.check_operand_count of %arg0 is at_least 1 -> ^bb1, ^bb3
    ^bb1:  // pred: ^bb0
      pdl_interp.check_operand_count of %arg0 is 2 -> ^bb2, ^bb3
    ^bb2:  // pred: ^bb1
      pdl_interp.record_match @rewriters::@success(%arg0 : !pdl.operation) : benefit(1), loc([%arg0]) -> ^bb3
    ^bb3:  // 3 preds: ^bb0, ^bb1, ^bb2
      pdl_interp.finalize
    }
    module @rewriters {
      pdl_interp.func @success(%arg0: !pdl.operation) {
        %0 = pdl_interp.create_operation "test.success" 
        pdl_interp.erase %arg0
        pdl_interp.finalize
      }
    }
  }
  module @ir attributes {test.check_operand_count_1} {
    %0 = "test.op"() : () -> i32
    "test.op"(%0, %0) : (i32, i32) -> ()
  }
}

// -----
module {
  module @patterns {
    pdl_interp.func @matcher(%arg0: !pdl.operation) {
      pdl_interp.check_operation_name of %arg0 is "test.op" -> ^bb1, ^bb2
    ^bb1:  // pred: ^bb0
      pdl_interp.record_match @rewriters::@success(%arg0 : !pdl.operation) : benefit(1), loc([%arg0]) -> ^bb2
    ^bb2:  // 2 preds: ^bb0, ^bb1
      pdl_interp.finalize
    }
    module @rewriters {
      pdl_interp.func @success(%arg0: !pdl.operation) {
        %0 = pdl_interp.create_operation "test.success" 
        pdl_interp.erase %arg0
        pdl_interp.finalize
      }
    }
  }
  module @ir attributes {test.check_operation_name_1} {
    "test.op"() : () -> ()
  }
}

// -----
module {
  module @patterns {
    pdl_interp.func @matcher(%arg0: !pdl.operation) {
      pdl_interp.check_result_count of %arg0 is at_least 1 -> ^bb1, ^bb3
    ^bb1:  // pred: ^bb0
      pdl_interp.check_result_count of %arg0 is 2 -> ^bb2, ^bb3
    ^bb2:  // pred: ^bb1
      pdl_interp.record_match @rewriters::@success(%arg0 : !pdl.operation) : benefit(1), loc([%arg0]) -> ^bb3
    ^bb3:  // 3 preds: ^bb0, ^bb1, ^bb2
      pdl_interp.finalize
    }
    module @rewriters {
      pdl_interp.func @success(%arg0: !pdl.operation) {
        %0 = pdl_interp.create_operation "test.success" 
        pdl_interp.erase %arg0
        pdl_interp.finalize
      }
    }
  }
  module @ir attributes {test.check_result_count_1} {
    %0 = "test.op"() : () -> i32
    %1:2 = "test.op"() : () -> (i32, i32)
  }
}

// -----
module {
  module @patterns {
    pdl_interp.func @matcher(%arg0: !pdl.operation) {
      %0 = pdl_interp.get_attribute "test_attr" of %arg0
      pdl_interp.is_not_null %0 : !pdl.attribute -> ^bb1, ^bb3
    ^bb1:  // pred: ^bb0
      %1 = pdl_interp.get_attribute_type of %0
      pdl_interp.check_type %1 is i32 -> ^bb2, ^bb3
    ^bb2:  // pred: ^bb1
      pdl_interp.record_match @rewriters::@success(%arg0 : !pdl.operation) : benefit(1), loc([%arg0]) -> ^bb3
    ^bb3:  // 3 preds: ^bb0, ^bb1, ^bb2
      pdl_interp.finalize
    }
    module @rewriters {
      pdl_interp.func @success(%arg0: !pdl.operation) {
        %0 = pdl_interp.create_operation "test.success" 
        pdl_interp.erase %arg0
        pdl_interp.finalize
      }
    }
  }
  module @ir attributes {test.check_type_1} {
    "test.op"() {test_attr = 10 : i32} : () -> ()
  }
}

// -----
module {
  module @patterns {
    pdl_interp.func @matcher(%arg0: !pdl.operation) {
      %0 = pdl_interp.get_results of %arg0 : !pdl.range<value>
      %1 = pdl_interp.get_value_type of %0 : !pdl.range<type>
      pdl_interp.check_types %1 are [i32] -> ^bb1, ^bb2
    ^bb1:  // pred: ^bb0
      pdl_interp.record_match @rewriters::@success(%arg0 : !pdl.operation) : benefit(1), loc([%arg0]) -> ^bb2
    ^bb2:  // 2 preds: ^bb0, ^bb1
      pdl_interp.finalize
    }
    module @rewriters {
      pdl_interp.func @success(%arg0: !pdl.operation) {
        %0 = pdl_interp.create_operation "test.success" 
        pdl_interp.erase %arg0
        pdl_interp.finalize
      }
    }
  }
  module @ir attributes {test.check_types_1} {
    %0:2 = "test.op"() : () -> (i32, i64)
    %1 = "test.op"() : () -> i32
  }
}

// -----
module {
  %c10_i64 = arith.constant 10 : i64
  module @patterns {
    pdl_interp.func @matcher(%arg0: !pdl.operation) {
      pdl_interp.check_operation_name of %arg0 is "test.op" -> ^bb1, ^bb2
    ^bb1:  // pred: ^bb0
      pdl_interp.record_match @rewriters::@success(%arg0 : !pdl.operation) : benefit(1), loc([%arg0]) -> ^bb2
    ^bb2:  // 2 preds: ^bb0, ^bb1
      pdl_interp.finalize
    }
    module @rewriters {
      pdl_interp.func @success(%arg0: !pdl.operation) {
        %0 = pdl_interp.create_attribute true
        %1 = pdl_interp.create_operation "arith.constant" {"value" = %0}  -> <inferred>
        %2 = pdl_interp.get_results of %1 : !pdl.range<value>
        %3 = pdl_interp.create_operation "test.success"(%2 : !pdl.range<value>) 
        pdl_interp.erase %arg0
        pdl_interp.finalize
      }
    }
  }
  module @ir attributes {test.create_op_infer_results} {
    %0:2 = "test.op"() : () -> (i64, i64)
  }
}

// -----
module {
  module @patterns {
    pdl_interp.func @matcher(%arg0: !pdl.operation) {
      pdl_interp.check_operand_count of %arg0 is 2 -> ^bb1, ^bb2
    ^bb1:  // pred: ^bb0
      pdl_interp.record_match @rewriters::@success(%arg0 : !pdl.operation) : benefit(1), loc([%arg0]) -> ^bb2
    ^bb2:  // 2 preds: ^bb0, ^bb1
      pdl_interp.finalize
    }
    module @rewriters {
      pdl_interp.func @success(%arg0: !pdl.operation) {
        %0 = pdl_interp.get_operand 0 of %arg0
        %1 = pdl_interp.get_operands of %arg0 : !pdl.range<value>
        %2 = pdl_interp.create_range %0, %1 : !pdl.value, !pdl.range<value> 
        %3 = pdl_interp.get_value_type of %0 : !pdl.type
        %4 = pdl_interp.get_value_type of %1 : !pdl.range<type>
        %5 = pdl_interp.create_range %3, %4 : !pdl.type, !pdl.range<type> 
        %6 = pdl_interp.create_operation "test.success"(%2 : !pdl.range<value>)  -> (%5 : !pdl.range<type>)
        pdl_interp.erase %arg0
        pdl_interp.finalize
      }
    }
  }
  module @ir attributes {test.create_range_1} {
    %0:2 = "test.input"() : () -> (i32, i32)
    "test.op"(%0#0, %0#1) : (i32, i32) -> ()
  }
}

// -----
module {
  module @patterns {
    pdl_interp.func @matcher(%arg0: !pdl.operation) {
      %0 = pdl_interp.get_attribute "test_attr" of %arg0
      pdl_interp.is_not_null %0 : !pdl.attribute -> ^bb1, ^bb3
    ^bb1:  // pred: ^bb0
      %1 = pdl_interp.create_type i32
      %2 = pdl_interp.get_attribute_type of %0
      pdl_interp.are_equal %2, %1 : !pdl.type -> ^bb2, ^bb3
    ^bb2:  // pred: ^bb1
      pdl_interp.record_match @rewriters::@success(%arg0 : !pdl.operation) : benefit(1), loc([%arg0]) -> ^bb3
    ^bb3:  // 3 preds: ^bb0, ^bb1, ^bb2
      pdl_interp.finalize
    }
    module @rewriters {
      pdl_interp.func @success(%arg0: !pdl.operation) {
        %0 = pdl_interp.create_operation "test.success" 
        pdl_interp.erase %arg0
        pdl_interp.finalize
      }
    }
  }
  module @ir attributes {test.create_type_1} {
    "test.op"() {test_attr = 0 : i32} : () -> ()
  }
}

// -----
module {
  module @patterns {
    pdl_interp.func @matcher(%arg0: !pdl.operation) {
      %0 = pdl_interp.get_result 0 of %arg0
      %1 = pdl_interp.get_users of %0 : !pdl.value
      %2 = pdl_interp.extract 1 of %1 : !pdl.operation
      pdl_interp.is_not_null %2 : !pdl.operation -> ^bb1, ^bb2
    ^bb1:  // pred: ^bb0
      pdl_interp.record_match @rewriters::@success(%2 : !pdl.operation) : benefit(1), loc([%arg0]) -> ^bb2
    ^bb2:  // 2 preds: ^bb0, ^bb1
      pdl_interp.finalize
    }
    module @rewriters {
      pdl_interp.func @success(%arg0: !pdl.operation) {
        %0 = pdl_interp.create_operation "test.success" 
        pdl_interp.erase %arg0
        pdl_interp.finalize
      }
    }
  }
  module @ir attributes {test.extract_op} {
    %0 = "test.op"() : () -> i32
    %1 = "test.op"(%0) : (i32) -> i32
    %2 = "test.op"(%0, %0) : (i32, i32) -> i32
  }
}

// -----
module {
  module @patterns {
    pdl_interp.func @matcher(%arg0: !pdl.operation) {
      %0 = pdl_interp.get_results of %arg0 : !pdl.range<value>
      %1 = pdl_interp.get_value_type of %0 : !pdl.range<type>
      %2 = pdl_interp.extract 1 of %1 : !pdl.type
      pdl_interp.is_not_null %2 : !pdl.type -> ^bb1, ^bb2
    ^bb1:  // pred: ^bb0
      pdl_interp.record_match @rewriters::@success(%arg0 : !pdl.operation) : benefit(1), loc([%arg0]) -> ^bb2
    ^bb2:  // 2 preds: ^bb0, ^bb1
      pdl_interp.finalize
    }
    module @rewriters {
      pdl_interp.func @success(%arg0: !pdl.operation) {
        %0 = pdl_interp.create_operation "test.success" 
        pdl_interp.erase %arg0
        pdl_interp.finalize
      }
    }
  }
  module @ir attributes {test.extract_type} {
    %0 = "test.op"() : () -> i32
    %1:2 = "test.op"(%0) : (i32) -> (i32, i32)
    %2 = "test.op"(%0) : (i32) -> i32
  }
}

// -----
module {
  module @patterns {
    pdl_interp.func @matcher(%arg0: !pdl.operation) {
      %0 = pdl_interp.get_results of %arg0 : !pdl.range<value>
      %1 = pdl_interp.extract 1 of %0 : !pdl.value
      pdl_interp.is_not_null %1 : !pdl.value -> ^bb1, ^bb2
    ^bb1:  // pred: ^bb0
      pdl_interp.record_match @rewriters::@success(%arg0 : !pdl.operation) : benefit(1), loc([%arg0]) -> ^bb2
    ^bb2:  // 2 preds: ^bb0, ^bb1
      pdl_interp.finalize
    }
    module @rewriters {
      pdl_interp.func @success(%arg0: !pdl.operation) {
        %0 = pdl_interp.create_operation "test.success" 
        pdl_interp.erase %arg0
        pdl_interp.finalize
      }
    }
  }
  module @ir attributes {test.extract_value} {
    %0 = "test.op"() : () -> i32
    %1:2 = "test.op"(%0) : (i32) -> (i32, i32)
    %2 = "test.op"(%0) : (i32) -> i32
  }
}

// -----
module {
  module @patterns {
    pdl_interp.func @matcher(%arg0: !pdl.operation) {
      %0 = pdl_interp.get_result 0 of %arg0
      %1 = pdl_interp.get_users of %0 : !pdl.value
      pdl_interp.foreach %arg1 : !pdl.operation in %1 {
        %2 = pdl_interp.get_result 0 of %arg1
        %3 = pdl_interp.get_users of %2 : !pdl.value
        pdl_interp.foreach %arg2 : !pdl.operation in %3 {
          pdl_interp.record_match @rewriters::@success(%arg2 : !pdl.operation) : benefit(1), loc([%arg0]) -> ^bb1
        ^bb1:  // pred: ^bb0
          pdl_interp.continue
        } -> ^bb1
      ^bb1:  // pred: ^bb0
        pdl_interp.continue
      } -> ^bb1
    ^bb1:  // pred: ^bb0
      pdl_interp.finalize
    }
    module @rewriters {
      pdl_interp.func @success(%arg0: !pdl.operation) {
        %0 = pdl_interp.create_operation "test.success" 
        pdl_interp.erase %arg0
        pdl_interp.finalize
      }
    }
  }
  module @ir attributes {test.foreach} {
    %0 = "test.op"() : () -> i32
    %1 = "test.op"(%0) : (i32) -> i32
    %2 = "test.op"(%1) : (i32) -> i32
    %3 = "test.op"(%1) : (i32) -> i32
    %4 = "test.op"(%0) : (i32) -> i32
    %5 = "test.op"(%4) : (i32) -> i32
    %6 = "test.op"(%4) : (i32) -> i32
  }
}

// -----
module {
  module @patterns {
    pdl_interp.func @matcher(%arg0: !pdl.operation) {
      %0 = pdl_interp.get_result 0 of %arg0
      %1 = pdl_interp.get_users of %0 : !pdl.value
      pdl_interp.foreach %arg1 : !pdl.operation in %1 {
        pdl_interp.record_match @rewriters::@success(%arg1 : !pdl.operation) : benefit(1), loc([%arg0]) -> ^bb1
      ^bb1:  // pred: ^bb0
        pdl_interp.continue
      } -> ^bb1
    ^bb1:  // pred: ^bb0
      pdl_interp.finalize
    }
    module @rewriters {
      pdl_interp.func @success(%arg0: !pdl.operation) {
        %0 = pdl_interp.create_operation "test.success" 
        pdl_interp.erase %arg0
        pdl_interp.finalize
      }
    }
  }
  module @ir attributes {test.get_users_of_value} {
    %0 = "test.op"() : () -> i32
    %1 = "test.op"(%0) : (i32) -> i32
    %2 = "test.op"(%0, %0) : (i32, i32) -> i32
  }
}

// -----
module {
  module @patterns {
    pdl_interp.func @matcher(%arg0: !pdl.operation) {
      pdl_interp.check_result_count of %arg0 is at_least 2 -> ^bb1, ^bb2
    ^bb1:  // pred: ^bb0
      %0 = pdl_interp.get_results of %arg0 : !pdl.range<value>
      %1 = pdl_interp.get_users of %0 : !pdl.range<value>
      pdl_interp.foreach %arg1 : !pdl.operation in %1 {
        pdl_interp.record_match @rewriters::@success(%arg1 : !pdl.operation) : benefit(1), loc([%arg0]) -> ^bb1
      ^bb1:  // pred: ^bb0
        pdl_interp.continue
      } -> ^bb2
    ^bb2:  // 2 preds: ^bb0, ^bb1
      pdl_interp.finalize
    }
    module @rewriters {
      pdl_interp.func @success(%arg0: !pdl.operation) {
        %0 = pdl_interp.create_operation "test.success" 
        pdl_interp.erase %arg0
        pdl_interp.finalize
      }
    }
  }
  module @ir attributes {test.get_all_users_of_range} {
    %0:2 = "test.op"() : () -> (i32, i32)
    %1 = "test.op"(%0#0) : (i32) -> i32
    %2 = "test.op"(%0#1) : (i32) -> i32
  }
}

// -----
module {
  module @patterns {
    pdl_interp.func @matcher(%arg0: !pdl.operation) {
      pdl_interp.check_result_count of %arg0 is at_least 2 -> ^bb1, ^bb2
    ^bb1:  // pred: ^bb0
      %0 = pdl_interp.get_results of %arg0 : !pdl.range<value>
      %1 = pdl_interp.extract 0 of %0 : !pdl.value
      %2 = pdl_interp.get_users of %1 : !pdl.value
      pdl_interp.foreach %arg1 : !pdl.operation in %2 {
        pdl_interp.record_match @rewriters::@success(%arg1 : !pdl.operation) : benefit(1), loc([%arg0]) -> ^bb1
      ^bb1:  // pred: ^bb0
        pdl_interp.continue
      } -> ^bb2
    ^bb2:  // 2 preds: ^bb0, ^bb1
      pdl_interp.finalize
    }
    module @rewriters {
      pdl_interp.func @success(%arg0: !pdl.operation) {
        %0 = pdl_interp.create_operation "test.success" 
        pdl_interp.erase %arg0
        pdl_interp.finalize
      }
    }
  }
  module @ir attributes {test.get_first_users_of_range} {
    %0:2 = "test.op"() : () -> (i32, i32)
    %1 = "test.op"(%0#0) : (i32) -> i32
    %2 = "test.op"(%0#1) : (i32) -> i32
  }
}

// -----
module {
  module @patterns {
    pdl_interp.func @matcher(%arg0: !pdl.operation) {
      pdl_interp.check_operand_count of %arg0 is 5 -> ^bb1, ^bb3
    ^bb1:  // pred: ^bb0
      %0 = pdl_interp.get_operand 0 of %arg0
      %1 = pdl_interp.get_operand 4 of %arg0
      %2 = pdl_interp.get_defining_op of %0 : !pdl.value
      %3 = pdl_interp.get_defining_op of %1 : !pdl.value
      pdl_interp.are_equal %2, %3 : !pdl.operation -> ^bb2, ^bb3
    ^bb2:  // pred: ^bb1
      pdl_interp.record_match @rewriters::@success(%arg0 : !pdl.operation) : benefit(1), loc([%arg0]) -> ^bb3
    ^bb3:  // 3 preds: ^bb0, ^bb1, ^bb2
      pdl_interp.finalize
    }
    module @rewriters {
      pdl_interp.func @success(%arg0: !pdl.operation) {
        %0 = pdl_interp.create_operation "test.success" 
        pdl_interp.erase %arg0
        pdl_interp.finalize
      }
    }
  }
  module @ir attributes {test.get_defining_op_1} {
    %0 = "test.op"() : () -> i32
    %1 = "test.op"() : () -> i32
    "test.op"(%0, %0, %0, %0, %0) : (i32, i32, i32, i32, i32) -> ()
    "test.op"(%0, %0, %0, %0, %1) : (i32, i32, i32, i32, i32) -> ()
  }
}

// -----
module {
  module @patterns {
    pdl_interp.func @matcher(%arg0: !pdl.operation) {
      pdl_interp.check_operand_count of %arg0 is 2 -> ^bb1, ^bb3
    ^bb1:  // pred: ^bb0
      %0 = pdl_interp.get_operands 0 of %arg0 : !pdl.range<value>
      %1 = pdl_interp.get_operands of %arg0 : !pdl.range<value>
      pdl_interp.are_equal %0, %1 : !pdl.range<value> -> ^bb2, ^bb3
    ^bb2:  // pred: ^bb1
      pdl_interp.record_match @rewriters::@success(%arg0 : !pdl.operation) : benefit(1), loc([%arg0]) -> ^bb3
    ^bb3:  // 3 preds: ^bb0, ^bb1, ^bb2
      pdl_interp.finalize
    }
    module @rewriters {
      pdl_interp.func @success(%arg0: !pdl.operation) {
        %0 = pdl_interp.create_operation "test.success" 
        pdl_interp.erase %arg0
        pdl_interp.finalize
      }
    }
  }
  module @ir attributes {test.get_operands_1} {
    %0:2 = "test.producer"() : () -> (i32, i32)
    "test.op"(%0#0, %0#1) : (i32, i32) -> ()
  }
}

// -----
module {
  module @patterns {
    pdl_interp.func @matcher(%arg0: !pdl.operation) {
      pdl_interp.check_operation_name of %arg0 is "test.attr_sized_operands" -> ^bb1, ^bb9
    ^bb1:  // pred: ^bb0
      %0 = pdl_interp.get_operands 0 of %arg0 : !pdl.range<value>
      pdl_interp.is_not_null %0 : !pdl.range<value> -> ^bb2, ^bb9
    ^bb2:  // pred: ^bb1
      %1 = pdl_interp.get_operands 0 of %arg0 : !pdl.value
      pdl_interp.is_not_null %1 : !pdl.value -> ^bb9, ^bb3
    ^bb3:  // pred: ^bb2
      %2 = pdl_interp.get_operands 1 of %arg0 : !pdl.range<value>
      pdl_interp.is_not_null %2 : !pdl.range<value> -> ^bb4, ^bb9
    ^bb4:  // pred: ^bb3
      %3 = pdl_interp.get_operands 1 of %arg0 : !pdl.value
      pdl_interp.is_not_null %3 : !pdl.value -> ^bb9, ^bb5
    ^bb5:  // pred: ^bb4
      %4 = pdl_interp.get_operands 2 of %arg0 : !pdl.range<value>
      pdl_interp.is_not_null %4 : !pdl.range<value> -> ^bb6, ^bb9
    ^bb6:  // pred: ^bb5
      %5 = pdl_interp.get_operands 2 of %arg0 : !pdl.value
      pdl_interp.is_not_null %5 : !pdl.value -> ^bb7, ^bb9
    ^bb7:  // pred: ^bb6
      %6 = pdl_interp.get_operands 50 of %arg0 : !pdl.value
      pdl_interp.is_not_null %6 : !pdl.value -> ^bb9, ^bb8
    ^bb8:  // pred: ^bb7
      pdl_interp.record_match @rewriters::@success(%arg0, %0, %2, %4, %5 : !pdl.operation, !pdl.range<value>, !pdl.range<value>, !pdl.range<value>, !pdl.value) : benefit(1), loc([%arg0]) -> ^bb9
    ^bb9:  // 9 preds: ^bb0, ^bb1, ^bb2, ^bb3, ^bb4, ^bb5, ^bb6, ^bb7, ^bb8
      pdl_interp.finalize
    }
    module @rewriters {
      pdl_interp.func @success(%arg0: !pdl.operation, %arg1: !pdl.range<value>, %arg2: !pdl.range<value>, %arg3: !pdl.range<value>, %arg4: !pdl.value) {
        %0 = pdl_interp.create_operation "test.success"(%arg1 : !pdl.range<value>) 
        %1 = pdl_interp.create_operation "test.success"(%arg2 : !pdl.range<value>) 
        %2 = pdl_interp.create_operation "test.success"(%arg3 : !pdl.range<value>) 
        %3 = pdl_interp.create_operation "test.success"(%arg4 : !pdl.value) 
        pdl_interp.erase %arg0
        pdl_interp.finalize
      }
    }
  }
  module @ir attributes {test.get_operands_2} {
    %0:5 = "test.producer"() : () -> (i32, i32, i32, i32, i32)
    "test.attr_sized_operands"(%0#0, %0#1, %0#2, %0#3, %0#4) <{operandSegmentSizes = array<i32: 0, 4, 1, 0>}> : (i32, i32, i32, i32, i32) -> ()
  }
}

// -----
module {
  module @patterns {
    pdl_interp.func @matcher(%arg0: !pdl.operation) {
      pdl_interp.check_result_count of %arg0 is 5 -> ^bb1, ^bb3
    ^bb1:  // pred: ^bb0
      %0 = pdl_interp.get_result 0 of %arg0
      %1 = pdl_interp.get_result 4 of %arg0
      %2 = pdl_interp.get_value_type of %0 : !pdl.type
      %3 = pdl_interp.get_value_type of %1 : !pdl.type
      pdl_interp.are_equal %2, %3 : !pdl.type -> ^bb2, ^bb3
    ^bb2:  // pred: ^bb1
      pdl_interp.record_match @rewriters::@success(%arg0 : !pdl.operation) : benefit(1), loc([%arg0]) -> ^bb3
    ^bb3:  // 3 preds: ^bb0, ^bb1, ^bb2
      pdl_interp.finalize
    }
    module @rewriters {
      pdl_interp.func @success(%arg0: !pdl.operation) {
        %0 = pdl_interp.create_operation "test.success" 
        pdl_interp.erase %arg0
        pdl_interp.finalize
      }
    }
  }
  module @ir attributes {test.get_result_1} {
    %0:5 = "test.op"() : () -> (i32, i32, i32, i32, i32)
    %1:5 = "test.op"() : () -> (i32, i32, i32, i32, i64)
  }
}

// -----
module {
  module @patterns {
    pdl_interp.func @matcher(%arg0: !pdl.operation) {
      pdl_interp.check_result_count of %arg0 is 5 -> ^bb1, ^bb3
    ^bb1:  // pred: ^bb0
      %0 = pdl_interp.get_results 0 of %arg0 : !pdl.range<value>
      %1 = pdl_interp.get_results of %arg0 : !pdl.range<value>
      pdl_interp.are_equal %0, %1 : !pdl.range<value> -> ^bb2, ^bb3
    ^bb2:  // pred: ^bb1
      pdl_interp.record_match @rewriters::@success(%arg0 : !pdl.operation) : benefit(1), loc([%arg0]) -> ^bb3
    ^bb3:  // 3 preds: ^bb0, ^bb1, ^bb2
      pdl_interp.finalize
    }
    module @rewriters {
      pdl_interp.func @success(%arg0: !pdl.operation) {
        %0 = pdl_interp.create_operation "test.success" 
        pdl_interp.erase %arg0
        pdl_interp.finalize
      }
    }
  }
  module @ir attributes {test.get_results_1} {
    %0:5 = "test.producer"() : () -> (i32, i32, i32, i32, i32)
  }
}

// -----
module {
  module @patterns {
    pdl_interp.func @matcher(%arg0: !pdl.operation) {
      pdl_interp.check_operation_name of %arg0 is "test.attr_sized_results" -> ^bb1, ^bb9
    ^bb1:  // pred: ^bb0
      %0 = pdl_interp.get_results 0 of %arg0 : !pdl.range<value>
      pdl_interp.is_not_null %0 : !pdl.range<value> -> ^bb2, ^bb9
    ^bb2:  // pred: ^bb1
      %1 = pdl_interp.get_results 0 of %arg0 : !pdl.value
      pdl_interp.is_not_null %1 : !pdl.value -> ^bb9, ^bb3
    ^bb3:  // pred: ^bb2
      %2 = pdl_interp.get_results 1 of %arg0 : !pdl.range<value>
      pdl_interp.is_not_null %2 : !pdl.range<value> -> ^bb4, ^bb9
    ^bb4:  // pred: ^bb3
      %3 = pdl_interp.get_results 1 of %arg0 : !pdl.value
      pdl_interp.is_not_null %3 : !pdl.value -> ^bb9, ^bb5
    ^bb5:  // pred: ^bb4
      %4 = pdl_interp.get_results 2 of %arg0 : !pdl.range<value>
      pdl_interp.is_not_null %4 : !pdl.range<value> -> ^bb6, ^bb9
    ^bb6:  // pred: ^bb5
      %5 = pdl_interp.get_results 2 of %arg0 : !pdl.value
      pdl_interp.is_not_null %5 : !pdl.value -> ^bb7, ^bb9
    ^bb7:  // pred: ^bb6
      %6 = pdl_interp.get_results 50 of %arg0 : !pdl.value
      pdl_interp.is_not_null %6 : !pdl.value -> ^bb9, ^bb8
    ^bb8:  // pred: ^bb7
      pdl_interp.record_match @rewriters::@success(%arg0, %0, %2, %4, %5 : !pdl.operation, !pdl.range<value>, !pdl.range<value>, !pdl.range<value>, !pdl.value) : benefit(1), loc([%arg0]) -> ^bb9
    ^bb9:  // 9 preds: ^bb0, ^bb1, ^bb2, ^bb3, ^bb4, ^bb5, ^bb6, ^bb7, ^bb8
      pdl_interp.finalize
    }
    module @rewriters {
      pdl_interp.func @success(%arg0: !pdl.operation, %arg1: !pdl.range<value>, %arg2: !pdl.range<value>, %arg3: !pdl.range<value>, %arg4: !pdl.value) {
        %0 = pdl_interp.get_value_type of %arg1 : !pdl.range<type>
        %1 = pdl_interp.get_value_type of %arg2 : !pdl.range<type>
        %2 = pdl_interp.get_value_type of %arg3 : !pdl.range<type>
        %3 = pdl_interp.get_value_type of %arg4 : !pdl.type
        %4 = pdl_interp.create_operation "test.success"  -> (%0 : !pdl.range<type>)
        %5 = pdl_interp.create_operation "test.success"  -> (%1 : !pdl.range<type>)
        %6 = pdl_interp.create_operation "test.success"  -> (%2 : !pdl.range<type>)
        %7 = pdl_interp.create_operation "test.success"  -> (%3 : !pdl.type)
        %8 = pdl_interp.get_results of %4 : !pdl.range<value>
        %9 = pdl_interp.get_results of %5 : !pdl.range<value>
        %10 = pdl_interp.get_results of %6 : !pdl.range<value>
        pdl_interp.replace %arg0 with (%8, %9, %10 : !pdl.range<value>, !pdl.range<value>, !pdl.range<value>)
        pdl_interp.finalize
      }
    }
  }
  module @ir attributes {test.get_results_2} {
    %b:4, %c = "test.attr_sized_results"() <{resultSegmentSizes = array<i32: 0, 4, 1, 0>}> : () -> (i32, i32, i32, i32, i32)
    "test.consumer"(%b#0, %b#1, %b#2, %b#3, %c) : (i32, i32, i32, i32, i32) -> ()
  }
}

// -----
module {
  module @patterns {
    pdl_interp.func @matcher(%arg0: !pdl.operation) {
      pdl_interp.check_operation_name of %arg0 is "test.op" -> ^bb1, ^bb3
    ^bb1:  // pred: ^bb0
      pdl_interp.record_match @rewriters::@failure(%arg0 : !pdl.operation) : benefit(1), loc([%arg0]) -> ^bb2
    ^bb2:  // pred: ^bb1
      pdl_interp.record_match @rewriters::@success(%arg0 : !pdl.operation) : benefit(2), loc([%arg0]) -> ^bb3
    ^bb3:  // 2 preds: ^bb0, ^bb2
      pdl_interp.finalize
    }
    module @rewriters {
      pdl_interp.func @failure(%arg0: !pdl.operation) {
        pdl_interp.erase %arg0
        pdl_interp.finalize
      }
      pdl_interp.func @success(%arg0: !pdl.operation) {
        %0 = pdl_interp.create_operation "test.success" 
        pdl_interp.erase %arg0
        pdl_interp.finalize
      }
    }
  }
  module @ir attributes {test.record_match_1} {
    "test.op"() : () -> ()
  }
}

// -----
module {
  module @patterns {
    pdl_interp.func @matcher(%arg0: !pdl.operation) {
      pdl_interp.check_operation_name of %arg0 is "test.op" -> ^bb1, ^bb2
    ^bb1:  // pred: ^bb0
      %0 = pdl_interp.get_operands of %arg0 : !pdl.range<value>
      %1 = pdl_interp.get_results of %arg0 : !pdl.range<value>
      %2 = pdl_interp.get_value_type of %1 : !pdl.range<type>
      pdl_interp.record_match @rewriters::@success(%0, %2, %arg0 : !pdl.range<value>, !pdl.range<type>, !pdl.operation) : benefit(1), loc([%arg0]) -> ^bb2
    ^bb2:  // 2 preds: ^bb0, ^bb1
      pdl_interp.finalize
    }
    module @rewriters {
      pdl_interp.func @success(%arg0: !pdl.range<value>, %arg1: !pdl.range<type>, %arg2: !pdl.operation) {
        %0 = pdl_interp.create_operation "test.success"(%arg0 : !pdl.range<value>)  -> (%arg1 : !pdl.range<type>)
        %1 = pdl_interp.get_results of %0 : !pdl.range<value>
        pdl_interp.replace %arg2 with (%1 : !pdl.range<value>)
        pdl_interp.finalize
      }
    }
  }
  module @ir attributes {test.record_match_2} {
    %0 = "test.producer"() : () -> i32
    %1:2 = "test.op"(%0) : (i32) -> (i64, i32)
    "test.consumer"(%1#0, %1#1) : (i64, i32) -> ()
  }
}

// -----
module {
  module @patterns {
    pdl_interp.func @matcher(%arg0: !pdl.operation) {
      pdl_interp.check_operation_name of %arg0 is "test.op" -> ^bb1, ^bb2
    ^bb1:  // pred: ^bb0
      pdl_interp.record_match @rewriters::@success(%arg0 : !pdl.operation) : benefit(1), loc([%arg0]) -> ^bb2
    ^bb2:  // 2 preds: ^bb0, ^bb1
      pdl_interp.finalize
    }
    module @rewriters {
      pdl_interp.func @success(%arg0: !pdl.operation) {
        %0 = pdl_interp.get_operand 0 of %arg0
        pdl_interp.replace %arg0 with (%0 : !pdl.value)
        pdl_interp.finalize
      }
    }
  }
  module @ir attributes {test.replace_op_1} {
    %0 = "test.op_input"() : () -> i32
    %1 = "test.op"(%0) : (i32) -> i32
    "test.op_consumer"(%1) : (i32) -> ()
  }
}

// -----
module {
  module @patterns {
    pdl_interp.func @matcher(%arg0: !pdl.operation) {
      %0 = pdl_interp.get_attribute "test_attr" of %arg0
      pdl_interp.switch_attribute %0 to [0, unit](^bb3, ^bb1) -> ^bb3
    ^bb1:  // pred: ^bb0
      %1 = pdl_interp.get_attribute "test_attr_2" of %arg0
      pdl_interp.switch_attribute %1 to [0, unit](^bb3, ^bb3) -> ^bb2
    ^bb2:  // pred: ^bb1
      pdl_interp.record_match @rewriters::@success(%arg0 : !pdl.operation) : benefit(1), loc([%arg0]) -> ^bb3
    ^bb3:  // 5 preds: ^bb0, ^bb0, ^bb1, ^bb1, ^bb2
      pdl_interp.finalize
    }
    module @rewriters {
      pdl_interp.func @success(%arg0: !pdl.operation) {
        %0 = pdl_interp.create_operation "test.success" 
        pdl_interp.erase %arg0
        pdl_interp.finalize
      }
    }
  }
  module @ir attributes {test.switch_attribute_1} {
    "test.op"() {test_attr} : () -> ()
  }
}

// -----
module {
  module @patterns {
    pdl_interp.func @matcher(%arg0: !pdl.operation) {
      pdl_interp.switch_operand_count of %arg0 to dense<[0, 1]> : vector<2xi32>(^bb3, ^bb1) -> ^bb3
    ^bb1:  // pred: ^bb0
      pdl_interp.switch_operand_count of %arg0 to dense<[0, 2]> : vector<2xi32>(^bb3, ^bb3) -> ^bb2
    ^bb2:  // pred: ^bb1
      pdl_interp.record_match @rewriters::@success(%arg0 : !pdl.operation) : benefit(1), loc([%arg0]) -> ^bb3
    ^bb3:  // 5 preds: ^bb0, ^bb0, ^bb1, ^bb1, ^bb2
      pdl_interp.finalize
    }
    module @rewriters {
      pdl_interp.func @success(%arg0: !pdl.operation) {
        %0 = pdl_interp.create_operation "test.success" 
        pdl_interp.erase %arg0
        pdl_interp.finalize
      }
    }
  }
  module @ir attributes {test.switch_operand_1} {
    %0 = "test.op_input"() : () -> i32
    "test.op"(%0) : (i32) -> ()
  }
}

// -----
module {
  module @patterns {
    pdl_interp.func @matcher(%arg0: !pdl.operation) {
      pdl_interp.switch_operation_name of %arg0 to ["foo.op", "test.op"](^bb3, ^bb1) -> ^bb3
    ^bb1:  // pred: ^bb0
      pdl_interp.switch_operation_name of %arg0 to ["foo.op", "bar.op"](^bb3, ^bb3) -> ^bb2
    ^bb2:  // pred: ^bb1
      pdl_interp.record_match @rewriters::@success(%arg0 : !pdl.operation) : benefit(1), loc([%arg0]) -> ^bb3
    ^bb3:  // 5 preds: ^bb0, ^bb0, ^bb1, ^bb1, ^bb2
      pdl_interp.finalize
    }
    module @rewriters {
      pdl_interp.func @success(%arg0: !pdl.operation) {
        %0 = pdl_interp.create_operation "test.success" 
        pdl_interp.erase %arg0
        pdl_interp.finalize
      }
    }
  }
  module @ir attributes {test.switch_operation_name_1} {
    "test.op"() : () -> ()
  }
}

// -----
module {
  module @patterns {
    pdl_interp.func @matcher(%arg0: !pdl.operation) {
      pdl_interp.switch_result_count of %arg0 to dense<[0, 1]> : vector<2xi32>(^bb3, ^bb1) -> ^bb3
    ^bb1:  // pred: ^bb0
      pdl_interp.switch_result_count of %arg0 to dense<[0, 2]> : vector<2xi32>(^bb3, ^bb3) -> ^bb2
    ^bb2:  // pred: ^bb1
      pdl_interp.record_match @rewriters::@success(%arg0 : !pdl.operation) : benefit(1), loc([%arg0]) -> ^bb3
    ^bb3:  // 5 preds: ^bb0, ^bb0, ^bb1, ^bb1, ^bb2
      pdl_interp.finalize
    }
    module @rewriters {
      pdl_interp.func @success(%arg0: !pdl.operation) {
        %0 = pdl_interp.create_operation "test.success" 
        pdl_interp.erase %arg0
        pdl_interp.finalize
      }
    }
  }
  module @ir attributes {test.switch_result_1} {
    %0 = "test.op"() : () -> i32
  }
}

// -----
module {
  module @patterns {
    pdl_interp.func @matcher(%arg0: !pdl.operation) {
      %0 = pdl_interp.get_attribute "test_attr" of %arg0
      pdl_interp.is_not_null %0 : !pdl.attribute -> ^bb1, ^bb4
    ^bb1:  // pred: ^bb0
      %1 = pdl_interp.get_attribute_type of %0
      pdl_interp.switch_type %1 to [i32, i64](^bb2, ^bb4) -> ^bb4
    ^bb2:  // pred: ^bb1
      pdl_interp.switch_type %1 to [i16, i64](^bb4, ^bb4) -> ^bb3
    ^bb3:  // pred: ^bb2
      pdl_interp.record_match @rewriters::@success(%arg0 : !pdl.operation) : benefit(1), loc([%arg0]) -> ^bb4
    ^bb4:  // 6 preds: ^bb0, ^bb1, ^bb1, ^bb2, ^bb2, ^bb3
      pdl_interp.finalize
    }
    module @rewriters {
      pdl_interp.func @success(%arg0: !pdl.operation) {
        %0 = pdl_interp.create_operation "test.success" 
        pdl_interp.erase %arg0
        pdl_interp.finalize
      }
    }
  }
  module @ir attributes {test.switch_type_1} {
    "test.op"() {test_attr = 10 : i32} : () -> ()
  }
}

// -----
module {
  module @patterns {
    pdl_interp.func @matcher(%arg0: !pdl.operation) {
      %0 = pdl_interp.get_results of %arg0 : !pdl.range<value>
      %1 = pdl_interp.get_value_type of %0 : !pdl.range<type>
      pdl_interp.switch_types %1 to [[i64, i64], [i32]](^bb1, ^bb3) -> ^bb3
    ^bb1:  // pred: ^bb0
      pdl_interp.switch_types %1 to [[i32], [i64, i32]](^bb3, ^bb3) -> ^bb2
    ^bb2:  // pred: ^bb1
      pdl_interp.record_match @rewriters::@success(%arg0 : !pdl.operation) : benefit(1), loc([%arg0]) -> ^bb3
    ^bb3:  // 5 preds: ^bb0, ^bb0, ^bb1, ^bb1, ^bb2
      pdl_interp.finalize
    }
    module @rewriters {
      pdl_interp.func @success(%arg0: !pdl.operation) {
        %0 = pdl_interp.create_operation "test.success" 
        pdl_interp.erase %arg0
        pdl_interp.finalize
      }
    }
  }
  module @ir attributes {test.switch_types_1} {
    %0:2 = "test.op"() : () -> (i64, i64)
  }
}

