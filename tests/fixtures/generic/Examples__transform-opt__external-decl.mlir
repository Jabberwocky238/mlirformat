"builtin.module"() ({
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "external_def", sym_visibility = "private"}> ({
  }) : () -> ()
  "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main", sym_visibility = "private"}> ({
  ^bb0(%arg0: !transform.any_op):
    "transform.include"(%arg0) <{failure_propagation_mode = 1 : i32, target = @external_def}> : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
}) {transform.with_named_sequence} : () -> ()

