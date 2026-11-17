"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4xf32>) -> tensor<4xf32>, sym_name = "dcast_fold"}> ({
  ^bb0(%arg0: tensor<4xf32> loc("<stdin>":3:8)):
    %0 = "quant.qcast"(%arg0) : (tensor<4xf32>) -> tensor<4x!quant.uniform<u8:f32, 2.000000e+00:128>> loc("<stdin>":4:10)
    %1 = "quant.dcast"(%0) : (tensor<4x!quant.uniform<u8:f32, 2.000000e+00:128>>) -> tensor<4xf32> loc("<stdin>":5:10)
    "func.return"(%1) : (tensor<4xf32>) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
