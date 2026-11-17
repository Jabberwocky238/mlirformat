"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x5x7x11xf32>) -> tensor<20x11xf32>, sym_name = "extract_slice_static"}> ({
  ^bb0(%arg0: tensor<3x5x7x11xf32> loc("<stdin>":3:8)):
    %0 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0, 1, 2], [3]]}> : (tensor<3x5x7x11xf32>) -> tensor<105x11xf32> loc("<stdin>":4:10)
    %1 = "tensor.extract_slice"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 20, 11>, static_strides = array<i64: 1, 1>}> : (tensor<105x11xf32>) -> tensor<20x11xf32> loc("<stdin>":5:10)
    "func.return"(%1) : (tensor<20x11xf32>) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
