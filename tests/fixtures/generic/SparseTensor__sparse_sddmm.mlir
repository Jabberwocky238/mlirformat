#map = affine_map<(d0, d1) -> ()>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<(d0) -> (d0)>
#map3 = affine_map<(d0, d1, d2) -> (d1, d0)>
#map4 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map5 = affine_map<(d0, d1, d2) -> (d1, d2)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<1024x1024xf64>, sym_name = "fold_yield_arg_zero"}> ({
    %16 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %17 = "tensor.empty"() : () -> tensor<1024x1024xf64>
    %18 = "linalg.generic"(%16, %17) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg19: f64, %arg20: f64):
      "linalg.yield"(%arg19) : (f64) -> ()
    }) : (f64, tensor<1024x1024xf64>) -> tensor<1024x1024xf64>
    "func.return"(%18) : (tensor<1024x1024xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> tensor<32xf64>, sym_name = "fold_yield_direct_zero"}> ({
    %13 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %14 = "tensor.empty"() : () -> tensor<32xf64>
    %15 = "linalg.generic"(%14) <{indexing_maps = [#map2], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg18: f64):
      "linalg.yield"(%13) : (f64) -> ()
    }) : (tensor<32xf64>) -> tensor<32xf64>
    "func.return"(%15) : (tensor<32xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xf64, #sparse>, tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64>, sym_name = "sampled_dd_unfused"}> ({
  ^bb0(%arg9: tensor<8x8xf64, #sparse>, %arg10: tensor<8x8xf64>, %arg11: tensor<8x8xf64>):
    %7 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<8x8xf64>}> : () -> tensor<8x8xf64>
    %8 = "linalg.generic"(%arg10, %arg11, %7) <{indexing_maps = [#map3, #map4, #map5], iterator_types = [#linalg.iterator_type<reduction>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg15: f64, %arg16: f64, %arg17: f64):
      %11 = "arith.mulf"(%arg15, %arg16) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %12 = "arith.addf"(%arg17, %11) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%12) : (f64) -> ()
    }) : (tensor<8x8xf64>, tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64>
    %9 = "linalg.generic"(%8, %arg9, %7) <{indexing_maps = [#map1, #map1, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg12: f64, %arg13: f64, %arg14: f64):
      %10 = "arith.mulf"(%arg12, %arg13) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%10) : (f64) -> ()
    }) : (tensor<8x8xf64>, tensor<8x8xf64, #sparse>, tensor<8x8xf64>) -> tensor<8x8xf64>
    "func.return"(%9) : (tensor<8x8xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xf64, #sparse>, tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64, #sparse>, sym_name = "sparse_sampled_dd_unfused"}> ({
  ^bb0(%arg0: tensor<8x8xf64, #sparse>, %arg1: tensor<8x8xf64>, %arg2: tensor<8x8xf64>):
    %0 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<8x8xf64>}> : () -> tensor<8x8xf64>
    %1 = "linalg.generic"(%arg1, %arg2, %0) <{indexing_maps = [#map3, #map4, #map5], iterator_types = [#linalg.iterator_type<reduction>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: f64, %arg7: f64, %arg8: f64):
      %5 = "arith.mulf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %6 = "arith.addf"(%arg8, %5) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%6) : (f64) -> ()
    }) : (tensor<8x8xf64>, tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64>
    %2 = "tensor.empty"() : () -> tensor<8x8xf64, #sparse>
    %3 = "linalg.generic"(%1, %arg0, %2) <{indexing_maps = [#map1, #map1, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f64, %arg4: f64, %arg5: f64):
      %4 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%4) : (f64) -> ()
    }) : (tensor<8x8xf64>, tensor<8x8xf64, #sparse>, tensor<8x8xf64, #sparse>) -> tensor<8x8xf64, #sparse>
    "func.return"(%3) : (tensor<8x8xf64, #sparse>) -> ()
  }) : () -> ()
}) : () -> ()

