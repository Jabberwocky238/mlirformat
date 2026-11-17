"builtin.module"() ({
  "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main", sym_visibility = "private"}> ({
  ^bb0(%arg0: !transform.any_op loc("<stdin>":3:8)):
    "transform.print"(%arg0) <{name = "in self-contained"}> : (!transform.any_op) -> () loc("<stdin>":4:5)
    "transform.yield"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) {transform.with_named_sequence} : () -> () loc("<stdin>":1:1)
