"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128xf32, 1 : i64>, index, index, index) -> tensor<128xf32, 1 : i64>, sym_name = "scf_for_iter_arg"}> ({
  ^bb0(%arg0: tensor<128xf32, 1 : i64> loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:41), %arg2: index loc("<stdin>":3:55), %arg3: index loc("<stdin>":3:69)):
    %0 = "scf.for"(%arg1, %arg2, %arg3, %arg0) ({
    ^bb0(%arg4: index loc("<stdin>":5:10), %arg5: tensor<128xf32, 1 : i64> loc("<stdin>":5:24)):
      %1 = "some.use"(%arg5) : (tensor<128xf32, 1 : i64>) -> tensor<128xf32, 1 : i64> loc("<stdin>":6:12)
      "scf.yield"(%1) : (tensor<128xf32, 1 : i64>) -> () loc("<stdin>":7:7)
    }) : (index, index, index, tensor<128xf32, 1 : i64>) -> tensor<128xf32, 1 : i64> loc("<stdin>":4:10)
    "func.return"(%0) : (tensor<128xf32, 1 : i64>) -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
