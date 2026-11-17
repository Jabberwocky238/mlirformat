"builtin.module"() ({
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "flatten"}> ({
  ^bb0(%arg0: !transform.any_op loc("<stdin>":3:8)):
    %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":4:10)
    "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
      "transform.apply_patterns.vector.flatten_vector_transfer_ops"() <{target_vector_bitwidth = 4294967295 : ui32}> : () -> () loc("<stdin>":6:7)
    }) : (!transform.any_op) -> () loc("<stdin>":5:5)
    "transform.yield"() : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
}) {transform.with_named_sequence} : () -> () loc("<stdin>":1:1)
