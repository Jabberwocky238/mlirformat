module attributes {transform.with_named_sequence} {
  transform.named_sequence @_match_matmul_like(%arg0: !transform.any_op {transform.readonly}, %arg1: !transform.param<i64> {transform.readonly}) -> (!transform.any_op, !transform.any_op, !transform.param<i64>, !transform.type, !transform.type, !transform.type, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>) {
    %0 = transform.param.constant 1 : i64 -> !transform.param<i64>
    %1 = transform.param.constant 2 : i64 -> !transform.param<i64>
    %2:9 = transform.match.structured %arg0 : (!transform.any_op) -> (!transform.any_op, !transform.param<i64>, !transform.type, !transform.type, !transform.type, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>) {
    ^bb0(%arg2: !transform.any_op):
      %3 = transform.match.structured.rank %arg2 : (!transform.any_op) -> !transform.param<i64>
      transform.match.param.cmpi eq %arg1, %3 : !transform.param<i64>
      %4 = transform.match.structured.dim %arg2[all] : (!transform.any_op) -> !transform.param<i64>
      %5 = transform.match.structured.num_inputs %arg2 : (!transform.any_op) -> !transform.param<i64>
      %6 = transform.match.structured.num_inits %arg2 : (!transform.any_op) -> !transform.param<i64>
      transform.match.param.cmpi eq %5, %1 : !transform.param<i64>
      transform.match.param.cmpi eq %6, %0 : !transform.param<i64>
      %7 = transform.match.structured.input %arg2[0] : (!transform.any_op) -> !transform.any_value
      %8 = transform.match.structured.input %arg2[1] : (!transform.any_op) -> !transform.any_value
      %9 = transform.match.structured.result %arg2[0] : (!transform.any_op) -> !transform.any_value
      %10 = transform.get_type elemental %7 : (!transform.any_value) -> !transform.type
      %11 = transform.get_type elemental %8 : (!transform.any_value) -> !transform.type
      %12 = transform.get_type elemental %9 : (!transform.any_value) -> !transform.type
      %13 = transform.match.structured.init %arg2[0] : (!transform.any_op) -> !transform.any_op
      transform.match.operation_name %13 ["linalg.fill"] : !transform.any_op
      transform.match.structured.body %arg2 {contraction = ["arith.mulf", "arith.addf"]} : !transform.any_op
      %batch, %m, %n, %k = transform.match.structured.classify_contraction_dims %arg2 : (!transform.any_op) -> (!transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>)
      transform.match.structured.yield %13, %4, %10, %11, %12, %batch, %m, %n, %k : !transform.any_op, !transform.param<i64>, !transform.type, !transform.type, !transform.type, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>
    }
    transform.yield %2#0, %arg0, %2#1, %2#2, %2#3, %2#4, %2#5, %2#6, %2#7, %2#8 : !transform.any_op, !transform.any_op, !transform.param<i64>, !transform.type, !transform.type, !transform.type, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>
  }
}

