module attributes {transform.with_named_sequence} {
  transform.named_sequence @schedule_with_constrained_param(%arg0: !transform.any_op {transform.readonly}) {
    %0 = transform.param.constant 42 : i64 -> !transform.param<i64>
    transform.smt.constrain_params(%0) : (!transform.param<i64>) -> () {
    ^bb0(%arg1: !smt.int):
      %c0 = smt.int.constant 0
      %c43 = smt.int.constant 43
      %1 = smt.int.cmp le %c0, %arg1
      smt.assert %1
      %2 = smt.int.cmp le %arg1, %c43
      smt.assert %2
    }
    transform.yield 
  }
}

// -----
module attributes {transform.with_named_sequence} {
  transform.named_sequence @schedule_with_constraint_on_multiple_params_returning_computed_value(%arg0: !transform.any_op {transform.readonly}) {
    %0 = transform.param.constant 4 : i64 -> !transform.param<i64>
    %1 = transform.param.constant 32 : i64 -> !transform.param<i64>
    %2 = transform.smt.constrain_params(%0, %1) : (!transform.param<i64>, !transform.param<i64>) -> !transform.param<i64> {
    ^bb0(%arg1: !smt.int, %arg2: !smt.int):
      %3 = smt.int.div %arg2, %arg1
      %c0 = smt.int.constant 0
      %4 = smt.int.mod %arg2, %arg1
      %5 = smt.eq %4, %c0 : !smt.int
      smt.assert %5
      smt.yield %3 : !smt.int
    }
    transform.yield 
  }
}

// -----
module attributes {transform.with_named_sequence} {
  transform.named_sequence @schedule_with_param_as_a_bool(%arg0: !transform.any_op {transform.readonly}) {
    %0 = transform.param.constant true -> !transform.param<i1>
    transform.smt.constrain_params(%0) : (!transform.param<i1>) -> () {
    ^bb0(%arg1: !smt.bool):
      %c0 = smt.int.constant 0
      %c1 = smt.int.constant 1
      %1 = smt.eq %c0, %c1 : !smt.int
      %2 = smt.or %arg1, %1
      smt.assert %2
    }
    transform.yield 
  }
}

