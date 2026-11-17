"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<f32>, sym_name = "different_before_after_args"}> ({
    %0 = "arith.constant"() <{value = true}> : () -> i1 loc("<stdin>":3:10)
    %1 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<f32>}> : () -> tensor<f32> loc("<stdin>":4:10)
    %2 = "scf.while"(%0) ({
    ^bb0(%arg1: i1 loc("<stdin>":6:10)):
      "scf.condition"(%0, %1) : (i1, tensor<f32>) -> () loc("<stdin>":7:7)
    }, {
    ^bb0(%arg0: tensor<f32> loc("<stdin>":9:10)):
      "scf.yield"(%0) : (i1) -> () loc("<stdin>":10:7)
    }) : (i1) -> tensor<f32> loc("<stdin>":5:10)
    "func.return"(%2) : (tensor<f32>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
