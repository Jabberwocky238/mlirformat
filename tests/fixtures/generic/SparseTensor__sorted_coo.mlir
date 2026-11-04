#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
#map2 = affine_map<(d0, d1) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32, #sparse>) -> tensor<?x?xf32, #sparse>, sym_name = "sparse_scale"}> ({
  ^bb0(%arg12: tensor<?x?xf32, #sparse>):
    %5 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %6 = "linalg.generic"(%arg12) <{doc = "X(i,j) = X(i,j) * 2.0", indexing_maps = [#map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg13: f32):
      %7 = "arith.mulf"(%arg13, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) : (tensor<?x?xf32, #sparse>) -> tensor<?x?xf32, #sparse>
    "func.return"(%6) : (tensor<?x?xf32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32x64xf64, #sparse>, tensor<64xf64>, tensor<32xf64>) -> tensor<32xf64>, sym_name = "matvec"}> ({
  ^bb0(%arg6: tensor<32x64xf64, #sparse>, %arg7: tensor<64xf64>, %arg8: tensor<32xf64>):
    %2 = "linalg.generic"(%arg6, %arg7, %arg8) <{doc = "x(i) += A(i,j) * b(j)", indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg9: f64, %arg10: f64, %arg11: f64):
      %3 = "arith.mulf"(%arg9, %arg10) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %4 = "arith.addf"(%arg11, %3) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%4) : (f64) -> ()
    }) : (tensor<32x64xf64, #sparse>, tensor<64xf64>, tensor<32xf64>) -> tensor<32xf64>
    "func.return"(%2) : (tensor<32xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32x64xf64, #sparse>, tensor<32x64xf64, #sparse>, tensor<32x64xf64>) -> tensor<32x64xf64>, sym_name = "mateltmul"}> ({
  ^bb0(%arg0: tensor<32x64xf64, #sparse>, %arg1: tensor<32x64xf64, #sparse>, %arg2: tensor<32x64xf64>):
    %0 = "linalg.generic"(%arg0, %arg1, %arg2) <{doc = "Z(i,j) = X(i,j) * Y(i,j)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f64, %arg4: f64, %arg5: f64):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%1) : (f64) -> ()
    }) : (tensor<32x64xf64, #sparse>, tensor<32x64xf64, #sparse>, tensor<32x64xf64>) -> tensor<32x64xf64>
    "func.return"(%0) : (tensor<32x64xf64>) -> ()
  }) : () -> ()
}) : () -> ()

