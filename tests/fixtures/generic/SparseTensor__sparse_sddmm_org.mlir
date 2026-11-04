#map = affine_map<(d0, d1, d2) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map3 = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x8xf64, #sparse>, tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64, #sparse>, sym_name = "sparse_sampled_dd_unfused"}> ({
  ^bb0(%arg0: tensor<8x8xf64, #sparse>, %arg1: tensor<8x8xf64>, %arg2: tensor<8x8xf64>):
    %0 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<8x8xf64>}> : () -> tensor<8x8xf64>
    %1 = "linalg.generic"(%arg1, %arg2, %0) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<reduction>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: f64, %arg7: f64, %arg8: f64):
      %5 = "arith.mulf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %6 = "arith.addf"(%arg8, %5) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%6) : (f64) -> ()
    }) : (tensor<8x8xf64>, tensor<8x8xf64>, tensor<8x8xf64>) -> tensor<8x8xf64>
    %2 = "tensor.empty"() : () -> tensor<8x8xf64, #sparse>
    %3 = "linalg.generic"(%1, %arg0, %2) <{indexing_maps = [#map3, #map3, #map3], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f64, %arg4: f64, %arg5: f64):
      %4 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%4) : (f64) -> ()
    }) : (tensor<8x8xf64>, tensor<8x8xf64, #sparse>, tensor<8x8xf64, #sparse>) -> tensor<8x8xf64, #sparse>
    "func.return"(%3) : (tensor<8x8xf64, #sparse>) -> ()
  }) : () -> ()
}) : () -> ()

