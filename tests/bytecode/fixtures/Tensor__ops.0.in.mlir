"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*xf32>, tensor<4x4xf32>, tensor<?x?xf32>) -> (), sym_name = "cast"}> ({
  ^bb0(%arg0: tensor<*xf32> loc("<stdin>":3:8), %arg1: tensor<4x4xf32> loc("<stdin>":3:30), %arg2: tensor<?x?xf32> loc("<stdin>":3:54)):
    %0 = "tensor.cast"(%arg0) : (tensor<*xf32>) -> tensor<?x?xf32> loc("<stdin>":4:10)
    %1 = "tensor.cast"(%arg1) : (tensor<4x4xf32>) -> tensor<*xf32> loc("<stdin>":5:10)
    %2 = "tensor.cast"(%arg2) : (tensor<?x?xf32>) -> tensor<4x?xf32> loc("<stdin>":6:10)
    %3 = "tensor.cast"(%2) : (tensor<4x?xf32>) -> tensor<?x?xf32> loc("<stdin>":7:10)
    "func.return"() : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
