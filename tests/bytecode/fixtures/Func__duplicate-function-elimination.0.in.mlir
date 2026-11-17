"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>) -> tensor<f32>, sym_name = "identity"}> ({
  ^bb0(%arg3: tensor<f32> loc("<stdin>":3:8)):
    "func.return"(%arg3) : (tensor<f32>) -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (tensor<f32>) -> tensor<f32>, sym_name = "also_identity"}> ({
  ^bb0(%arg2: tensor<f32> loc("<stdin>":7:8)):
    "func.return"(%arg2) : (tensor<f32>) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = (tensor<f32>) -> tensor<f32>, sym_name = "yet_another_identity"}> ({
  ^bb0(%arg1: tensor<f32> loc("<stdin>":11:8)):
    "func.return"(%arg1) : (tensor<f32>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":10:3)
  "func.func"() <{function_type = (tensor<f32>) -> tensor<f32>, sym_name = "user"}> ({
  ^bb0(%arg0: tensor<f32> loc("<stdin>":15:8)):
    %0 = "func.call"(%arg0) <{callee = @identity}> : (tensor<f32>) -> tensor<f32> loc("<stdin>":16:10)
    %1 = "func.call"(%0) <{callee = @also_identity}> : (tensor<f32>) -> tensor<f32> loc("<stdin>":17:10)
    %2 = "func.call"(%1) <{callee = @yet_another_identity}> : (tensor<f32>) -> tensor<f32> loc("<stdin>":18:10)
    "func.return"(%2) : (tensor<f32>) -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":14:3)
}) : () -> () loc("<stdin>":1:1)
