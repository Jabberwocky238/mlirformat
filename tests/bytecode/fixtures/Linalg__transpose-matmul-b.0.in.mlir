"builtin.module"() ({
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
  ^bb0(%arg0: !transform.any_op loc("<stdin>":3:8)):
    %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul", "linalg.batch_matmul"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":4:10)
    %1 = "transform.structured.transpose_matmul"(%0) <{inputToTranspose = 1 : i32}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":5:10)
    %2 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":6:10)
    "transform.apply_cse"(%2) : (!transform.any_op) -> () loc("<stdin>":7:5)
    "transform.apply_patterns"(%2) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
      "transform.apply_patterns.canonicalization"() : () -> () loc("<stdin>":9:7)
    }) : (!transform.any_op) -> () loc("<stdin>":8:5)
    "transform.yield"() : () -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":2:3)
}) {transform.with_named_sequence} : () -> () loc("<stdin>":1:1)
