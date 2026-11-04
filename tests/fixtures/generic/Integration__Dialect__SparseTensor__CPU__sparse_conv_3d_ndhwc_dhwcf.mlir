#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d0, d1 + d5, d2 + d6, d3 + d7, d8)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d5, d6, d7, d8, d4)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d0, d1, d2, d3, d4)>
#map3 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2, d3, d4)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2, d3, d4) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : compressed, d4 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1, d2, d3, d4) -> (d0 : compressed, d1 : dense, d2 : compressed, d3 : dense, d4 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index, index, f32) -> tensor<?x?x?x?x?xf32>, sym_name = "alloc_5d_filled_f32"}> ({
  ^bb0(%arg16: index, %arg17: index, %arg18: index, %arg19: index, %arg20: index, %arg21: f32):
    %33 = "tensor.empty"(%arg16, %arg17, %arg18, %arg19, %arg20) : (index, index, index, index, index) -> tensor<?x?x?x?x?xf32>
    %34 = "linalg.fill"(%arg21, %33) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg22: f32, %arg23: f32):
      "linalg.yield"(%arg22) : (f32) -> ()
    }) : (f32, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>
    "func.return"(%34) : (tensor<?x?x?x?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>, sym_name = "conv_3d_ndhwc_dhwcf"}> ({
  ^bb0(%arg10: tensor<?x?x?x?x?xf32>, %arg11: tensor<?x?x?x?x?xf32>, %arg12: tensor<?x?x?x?x?xf32>):
    %30 = "linalg.conv_3d_ndhwc_dhwcf"(%arg10, %arg11, %arg12) <{dilations = dense<1> : tensor<3xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<3xi64>}> ({
    ^bb0(%arg13: f32, %arg14: f32, %arg15: f32):
      %31 = "arith.mulf"(%arg13, %arg14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %32 = "arith.addf"(%arg15, %31) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%32) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>
    "func.return"(%30) : (tensor<?x?x?x?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?x?x?xf32, #sparse>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32, #sparse>, sym_name = "conv_3d_ndhwc_dhwcf_CCCCC"}> ({
  ^bb0(%arg5: tensor<?x?x?x?x?xf32, #sparse>, %arg6: tensor<?x?x?x?x?xf32>):
    %24 = "arith.constant"() <{value = 1 : index}> : () -> index
    %25 = "arith.constant"() <{value = 6 : index}> : () -> index
    %26 = "tensor.empty"(%24, %25, %25, %25, %24) : (index, index, index, index, index) -> tensor<?x?x?x?x?xf32, #sparse>
    %27 = "linalg.conv_3d_ndhwc_dhwcf"(%arg5, %arg6, %26) <{dilations = dense<1> : tensor<3xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<3xi64>}> ({
    ^bb0(%arg7: f32, %arg8: f32, %arg9: f32):
      %28 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %29 = "arith.addf"(%arg9, %28) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%29) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?x?xf32, #sparse>, tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32, #sparse>) -> tensor<?x?x?x?x?xf32, #sparse>
    "func.return"(%27) : (tensor<?x?x?x?x?xf32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?x?x?xf32, #sparse1>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32, #sparse1>, sym_name = "conv_3d_ndhwc_dhwcf_CDCDC"}> ({
  ^bb0(%arg0: tensor<?x?x?x?x?xf32, #sparse1>, %arg1: tensor<?x?x?x?x?xf32>):
    %18 = "arith.constant"() <{value = 1 : index}> : () -> index
    %19 = "arith.constant"() <{value = 6 : index}> : () -> index
    %20 = "tensor.empty"(%18, %19, %19, %19, %18) : (index, index, index, index, index) -> tensor<?x?x?x?x?xf32, #sparse1>
    %21 = "linalg.conv_3d_ndhwc_dhwcf"(%arg0, %arg1, %20) <{dilations = dense<1> : tensor<3xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<3xi64>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %22 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %23 = "arith.addf"(%arg4, %22) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%23) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?x?xf32, #sparse1>, tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32, #sparse1>) -> tensor<?x?x?x?x?xf32, #sparse1>
    "func.return"(%21) : (tensor<?x?x?x?x?xf32, #sparse1>) -> ()
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
    %8 = "func.call"(%1, %4, %4, %4, %1, %6) <{callee = @alloc_5d_filled_f32}> : (index, index, index, index, index, f32) -> tensor<?x?x?x?x?xf32>
    %9 = "tensor.insert"(%5, %8, %0, %0, %0, %2, %0) : (f32, tensor<?x?x?x?x?xf32>, index, index, index, index, index) -> tensor<?x?x?x?x?xf32>
    %10 = "func.call"(%2, %2, %2, %1, %1, %6) <{callee = @alloc_5d_filled_f32}> : (index, index, index, index, index, f32) -> tensor<?x?x?x?x?xf32>
    %11 = "func.call"(%1, %3, %3, %3, %1, %7) <{callee = @alloc_5d_filled_f32}> : (index, index, index, index, index, f32) -> tensor<?x?x?x?x?xf32>
    %12 = "sparse_tensor.convert"(%9) : (tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32, #sparse>
    %13 = "sparse_tensor.convert"(%9) : (tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32, #sparse1>
    %14 = "func.call"(%9, %10, %11) <{callee = @conv_3d_ndhwc_dhwcf}> : (tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>
    %15 = "vector.transfer_read"(%14, %0, %0, %0, %0, %0, %7) <{in_bounds = [false, false, false, false, false], operandSegmentSizes = array<i32: 1, 5, 1, 0>, permutation_map = #map3}> : (tensor<?x?x?x?x?xf32>, index, index, index, index, index, f32) -> vector<1x6x6x6x1xf32>
    "vector.print"(%15) <{punctuation = #vector.punctuation<newline>}> : (vector<1x6x6x6x1xf32>) -> ()
    %16 = "func.call"(%12, %10) <{callee = @conv_3d_ndhwc_dhwcf_CCCCC}> : (tensor<?x?x?x?x?xf32, #sparse>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32, #sparse>
    "sparse_tensor.print"(%16) : (tensor<?x?x?x?x?xf32, #sparse>) -> ()
    %17 = "func.call"(%13, %10) <{callee = @conv_3d_ndhwc_dhwcf_CDCDC}> : (tensor<?x?x?x?x?xf32, #sparse1>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32, #sparse1>
    "sparse_tensor.print"(%17) : (tensor<?x?x?x?x?xf32, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%9) : (tensor<?x?x?x?x?xf32>) -> ()
    "bufferization.dealloc_tensor"(%10) : (tensor<?x?x?x?x?xf32>) -> ()
    "bufferization.dealloc_tensor"(%11) : (tensor<?x?x?x?x?xf32>) -> ()
    "bufferization.dealloc_tensor"(%13) : (tensor<?x?x?x?x?xf32, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%12) : (tensor<?x?x?x?x?xf32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%16) : (tensor<?x?x?x?x?xf32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%17) : (tensor<?x?x?x?x?xf32, #sparse1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

