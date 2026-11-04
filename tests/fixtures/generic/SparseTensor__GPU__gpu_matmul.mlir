#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse>, tensor<?x?xf64>, tensor<?x?xf64>) -> tensor<?x?xf64>, sym_name = "matmul"}> ({
  ^bb0(%arg0: tensor<?x?xf64, #sparse>, %arg1: tensor<?x?xf64>, %arg2: tensor<?x?xf64>):
    %0 = "linalg.matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f64, %arg4: f64, %arg5: f64):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%2) : (f64) -> ()
    }) : (tensor<?x?xf64, #sparse>, tensor<?x?xf64>, tensor<?x?xf64>) -> tensor<?x?xf64>
    "func.return"(%0) : (tensor<?x?xf64>) -> ()
  }) : () -> ()
}) : () -> ()

