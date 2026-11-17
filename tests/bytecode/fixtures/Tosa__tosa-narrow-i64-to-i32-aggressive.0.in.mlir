"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x513x513x2147483650xi8>) -> tensor<1x513x513xi64>, sym_name = "test_i64_argmax_large_axis_dim"}> ({
  ^bb0(%arg0: tensor<1x513x513x2147483650xi8> loc("<stdin>":3:8)):
    %0 = "tosa.argmax"(%arg0) <{axis = 3 : i32, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<1x513x513x2147483650xi8>) -> tensor<1x513x513xi64> loc("<stdin>":4:10)
    "func.return"(%0) : (tensor<1x513x513xi64>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
