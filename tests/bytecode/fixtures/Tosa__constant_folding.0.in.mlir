"builtin.module"() ({
  "func.func"() <{function_type = (index) -> tensor<4xi32>, sym_name = "test_const"}> ({
  ^bb0(%arg0: index loc("<stdin>":3:8)):
    %0 = "tosa.const"() <{values = dense<[3, 0, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc("<stdin>":4:10)
    "func.return"(%0) : (tensor<4xi32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
