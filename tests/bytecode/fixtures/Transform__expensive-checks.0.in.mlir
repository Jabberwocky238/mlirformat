"builtin.module"() ({
  "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
  ^bb0(%arg0: !transform.any_op loc("<stdin>":3:8)):
    %0 = "transform.test_copy_payload"(%arg0) : (!transform.any_op) -> !transform.any_op loc("<stdin>":4:10)
    %1 = "transform.test_copy_payload"(%arg0) : (!transform.any_op) -> !transform.any_op loc("<stdin>":5:10)
    %2 = "transform.merge_handles"(%0, %1) <{deduplicate}> : (!transform.any_op, !transform.any_op) -> !transform.any_op loc("<stdin>":6:10)
    "transform.yield"() : () -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
}) {transform.with_named_sequence} : () -> () loc("<stdin>":1:1)
