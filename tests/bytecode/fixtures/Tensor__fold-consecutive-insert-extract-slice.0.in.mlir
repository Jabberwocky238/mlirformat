"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, index, index, index, index) -> tensor<8x16x32x?xf32>, sym_name = "extract_slice_same_rank"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xf32> loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:36), %arg2: index loc("<stdin>":3:50), %arg3: index loc("<stdin>":3:64), %arg4: index loc("<stdin>":3:78)):
    %0 = "tensor.extract_slice"(%arg0, %arg1, %arg3) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 0, 1, 2, -9223372036854775808>, static_sizes = array<i64: 128, 128, 128, -9223372036854775808>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<?x?x?x?xf32>, index, index) -> tensor<128x128x128x?xf32> loc("<stdin>":4:10)
    %1 = "tensor.extract_slice"(%0, %arg2, %arg4) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 7, 8, 9, -9223372036854775808>, static_sizes = array<i64: 8, 16, 32, -9223372036854775808>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<128x128x128x?xf32>, index, index) -> tensor<8x16x32x?xf32> loc("<stdin>":5:10)
    "func.return"(%1) : (tensor<8x16x32x?xf32>) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
