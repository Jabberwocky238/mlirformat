"builtin.module"() ({
  "func.func"() <{function_type = (tensor<i32>) -> tensor<i32>, sym_name = "while_test"}> ({
  ^bb0(%arg0: tensor<i32> loc("<stdin>":3:8)):
    %0 = "tosa.while_loop"(%arg0) ({
    ^bb0(%arg2: tensor<i32> loc("<stdin>":5:10)):
      %3 = "tosa.const"() <{values = dense<3> : tensor<i32>}> : () -> tensor<i32> loc("<stdin>":6:12)
      %4 = "tosa.greater_equal"(%3, %arg2) : (tensor<i32>, tensor<i32>) -> tensor<i1> loc("<stdin>":7:12)
      "tosa.yield"(%4) : (tensor<i1>) -> () loc("<stdin>":8:7)
    }, {
    ^bb0(%arg1: tensor<i32> loc("<stdin>":10:10)):
      %1 = "tosa.const"() <{values = dense<1> : tensor<i32>}> : () -> tensor<i32> loc("<stdin>":11:12)
      %2 = "tosa.add"(%arg1, %1) : (tensor<i32>, tensor<i32>) -> tensor<i32> loc("<stdin>":12:12)
      "tosa.yield"(%2) : (tensor<i32>) -> () loc("<stdin>":13:7)
    }) : (tensor<i32>) -> tensor<i32> loc("<stdin>":4:10)
    "func.return"(%0) : (tensor<i32>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
