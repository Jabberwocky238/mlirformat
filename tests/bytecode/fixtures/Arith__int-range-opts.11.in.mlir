"builtin.module"() ({
  "func.func"() <{function_type = (i32, tensor<128xi1>) -> tensor<128xi64>, sym_name = "analysis_crash"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":4:8), %arg1: tensor<128xi1> loc("<stdin>":4:20)):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":5:10)
    %1 = "arith.constant"() <{value = dense<-1> : tensor<128xi32>}> : () -> tensor<128xi32> loc("<stdin>":6:10)
    %2 = "tensor.splat"(%arg0) : (i32) -> tensor<128xi32> loc("<stdin>":7:10)
    %3 = "scf.for"(%0, %arg0, %arg0, %2) ({
    ^bb0(%arg2: i32 loc("<stdin>":9:10), %arg3: tensor<128xi32> loc("<stdin>":9:22)):
      "scf.yield"(%arg3) : (tensor<128xi32>) -> () loc("<stdin>":10:7)
    }) : (i32, i32, i32, tensor<128xi32>) -> tensor<128xi32> loc("<stdin>":8:10)
    %4 = "arith.select"(%arg1, %3, %1) : (tensor<128xi1>, tensor<128xi32>, tensor<128xi32>) -> tensor<128xi32> loc("<stdin>":12:10)
    %5 = "arith.extsi"(%4) : (tensor<128xi32>) -> tensor<128xi64> loc("<stdin>":13:10)
    "func.return"(%5) : (tensor<128xi64>) -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
