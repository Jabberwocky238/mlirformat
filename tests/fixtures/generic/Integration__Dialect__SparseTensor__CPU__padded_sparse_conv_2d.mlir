#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d4, d5, d6, d3)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
#map3 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed, d1 : dense, d2 : compressed, d3 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index, f32) -> tensor<?x?x?x?xf32>, sym_name = "alloc_4d_filled_f32"}> ({
  ^bb0(%arg21: index, %arg22: index, %arg23: index, %arg24: index, %arg25: f32):
    %33 = "tensor.empty"(%arg21, %arg22, %arg23, %arg24) : (index, index, index, index) -> tensor<?x?x?x?xf32>
    %34 = "linalg.fill"(%arg25, %33) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg26: f32, %arg27: f32):
      "linalg.yield"(%arg26) : (f32) -> ()
    }) : (f32, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    "func.return"(%34) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<3x8x8x3xf32>, tensor<5x5x3x1xf32>, tensor<3x8x8x1xf32>) -> tensor<3x8x8x1xf32>, sym_name = "conv_2d_nhwc_hwcf"}> ({
  ^bb0(%arg11: tensor<3x8x8x3xf32>, %arg12: tensor<5x5x3x1xf32>, %arg13: tensor<3x8x8x1xf32>):
    %28 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %29 = "tensor.pad"(%arg11) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 0, 2, 2, 0>, static_low = array<i64: 0, 2, 2, 0>}> ({
    ^bb0(%arg17: index, %arg18: index, %arg19: index, %arg20: index):
      "tensor.yield"(%28) : (f32) -> ()
    }) : (tensor<3x8x8x3xf32>) -> tensor<3x12x12x3xf32>
    %30 = "linalg.conv_2d_nhwc_hwcf"(%29, %arg12, %arg13) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg14: f32, %arg15: f32, %arg16: f32):
      %31 = "arith.mulf"(%arg14, %arg15) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %32 = "arith.addf"(%arg16, %31) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%32) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<3x12x12x3xf32>, tensor<5x5x3x1xf32>, tensor<3x8x8x1xf32>) -> tensor<3x8x8x1xf32>
    "bufferization.dealloc_tensor"(%29) : (tensor<3x12x12x3xf32>) -> ()
    "func.return"(%30) : (tensor<3x8x8x1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<3x8x8x3xf32, #sparse>, tensor<5x5x3x1xf32>) -> tensor<3x8x8x1xf32>, sym_name = "conv_2d_nhwc_hwcf_CDCC_NHWC"}> ({
  ^bb0(%arg0: tensor<3x8x8x3xf32, #sparse>, %arg1: tensor<5x5x3x1xf32>):
    %21 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %22 = "tensor.empty"() : () -> tensor<3x8x8x1xf32>
    %23 = "linalg.fill"(%21, %22) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg9: f32, %arg10: f32):
      "linalg.yield"(%arg9) : (f32) -> ()
    }) : (f32, tensor<3x8x8x1xf32>) -> tensor<3x8x8x1xf32>
    %24 = "tensor.pad"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 0, 2, 2, 0>, static_low = array<i64: 0, 2, 2, 0>}> ({
    ^bb0(%arg5: index, %arg6: index, %arg7: index, %arg8: index):
      "tensor.yield"(%21) : (f32) -> ()
    }) : (tensor<3x8x8x3xf32, #sparse>) -> tensor<3x12x12x3xf32, #sparse>
    %25 = "linalg.conv_2d_nhwc_hwcf"(%24, %arg1, %23) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %26 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %27 = "arith.addf"(%arg4, %26) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%27) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<3x12x12x3xf32, #sparse>, tensor<5x5x3x1xf32>, tensor<3x8x8x1xf32>) -> tensor<3x8x8x1xf32>
    "func.return"(%25) : (tensor<3x8x8x1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 3 : index}> : () -> index
    %3 = "arith.constant"() <{value = 5 : index}> : () -> index
    %4 = "arith.constant"() <{value = 6 : index}> : () -> index
    %5 = "arith.constant"() <{value = 8 : index}> : () -> index
    %6 = "arith.constant"() <{value = 1.000000e+01 : f32}> : () -> f32
    %7 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %8 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %9 = "func.call"(%3, %3, %2, %1, %7) <{callee = @alloc_4d_filled_f32}> : (index, index, index, index, f32) -> tensor<?x?x?x?xf32>
    %10 = "func.call"(%2, %5, %5, %2, %7) <{callee = @alloc_4d_filled_f32}> : (index, index, index, index, f32) -> tensor<?x?x?x?xf32>
    %11 = "tensor.insert"(%6, %10, %0, %0, %2, %0) : (f32, tensor<?x?x?x?xf32>, index, index, index, index) -> tensor<?x?x?x?xf32>
    %12 = "func.call"(%2, %5, %5, %1, %8) <{callee = @alloc_4d_filled_f32}> : (index, index, index, index, f32) -> tensor<?x?x?x?xf32>
    %13 = "tensor.cast"(%9) : (tensor<?x?x?x?xf32>) -> tensor<5x5x3x1xf32>
    %14 = "tensor.cast"(%11) : (tensor<?x?x?x?xf32>) -> tensor<3x8x8x3xf32>
    %15 = "tensor.cast"(%12) : (tensor<?x?x?x?xf32>) -> tensor<3x8x8x1xf32>
    %16 = "func.call"(%14, %13, %15) <{callee = @conv_2d_nhwc_hwcf}> : (tensor<3x8x8x3xf32>, tensor<5x5x3x1xf32>, tensor<3x8x8x1xf32>) -> tensor<3x8x8x1xf32>
    %17 = "sparse_tensor.convert"(%14) : (tensor<3x8x8x3xf32>) -> tensor<3x8x8x3xf32, #sparse>
    %18 = "func.call"(%17, %13) <{callee = @conv_2d_nhwc_hwcf_CDCC_NHWC}> : (tensor<3x8x8x3xf32, #sparse>, tensor<5x5x3x1xf32>) -> tensor<3x8x8x1xf32>
    %19 = "vector.transfer_read"(%16, %0, %0, %0, %0, %8) <{in_bounds = [false, false, false, false], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map3}> : (tensor<3x8x8x1xf32>, index, index, index, index, f32) -> vector<3x8x8x1xf32>
    "vector.print"(%19) <{punctuation = #vector.punctuation<newline>}> : (vector<3x8x8x1xf32>) -> ()
    %20 = "vector.transfer_read"(%18, %0, %0, %0, %0, %8) <{in_bounds = [false, false, false, false], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map3}> : (tensor<3x8x8x1xf32>, index, index, index, index, f32) -> vector<3x8x8x1xf32>
    "vector.print"(%20) <{punctuation = #vector.punctuation<newline>}> : (vector<3x8x8x1xf32>) -> ()
    "bufferization.dealloc_tensor"(%13) : (tensor<5x5x3x1xf32>) -> ()
    "bufferization.dealloc_tensor"(%14) : (tensor<3x8x8x3xf32>) -> ()
    "bufferization.dealloc_tensor"(%15) : (tensor<3x8x8x1xf32>) -> ()
    "bufferization.dealloc_tensor"(%18) : (tensor<3x8x8x1xf32>) -> ()
    "bufferization.dealloc_tensor"(%17) : (tensor<3x8x8x3xf32, #sparse>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

