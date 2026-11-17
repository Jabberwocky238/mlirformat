"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>, tensor<f32>, tensor<i1>) -> tensor<f32>, sym_name = "inlined_if_fn"}> ({
  ^bb0(%arg4: tensor<f32> loc("<stdin>":3:8), %arg5: tensor<f32> loc("<stdin>":3:28), %arg6: tensor<i1> loc("<stdin>":3:48)):
    %2 = "tosa.cond_if"(%arg6, %arg4, %arg5) ({
    ^bb0(%arg9: tensor<f32> loc("<stdin>":5:10), %arg10: tensor<f32> loc("<stdin>":5:30)):
      %4 = "func.call"(%arg9, %arg10) <{callee = @add}> : (tensor<f32>, tensor<f32>) -> tensor<f32> loc("<stdin>":6:12)
      "tosa.yield"(%4) : (tensor<f32>) -> () loc("<stdin>":7:7)
    }, {
    ^bb0(%arg7: tensor<f32> loc("<stdin>":9:10), %arg8: tensor<f32> loc("<stdin>":9:30)):
      %3 = "func.call"(%arg7, %arg8) <{callee = @sub}> : (tensor<f32>, tensor<f32>) -> tensor<f32> loc("<stdin>":10:12)
      "tosa.yield"(%3) : (tensor<f32>) -> () loc("<stdin>":11:7)
    }) : (tensor<i1>, tensor<f32>, tensor<f32>) -> tensor<f32> loc("<stdin>":4:10)
    "func.return"(%2) : (tensor<f32>) -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (tensor<f32>, tensor<f32>) -> tensor<f32>, sym_name = "add", sym_visibility = "private"}> ({
  ^bb0(%arg2: tensor<f32> loc("<stdin>":16:8), %arg3: tensor<f32> loc("<stdin>":16:28)):
    %1 = "tosa.add"(%arg2, %arg3) : (tensor<f32>, tensor<f32>) -> tensor<f32> loc("<stdin>":17:10)
    "func.return"(%1) : (tensor<f32>) -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":15:3)
  "func.func"() <{function_type = (tensor<f32>, tensor<f32>) -> tensor<f32>, sym_name = "sub", sym_visibility = "private"}> ({
  ^bb0(%arg0: tensor<f32> loc("<stdin>":21:8), %arg1: tensor<f32> loc("<stdin>":21:28)):
    %0 = "tosa.sub"(%arg0, %arg1) : (tensor<f32>, tensor<f32>) -> tensor<f32> loc("<stdin>":22:10)
    "func.return"(%0) : (tensor<f32>) -> () loc("<stdin>":23:5)
  }) : () -> () loc("<stdin>":20:3)
}) : () -> () loc("<stdin>":1:1)
