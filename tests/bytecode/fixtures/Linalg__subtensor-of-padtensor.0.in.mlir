"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x5xf32>, f32) -> tensor<2x1xf32>, sym_name = "static_data_only"}> ({
  ^bb0(%arg0: tensor<4x5xf32> loc("<stdin>":3:8), %arg1: f32 loc("<stdin>":3:32)):
    %0 = "tensor.pad"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 7, 8>, static_low = array<i64: 0, 0>}> ({
    ^bb0(%arg2: index loc("<stdin>":5:10), %arg3: index loc("<stdin>":5:24)):
      "tensor.yield"(%arg1) : (f32) -> () loc("<stdin>":6:7)
    }) : (tensor<4x5xf32>) -> tensor<11x13xf32> loc("<stdin>":4:10)
    %1 = "tensor.extract_slice"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 1, 2>, static_sizes = array<i64: 2, 1>, static_strides = array<i64: 1, 1>}> : (tensor<11x13xf32>) -> tensor<2x1xf32> loc("<stdin>":8:10)
    "func.return"(%1) : (tensor<2x1xf32>) -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
