"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x2x3x4xi48>) -> tensor<1x2x3x4xi48>, sym_name = "i48_to_i64"}> ({
  ^bb0(%arg0: tensor<1x2x3x4xi48> loc("<stdin>":3:8)):
    "func.return"(%arg0) : (tensor<1x2x3x4xi48>) -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
