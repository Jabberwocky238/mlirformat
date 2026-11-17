"builtin.module"() ({
  "transform.sequence"() <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 0, 0>}> ({
  ^bb0(%arg0: !transform.any_op loc("<stdin>":3:8)):
    "transform.alternatives"(%arg0) ({
    ^bb0(%arg1: !transform.any_op loc("<stdin>":5:10)):
      "transform.yield"() : () -> () loc("<stdin>":6:7)
    }) : (!transform.any_op) -> () loc("<stdin>":4:5)
    "transform.yield"() : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
