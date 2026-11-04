#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : dense, d2 : compressed), explicitVal = 1.000000e+00 : f32 }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x3x8xf32, #sparse>) -> tensor<f32>, sym_name = "sum_squares"}> ({
  ^bb0(%arg9: tensor<2x3x8xf32, #sparse>):
    %8 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %9 = "tensor.empty"() : () -> tensor<2x3x8xf32>
    %10 = "linalg.generic"(%arg9, %arg9, %9) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg14: f32, %arg15: f32, %arg16: f32):
      %15 = "arith.mulf"(%arg14, %arg15) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%15) : (f32) -> ()
    }) : (tensor<2x3x8xf32, #sparse>, tensor<2x3x8xf32, #sparse>, tensor<2x3x8xf32>) -> tensor<2x3x8xf32>
    %11 = "tensor.empty"() : () -> tensor<f32>
    %12 = "linalg.fill"(%8, %11) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg12: f32, %arg13: f32):
      "linalg.yield"(%arg12) : (f32) -> ()
    }) : (f32, tensor<f32>) -> tensor<f32>
    %13 = "linalg.generic"(%10, %12) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg10: f32, %arg11: f32):
      %14 = "arith.addf"(%arg10, %arg11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%14) : (f32) -> ()
    }) : (tensor<2x3x8xf32>, tensor<f32>) -> tensor<f32>
    "func.return"(%13) : (tensor<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x3x8xf32, #sparse>, tensor<2x3x8xf32>) -> tensor<f32>, sym_name = "sum_products"}> ({
  ^bb0(%arg0: tensor<2x3x8xf32, #sparse>, %arg1: tensor<2x3x8xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "tensor.empty"() : () -> tensor<2x3x8xf32>
    %2 = "linalg.generic"(%arg0, %arg1, %1) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32, %arg8: f32):
      %7 = "arith.mulf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) : (tensor<2x3x8xf32, #sparse>, tensor<2x3x8xf32>, tensor<2x3x8xf32>) -> tensor<2x3x8xf32>
    %3 = "tensor.empty"() : () -> tensor<f32>
    %4 = "linalg.fill"(%0, %3) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      "linalg.yield"(%arg4) : (f32) -> ()
    }) : (f32, tensor<f32>) -> tensor<f32>
    %5 = "linalg.generic"(%2, %4) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %6 = "arith.addf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%6) : (f32) -> ()
    }) : (tensor<2x3x8xf32>, tensor<f32>) -> tensor<f32>
    "func.return"(%5) : (tensor<f32>) -> ()
  }) : () -> ()
}) : () -> ()

