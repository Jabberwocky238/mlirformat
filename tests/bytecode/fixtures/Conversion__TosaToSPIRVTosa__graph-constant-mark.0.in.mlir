"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<17xi32>, sym_name = "large_const"}> ({
    %0 = "tosa.const"() <{values = dense<[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]> : tensor<17xi32>}> : () -> tensor<17xi32> loc("<stdin>":3:10)
    "func.return"(%0) : (tensor<17xi32>) -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
