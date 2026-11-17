"builtin.module"() ({
  "func.func"() <{function_type = (tensor<5xf32>) -> index, sym_name = "successful_pass_application"}> ({
  ^bb0(%arg1: tensor<5xf32> loc("<stdin>":3:8)):
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:10)
    %3 = "tensor.dim"(%arg1, %2) : (tensor<5xf32>, index) -> index loc("<stdin>":5:10)
    "func.return"(%3) : (index) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":10:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":11:12)
      %1 = "transform.apply_registered_pass"(%0) <{options = {}, pass_name = "canonicalize"}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":12:12)
      "transform.yield"() : () -> () loc("<stdin>":13:7)
    }) : () -> () loc("<stdin>":9:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":8:3)
}) : () -> () loc("<stdin>":1:1)
