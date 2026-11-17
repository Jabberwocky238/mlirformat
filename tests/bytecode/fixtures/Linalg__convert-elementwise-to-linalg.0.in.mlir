"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>, tensor<f32>) -> tensor<f32>, sym_name = "addf_rank0"}> ({
  ^bb0(%arg0: tensor<f32> loc("<stdin>":3:8), %arg1: tensor<f32> loc("<stdin>":3:28)):
    %0 = "arith.addf"(%arg0, %arg1) <{fastmath = #arith.fastmath<none>}> : (tensor<f32>, tensor<f32>) -> tensor<f32> loc("<stdin>":4:10)
    "func.return"(%0) : (tensor<f32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
