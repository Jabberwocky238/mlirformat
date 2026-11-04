"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, i1) -> (), sym_name = "for_if_for"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: i1):
    %0 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<128x32xf16>}> : () -> tensor<128x32xf16>
    %1 = "scf.for"(%arg0, %arg1, %arg2, %0) ({
    ^bb0(%arg4: index, %arg5: tensor<128x32xf16>):
      %2 = "scf.if"(%arg3) ({
        "scf.yield"(%arg5) : (tensor<128x32xf16>) -> ()
      }, {
        %3 = "scf.for"(%arg0, %arg1, %arg2, %arg5) ({
        ^bb0(%arg6: index, %arg7: tensor<128x32xf16>):
          "scf.yield"(%arg7) : (tensor<128x32xf16>) -> ()
        }) : (index, index, index, tensor<128x32xf16>) -> tensor<128x32xf16>
        "scf.yield"(%3) : (tensor<128x32xf16>) -> ()
      }) : (i1) -> tensor<128x32xf16>
      "scf.yield"(%2) : (tensor<128x32xf16>) -> ()
    }) : (index, index, index, tensor<128x32xf16>) -> tensor<128x32xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

