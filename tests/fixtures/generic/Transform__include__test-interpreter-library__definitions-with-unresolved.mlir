"builtin.module"() ({
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "print_message"}> ({
  }) : () -> ()
  "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "reference_other_module"}> ({
  ^bb0(%arg0: !transform.any_op):
    "transform.include"(%arg0) <{failure_propagation_mode = 1 : i32, target = @print_message}> : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
}) {transform.with_named_sequence} : () -> ()

