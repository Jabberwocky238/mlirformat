"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xi1>) -> tensor<13x21x3xf32>, sym_name = "test_bool_to_fp32"}> ({
  ^bb0(%arg0: tensor<13x21x3xi1> loc("<stdin>":3:8)):
    %0 = "tosa.cast"(%arg0) : (tensor<13x21x3xi1>) -> tensor<13x21x3xf32> loc("<stdin>":4:10)
    "func.return"(%0) : (tensor<13x21x3xf32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
