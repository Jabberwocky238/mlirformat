"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index, f32) -> tensor<?x?x?x?xf32>, sym_name = "alloc_4d_filled_f32"}> ({
  ^bb0(%arg21: index loc("<stdin>":8:8), %arg22: index loc("<stdin>":8:23), %arg23: index loc("<stdin>":8:38), %arg24: index loc("<stdin>":8:53), %arg25: f32 loc("<stdin>":8:68)):
    %33 = "tensor.empty"(%arg21, %arg22, %arg23, %arg24) : (index, index, index, index) -> tensor<?x?x?x?xf32> loc("<stdin>":9:11)
    %34 = "linalg.fill"(%arg25, %33) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg26: f32 loc("<stdin>":11:10), %arg27: f32 loc("<stdin>":11:23)):
      "linalg.yield"(%arg26) : (f32) -> () loc("<stdin>":12:7)
    }) : (f32, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> loc("<stdin>":10:11)
    "func.return"(%34) : (tensor<?x?x?x?xf32>) -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (tensor<3x8x8x3xf32>, tensor<5x5x3x1xf32>, tensor<3x8x8x1xf32>) -> tensor<3x8x8x1xf32>, sym_name = "conv_2d_nhwc_hwcf"}> ({
  ^bb0(%arg11: tensor<3x8x8x3xf32> loc("<stdin>":17:8), %arg12: tensor<5x5x3x1xf32> loc("<stdin>":17:37), %arg13: tensor<3x8x8x1xf32> loc("<stdin>":17:66)):
    %28 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":18:11)
    %29 = "tensor.pad"(%arg11) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 0, 2, 2, 0>, static_low = array<i64: 0, 2, 2, 0>}> ({
    ^bb0(%arg17: index loc("<stdin>":20:10), %arg18: index loc("<stdin>":20:25), %arg19: index loc("<stdin>":20:40), %arg20: index loc("<stdin>":20:55)):
      "tensor.yield"(%28) : (f32) -> () loc("<stdin>":21:7)
    }) : (tensor<3x8x8x3xf32>) -> tensor<3x12x12x3xf32> loc("<stdin>":19:11)
    %30 = "linalg.conv_2d_nhwc_hwcf"(%29, %arg12, %arg13) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg14: f32 loc("<stdin>":24:10), %arg15: f32 loc("<stdin>":24:23), %arg16: f32 loc("<stdin>":24:36)):
      %31 = "arith.mulf"(%arg14, %arg15) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":25:13)
      %32 = "arith.addf"(%arg16, %31) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":26:13)
      "linalg.yield"(%32) : (f32) -> () loc("<stdin>":27:7)
    }) {linalg.memoized_indexing_maps = [affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>, affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d4, d5, d6, d3)>, affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>]} : (tensor<3x12x12x3xf32>, tensor<5x5x3x1xf32>, tensor<3x8x8x1xf32>) -> tensor<3x8x8x1xf32> loc("<stdin>":23:11)
    "bufferization.dealloc_tensor"(%29) : (tensor<3x12x12x3xf32>) -> () loc("<stdin>":29:5)
    "func.return"(%30) : (tensor<3x8x8x1xf32>) -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":16:3)
  "func.func"() <{function_type = (tensor<3x8x8x3xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed, d1 : dense, d2 : compressed, d3 : compressed) }>>, tensor<5x5x3x1xf32>) -> tensor<3x8x8x1xf32>, sym_name = "conv_2d_nhwc_hwcf_CDCC_NHWC"}> ({
  ^bb0(%arg0: tensor<3x8x8x3xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed, d1 : dense, d2 : compressed, d3 : compressed) }>> loc("<stdin>":33:8), %arg1: tensor<5x5x3x1xf32> loc("<stdin>":33:45)):
    %21 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":34:11)
    %22 = "tensor.empty"() : () -> tensor<3x8x8x1xf32> loc("<stdin>":35:11)
    %23 = "linalg.fill"(%21, %22) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg9: f32 loc("<stdin>":37:10), %arg10: f32 loc("<stdin>":37:22)):
      "linalg.yield"(%arg9) : (f32) -> () loc("<stdin>":38:7)
    }) : (f32, tensor<3x8x8x1xf32>) -> tensor<3x8x8x1xf32> loc("<stdin>":36:11)
    %24 = "tensor.pad"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 0, 2, 2, 0>, static_low = array<i64: 0, 2, 2, 0>}> ({
    ^bb0(%arg5: index loc("<stdin>":41:10), %arg6: index loc("<stdin>":41:24), %arg7: index loc("<stdin>":41:38), %arg8: index loc("<stdin>":41:52)):
      "tensor.yield"(%21) : (f32) -> () loc("<stdin>":42:7)
    }) : (tensor<3x8x8x3xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed, d1 : dense, d2 : compressed, d3 : compressed) }>>) -> tensor<3x12x12x3xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed, d1 : dense, d2 : compressed, d3 : compressed) }>> loc("<stdin>":40:11)
    %25 = "linalg.conv_2d_nhwc_hwcf"(%24, %arg1, %23) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":45:10), %arg3: f32 loc("<stdin>":45:22), %arg4: f32 loc("<stdin>":45:34)):
      %26 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":46:13)
      %27 = "arith.addf"(%arg4, %26) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":47:13)
      "linalg.yield"(%27) : (f32) -> () loc("<stdin>":48:7)
    }) {linalg.memoized_indexing_maps = [affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>, affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d4, d5, d6, d3)>, affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>]} : (tensor<3x12x12x3xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed, d1 : dense, d2 : compressed, d3 : compressed) }>>, tensor<5x5x3x1xf32>, tensor<3x8x8x1xf32>) -> tensor<3x8x8x1xf32> loc("<stdin>":44:11)
    "func.return"(%25) : (tensor<3x8x8x1xf32>) -> () loc("<stdin>":50:5)
  }) : () -> () loc("<stdin>":32:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":53:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":54:10)
    %2 = "arith.constant"() <{value = 3 : index}> : () -> index loc("<stdin>":55:10)
    %3 = "arith.constant"() <{value = 5 : index}> : () -> index loc("<stdin>":56:10)
    %4 = "arith.constant"() <{value = 6 : index}> : () -> index loc("<stdin>":57:10)
    %5 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":58:10)
    %6 = "arith.constant"() <{value = 1.000000e+01 : f32}> : () -> f32 loc("<stdin>":59:10)
    %7 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32 loc("<stdin>":60:10)
    %8 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":61:10)
    %9 = "func.call"(%3, %3, %2, %1, %7) <{callee = @alloc_4d_filled_f32}> : (index, index, index, index, f32) -> tensor<?x?x?x?xf32> loc("<stdin>":62:10)
    %10 = "func.call"(%2, %5, %5, %2, %7) <{callee = @alloc_4d_filled_f32}> : (index, index, index, index, f32) -> tensor<?x?x?x?xf32> loc("<stdin>":63:11)
    %11 = "tensor.insert"(%6, %10, %0, %0, %2, %0) : (f32, tensor<?x?x?x?xf32>, index, index, index, index) -> tensor<?x?x?x?xf32> loc("<stdin>":64:11)
    %12 = "func.call"(%2, %5, %5, %1, %8) <{callee = @alloc_4d_filled_f32}> : (index, index, index, index, f32) -> tensor<?x?x?x?xf32> loc("<stdin>":65:11)
    %13 = "tensor.cast"(%9) : (tensor<?x?x?x?xf32>) -> tensor<5x5x3x1xf32> loc("<stdin>":66:11)
    %14 = "tensor.cast"(%11) : (tensor<?x?x?x?xf32>) -> tensor<3x8x8x3xf32> loc("<stdin>":67:11)
    %15 = "tensor.cast"(%12) : (tensor<?x?x?x?xf32>) -> tensor<3x8x8x1xf32> loc("<stdin>":68:11)
    %16 = "func.call"(%14, %13, %15) <{callee = @conv_2d_nhwc_hwcf}> : (tensor<3x8x8x3xf32>, tensor<5x5x3x1xf32>, tensor<3x8x8x1xf32>) -> tensor<3x8x8x1xf32> loc("<stdin>":69:11)
    %17 = "sparse_tensor.convert"(%14) : (tensor<3x8x8x3xf32>) -> tensor<3x8x8x3xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed, d1 : dense, d2 : compressed, d3 : compressed) }>> loc("<stdin>":70:11)
    %18 = "func.call"(%17, %13) <{callee = @conv_2d_nhwc_hwcf_CDCC_NHWC}> : (tensor<3x8x8x3xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed, d1 : dense, d2 : compressed, d3 : compressed) }>>, tensor<5x5x3x1xf32>) -> tensor<3x8x8x1xf32> loc("<stdin>":71:11)
    %19 = "vector.transfer_read"(%16, %0, %0, %0, %0, %8) <{in_bounds = [false, false, false, false], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>}> : (tensor<3x8x8x1xf32>, index, index, index, index, f32) -> vector<3x8x8x1xf32> loc("<stdin>":72:11)
    "vector.print"(%19) <{punctuation = #vector.punctuation<newline>}> : (vector<3x8x8x1xf32>) -> () loc("<stdin>":73:5)
    %20 = "vector.transfer_read"(%18, %0, %0, %0, %0, %8) <{in_bounds = [false, false, false, false], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>}> : (tensor<3x8x8x1xf32>, index, index, index, index, f32) -> vector<3x8x8x1xf32> loc("<stdin>":74:11)
    "vector.print"(%20) <{punctuation = #vector.punctuation<newline>}> : (vector<3x8x8x1xf32>) -> () loc("<stdin>":75:5)
    "bufferization.dealloc_tensor"(%13) : (tensor<5x5x3x1xf32>) -> () loc("<stdin>":76:5)
    "bufferization.dealloc_tensor"(%14) : (tensor<3x8x8x3xf32>) -> () loc("<stdin>":77:5)
    "bufferization.dealloc_tensor"(%15) : (tensor<3x8x8x1xf32>) -> () loc("<stdin>":78:5)
    "bufferization.dealloc_tensor"(%18) : (tensor<3x8x8x1xf32>) -> () loc("<stdin>":79:5)
    "bufferization.dealloc_tensor"(%17) : (tensor<3x8x8x3xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed, d1 : dense, d2 : compressed, d3 : compressed) }>>) -> () loc("<stdin>":80:5)
    "func.return"() : () -> () loc("<stdin>":81:5)
  }) : () -> () loc("<stdin>":52:3)
}) : () -> () loc("<stdin>":6:1)
