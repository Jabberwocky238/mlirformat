"builtin.module"() ({
  "func.func"() <{function_type = (tensor<5xf32>) -> (tensor<5xf32>, tensor<5xf32>), sym_name = "callee", sym_visibility = "private"}> ({
  ^bb0(%arg1: tensor<5xf32> loc("<stdin>":3:8)):
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:10)
    %5 = "arith.constant"() <{value = 8.000000e+00 : f32}> : () -> f32 loc("<stdin>":5:10)
    %6 = "tensor.insert"(%5, %arg1, %4) : (f32, tensor<5xf32>, index) -> tensor<5xf32> loc("<stdin>":6:10)
    "func.return"(%arg1, %6) : (tensor<5xf32>, tensor<5xf32>) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (tensor<5xf32>) -> (f32, f32), sym_name = "main"}> ({
  ^bb0(%arg0: tensor<5xf32> loc("<stdin>":10:8)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":11:10)
    %1:2 = "func.call"(%arg0) <{callee = @callee}> : (tensor<5xf32>) -> (tensor<5xf32>, tensor<5xf32>) loc("<stdin>":12:12)
    %2 = "tensor.extract"(%1#0, %0) : (tensor<5xf32>, index) -> f32 loc("<stdin>":13:10)
    %3 = "tensor.extract"(%1#1, %0) : (tensor<5xf32>, index) -> f32 loc("<stdin>":14:10)
    "func.return"(%2, %3) : (f32, f32) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":9:3)
}) : () -> () loc("<stdin>":1:1)
