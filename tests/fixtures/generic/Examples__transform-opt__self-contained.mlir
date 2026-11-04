"builtin.module"() ({
  "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main", sym_visibility = "private"}> ({
  ^bb0(%arg0: !transform.any_op):
    "transform.print"(%arg0) <{name = "in self-contained"}> : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
}) {transform.with_named_sequence} : () -> ()

