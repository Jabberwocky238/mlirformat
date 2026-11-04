#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1024x8xf64>, tensor<8x1024xf64, #sparse>, tensor<1024x1024xf64, #sparse>) -> tensor<1024x1024xf64>, sym_name = "matmuls"}> ({
  ^bb0(%arg0: tensor<1024x8xf64>, %arg1: tensor<8x1024xf64, #sparse>, %arg2: tensor<1024x1024xf64, #sparse>):
    %0 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<1024x1024xf64>}> : () -> tensor<1024x1024xf64>
    %1 = "linalg.matmul"(%arg0, %arg1, %0) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: f64, %arg7: f64, %arg8: f64):
      %5 = "arith.mulf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %6 = "arith.addf"(%arg8, %5) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%6) : (f64) -> ()
    }) : (tensor<1024x8xf64>, tensor<8x1024xf64, #sparse>, tensor<1024x1024xf64>) -> tensor<1024x1024xf64>
    %2 = "linalg.matmul"(%1, %arg2, %0) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f64, %arg4: f64, %arg5: f64):
      %3 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %4 = "arith.addf"(%arg5, %3) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%4) : (f64) -> ()
    }) : (tensor<1024x1024xf64>, tensor<1024x1024xf64, #sparse>, tensor<1024x1024xf64>) -> tensor<1024x1024xf64>
    "func.return"(%2) : (tensor<1024x1024xf64>) -> ()
  }) : () -> ()
}) : () -> ()

