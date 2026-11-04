"builtin.module"() <{sym_name = "transforms"}> ({
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "drop_unit_dims"}> ({
  ^bb0(%arg0: !transform.any_op):
    %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
    "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
      "transform.apply_patterns.vector.drop_inner_most_unit_dims_from_xfer_ops"() : () -> ()
    }) : (!transform.op<"func.func">) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
}) {transform.with_named_sequence} : () -> ()

