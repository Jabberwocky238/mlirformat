"builtin.module"() ({
  "func.func"() <{function_type = (tensor<5xf32>) -> index, sym_name = "canonicalization"}> ({
  ^bb0(%arg1: tensor<5xf32> loc("<stdin>":4:8)):
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:10)
    %3 = "tensor.dim"(%arg1, %2) : (tensor<5xf32>, index) -> index loc("<stdin>":6:10)
    "func.return"(%3) : (index) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":3:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":11:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.dim"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":12:12)
      %1 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":13:12)
      "transform.apply_patterns"(%1) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.canonicalization"() : () -> () loc("<stdin>":15:9)
      }) : (!transform.any_op) -> () loc("<stdin>":14:7)
      "transform.yield"() : () -> () loc("<stdin>":17:7)
    }) : () -> () loc("<stdin>":10:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":9:3)
}) : () -> () loc("<stdin>":2:1)
