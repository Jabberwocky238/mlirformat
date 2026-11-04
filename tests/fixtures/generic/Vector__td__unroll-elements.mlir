"builtin.module"() ({
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "unroll_to_elements"}> ({
  ^bb0(%arg0: !transform.any_op):
    %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
    "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
      "transform.apply_patterns.vector.unroll_to_elements"() : () -> ()
      "transform.apply_patterns.vector.unroll_from_elements"() : () -> ()
    }) : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
}) {transform.with_named_sequence} : () -> ()

