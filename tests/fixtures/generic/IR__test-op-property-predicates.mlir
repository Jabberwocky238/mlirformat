"builtin.module"() ({
  "test.op_with_property_predicates"() <{array = [], defaulted = 3 : i64, more_constrained = 4 : i64, non_empty_constrained = [6], non_empty_optional = [[7]], non_empty_unconstrained = [5], optional = [2], scalar = 1 : i64, unconstrained = 8 : i64}> : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "test.op_with_property_predicates"() <{array = [], defaulted = 0 : i64, more_constrained = 4 : i64, non_empty_constrained = [6], non_empty_optional = [], non_empty_unconstrained = [5], optional = [], scalar = 1 : i64, unconstrained = 8 : i64}> : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
