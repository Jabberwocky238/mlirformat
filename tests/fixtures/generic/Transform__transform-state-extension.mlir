"builtin.module"() ({
  "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
  ^bb0(%arg0: !transform.any_op):
    "transform.test_add_test_extension"() <{message = "A"}> : () -> ()
    %0 = "transform.test_remap_operand_to_self"(%arg0) : (!transform.any_op) -> !transform.any_op
    "transform.yield"() : () -> ()
  }) : () -> ()
}) {transform.with_named_sequence} : () -> ()

// -----
"builtin.module"() ({
  "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
  ^bb0(%arg0: !transform.any_op):
    "transform.test_add_test_extension"() <{message = "A"}> : () -> ()
    %0 = "transform.test_remap_operand_to_self"(%arg0) : (!transform.any_op) -> !transform.any_op
    %1 = "transform.test_remap_operand_to_self"(%0) : (!transform.any_op) -> !transform.any_op
    "transform.yield"() : () -> ()
  }) : () -> ()
}) {transform.with_named_sequence} : () -> ()

