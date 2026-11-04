module {
  test.op_with_property_predicates <{array = [], defaulted = 3 : i64, more_constrained = 4 : i64, non_empty_constrained = [6], non_empty_optional = [[7]], non_empty_unconstrained = [5], optional = [2], scalar = 1 : i64, unconstrained = 8 : i64}>
}

// -----
module {
  test.op_with_property_predicates <{array = [], more_constrained = 4 : i64, non_empty_constrained = [6], non_empty_unconstrained = [5], scalar = 1 : i64, unconstrained = 8 : i64}>
}

// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
