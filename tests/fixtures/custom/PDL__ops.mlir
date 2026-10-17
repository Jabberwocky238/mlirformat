module {
}

// -----
module {
  pdl.pattern @operations : benefit(1) {
    %0 = attribute
    %1 = type
    %2 = operation  {"attr" = %0} -> (%1 : !pdl.type)
    %3 = result 0 of %2
    %4 = operand
    %5 = operation(%3, %4 : !pdl.value, !pdl.value) 
    rewrite %5 with "rewriter"
  }
}

// -----
module {
  pdl.pattern @rewrite_with_args : benefit(1) {
    %0 = operand
    %1 = operation(%0 : !pdl.value) 
    rewrite %1 with "rewriter"(%0 : !pdl.value)
  }
}

// -----
module {
  pdl.pattern @rewrite_multi_root_optimal : benefit(2) {
    %0 = operand
    %1 = operand
    %2 = type
    %3 = operation(%0 : !pdl.value)  -> (%2 : !pdl.type)
    %4 = result 0 of %3
    %5 = operation(%4 : !pdl.value) 
    %6 = operation(%1 : !pdl.value)  -> (%2 : !pdl.type)
    %7 = result 0 of %6
    %8 = operation(%4, %7 : !pdl.value, !pdl.value) 
    rewrite with "rewriter"(%5, %8 : !pdl.operation, !pdl.operation)
  }
}

// -----
module {
  pdl.pattern @rewrite_multi_root_forced : benefit(2) {
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
module {
  pdl.pattern @infer_type_from_operation_replace : benefit(1) {
    %0 = type : i32
    %1 = type
    %2 = operation  -> (%0, %1 : !pdl.type, !pdl.type)
    rewrite %2 {
      %3 = type
      %4 = operation "foo.op"  -> (%0, %3 : !pdl.type, !pdl.type)
      replace %2 with %4
    }
  }
}

// -----
module {
  pdl.pattern @infer_type_from_type_used_in_match : benefit(1) {
    %0 = type : i32
    %1 = type
    %2 = operation  -> (%0, %1 : !pdl.type, !pdl.type)
    rewrite %2 {
      %3 = operation "foo.op"  -> (%0, %1 : !pdl.type, !pdl.type)
    }
  }
}

// -----
module {
  pdl.pattern @infer_type_from_type_used_in_match : benefit(1) {
    %0 = types
    %1 = operation  -> (%0 : !pdl.range<type>)
    rewrite %1 {
      %2 = types : [i32, i64]
      %3 = operation "foo.op"  -> (%0, %2 : !pdl.range<type>, !pdl.range<type>)
    }
  }
}

// -----
module {
  pdl.pattern @infer_type_from_type_used_in_match : benefit(1) {
    %0 = type
    %1 = type
    %2 = operand : %0
    %3 = operand : %1
    %4 = operation(%2, %3 : !pdl.value, !pdl.value) 
    rewrite %4 {
      %5 = operation "foo.op"  -> (%0, %1 : !pdl.type, !pdl.type)
    }
  }
}

// -----
module {
  pdl.pattern @infer_type_from_type_used_in_match : benefit(1) {
    %0 = types
    %1 = operands : %0
    %2 = operation(%1 : !pdl.range<value>) 
    rewrite %2 {
      %3 = operation "foo.op"  -> (%0 : !pdl.range<type>)
    }
  }
}

// -----
module {
  pdl.pattern @apply_rewrite_with_no_results : benefit(1) {
    %0 = operation 
    rewrite %0 {
      apply_native_rewrite "NativeRewrite"(%0 : !pdl.operation)
    }
  }
}

// -----
module {
  pdl.pattern @apply_constraint_with_no_results : benefit(1) {
    %0 = operation 
    apply_native_constraint "NativeConstraint"(%0 : !pdl.operation)
    rewrite %0 with "rewriter"
  }
}

// -----
module {
  pdl.pattern @apply_constraint_with_results : benefit(1) {
    %0 = operation 
    %1 = apply_native_constraint "NativeConstraint"(%0 : !pdl.operation) : !pdl.attribute
    rewrite %0 {
      apply_native_rewrite "NativeRewrite"(%1 : !pdl.attribute)
    }
  }
}

// -----
module {
  pdl.pattern @attribute_with_dict : benefit(1) {
    %0 = operation 
    rewrite %0 {
      %1 = attribute = {some_unit_attr} attributes {pdl.special_attribute}
      apply_native_rewrite "NativeRewrite"(%1 : !pdl.attribute)
    }
  }
}

// -----
module {
  pdl.pattern @attribute_with_loc : benefit(1) {
    %0 = attribute
    %1 = operation  {"attribute" = %0}
    rewrite %1 with "rewriter"
  }
}

