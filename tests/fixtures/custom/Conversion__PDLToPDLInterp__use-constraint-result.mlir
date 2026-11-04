module {
  pdl.pattern : benefit(1) {
    %0 = attribute
    %1 = types
    %2 = operation "tosa.mul"  {"shift" = %0} -> (%1 : !pdl.range<type>)
    %3 = attribute = 0 : i32
    %4 = attribute = 1 : i32
    %5 = apply_native_constraint "return_attr_constraint"(%3, %4 : !pdl.attribute, !pdl.attribute) : !pdl.attribute
    apply_native_constraint "use_attr_constraint"(%0, %5 : !pdl.attribute, !pdl.attribute)
    rewrite %2 with "rewriter"
  }
}

// -----
module {
  pdl.pattern : benefit(1) {
    %0 = operation 
    %1 = result 0 of %0
    %2 = apply_native_constraint "return_attr_constraint"(%0 : !pdl.operation) : !pdl.attribute
    %3 = operation(%1 : !pdl.value)  {"attr" = %2}
    rewrite %3 with "rewriter"(%2 : !pdl.attribute)
  }
}

// -----
module {
  pdl.pattern : benefit(1) {
    %0 = attribute = 10 : i64
    %1 = apply_native_constraint "return_value_constr"(%0 : !pdl.attribute) : !pdl.value
    %2 = operation(%1 : !pdl.value) 
    rewrite %2 with "rewriter"
  }
}

// -----
module {
  pdl.pattern : benefit(1) {
    %0 = attribute = 10 : i64
    %1 = apply_native_constraint "return_type_constr"(%0 : !pdl.attribute) : !pdl.type
    %2 = operation  -> (%1 : !pdl.type)
    rewrite %2 with "rewriter"
  }
}

// -----
module {
  pdl.pattern : benefit(1) {
    %0 = attribute = 10 : i64
    %1 = apply_native_constraint "return_type_range_constr"(%0 : !pdl.attribute) : !pdl.range<type>
    %2 = operation  -> (%1 : !pdl.range<type>)
    rewrite %2 with "rewriter"
  }
}

