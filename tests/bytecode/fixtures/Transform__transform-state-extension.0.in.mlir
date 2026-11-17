"builtin.module"() ({
  "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
  ^bb0(%arg0: !transform.any_op loc("<stdin>":3:8)):
    "transform.test_add_test_extension"() <{message = "A"}> : () -> () loc("<stdin>":4:5)
    %0 = "transform.test_remap_operand_to_self"(%arg0) : (!transform.any_op) -> !transform.any_op loc("<stdin>":5:10)
    "transform.yield"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) {transform.with_named_sequence} : () -> () loc("<stdin>":1:1)
