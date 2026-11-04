"builtin.module"() ({
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "external_def"}> ({
  ^bb0(%arg0: !transform.any_op):
    "transform.print"(%arg0) <{name = "external_def"}> : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
}) {transform.with_named_sequence} : () -> ()

