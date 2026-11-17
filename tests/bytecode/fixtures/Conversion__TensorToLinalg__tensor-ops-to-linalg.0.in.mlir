"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x28x28x1xf32>) -> tensor<1x32x32x1xf32>, sym_name = "generalize_pad_tensor_static_shape"}> ({
  ^bb0(%arg6: tensor<1x28x28x1xf32> loc("<stdin>":3:8)):
    %3 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":4:10)
    %4 = "tensor.pad"(%arg6) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 0, 2, 2, 0>, static_low = array<i64: 0, 2, 2, 0>}> ({
    ^bb0(%arg7: index loc("<stdin>":6:10), %arg8: index loc("<stdin>":6:24), %arg9: index loc("<stdin>":6:38), %arg10: index loc("<stdin>":6:52)):
      "tensor.yield"(%3) : (f32) -> () loc("<stdin>":7:7)
    }) : (tensor<1x28x28x1xf32>) -> tensor<1x32x32x1xf32> loc("<stdin>":5:10)
    "func.return"(%4) : (tensor<1x32x32x1xf32>) -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (tensor<4x?x2x?xf32>, index) -> tensor<4x?x?x?xf32>, sym_name = "generalize_pad_tensor_dynamic_shape"}> ({
  ^bb0(%arg0: tensor<4x?x2x?xf32> loc("<stdin>":12:8), %arg1: index loc("<stdin>":12:36)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":13:10)
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":14:10)
    %2 = "tensor.pad"(%arg0, %0, %0, %arg1, %0, %0, %0, %0, %arg1) <{operandSegmentSizes = array<i32: 1, 4, 4>, static_high = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_low = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808, -9223372036854775808>}> ({
    ^bb0(%arg2: index loc("<stdin>":16:10), %arg3: index loc("<stdin>":16:24), %arg4: index loc("<stdin>":16:38), %arg5: index loc("<stdin>":16:52)):
      "tensor.yield"(%1) : (f32) -> () loc("<stdin>":17:7)
    }) : (tensor<4x?x2x?xf32>, index, index, index, index, index, index, index, index) -> tensor<4x?x?x?xf32> loc("<stdin>":15:10)
    "func.return"(%2) : (tensor<4x?x?x?xf32>) -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":11:3)
}) : () -> () loc("<stdin>":1:1)
