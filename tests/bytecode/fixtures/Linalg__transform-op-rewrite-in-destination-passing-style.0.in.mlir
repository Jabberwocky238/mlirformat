"builtin.module"() ({
  "func.func"() <{function_type = (index) -> tensor<index>, sym_name = "tensor_from_elements_0d"}> ({
  ^bb0(%arg1: index loc("<stdin>":3:8)):
    %2 = "tensor.from_elements"(%arg1) : (index) -> tensor<index> loc("<stdin>":4:10)
    "func.return"(%2) : (tensor<index>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":9:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.from_elements"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":10:12)
      %1 = "transform.structured.rewrite_in_destination_passing_style"(%0) : (!transform.any_op) -> !transform.any_op loc("<stdin>":11:12)
      "transform.yield"() : () -> () loc("<stdin>":12:7)
    }) : () -> () loc("<stdin>":8:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":7:3)
}) : () -> () loc("<stdin>":1:1)
