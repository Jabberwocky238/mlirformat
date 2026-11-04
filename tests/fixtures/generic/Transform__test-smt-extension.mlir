"builtin.module"() ({
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "schedule_with_constrained_param"}> ({
  ^bb0(%arg0: !transform.any_op):
    %0 = "transform.param.constant"() <{value = 42 : i64}> : () -> !transform.param<i64>
    "transform.smt.constrain_params"(%0) ({
    ^bb0(%arg1: !smt.int):
      %1 = "smt.int.constant"() <{value = 0 : ui64}> : () -> !smt.int
      %2 = "smt.int.constant"() <{value = 43 : ui8}> : () -> !smt.int
      %3 = "smt.int.cmp"(%1, %arg1) <{pred = 1 : i64}> : (!smt.int, !smt.int) -> !smt.bool
      "smt.assert"(%3) : (!smt.bool) -> ()
      %4 = "smt.int.cmp"(%arg1, %2) <{pred = 1 : i64}> : (!smt.int, !smt.int) -> !smt.bool
      "smt.assert"(%4) : (!smt.bool) -> ()
      "smt.yield"() : () -> ()
    }) : (!transform.param<i64>) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
}) {transform.with_named_sequence} : () -> ()

// -----
"builtin.module"() ({
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "schedule_with_constraint_on_multiple_params_returning_computed_value"}> ({
  ^bb0(%arg0: !transform.any_op):
    %0 = "transform.param.constant"() <{value = 4 : i64}> : () -> !transform.param<i64>
    %1 = "transform.param.constant"() <{value = 32 : i64}> : () -> !transform.param<i64>
    %2 = "transform.smt.constrain_params"(%0, %1) ({
    ^bb0(%arg1: !smt.int, %arg2: !smt.int):
      %3 = "smt.int.div"(%arg2, %arg1) : (!smt.int, !smt.int) -> !smt.int
      %4 = "smt.int.constant"() <{value = 0 : ui64}> : () -> !smt.int
      %5 = "smt.int.mod"(%arg2, %arg1) : (!smt.int, !smt.int) -> !smt.int
      %6 = "smt.eq"(%5, %4) : (!smt.int, !smt.int) -> !smt.bool
      "smt.assert"(%6) : (!smt.bool) -> ()
      "smt.yield"(%3) : (!smt.int) -> ()
    }) : (!transform.param<i64>, !transform.param<i64>) -> !transform.param<i64>
    "transform.yield"() : () -> ()
  }) : () -> ()
}) {transform.with_named_sequence} : () -> ()

// -----
"builtin.module"() ({
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "schedule_with_param_as_a_bool"}> ({
  ^bb0(%arg0: !transform.any_op):
    %0 = "transform.param.constant"() <{value = true}> : () -> !transform.param<i1>
    "transform.smt.constrain_params"(%0) ({
    ^bb0(%arg1: !smt.bool):
      %1 = "smt.int.constant"() <{value = 0 : ui64}> : () -> !smt.int
      %2 = "smt.int.constant"() <{value = 1 : ui4}> : () -> !smt.int
      %3 = "smt.eq"(%1, %2) : (!smt.int, !smt.int) -> !smt.bool
      %4 = "smt.or"(%arg1, %3) : (!smt.bool, !smt.bool) -> !smt.bool
      "smt.assert"(%4) : (!smt.bool) -> ()
      "smt.yield"() : () -> ()
    }) : (!transform.param<i1>) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
}) {transform.with_named_sequence} : () -> ()

