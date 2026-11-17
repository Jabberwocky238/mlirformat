"builtin.module"() <{sym_name = "td_module_4"}> ({
  "builtin.module"() <{sym_name = "foo_module"}> ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg2: !transform.any_op loc("<stdin>":4:10)):
      "transform.print"() <{name = "foo_module"}> : () -> () loc("<stdin>":5:7)
      "transform.yield"() : () -> () loc("<stdin>":6:7)
    }) : () -> () loc("<stdin>":3:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":2:3)
  "builtin.module"() <{sym_name = "bar_module"}> ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg1: !transform.any_op loc("<stdin>":11:10)):
      "transform.print"() <{name = "bar_module"}> : () -> () loc("<stdin>":12:7)
      "transform.yield"() : () -> () loc("<stdin>":13:7)
    }) : () -> () loc("<stdin>":10:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":9:3)
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
  ^bb0(%arg0: !transform.any_op loc("<stdin>":17:8)):
    "transform.include"(%arg0) <{failure_propagation_mode = 2 : i32, target = @foo_module::@__transform_main}> : (!transform.any_op) -> () loc("<stdin>":18:5)
    "transform.include"(%arg0) <{failure_propagation_mode = 2 : i32, target = @bar_module::@__transform_main}> : (!transform.any_op) -> () loc("<stdin>":19:5)
    "transform.yield"() : () -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":16:3)
}) {transform.with_named_sequence} : () -> () loc("<stdin>":1:1)
