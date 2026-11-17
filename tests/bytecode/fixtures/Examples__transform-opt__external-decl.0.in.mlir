"builtin.module"() ({
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "external_def", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":2:3)
  "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main", sym_visibility = "private"}> ({
  ^bb0(%arg0: !transform.any_op loc("<stdin>":5:8)):
    "transform.include"(%arg0) <{failure_propagation_mode = 1 : i32, target = @external_def}> : (!transform.any_op) -> () loc("<stdin>":6:5)
    "transform.yield"() : () -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":4:3)
}) {transform.with_named_sequence} : () -> () loc("<stdin>":1:1)
