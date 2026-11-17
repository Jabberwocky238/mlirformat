"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "arith_constants"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":3:10)
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":4:10)
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":5:10)
    %3 = "arith.constant"() <{value = dense<0> : tensor<i32>}> : () -> tensor<i32> loc("<stdin>":6:10)
    %4 = "arith.constant"() <{value = dense<[[1, 2], [-3, 9], [0, 0], [2, -1]]> : tensor<4x2xi64>}> : () -> tensor<4x2xi64> loc("<stdin>":7:10)
    "func.return"() : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
