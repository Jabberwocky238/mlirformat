"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x1xf32>) -> tensor<1x1xf32>, sym_name = "slice_constant"}> ({
  ^bb0(%arg0: tensor<2x1xf32> loc("<stdin>":3:8)):
    %0 = "arith.constant"() <{value = dense<[[1.000000e+01], [1.100000e+01]]> : tensor<2x1xf32>}> : () -> tensor<2x1xf32> loc("<stdin>":4:10)
    %1 = "tensor.extract_slice"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 1, 1>, static_strides = array<i64: 1, 1>}> : (tensor<2x1xf32>) -> tensor<1x1xf32> loc("<stdin>":5:10)
    "func.return"(%1) : (tensor<1x1xf32>) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
