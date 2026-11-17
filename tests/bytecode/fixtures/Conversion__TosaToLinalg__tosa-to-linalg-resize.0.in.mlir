"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x1x1x7xf32>) -> tensor<3x1x1x7xf32>, sym_name = "unary_resize_nearest_fp32"}> ({
  ^bb0(%arg0: tensor<3x1x1x7xf32> loc("<stdin>":3:8)):
    %0 = "tosa.const_shape"() <{values = dense<[2, 2, 1, 1]> : tensor<4xindex>}> : () -> !tosa.shape<4> loc("<stdin>":4:10)
    %1 = "tosa.const_shape"() <{values = dense<0> : tensor<2xindex>}> : () -> !tosa.shape<2> loc("<stdin>":5:10)
    %2 = "tosa.const_shape"() <{values = dense<0> : tensor<2xindex>}> : () -> !tosa.shape<2> loc("<stdin>":6:10)
    %3 = "tosa.resize"(%arg0, %0, %1, %2) <{mode = #tosa.resize_mode<NEAREST_NEIGHBOR>}> : (tensor<3x1x1x7xf32>, !tosa.shape<4>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<3x1x1x7xf32> loc("<stdin>":7:10)
    "func.return"(%3) : (tensor<3x1x1x7xf32>) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
