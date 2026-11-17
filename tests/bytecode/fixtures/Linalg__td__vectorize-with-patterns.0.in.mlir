"builtin.module"() <{sym_name = "transforms"}> ({
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "vectorize_with_patterns"}> ({
  ^bb0(%arg0: !transform.any_op loc("<stdin>":3:8)):
    %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":4:10)
    %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":5:10)
    %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) <{vectorize_nd_extract}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":6:10)
    "transform.yield"() : () -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
}) {transform.with_named_sequence} : () -> () loc("<stdin>":1:1)
