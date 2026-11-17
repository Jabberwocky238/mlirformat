"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x3x4xi8>) -> tensor<2x4xi32>, sym_name = "argmax_int"}> ({
  ^bb0(%arg0: tensor<2x3x4xi8> loc("<stdin>":3:8)):
    %0 = "tosa.argmax"(%arg0) <{axis = 1 : i32, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<2x3x4xi8>) -> tensor<2x4xi32> loc("<stdin>":4:10)
    "func.return"(%0) : (tensor<2x4xi32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
