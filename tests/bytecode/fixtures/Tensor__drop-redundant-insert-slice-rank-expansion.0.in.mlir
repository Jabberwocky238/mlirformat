"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x480xf32>, tensor<1x1x128x480xf32>) -> tensor<123x456xf32>, sym_name = "test_drop_rank_expansion"}> ({
  ^bb0(%arg0: tensor<128x480xf32> loc("<stdin>":3:8), %arg1: tensor<1x1x128x480xf32> loc("<stdin>":3:36)):
    %0 = "tensor.insert_slice"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0, 0>, static_sizes = array<i64: 1, 1, 128, 480>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<128x480xf32>, tensor<1x1x128x480xf32>) -> tensor<1x1x128x480xf32> loc("<stdin>":4:10)
    %1 = "tensor.extract_slice"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0, 0>, static_sizes = array<i64: 1, 1, 123, 456>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<1x1x128x480xf32>) -> tensor<123x456xf32> loc("<stdin>":5:10)
    "func.return"(%1) : (tensor<123x456xf32>) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
