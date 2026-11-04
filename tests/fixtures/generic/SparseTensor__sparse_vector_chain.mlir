#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f64>, tensor<64x32xf64, #sparse>, tensor<64x32xf64, #sparse>) -> tensor<f64>, sym_name = "sparse_matrix_sum"}> ({
  ^bb0(%arg0: tensor<f64>, %arg1: tensor<64x32xf64, #sparse>, %arg2: tensor<64x32xf64, #sparse>):
    %0 = "linalg.generic"(%arg1, %arg2, %arg0) <{indexing_maps = [#map, #map, #map1], iterator_types = [#linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f64, %arg4: f64, %arg5: f64):
      %1 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%2) : (f64) -> ()
    }) : (tensor<64x32xf64, #sparse>, tensor<64x32xf64, #sparse>, tensor<f64>) -> tensor<f64>
    "func.return"(%0) : (tensor<f64>) -> ()
  }) : () -> ()
}) : () -> ()

