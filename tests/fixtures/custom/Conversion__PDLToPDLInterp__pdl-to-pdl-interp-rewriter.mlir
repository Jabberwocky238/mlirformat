module {
}

// -----
module @external {
  pdl.pattern : benefit(1) {
    %0 = operand
    %1 = operation "foo.op"(%0 : !pdl.value) 
    rewrite %1 with "rewriter"(%0 : !pdl.value)
  }
}

// -----
module @erase {
  pdl.pattern : benefit(1) {
    %0 = operation "foo.op" 
    rewrite %0 {
      erase %0
    }
  }
}

// -----
module @operation_attributes {
  pdl.pattern : benefit(1) {
    %0 = attribute
    %1 = operation "foo.op"  {"attr" = %0}
    rewrite %1 {
      %2 = attribute = true
      %3 = operation "foo.op"  {"attr" = %0, "attr1" = %2}
      erase %1
    }
  }
}

// -----
module @operation_operands {
  pdl.pattern : benefit(1) {
    %0 = operand
    %1 = operation "foo.op"(%0 : !pdl.value) 
    rewrite %1 {
      %2 = type : i32
      %3 = operation "foo.op"(%0 : !pdl.value)  -> (%2 : !pdl.type)
      %4 = result 0 of %3
      %5 = operation "foo.op2"(%4 : !pdl.value) 
      erase %1
    }
  }
}

// -----
module @operation_infer_types_from_replaceop {
  pdl.pattern : benefit(1) {
    %0 = type
    %1 = type
    %2 = operation "foo.op"  -> (%0, %1 : !pdl.type, !pdl.type)
    rewrite %2 {
      %3 = type
      %4 = operation "foo.op" 
      replace %2 with %4
    }
  }
}

// -----
module @operation_infer_types_from_otherop_individual_results {
  pdl.pattern : benefit(1) {
    %0 = type
    %1 = types
    %2 = operation "foo.op"  -> (%0, %1 : !pdl.type, !pdl.range<type>)
    rewrite %2 {
      %3 = operation "foo.op"  -> (%0, %1 : !pdl.type, !pdl.range<type>)
    }
  }
}

// -----
module @operation_infer_types_from_otherop_results {
  pdl.pattern : benefit(1) {
    %0 = types
    %1 = operation "foo.op"  -> (%0 : !pdl.range<type>)
    rewrite %1 {
      %2 = operation "foo.op"  -> (%0 : !pdl.range<type>)
    }
  }
}

// -----
module @operation_infer_types_from_interface {
  %true = arith.constant true
  pdl.pattern : benefit(1) {
    %0 = operation "foo.op" 
    rewrite %0 {
      %1 = types
      %2 = operation "arith.constant"  -> (%1 : !pdl.range<type>)
      %3 = operation "foo.op"  -> (%1 : !pdl.range<type>)
    }
  }
}

// -----
module @replace_with_op {
  pdl.pattern : benefit(1) {
    %0 = type : i32
    %1 = operation "foo.op"  -> (%0 : !pdl.type)
    rewrite %1 {
      %2 = operation "foo.op"  -> (%0 : !pdl.type)
      replace %1 with %2
    }
  }
}

// -----
module @replace_with_values {
  pdl.pattern : benefit(1) {
    %0 = types
    %1 = operation "foo.op"  -> (%0 : !pdl.range<type>)
    rewrite %1 {
      %2 = operation "foo.op"  -> (%0 : !pdl.range<type>)
      %3 = result 0 of %2
      %4 = results 1 of %2  -> !pdl.range<value>
      %5 = results 2 of %2  -> !pdl.value
      replace %1 with(%3, %4, %5 : !pdl.value, !pdl.range<value>, !pdl.value)
    }
  }
}

// -----
module @replace_with_no_results {
  pdl.pattern : benefit(1) {
    %0 = operation "foo.op" 
    rewrite %0 {
      %1 = operation "foo.op" 
      replace %0 with %1
    }
  }
}

// -----
module @apply_native_rewrite {
  pdl.pattern : benefit(1) {
    %0 = type
    %1 = operation "foo.op"  -> (%0 : !pdl.type)
    rewrite %1 {
      %2 = apply_native_rewrite "functor"(%1 : !pdl.operation) : !pdl.type
      %3 = operation "foo.op"  -> (%2 : !pdl.type)
    }
  }
}

// -----
module @unbound_rewrite_op {
  pdl.pattern : benefit(1) {
    %0 = operation "foo.op" 
    rewrite %0 {
      %1 = operation "bar.op" 
    }
  }
}

// -----
module @range_op {
  pdl.pattern : benefit(1) {
    %0 = operand
    %1 = operation "foo.op"(%0 : !pdl.value) 
    rewrite %1 {
      %2 = range : !pdl.range<value>
      %3 = range %0, %2 : !pdl.value, !pdl.range<value> 
    }
  }
}

