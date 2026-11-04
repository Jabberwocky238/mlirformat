"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %1 = "arith.constant"() <{value = dense<[[[[-3.905800e+00, 0.907199978], [-2.947000e+00, -2.205500e+00], [1.839460e+01, 8.29969978]], [[3.470000e+00, 5.900600e+00], [-1.722670e+01, 4.977700e+00], [1.045000e+00, -8.201000e-01]]], [[[1.769960e+01, -1.117630e+01], [2.677750e+01, -3.882300e+00], [-4.249200e+00, -5.896600e+00]], [[2.125900e+00, 1.317940e+01], [-1.071360e+01, 8.428000e-01], [1.642330e+01, 9.458900e+00]]]]> : tensor<2x2x3x2xf32>}> : () -> tensor<2x2x3x2xf32>
    %2 = "tensor.cast"(%1) : (tensor<2x2x3x2xf32>) -> tensor<2x?x?x?xf32>
    %3 = "func.call"(%2) <{callee = @collapse_dynamic_shape}> : (tensor<2x?x?x?xf32>) -> tensor<2x?x?xf32>
    %4 = "tensor.cast"(%3) : (tensor<2x?x?xf32>) -> tensor<*xf32>
    "func.call"(%4) <{callee = @printMemrefF32}> : (tensor<*xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x?x?x?xf32>) -> tensor<2x?x?xf32>, sym_name = "collapse_dynamic_shape"}> ({
  ^bb0(%arg0: tensor<2x?x?x?xf32>):
    %0 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0], [1, 2], [3]]}> : (tensor<2x?x?x?xf32>) -> tensor<2x?x?xf32>
    "func.return"(%0) : (tensor<2x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

