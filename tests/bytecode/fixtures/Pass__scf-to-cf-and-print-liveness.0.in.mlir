"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, i1) -> (), sym_name = "for_if_for"}> ({
  ^bb0(%arg0: index loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:22), %arg2: index loc("<stdin>":3:36), %arg3: i1 loc("<stdin>":3:50)):
    %0 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<128x32xf16>}> : () -> tensor<128x32xf16> loc("<stdin>":4:10)
    %1 = "scf.for"(%arg0, %arg1, %arg2, %0) ({
    ^bb0(%arg4: index loc("<stdin>":6:10), %arg5: tensor<128x32xf16> loc("<stdin>":6:24)):
      %2 = "scf.if"(%arg3) ({
        "scf.yield"(%arg5) : (tensor<128x32xf16>) -> () loc("<stdin>":8:9)
      }, {
        %3 = "scf.for"(%arg0, %arg1, %arg2, %arg5) ({
        ^bb0(%arg6: index loc("<stdin>":11:14), %arg7: tensor<128x32xf16> loc("<stdin>":11:28)):
          "scf.yield"(%arg7) : (tensor<128x32xf16>) -> () loc("<stdin>":12:11)
        }) : (index, index, index, tensor<128x32xf16>) -> tensor<128x32xf16> loc("<stdin>":10:14)
        "scf.yield"(%3) : (tensor<128x32xf16>) -> () loc("<stdin>":14:9)
      }) : (i1) -> tensor<128x32xf16> loc("<stdin>":7:12)
      "scf.yield"(%2) : (tensor<128x32xf16>) -> () loc("<stdin>":16:7)
    }) : (index, index, index, tensor<128x32xf16>) -> tensor<128x32xf16> loc("<stdin>":5:10)
    "func.return"() : () -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
