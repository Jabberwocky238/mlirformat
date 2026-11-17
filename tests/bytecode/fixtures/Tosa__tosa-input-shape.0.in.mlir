"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x?xi32>, tensor<?x256xf32>, tensor<?x9xf32>) -> (tensor<2x?xi32>, tensor<?x256xf32>, tensor<?x9xf32>), sym_name = "test_empty_func"}> ({
  ^bb0(%arg0: tensor<2x?xi32> loc("<stdin>":3:8), %arg1: tensor<?x256xf32> loc("<stdin>":3:32), %arg2: tensor<?x9xf32> loc("<stdin>":3:58)):
    "func.return"(%arg0, %arg1, %arg2) : (tensor<2x?xi32>, tensor<?x256xf32>, tensor<?x9xf32>) -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
