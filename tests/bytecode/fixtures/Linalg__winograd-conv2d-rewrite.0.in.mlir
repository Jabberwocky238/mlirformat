"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x11x11x5xf32>, tensor<2x3x3x5xf32>, tensor<2x9x9x2xf32>) -> tensor<2x9x9x2xf32>, sym_name = "conv2d"}> ({
  ^bb0(%arg0: tensor<2x11x11x5xf32> loc("<stdin>":6:8), %arg1: tensor<2x3x3x5xf32> loc("<stdin>":6:38), %arg2: tensor<2x9x9x2xf32> loc("<stdin>":6:66)):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":7:10)
    %1 = "tensor.empty"() : () -> tensor<6x6x5x2xf32> loc("<stdin>":8:10)
    %2 = "linalg.winograd_filter_transform"(%arg1, %1) <{fmr = 1 : i32}> : (tensor<2x3x3x5xf32>, tensor<6x6x5x2xf32>) -> tensor<6x6x5x2xf32> loc("<stdin>":9:10)
    %3 = "tensor.pad"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 0, 3, 3, 0>, static_low = array<i64: 0, 0, 0, 0>}> ({
    ^bb0(%arg12: index loc("<stdin>":11:10), %arg13: index loc("<stdin>":11:25), %arg14: index loc("<stdin>":11:40), %arg15: index loc("<stdin>":11:55)):
      "tensor.yield"(%0) : (f32) -> () loc("<stdin>":12:7)
    }) : (tensor<2x11x11x5xf32>) -> tensor<2x14x14x5xf32> loc("<stdin>":10:10)
    %4 = "tensor.empty"() : () -> tensor<6x6x3x3x2x5xf32> loc("<stdin>":14:10)
    %5 = "linalg.winograd_input_transform"(%3, %4) <{fmr = 1 : i32}> : (tensor<2x14x14x5xf32>, tensor<6x6x3x3x2x5xf32>) -> tensor<6x6x3x3x2x5xf32> loc("<stdin>":15:10)
    %6 = "tensor.collapse_shape"(%2) <{reassociation = [[0, 1], [2], [3]]}> : (tensor<6x6x5x2xf32>) -> tensor<36x5x2xf32> loc("<stdin>":16:10)
    %7 = "tensor.collapse_shape"(%5) <{reassociation = [[0, 1], [2, 3, 4], [5]]}> : (tensor<6x6x3x3x2x5xf32>) -> tensor<36x18x5xf32> loc("<stdin>":17:10)
    %8 = "tensor.empty"() : () -> tensor<36x18x2xf32> loc("<stdin>":18:10)
    %9 = "linalg.fill"(%0, %8) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg10: f32 loc("<stdin>":20:10), %arg11: f32 loc("<stdin>":20:23)):
      "linalg.yield"(%arg10) : (f32) -> () loc("<stdin>":21:7)
    }) : (f32, tensor<36x18x2xf32>) -> tensor<36x18x2xf32> loc("<stdin>":19:10)
    %10 = "linalg.batch_matmul"(%7, %6, %9) <{indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: f32 loc("<stdin>":24:10), %arg8: f32 loc("<stdin>":24:22), %arg9: f32 loc("<stdin>":24:34)):
      %15 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":25:13)
      %16 = "arith.addf"(%arg9, %15) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":26:13)
      "linalg.yield"(%16) : (f32) -> () loc("<stdin>":27:7)
    }) : (tensor<36x18x5xf32>, tensor<36x5x2xf32>, tensor<36x18x2xf32>) -> tensor<36x18x2xf32> loc("<stdin>":23:11)
    %11 = "tensor.expand_shape"(%10) <{reassociation = [[0, 1], [2, 3, 4], [5]], static_output_shape = array<i64: 6, 6, 3, 3, 2, 2>}> : (tensor<36x18x2xf32>) -> tensor<6x6x3x3x2x2xf32> loc("<stdin>":29:11)
    %12 = "tensor.pad"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 0, 3, 3, 0>, static_low = array<i64: 0, 0, 0, 0>}> ({
    ^bb0(%arg3: index loc("<stdin>":31:10), %arg4: index loc("<stdin>":31:24), %arg5: index loc("<stdin>":31:38), %arg6: index loc("<stdin>":31:52)):
      "tensor.yield"(%0) : (f32) -> () loc("<stdin>":32:7)
    }) : (tensor<2x9x9x2xf32>) -> tensor<2x12x12x2xf32> loc("<stdin>":30:11)
    %13 = "linalg.winograd_output_transform"(%11, %12) <{fmr = 1 : i32}> : (tensor<6x6x3x3x2x2xf32>, tensor<2x12x12x2xf32>) -> tensor<2x12x12x2xf32> loc("<stdin>":34:11)
    %14 = "tensor.extract_slice"(%13) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0, 0>, static_sizes = array<i64: 2, 9, 9, 2>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<2x12x12x2xf32>) -> tensor<2x9x9x2xf32> loc("<stdin>":35:11)
    "func.return"(%14) : (tensor<2x9x9x2xf32>) -> () loc("<stdin>":36:5)
  }) : () -> () loc("<stdin>":5:3)
}) : () -> () loc("<stdin>":4:1)
