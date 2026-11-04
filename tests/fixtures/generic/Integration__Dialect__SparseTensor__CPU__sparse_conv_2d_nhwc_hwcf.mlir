#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d4, d5, d6, d3)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
#map3 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed, d1 : dense, d2 : compressed, d3 : dense) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : dense, d1 : compressed, d2 : compressed, d3 : dense) }>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index, f32) -> tensor<?x?x?x?xf32>, sym_name = "alloc_4d_filled_f32"}> ({
  ^bb0(%arg21: index, %arg22: index, %arg23: index, %arg24: index, %arg25: f32):
    %44 = "tensor.empty"(%arg21, %arg22, %arg23, %arg24) : (index, index, index, index) -> tensor<?x?x?x?xf32>
    %45 = "linalg.fill"(%arg25, %44) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg26: f32, %arg27: f32):
      "linalg.yield"(%arg26) : (f32) -> ()
    }) : (f32, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    "func.return"(%45) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>, sym_name = "conv_2d_nhwc_hwcf"}> ({
  ^bb0(%arg15: tensor<?x?x?x?xf32>, %arg16: tensor<?x?x?x?xf32>, %arg17: tensor<?x?x?x?xf32>):
    %41 = "linalg.conv_2d_nhwc_hwcf"(%arg15, %arg16, %arg17) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg18: f32, %arg19: f32, %arg20: f32):
      %42 = "arith.mulf"(%arg18, %arg19) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %43 = "arith.addf"(%arg20, %42) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%43) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    "func.return"(%41) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?x?xf32, #sparse>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32, #sparse>, sym_name = "conv_2d_nhwc_hwcf_CCCC"}> ({
  ^bb0(%arg10: tensor<?x?x?x?xf32, #sparse>, %arg11: tensor<?x?x?x?xf32>):
    %34 = "arith.constant"() <{value = 1 : index}> : () -> index
    %35 = "arith.constant"() <{value = 3 : index}> : () -> index
    %36 = "arith.constant"() <{value = 6 : index}> : () -> index
    %37 = "tensor.empty"(%35, %36, %36, %34) : (index, index, index, index) -> tensor<?x?x?x?xf32, #sparse>
    %38 = "linalg.conv_2d_nhwc_hwcf"(%arg10, %arg11, %37) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg12: f32, %arg13: f32, %arg14: f32):
      %39 = "arith.mulf"(%arg12, %arg13) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %40 = "arith.addf"(%arg14, %39) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%40) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?xf32, #sparse>, tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32, #sparse>) -> tensor<?x?x?x?xf32, #sparse>
    "func.return"(%38) : (tensor<?x?x?x?xf32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?x?xf32, #sparse1>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32, #sparse1>, sym_name = "conv_2d_nhwc_hwcf_CDCD"}> ({
  ^bb0(%arg5: tensor<?x?x?x?xf32, #sparse1>, %arg6: tensor<?x?x?x?xf32>):
    %27 = "arith.constant"() <{value = 1 : index}> : () -> index
    %28 = "arith.constant"() <{value = 3 : index}> : () -> index
    %29 = "arith.constant"() <{value = 6 : index}> : () -> index
    %30 = "tensor.empty"(%28, %29, %29, %27) : (index, index, index, index) -> tensor<?x?x?x?xf32, #sparse1>
    %31 = "linalg.conv_2d_nhwc_hwcf"(%arg5, %arg6, %30) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg7: f32, %arg8: f32, %arg9: f32):
      %32 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %33 = "arith.addf"(%arg9, %32) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%33) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?xf32, #sparse1>, tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32, #sparse1>) -> tensor<?x?x?x?xf32, #sparse1>
    "func.return"(%31) : (tensor<?x?x?x?xf32, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?x?xf32, #sparse2>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32, #sparse2>, sym_name = "conv_2d_nhwc_hwcf_DCCD"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xf32, #sparse2>, %arg1: tensor<?x?x?x?xf32>):
    %20 = "arith.constant"() <{value = 1 : index}> : () -> index
    %21 = "arith.constant"() <{value = 3 : index}> : () -> index
    %22 = "arith.constant"() <{value = 6 : index}> : () -> index
    %23 = "tensor.empty"(%21, %22, %22, %20) : (index, index, index, index) -> tensor<?x?x?x?xf32, #sparse2>
    %24 = "linalg.conv_2d_nhwc_hwcf"(%arg0, %arg1, %23) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %25 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %26 = "arith.addf"(%arg4, %25) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%26) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?xf32, #sparse2>, tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32, #sparse2>) -> tensor<?x?x?x?xf32, #sparse2>
    "func.return"(%24) : (tensor<?x?x?x?xf32, #sparse2>) -> ()
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
    %8 = "func.call"(%2, %2, %2, %1, %6) <{callee = @alloc_4d_filled_f32}> : (index, index, index, index, f32) -> tensor<?x?x?x?xf32>
    %9 = "func.call"(%2, %4, %4, %2, %6) <{callee = @alloc_4d_filled_f32}> : (index, index, index, index, f32) -> tensor<?x?x?x?xf32>
    %10 = "tensor.insert"(%5, %9, %0, %0, %2, %0) : (f32, tensor<?x?x?x?xf32>, index, index, index, index) -> tensor<?x?x?x?xf32>
    %11 = "func.call"(%2, %3, %3, %1, %7) <{callee = @alloc_4d_filled_f32}> : (index, index, index, index, f32) -> tensor<?x?x?x?xf32>
    %12 = "sparse_tensor.convert"(%10) : (tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32, #sparse>
    %13 = "sparse_tensor.convert"(%10) : (tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32, #sparse1>
    %14 = "sparse_tensor.convert"(%10) : (tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32, #sparse2>
    %15 = "func.call"(%10, %8, %11) <{callee = @conv_2d_nhwc_hwcf}> : (tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    %16 = "func.call"(%12, %8) <{callee = @conv_2d_nhwc_hwcf_CCCC}> : (tensor<?x?x?x?xf32, #sparse>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32, #sparse>
    %17 = "func.call"(%13, %8) <{callee = @conv_2d_nhwc_hwcf_CDCD}> : (tensor<?x?x?x?xf32, #sparse1>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32, #sparse1>
    %18 = "func.call"(%14, %8) <{callee = @conv_2d_nhwc_hwcf_DCCD}> : (tensor<?x?x?x?xf32, #sparse2>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32, #sparse2>
    %19 = "vector.transfer_read"(%15, %0, %0, %0, %0, %7) <{in_bounds = [false, false, false, false], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map3}> : (tensor<?x?x?x?xf32>, index, index, index, index, f32) -> vector<3x6x6x1xf32>
    "vector.print"(%19) <{punctuation = #vector.punctuation<newline>}> : (vector<3x6x6x1xf32>) -> ()
    "sparse_tensor.print"(%16) : (tensor<?x?x?x?xf32, #sparse>) -> ()
    "sparse_tensor.print"(%17) : (tensor<?x?x?x?xf32, #sparse1>) -> ()
    "sparse_tensor.print"(%18) : (tensor<?x?x?x?xf32, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%10) : (tensor<?x?x?x?xf32>) -> ()
    "bufferization.dealloc_tensor"(%8) : (tensor<?x?x?x?xf32>) -> ()
    "bufferization.dealloc_tensor"(%11) : (tensor<?x?x?x?xf32>) -> ()
    "bufferization.dealloc_tensor"(%13) : (tensor<?x?x?x?xf32, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%12) : (tensor<?x?x?x?xf32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%14) : (tensor<?x?x?x?xf32, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%16) : (tensor<?x?x?x?xf32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%17) : (tensor<?x?x?x?xf32, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%18) : (tensor<?x?x?x?xf32, #sparse2>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

