"builtin.module"() ({
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}, {transform.readonly}], function_type = (!transform.any_op, !transform.param<i64>) -> (!transform.any_op, !transform.any_op, !transform.param<i64>, !transform.type, !transform.type, !transform.type, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>), sym_name = "_match_matmul_like"}> ({
  ^bb0(%arg0: !transform.any_op, %arg1: !transform.param<i64>):
    %0 = "transform.param.constant"() <{value = 1 : i64}> : () -> !transform.param<i64>
    %1 = "transform.param.constant"() <{value = 2 : i64}> : () -> !transform.param<i64>
    %2:9 = "transform.match.structured"(%arg0) ({
    ^bb0(%arg2: !transform.any_op):
      %3 = "transform.match.structured.rank"(%arg2) : (!transform.any_op) -> !transform.param<i64>
      "transform.match.param.cmpi"(%arg1, %3) <{predicate = 0 : i32}> : (!transform.param<i64>, !transform.param<i64>) -> ()
      %4 = "transform.match.structured.dim"(%arg2) <{is_all, raw_dim_list = array<i64>}> : (!transform.any_op) -> !transform.param<i64>
      %5 = "transform.match.structured.num_inputs"(%arg2) : (!transform.any_op) -> !transform.param<i64>
      %6 = "transform.match.structured.num_inits"(%arg2) : (!transform.any_op) -> !transform.param<i64>
      "transform.match.param.cmpi"(%5, %1) <{predicate = 0 : i32}> : (!transform.param<i64>, !transform.param<i64>) -> ()
      "transform.match.param.cmpi"(%6, %0) <{predicate = 0 : i32}> : (!transform.param<i64>, !transform.param<i64>) -> ()
      %7 = "transform.match.structured.input"(%arg2) <{raw_position_list = array<i64: 0>}> : (!transform.any_op) -> !transform.any_value
      %8 = "transform.match.structured.input"(%arg2) <{raw_position_list = array<i64: 1>}> : (!transform.any_op) -> !transform.any_value
      %9 = "transform.match.structured.result"(%arg2) <{position = 0 : i64}> : (!transform.any_op) -> !transform.any_value
      %10 = "transform.get_type"(%7) <{elemental}> : (!transform.any_value) -> !transform.type
      %11 = "transform.get_type"(%8) <{elemental}> : (!transform.any_value) -> !transform.type
      %12 = "transform.get_type"(%9) <{elemental}> : (!transform.any_value) -> !transform.type
      %13 = "transform.match.structured.init"(%arg2) <{raw_position_list = array<i64: 0>}> : (!transform.any_op) -> !transform.any_op
      "transform.match.operation_name"(%13) <{op_names = ["linalg.fill"]}> : (!transform.any_op) -> ()
      "transform.match.structured.body"(%arg2) <{contraction = ["arith.mulf", "arith.addf"]}> : (!transform.any_op) -> ()
      %14:4 = "transform.match.structured.classify_contraction_dims"(%arg2) : (!transform.any_op) -> (!transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>)
      "transform.match.structured.yield"(%13, %4, %10, %11, %12, %14#0, %14#1, %14#2, %14#3) : (!transform.any_op, !transform.param<i64>, !transform.type, !transform.type, !transform.type, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>) -> ()
    }) : (!transform.any_op) -> (!transform.any_op, !transform.param<i64>, !transform.type, !transform.type, !transform.type, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>)
    "transform.yield"(%2#0, %arg0, %2#1, %2#2, %2#3, %2#4, %2#5, %2#6, %2#7, %2#8) : (!transform.any_op, !transform.any_op, !transform.param<i64>, !transform.type, !transform.type, !transform.type, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>) -> ()
  }) : () -> ()
}) {transform.with_named_sequence} : () -> ()

