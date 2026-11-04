#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1 + d3, d4)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d3, d4, d2)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : dense, d2 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, f32) -> tensor<?x?x?xf32>, sym_name = "alloc_3d_filled_f32"}> ({
  ^bb0(%arg16: index, %arg17: index, %arg18: index, %arg19: f32):
    %35 = "tensor.empty"(%arg16, %arg17, %arg18) : (index, index, index) -> tensor<?x?x?xf32>
    %36 = "linalg.fill"(%arg19, %35) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg20: f32, %arg21: f32):
      "linalg.yield"(%arg20) : (f32) -> ()
    }) : (f32, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    "func.return"(%36) : (tensor<?x?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>, sym_name = "conv_1d_nwc_wcf"}> ({
  ^bb0(%arg10: tensor<?x?x?xf32>, %arg11: tensor<?x?x?xf32>, %arg12: tensor<?x?x?xf32>):
    %32 = "linalg.conv_1d_nwc_wcf"(%arg10, %arg11, %arg12) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg13: f32, %arg14: f32, %arg15: f32):
      %33 = "arith.mulf"(%arg13, %arg14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %34 = "arith.addf"(%arg15, %33) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%34) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    "func.return"(%32) : (tensor<?x?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?xf32, #sparse>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32, #sparse>, sym_name = "conv_1d_nwc_wcf_CCC"}> ({
  ^bb0(%arg5: tensor<?x?x?xf32, #sparse>, %arg6: tensor<?x?x?xf32>):
    %25 = "arith.constant"() <{value = 1 : index}> : () -> index
    %26 = "arith.constant"() <{value = 3 : index}> : () -> index
    %27 = "arith.constant"() <{value = 6 : index}> : () -> index
    %28 = "tensor.empty"(%26, %27, %25) : (index, index, index) -> tensor<?x?x?xf32, #sparse>
    %29 = "linalg.conv_1d_nwc_wcf"(%arg5, %arg6, %28) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg7: f32, %arg8: f32, %arg9: f32):
      %30 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %31 = "arith.addf"(%arg9, %30) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%31) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?xf32, #sparse>, tensor<?x?x?xf32>, tensor<?x?x?xf32, #sparse>) -> tensor<?x?x?xf32, #sparse>
    "func.return"(%29) : (tensor<?x?x?xf32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?xf32, #sparse1>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32, #sparse1>, sym_name = "conv_1d_nwc_wcf_CDC"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32, #sparse1>, %arg1: tensor<?x?x?xf32>):
    %18 = "arith.constant"() <{value = 1 : index}> : () -> index
    %19 = "arith.constant"() <{value = 3 : index}> : () -> index
    %20 = "arith.constant"() <{value = 6 : index}> : () -> index
    %21 = "tensor.empty"(%19, %20, %18) : (index, index, index) -> tensor<?x?x?xf32, #sparse1>
    %22 = "linalg.conv_1d_nwc_wcf"(%arg0, %arg1, %21) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %23 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %24 = "arith.addf"(%arg4, %23) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%24) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?xf32, #sparse1>, tensor<?x?x?xf32>, tensor<?x?x?xf32, #sparse1>) -> tensor<?x?x?xf32, #sparse1>
    "func.return"(%22) : (tensor<?x?x?xf32, #sparse1>) -> ()
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
    %8 = "func.call"(%2, %4, %1, %6) <{callee = @alloc_3d_filled_f32}> : (index, index, index, f32) -> tensor<?x?x?xf32>
    %9 = "tensor.insert"(%5, %8, %0, %2, %0) : (f32, tensor<?x?x?xf32>, index, index, index) -> tensor<?x?x?xf32>
    %10 = "func.call"(%2, %1, %1, %6) <{callee = @alloc_3d_filled_f32}> : (index, index, index, f32) -> tensor<?x?x?xf32>
    %11 = "func.call"(%2, %3, %1, %7) <{callee = @alloc_3d_filled_f32}> : (index, index, index, f32) -> tensor<?x?x?xf32>
    %12 = "sparse_tensor.convert"(%9) : (tensor<?x?x?xf32>) -> tensor<?x?x?xf32, #sparse>
    %13 = "sparse_tensor.convert"(%9) : (tensor<?x?x?xf32>) -> tensor<?x?x?xf32, #sparse1>
    %14 = "func.call"(%9, %10, %11) <{callee = @conv_1d_nwc_wcf}> : (tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    %15 = "func.call"(%12, %10) <{callee = @conv_1d_nwc_wcf_CCC}> : (tensor<?x?x?xf32, #sparse>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32, #sparse>
    %16 = "func.call"(%13, %10) <{callee = @conv_1d_nwc_wcf_CDC}> : (tensor<?x?x?xf32, #sparse1>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32, #sparse1>
    %17 = "vector.transfer_read"(%14, %0, %0, %0, %7) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 3, 1, 0>, permutation_map = #map3}> : (tensor<?x?x?xf32>, index, index, index, f32) -> vector<3x6x1xf32>
    "vector.print"(%17) <{punctuation = #vector.punctuation<newline>}> : (vector<3x6x1xf32>) -> ()
    "sparse_tensor.print"(%15) : (tensor<?x?x?xf32, #sparse>) -> ()
    "sparse_tensor.print"(%16) : (tensor<?x?x?xf32, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%9) : (tensor<?x?x?xf32>) -> ()
    "bufferization.dealloc_tensor"(%10) : (tensor<?x?x?xf32>) -> ()
    "bufferization.dealloc_tensor"(%11) : (tensor<?x?x?xf32>) -> ()
    "bufferization.dealloc_tensor"(%13) : (tensor<?x?x?xf32, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%12) : (tensor<?x?x?xf32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%15) : (tensor<?x?x?xf32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%16) : (tensor<?x?x?xf32, #sparse1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

