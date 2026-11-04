"builtin.module"() <{sym_name = "td_module_4"}> ({
  "builtin.module"() <{sym_name = "foo_module"}> ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg2: !transform.any_op):
      "transform.print"() <{name = "foo_module"}> : () -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
  "builtin.module"() <{sym_name = "bar_module"}> ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg1: !transform.any_op):
      "transform.print"() <{name = "bar_module"}> : () -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
  ^bb0(%arg0: !transform.any_op):
    "transform.include"(%arg0) <{failure_propagation_mode = 2 : i32, target = @foo_module::@__transform_main}> : (!transform.any_op) -> ()
    "transform.include"(%arg0) <{failure_propagation_mode = 2 : i32, target = @bar_module::@__transform_main}> : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
}) {transform.with_named_sequence} : () -> ()

