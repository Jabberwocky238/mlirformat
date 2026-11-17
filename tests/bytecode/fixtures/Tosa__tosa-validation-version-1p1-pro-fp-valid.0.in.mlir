"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x27x3xi8>, tensor<13x26xi32>) -> tensor<13x26x3xi8>, sym_name = "test_gather_i8_i32"}> ({
  ^bb0(%arg0: tensor<13x27x3xi8> loc("<stdin>":3:8), %arg1: tensor<13x26xi32> loc("<stdin>":3:35)):
    %0 = "tosa.gather"(%arg0, %arg1) : (tensor<13x27x3xi8>, tensor<13x26xi32>) -> tensor<13x26x3xi8> loc("<stdin>":4:10)
    "func.return"(%0) : (tensor<13x26x3xi8>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
