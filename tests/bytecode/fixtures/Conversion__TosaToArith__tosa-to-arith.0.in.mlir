"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<i32>, sym_name = "const_test"}> ({
    %0 = "tosa.const"() <{values = dense<3> : tensor<i32>}> : () -> tensor<i32> loc("<stdin>":3:10)
    "func.return"(%0) : (tensor<i32>) -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
