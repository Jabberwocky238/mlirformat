#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d4, d2 + d5, d3 + d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d1, d4, d5, d6)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
#map3 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed, d1 : dense, d2 : compressed, d3 : dense) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index, f32) -> tensor<?x?x?x?xf32>, sym_name = "alloc_4d_filled_f32"}> ({
  ^bb0(%arg24: index, %arg25: index, %arg26: index, %arg27: index, %arg28: f32):
    %37 = "tensor.empty"(%arg24, %arg25, %arg26, %arg27) : (index, index, index, index) -> tensor<?x?x?x?xf32>
    %38 = "linalg.fill"(%arg28, %37) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg29: f32, %arg30: f32):
      "linalg.yield"(%arg29) : (f32) -> ()
    }) : (f32, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    "func.return"(%38) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>, sym_name = "conv_2d_nchw_fchw"}> ({
  ^bb0(%arg18: tensor<?x?x?x?xf32>, %arg19: tensor<?x?x?x?xf32>, %arg20: tensor<?x?x?x?xf32>):
    %34 = "linalg.conv_2d_nchw_fchw"(%arg18, %arg19, %arg20) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg21: f32, %arg22: f32, %arg23: f32):
      %35 = "arith.mulf"(%arg21, %arg22) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %36 = "arith.addf"(%arg23, %35) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%36) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    "func.return"(%34) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?x?xf32, #sparse>, tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>, sym_name = "conv_2d_nchw_fchw_CDCD"}> ({
  ^bb0(%arg12: tensor<?x?x?x?xf32, #sparse>, %arg13: tensor<?x?x?x?xf32>, %arg14: tensor<?x?x?x?xf32>):
    %31 = "linalg.conv_2d_nchw_fchw"(%arg12, %arg13, %arg14) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg15: f32, %arg16: f32, %arg17: f32):
      %32 = "arith.mulf"(%arg15, %arg16) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %33 = "arith.addf"(%arg17, %32) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%33) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?xf32, #sparse>, tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    "func.return"(%31) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?x?xf32, #sparse1>, tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>, sym_name = "conv_2d_nchw_fchw_CCCC"}> ({
  ^bb0(%arg6: tensor<?x?x?x?xf32, #sparse1>, %arg7: tensor<?x?x?x?xf32>, %arg8: tensor<?x?x?x?xf32>):
    %28 = "linalg.conv_2d_nchw_fchw"(%arg6, %arg7, %arg8) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg9: f32, %arg10: f32, %arg11: f32):
      %29 = "arith.mulf"(%arg9, %arg10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %30 = "arith.addf"(%arg11, %29) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%30) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?xf32, #sparse1>, tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    "func.return"(%28) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?x?xf32, #sparse1>, tensor<?x?x?x?xf32, #sparse1>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>, sym_name = "conv_2d_nchw_fchw_CCCC_CCCC"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xf32, #sparse1>, %arg1: tensor<?x?x?x?xf32, #sparse1>, %arg2: tensor<?x?x?x?xf32>):
    %25 = "linalg.conv_2d_nchw_fchw"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %26 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %27 = "arith.addf"(%arg5, %26) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%27) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?xf32, #sparse1>, tensor<?x?x?x?xf32, #sparse1>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    "func.return"(%25) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 3 : index}> : () -> index
    %3 = "arith.constant"() <{value = 6 : index}> : () -> index
    %4 = "arith.constant"() <{value = 8 : index}> : () -> index
    %5 = "arith.constant"() <{value = 1.000000e+01 : f32}> : () -> f32
    %6 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %7 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %8 = "func.call"(%1, %2, %2, %2, %6) <{callee = @alloc_4d_filled_f32}> : (index, index, index, index, f32) -> tensor<?x?x?x?xf32>
    %9 = "func.call"(%2, %2, %4, %4, %6) <{callee = @alloc_4d_filled_f32}> : (index, index, index, index, f32) -> tensor<?x?x?x?xf32>
    %10 = "tensor.insert"(%5, %9, %0, %0, %0, %2) : (f32, tensor<?x?x?x?xf32>, index, index, index, index) -> tensor<?x?x?x?xf32>
    %11 = "func.call"(%2, %1, %3, %3, %7) <{callee = @alloc_4d_filled_f32}> : (index, index, index, index, f32) -> tensor<?x?x?x?xf32>
    %12 = "func.call"(%2, %1, %3, %3, %7) <{callee = @alloc_4d_filled_f32}> : (index, index, index, index, f32) -> tensor<?x?x?x?xf32>
    %13 = "func.call"(%2, %1, %3, %3, %7) <{callee = @alloc_4d_filled_f32}> : (index, index, index, index, f32) -> tensor<?x?x?x?xf32>
    %14 = "sparse_tensor.convert"(%10) : (tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32, #sparse>
    %15 = "sparse_tensor.convert"(%10) : (tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32, #sparse1>
    %16 = "sparse_tensor.convert"(%8) : (tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32, #sparse1>
    %17 = "func.call"(%10, %8, %11) <{callee = @conv_2d_nchw_fchw}> : (tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    %18 = "func.call"(%14, %8, %12) <{callee = @conv_2d_nchw_fchw_CDCD}> : (tensor<?x?x?x?xf32, #sparse>, tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    %19 = "func.call"(%15, %8, %13) <{callee = @conv_2d_nchw_fchw_CCCC}> : (tensor<?x?x?x?xf32, #sparse1>, tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    %20 = "func.call"(%15, %16, %11) <{callee = @conv_2d_nchw_fchw_CCCC_CCCC}> : (tensor<?x?x?x?xf32, #sparse1>, tensor<?x?x?x?xf32, #sparse1>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    %21 = "vector.transfer_read"(%17, %0, %0, %0, %0, %7) <{in_bounds = [false, false, false, false], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map3}> : (tensor<?x?x?x?xf32>, index, index, index, index, f32) -> vector<3x1x6x6xf32>
    "vector.print"(%21) <{punctuation = #vector.punctuation<newline>}> : (vector<3x1x6x6xf32>) -> ()
    %22 = "vector.transfer_read"(%18, %0, %0, %0, %0, %7) <{in_bounds = [false, false, false, false], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map3}> : (tensor<?x?x?x?xf32>, index, index, index, index, f32) -> vector<3x1x6x6xf32>
    "vector.print"(%22) <{punctuation = #vector.punctuation<newline>}> : (vector<3x1x6x6xf32>) -> ()
    %23 = "vector.transfer_read"(%19, %0, %0, %0, %0, %7) <{in_bounds = [false, false, false, false], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map3}> : (tensor<?x?x?x?xf32>, index, index, index, index, f32) -> vector<3x1x6x6xf32>
    "vector.print"(%23) <{punctuation = #vector.punctuation<newline>}> : (vector<3x1x6x6xf32>) -> ()
    %24 = "vector.transfer_read"(%20, %0, %0, %0, %0, %7) <{in_bounds = [false, false, false, false], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map3}> : (tensor<?x?x?x?xf32>, index, index, index, index, f32) -> vector<3x1x6x6xf32>
    "vector.print"(%24) <{punctuation = #vector.punctuation<newline>}> : (vector<3x1x6x6xf32>) -> ()
    "bufferization.dealloc_tensor"(%10) : (tensor<?x?x?x?xf32>) -> ()
    "bufferization.dealloc_tensor"(%8) : (tensor<?x?x?x?xf32>) -> ()
    "bufferization.dealloc_tensor"(%11) : (tensor<?x?x?x?xf32>) -> ()
    "bufferization.dealloc_tensor"(%12) : (tensor<?x?x?x?xf32>) -> ()
    "bufferization.dealloc_tensor"(%13) : (tensor<?x?x?x?xf32>) -> ()
    "bufferization.dealloc_tensor"(%17) : (tensor<?x?x?x?xf32>) -> ()
    "bufferization.dealloc_tensor"(%15) : (tensor<?x?x?x?xf32, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%14) : (tensor<?x?x?x?xf32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%16) : (tensor<?x?x?x?xf32, #sparse1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

