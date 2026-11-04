#map = affine_map<(d0, d1, d2) -> (d0, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x4xf64>, tensor<8x4xf64, #sparse>, tensor<2x4xf64>) -> tensor<2x4xf64>, sym_name = "b_ununsed"}> ({
  ^bb0(%arg0: tensor<2x4xf64>, %arg1: tensor<8x4xf64, #sparse>, %arg2: tensor<2x4xf64>):
    %0 = "linalg.generic"(%arg0, %arg1, %arg2) <{doc = "C(i,j) = SUM_k A(i,j)", indexing_maps = [#map, #map1, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f64, %arg4: f64, %arg5: f64):
      %1 = "arith.addf"(%arg5, %arg3) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%1) : (f64) -> ()
    }) : (tensor<2x4xf64>, tensor<8x4xf64, #sparse>, tensor<2x4xf64>) -> tensor<2x4xf64>
    "func.return"(%0) : (tensor<2x4xf64>) -> ()
  }) : () -> ()
}) : () -> ()

