#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0 + d3, d1 + d4, d2 + d5)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d3, d4, d5)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : dense, d2 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : compressed, d2 : compressed) }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : dense, d2 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, f32) -> tensor<?x?x?xf32>, sym_name = "alloc_3d_filled_f32"}> ({
  ^bb0(%arg26: index, %arg27: index, %arg28: index, %arg29: f32):
    %45 = "tensor.empty"(%arg26, %arg27, %arg28) : (index, index, index) -> tensor<?x?x?xf32>
    %46 = "linalg.fill"(%arg29, %45) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg30: f32, %arg31: f32):
      "linalg.yield"(%arg30) : (f32) -> ()
    }) : (f32, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    "func.return"(%46) : (tensor<?x?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>, sym_name = "conv_3d"}> ({
  ^bb0(%arg20: tensor<?x?x?xf32>, %arg21: tensor<?x?x?xf32>, %arg22: tensor<?x?x?xf32>):
    %42 = "linalg.conv_3d"(%arg20, %arg21, %arg22) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg23: f32, %arg24: f32, %arg25: f32):
      %43 = "arith.mulf"(%arg23, %arg24) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %44 = "arith.addf"(%arg25, %43) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%44) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    "func.return"(%42) : (tensor<?x?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?xf32, #sparse>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32, #sparse>, sym_name = "conv_3d_CCC"}> ({
  ^bb0(%arg15: tensor<?x?x?xf32, #sparse>, %arg16: tensor<?x?x?xf32>):
    %37 = "arith.constant"() <{value = 6 : index}> : () -> index
    %38 = "tensor.empty"(%37, %37, %37) : (index, index, index) -> tensor<?x?x?xf32, #sparse>
    %39 = "linalg.conv_3d"(%arg15, %arg16, %38) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg17: f32, %arg18: f32, %arg19: f32):
      %40 = "arith.mulf"(%arg17, %arg18) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %41 = "arith.addf"(%arg19, %40) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%41) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?xf32, #sparse>, tensor<?x?x?xf32>, tensor<?x?x?xf32, #sparse>) -> tensor<?x?x?xf32, #sparse>
    "func.return"(%39) : (tensor<?x?x?xf32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?xf32, #sparse1>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32, #sparse1>, sym_name = "conv_3d_CDC"}> ({
  ^bb0(%arg10: tensor<?x?x?xf32, #sparse1>, %arg11: tensor<?x?x?xf32>):
    %32 = "arith.constant"() <{value = 6 : index}> : () -> index
    %33 = "tensor.empty"(%32, %32, %32) : (index, index, index) -> tensor<?x?x?xf32, #sparse1>
    %34 = "linalg.conv_3d"(%arg10, %arg11, %33) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg12: f32, %arg13: f32, %arg14: f32):
      %35 = "arith.mulf"(%arg12, %arg13) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %36 = "arith.addf"(%arg14, %35) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%36) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?xf32, #sparse1>, tensor<?x?x?xf32>, tensor<?x?x?xf32, #sparse1>) -> tensor<?x?x?xf32, #sparse1>
    "func.return"(%34) : (tensor<?x?x?xf32, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?xf32, #sparse2>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32, #sparse2>, sym_name = "conv_3d_DCC"}> ({
  ^bb0(%arg5: tensor<?x?x?xf32, #sparse2>, %arg6: tensor<?x?x?xf32>):
    %27 = "arith.constant"() <{value = 6 : index}> : () -> index
    %28 = "tensor.empty"(%27, %27, %27) : (index, index, index) -> tensor<?x?x?xf32, #sparse2>
    %29 = "linalg.conv_3d"(%arg5, %arg6, %28) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: f32, %arg8: f32, %arg9: f32):
      %30 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %31 = "arith.addf"(%arg9, %30) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%31) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?xf32, #sparse2>, tensor<?x?x?xf32>, tensor<?x?x?xf32, #sparse2>) -> tensor<?x?x?xf32, #sparse2>
    "func.return"(%29) : (tensor<?x?x?xf32, #sparse2>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?xf32, #sparse3>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32, #sparse3>, sym_name = "conv_3d_DDC"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32, #sparse3>, %arg1: tensor<?x?x?xf32>):
    %22 = "arith.constant"() <{value = 6 : index}> : () -> index
    %23 = "tensor.empty"(%22, %22, %22) : (index, index, index) -> tensor<?x?x?xf32, #sparse3>
    %24 = "linalg.conv_3d"(%arg0, %arg1, %23) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %25 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %26 = "arith.addf"(%arg4, %25) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%26) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?xf32, #sparse3>, tensor<?x?x?xf32>, tensor<?x?x?xf32, #sparse3>) -> tensor<?x?x?xf32, #sparse3>
    "func.return"(%24) : (tensor<?x?x?xf32, #sparse3>) -> ()
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
    %8 = "func.call"(%2, %2, %2, %6) <{callee = @alloc_3d_filled_f32}> : (index, index, index, f32) -> tensor<?x?x?xf32>
    %9 = "func.call"(%4, %4, %4, %6) <{callee = @alloc_3d_filled_f32}> : (index, index, index, f32) -> tensor<?x?x?xf32>
    %10 = "tensor.insert"(%5, %9, %0, %2, %0) : (f32, tensor<?x?x?xf32>, index, index, index) -> tensor<?x?x?xf32>
    %11 = "func.call"(%3, %3, %3, %7) <{callee = @alloc_3d_filled_f32}> : (index, index, index, f32) -> tensor<?x?x?xf32>
    %12 = "sparse_tensor.convert"(%10) : (tensor<?x?x?xf32>) -> tensor<?x?x?xf32, #sparse>
    %13 = "sparse_tensor.convert"(%10) : (tensor<?x?x?xf32>) -> tensor<?x?x?xf32, #sparse1>
    %14 = "sparse_tensor.convert"(%10) : (tensor<?x?x?xf32>) -> tensor<?x?x?xf32, #sparse2>
    %15 = "sparse_tensor.convert"(%10) : (tensor<?x?x?xf32>) -> tensor<?x?x?xf32, #sparse3>
    %16 = "func.call"(%10, %8, %11) <{callee = @conv_3d}> : (tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    %17 = "func.call"(%12, %8) <{callee = @conv_3d_CCC}> : (tensor<?x?x?xf32, #sparse>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32, #sparse>
    %18 = "func.call"(%13, %8) <{callee = @conv_3d_CDC}> : (tensor<?x?x?xf32, #sparse1>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32, #sparse1>
    %19 = "func.call"(%14, %8) <{callee = @conv_3d_DCC}> : (tensor<?x?x?xf32, #sparse2>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32, #sparse2>
    %20 = "func.call"(%15, %8) <{callee = @conv_3d_DDC}> : (tensor<?x?x?xf32, #sparse3>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32, #sparse3>
    %21 = "vector.transfer_read"(%16, %0, %0, %0, %7) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 3, 1, 0>, permutation_map = #map3}> : (tensor<?x?x?xf32>, index, index, index, f32) -> vector<6x6x6xf32>
    "vector.print"(%21) <{punctuation = #vector.punctuation<newline>}> : (vector<6x6x6xf32>) -> ()
    "sparse_tensor.print"(%17) : (tensor<?x?x?xf32, #sparse>) -> ()
    "sparse_tensor.print"(%18) : (tensor<?x?x?xf32, #sparse1>) -> ()
    "sparse_tensor.print"(%20) : (tensor<?x?x?xf32, #sparse3>) -> ()
    "sparse_tensor.print"(%19) : (tensor<?x?x?xf32, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%10) : (tensor<?x?x?xf32>) -> ()
    "bufferization.dealloc_tensor"(%8) : (tensor<?x?x?xf32>) -> ()
    "bufferization.dealloc_tensor"(%11) : (tensor<?x?x?xf32>) -> ()
    "bufferization.dealloc_tensor"(%13) : (tensor<?x?x?xf32, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%12) : (tensor<?x?x?xf32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%15) : (tensor<?x?x?xf32, #sparse3>) -> ()
    "bufferization.dealloc_tensor"(%14) : (tensor<?x?x?xf32, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%17) : (tensor<?x?x?xf32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%18) : (tensor<?x?x?xf32, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%20) : (tensor<?x?x?xf32, #sparse3>) -> ()
    "bufferization.dealloc_tensor"(%19) : (tensor<?x?x?xf32, #sparse2>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

