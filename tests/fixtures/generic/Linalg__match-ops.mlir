"builtin.module"() ({
  "transform.sequence"() <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 0, 0>}> ({
  ^bb0(%arg0: !transform.any_op):
    "transform.match.structured"(%arg0) ({
    ^bb0(%arg4: !transform.any_op):
      "transform.match.structured.dim"(%arg4) <{is_all, raw_dim_list = array<i64>}> : (!transform.any_op) -> ()
      "transform.match.structured.dim"(%arg4) <{raw_dim_list = array<i64: 0>}> : (!transform.any_op) -> ()
      "transform.match.structured.dim"(%arg4) <{raw_dim_list = array<i64: 0, 1, -2>}> : (!transform.any_op) -> ()
      "transform.match.structured.dim"(%arg4) <{is_inverted, raw_dim_list = array<i64: 0>}> : (!transform.any_op) -> ()
      "transform.match.structured.dim"(%arg4) <{is_inverted, raw_dim_list = array<i64: 0, -1, 2>}> : (!transform.any_op) -> ()
      "transform.match.structured.yield"() : () -> ()
    }) : (!transform.any_op) -> ()
    "transform.match.structured"(%arg0) ({
    ^bb0(%arg3: !transform.any_op):
      "transform.match.structured.yield"() : () -> ()
    }) : (!transform.any_op) -> ()
    %0 = "transform.match.structured"(%arg0) ({
    ^bb0(%arg2: !transform.any_op):
      "transform.match.structured.yield"(%arg2) : (!transform.any_op) -> ()
    }) : (!transform.any_op) -> !transform.any_op
    %1:2 = "transform.match.structured"(%arg0) ({
    ^bb0(%arg1: !transform.any_op):
      "transform.match.structured.yield"(%arg1, %arg1) : (!transform.any_op, !transform.any_op) -> ()
    }) : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
    "transform.yield"() : () -> ()
  }) : () -> ()
}) : () -> ()

