"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x1xf32>) -> tensor<1xi32>, sym_name = "argmax_nofold"}> ({
  ^bb0(%arg0: tensor<?x1xf32> loc("<stdin>":3:8)):
    %0 = "tosa.argmax"(%arg0) <{axis = 0 : i32, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<?x1xf32>) -> tensor<1xi32> loc("<stdin>":4:10)
    "func.return"(%0) : (tensor<1xi32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
