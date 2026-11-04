"builtin.module"() <{sym_name = "transforms"}> ({
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "decompose_unpack"}> ({
  ^bb0(%arg0: !transform.any_op):
    %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.unpack"]}> : (!transform.any_op) -> !transform.any_op
    %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
    "transform.apply_patterns"(%1) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
      "transform.apply_patterns.linalg.decompose_pack_unpack"() : () -> ()
    }) : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
}) {transform.with_named_sequence} : () -> ()

