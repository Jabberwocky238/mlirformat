"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %7 = "arith.constant"() <{value = dense<[[[-3.905800e+00, 0.907199978], [-2.947000e+00, -2.205500e+00], [1.839460e+01, 8.29969978], [3.470000e+00, 5.900600e+00], [-1.722670e+01, 4.977700e+00], [1.045000e+00, -8.201000e-01]], [[1.769960e+01, -1.117630e+01], [2.677750e+01, -3.882300e+00], [-4.249200e+00, -5.896600e+00], [2.125900e+00, 1.317940e+01], [-1.071360e+01, 8.428000e-01], [1.642330e+01, 9.458900e+00]]]> : tensor<2x6x2xf32>}> : () -> tensor<2x6x2xf32>
    %8 = "tensor.cast"(%7) : (tensor<2x6x2xf32>) -> tensor<2x?x?xf32>
    %9 = "func.call"(%8) <{callee = @expand_dynamic_shape}> : (tensor<2x?x?xf32>) -> tensor<2x2x?x1x?xf32>
    %10 = "tensor.cast"(%9) : (tensor<2x2x?x1x?xf32>) -> tensor<*xf32>
    "func.call"(%10) <{callee = @printMemrefF32}> : (tensor<*xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x?x?xf32>) -> tensor<2x2x?x1x?xf32>, sym_name = "expand_dynamic_shape"}> ({
  ^bb0(%arg0: tensor<2x?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "tensor.dim"(%arg0, %1) : (tensor<2x?x?xf32>, index) -> index
    %4 = "tensor.dim"(%arg0, %2) : (tensor<2x?x?xf32>, index) -> index
    %5 = "arith.divui"(%3, %2) : (index, index) -> index
    %6 = "tensor.expand_shape"(%arg0, %5, %4) <{reassociation = [[0], [1, 2, 3], [4]], static_output_shape = array<i64: 2, 2, -9223372036854775808, 1, -9223372036854775808>}> : (tensor<2x?x?xf32>, index, index) -> tensor<2x2x?x1x?xf32>
    "func.return"(%6) : (tensor<2x2x?x1x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

