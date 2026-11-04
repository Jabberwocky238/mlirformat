module @empty_module {
}

// -----
module @simple {
  pdl.pattern : benefit(1) {
    %0 = operation "foo.op" 
    rewrite %0 with "rewriter"
  }
}

// -----
module @attributes {
  pdl.pattern : benefit(1) {
    %0 = type : i64
    %1 = attribute = 10 : i64
    %2 = attribute : %0
    %3 = operation  {"attr" = %1, "attr1" = %2}
    rewrite %3 with "rewriter"
  }
}

// -----
module @constraints {
  pdl.pattern : benefit(1) {
    %0 = operand
    %1 = operand
    %2 = operation(%0, %1 : !pdl.value, !pdl.value) 
    %3 = result 0 of %2
    apply_native_constraint "multi_constraint"(%0, %1, %3 : !pdl.value, !pdl.value, !pdl.value)
    rewrite %2 with "rewriter"
  }
}

// -----
module @constraint_with_result {
  pdl.pattern : benefit(1) {
    %0 = operation 
    %1 = apply_native_constraint "check_op_and_get_attr_constr"(%0 : !pdl.operation) : !pdl.attribute
    rewrite %0 with "rewriter"(%1 : !pdl.attribute)
  }
}

// -----
module @constraint_with_unused_result {
  pdl.pattern : benefit(1) {
    %0 = operation 
    %1 = apply_native_constraint "check_op_and_get_attr_constr"(%0 : !pdl.operation) : !pdl.attribute
    rewrite %0 with "rewriter"
  }
}

// -----
module @constraint_with_result_multiple {
  pdl.pattern : benefit(1) {
    %0 = operation 
    %1 = apply_native_constraint "check_op_and_get_attr_constr"(%0 : !pdl.operation) : !pdl.attribute
    rewrite %0 with "rewriter"(%1 : !pdl.attribute)
  }
  pdl.pattern : benefit(1) {
    %0 = operation 
    %1 = apply_native_constraint "check_op_and_get_attr_constr"(%0 : !pdl.operation) : !pdl.attribute
    rewrite %0 with "rewriter"(%1 : !pdl.attribute)
  }
}

// -----
module @negated_constraint {
  pdl.pattern : benefit(1) {
    %0 = operation 
    apply_native_constraint "constraint"(%0 : !pdl.operation) {isNegated = true}
    rewrite %0 with "rewriter"
  }
}

// -----
module @inputs {
  pdl.pattern : benefit(1) {
    %0 = type : i64
    %1 = operand : %0
    %2 = operation(%1, %1 : !pdl.value, !pdl.value) 
    rewrite %2 with "rewriter"
  }
}

// -----
module @variadic_inputs {
  pdl.pattern : benefit(1) {
    %0 = types : [i64]
    %1 = operands : %0
    %2 = operand
    %3 = operation(%2, %1, %2 : !pdl.value, !pdl.range<value>, !pdl.value) 
    rewrite %3 with "rewriter"
  }
}

// -----
module @single_operand_range {
  pdl.pattern : benefit(1) {
    %0 = types : [i64]
    %1 = operands : %0
    %2 = operation(%1 : !pdl.range<value>) 
    rewrite %2 with "rewriter"
  }
}

// -----
module @results {
  pdl.pattern : benefit(1) {
    %0 = type : i32
    %1 = type
    %2 = operation  -> (%0, %1 : !pdl.type, !pdl.type)
    rewrite %2 with "rewriter"
  }
}

// -----
module @variadic_results {
  pdl.pattern : benefit(1) {
    %0 = types : [i64]
    %1 = type
    %2 = operation  -> (%1, %0, %1 : !pdl.type, !pdl.range<type>, !pdl.type)
    rewrite %2 with "rewriter"
  }
}

// -----
module @single_result_range {
  pdl.pattern : benefit(1) {
    %0 = types : [i64]
    %1 = operation  -> (%0 : !pdl.range<type>)
    rewrite %1 with "rewriter"
  }
}

// -----
module @results_as_operands {
  pdl.pattern : benefit(1) {
    %0 = type : i32
    %1 = type
    %2 = operation  -> (%0, %1 : !pdl.type, !pdl.type)
    %3 = result 0 of %2
    %4 = result 1 of %2
    %5 = operation(%3, %4 : !pdl.value, !pdl.value) 
    rewrite %5 with "rewriter"
  }
}

// -----
module @single_result_range_as_operands {
  pdl.pattern : benefit(1) {
    %0 = types
    %1 = operation  -> (%0 : !pdl.range<type>)
    %2 = results of %1 
    %3 = operation(%2 : !pdl.range<value>) 
    rewrite %3 with "rewriter"
  }
}

// -----
module @switch_single_result_type {
  pdl.pattern : benefit(1) {
    %0 = type : i32
    %1 = operation  -> (%0 : !pdl.type)
    rewrite %1 with "rewriter"
  }
  pdl.pattern : benefit(1) {
    %0 = type : i64
    %1 = operation  -> (%0 : !pdl.type)
    rewrite %1 with "rewriter"
  }
}

// -----
module @switch_result_types {
  pdl.pattern : benefit(1) {
    %0 = types : [i32]
    %1 = operation  -> (%0 : !pdl.range<type>)
    rewrite %1 with "rewriter"
  }
  pdl.pattern : benefit(1) {
    %0 = types : [i64, i32]
    %1 = operation  -> (%0 : !pdl.range<type>)
    rewrite %1 with "rewriter"
  }
}

