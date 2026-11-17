"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x16xf32>) -> (), sym_name = "zero_results"}> ({
  ^bb0(%arg0: tensor<1x16xf32> loc("<stdin>":3:8)):
    "tosa.custom"(%arg0) <{domain_name = "test", implementation_attrs = "{}", operator_name = "NoResult"}> : (tensor<1x16xf32>) -> () loc("<stdin>":4:5)
    "func.return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
