"builtin.module"() ({
  "transform.sequence"() <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 0, 0>}> ({
  ^bb0(%arg0: !transform.any_op loc("<stdin>":3:8)):
    "transform.match.structured"(%arg0) ({
    ^bb0(%arg4: !transform.any_op loc("<stdin>":5:10)):
      "transform.match.structured.dim"(%arg4) <{is_all, raw_dim_list = array<i64>}> : (!transform.any_op) -> () loc("<stdin>":6:7)
      "transform.match.structured.dim"(%arg4) <{raw_dim_list = array<i64: 0>}> : (!transform.any_op) -> () loc("<stdin>":7:7)
      "transform.match.structured.dim"(%arg4) <{raw_dim_list = array<i64: 0, 1, -2>}> : (!transform.any_op) -> () loc("<stdin>":8:7)
      "transform.match.structured.dim"(%arg4) <{is_inverted, raw_dim_list = array<i64: 0>}> : (!transform.any_op) -> () loc("<stdin>":9:7)
      "transform.match.structured.dim"(%arg4) <{is_inverted, raw_dim_list = array<i64: 0, -1, 2>}> : (!transform.any_op) -> () loc("<stdin>":10:7)
      "transform.match.structured.yield"() : () -> () loc("<stdin>":11:7)
    }) : (!transform.any_op) -> () loc("<stdin>":4:5)
    "transform.match.structured"(%arg0) ({
    ^bb0(%arg3: !transform.any_op loc("<stdin>":14:10)):
      "transform.match.structured.yield"() : () -> () loc("<stdin>":15:7)
    }) : (!transform.any_op) -> () loc("<stdin>":13:5)
    %0 = "transform.match.structured"(%arg0) ({
    ^bb0(%arg2: !transform.any_op loc("<stdin>":18:10)):
      "transform.match.structured.yield"(%arg2) : (!transform.any_op) -> () loc("<stdin>":19:7)
    }) : (!transform.any_op) -> !transform.any_op loc("<stdin>":17:10)
    %1:2 = "transform.match.structured"(%arg0) ({
    ^bb0(%arg1: !transform.any_op loc("<stdin>":22:10)):
      "transform.match.structured.yield"(%arg1, %arg1) : (!transform.any_op, !transform.any_op) -> () loc("<stdin>":23:7)
    }) : (!transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":21:12)
    "transform.yield"() : () -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