// -----
module @switch_operand_count_at_least {
  pdl.pattern : benefit(1) {
    %0 = operand
    %1 = operands
    %2 = operation(%0, %1 : !pdl.value, !pdl.range<value>) 
    rewrite %2 with "rewriter"
  }
  pdl.pattern : benefit(1) {
    %0 = operand
    %1 = operand
    %2 = operands
    %3 = operation(%0, %1, %2 : !pdl.value, !pdl.value, !pdl.range<value>) 
    rewrite %3 with "rewriter"
  }
}

// -----
module @switch_result_count_at_least {
  pdl.pattern : benefit(1) {
    %0 = type
    %1 = types
    %2 = operation  -> (%0, %1 : !pdl.type, !pdl.range<type>)
    rewrite %2 with "rewriter"
  }
  pdl.pattern : benefit(1) {
    %0 = type
    %1 = type
    %2 = types
    %3 = operation  -> (%0, %1, %2 : !pdl.type, !pdl.type, !pdl.range<type>)
    rewrite %3 with "rewriter"
  }
}

// -----
module @predicate_ordering {
  pdl.pattern : benefit(1) {
    %0 = type
    apply_native_constraint "typeConstraint"(%0 : !pdl.type)
    %1 = operation  -> (%0 : !pdl.type)
    rewrite %1 with "rewriter"
  }
  pdl.pattern : benefit(1) {
    %0 = type
    %1 = operation  -> (%0 : !pdl.type)
    rewrite %1 with "rewriter"
  }
}

// -----
module @multi_root {
  pdl.pattern @rewrite_multi_root : benefit(1) {
    %0 = operand
    %1 = operand
    %2 = type
    %3 = operation(%0 : !pdl.value)  -> (%2 : !pdl.type)
    %4 = result 0 of %3
    %5 = operation(%4 : !pdl.value) 
    %6 = operation(%1 : !pdl.value)  -> (%2 : !pdl.type)
    %7 = result 0 of %6
    %8 = operation(%4, %7 : !pdl.value, !pdl.value) 
    rewrite %5 with "rewriter"(%8 : !pdl.operation)
  }
}

// -----
module @overlapping_roots {
  pdl.pattern @rewrite_overlapping_roots : benefit(1) {
    %0 = operand
    %1 = operand
    %2 = type
    %3 = operation(%0, %1 : !pdl.value, !pdl.value)  -> (%2 : !pdl.type)
    %4 = result 0 of %3
    %5 = operation(%4 : !pdl.value) 
    rewrite with "rewriter"(%5 : !pdl.operation)
  }
}

// -----
module @force_overlapped_root {
  pdl.pattern @rewrite_forced_overlapped_root : benefit(1) {
    %0 = operand
    %1 = operand
    %2 = type
    %3 = operation(%0, %1 : !pdl.value, !pdl.value)  -> (%2 : !pdl.type)
    %4 = result 0 of %3
    %5 = operation(%4 : !pdl.value) 
    rewrite %3 with "rewriter"(%5 : !pdl.operation)
  }
}

// -----
module @variadic_results_all {
  pdl.pattern @variadic_results_all : benefit(1) {
    %0 = types
    %1 = operation  -> (%0 : !pdl.range<type>)
    %2 = results of %1 
    %3 = operation(%2 : !pdl.range<value>) 
    rewrite %1 with "rewriter"(%3 : !pdl.operation)
  }
}

// -----
module @variadic_results_at {
  pdl.pattern @variadic_results_at : benefit(1) {
    %0 = type
    %1 = types
    %2 = operand
    %3 = operation  -> (%1, %0 : !pdl.range<type>, !pdl.type)
    %4 = results 0 of %3  -> !pdl.range<value>
    %5 = operation(%4, %2 : !pdl.range<value>, !pdl.value) 
    %6 = operation(%2, %4 : !pdl.value, !pdl.range<value>) 
    rewrite with "rewriter"(%5, %6 : !pdl.operation, !pdl.operation)
  }
}

// -----
module @attribute_literal {
  pdl.pattern : benefit(1) {
    %0 = attribute = 10 : i64
    apply_native_constraint "constraint"(%0 : !pdl.attribute)
    %1 = operation 
    rewrite %1 with "rewriter"
  }
}

// -----
module @type_literal {
  pdl.pattern : benefit(1) {
    %0 = type : i32
    %1 = types : [i32, i64]
    apply_native_constraint "constraint"(%0, %1 : !pdl.type, !pdl.range<type>)
    %2 = operation 
    rewrite %2 with "rewriter"
  }
}

// -----
module @common_connector {
  pdl.pattern @common_connector : benefit(1) {
    %0 = type
    %1 = operation  -> (%0, %0 : !pdl.type, !pdl.type)
    %2 = result 0 of %1
    %3 = result 1 of %1
    %4 = operation(%2 : !pdl.value) 
    %5 = operation(%2 : !pdl.value) 
    %6 = operation(%3 : !pdl.value)  -> (%0 : !pdl.type)
    %7 = result 0 of %6
    %8 = operation(%7 : !pdl.value) 
    rewrite with "rewriter"(%4, %5, %8 : !pdl.operation, !pdl.operation, !pdl.operation)
  }
}

// -----
module @common_connector_range {
  pdl.pattern @common_connector_range : benefit(1) {
    %0 = types
    %1 = operation  -> (%0, %0 : !pdl.range<type>, !pdl.range<type>)
    %2 = results 0 of %1  -> !pdl.range<value>
    %3 = results 1 of %1  -> !pdl.range<value>
    %4 = operation(%2 : !pdl.range<value>) 
    %5 = operation(%2 : !pdl.range<value>) 
    %6 = operation(%3 : !pdl.range<value>)  -> (%0 : !pdl.range<type>)
    %7 = results of %6 
    %8 = operation(%7 : !pdl.range<value>) 
    rewrite with "rewriter"(%4, %5, %8 : !pdl.operation, !pdl.operation, !pdl.operation)
  }
}

