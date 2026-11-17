"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x16xf32>, tensor<1x16xf32>) -> tensor<1x16xf32>, sym_name = "mapped_custom"}> ({
  ^bb0(%arg0: tensor<1x16xf32> loc("<stdin>":3:8), %arg1: tensor<1x16xf32> loc("<stdin>":3:33)):
    %0 = "tosa.custom"(%arg0, %arg1) <{domain_name = "my:custom", implementation_attrs = "{\22param\22:\22value\22}", operator_name = "TestOp"}> : (tensor<1x16xf32>, tensor<1x16xf32>) -> tensor<1x16xf32> loc("<stdin>":4:10)
    "func.return"(%0) : (tensor<1x16xf32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
