#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
#map2 = affine_map<(d0, d1) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x64xf64, #sparse>, tensor<64xf64>, tensor<32xf64>) -> tensor<32xf64>, sym_name = "matvec"}> ({
  ^bb0(%arg0: tensor<32x64xf64, #sparse>, %arg1: tensor<64xf64>, %arg2: tensor<32xf64>):
    %0 = "linalg.generic"(%arg0, %arg1, %arg2) <{doc = "x(i) += A(i,j) * b(j)", indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f64, %arg4: f64, %arg5: f64):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%2) : (f64) -> ()
    }) : (tensor<32x64xf64, #sparse>, tensor<64xf64>, tensor<32xf64>) -> tensor<32xf64>
    "func.return"(%0) : (tensor<32xf64>) -> ()
  }) : () -> ()
}) : () -> ()

