"builtin.module"() ({
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "schedule_with_constrained_param"}> ({
  ^bb0(%arg0: !transform.any_op loc("<stdin>":3:8)):
    %0 = "transform.param.constant"() <{value = 42 : i64}> : () -> !transform.param<i64> loc("<stdin>":4:10)
    "transform.smt.constrain_params"(%0) ({
    ^bb0(%arg1: !smt.int loc("<stdin>":6:10)):
      %1 = "smt.int.constant"() <{value = 0 : ui64}> : () -> !smt.int loc("<stdin>":7:12)
      %2 = "smt.int.constant"() <{value = 43 : ui8}> : () -> !smt.int loc("<stdin>":8:12)
      %3 = "smt.int.cmp"(%1, %arg1) <{pred = 1 : i64}> : (!smt.int, !smt.int) -> !smt.bool loc("<stdin>":9:12)
      "smt.assert"(%3) : (!smt.bool) -> () loc("<stdin>":10:7)
      %4 = "smt.int.cmp"(%arg1, %2) <{pred = 1 : i64}> : (!smt.int, !smt.int) -> !smt.bool loc("<stdin>":11:12)
      "smt.assert"(%4) : (!smt.bool) -> () loc("<stdin>":12:7)
      "smt.yield"() : () -> () loc("<stdin>":13:7)
    }) : (!transform.param<i64>) -> () loc("<stdin>":5:5)
    "transform.yield"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":2:3)
}) {transform.with_named_sequence} : () -> () loc("<stdin>":1:1)
