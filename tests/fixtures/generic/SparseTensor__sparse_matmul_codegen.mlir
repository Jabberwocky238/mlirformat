#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8xf64, #sparse>, tensor<8x4xf64, #sparse>) -> tensor<4x4xf64, #sparse>, sym_name = "matmul"}> ({
  ^bb0(%arg0: tensor<4x8xf64, #sparse>, %arg1: tensor<8x4xf64, #sparse>):
    %0 = "tensor.empty"() : () -> tensor<4x4xf64, #sparse>
    %1 = "linalg.matmul"(%arg0, %arg1, %0) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f64, %arg3: f64, %arg4: f64):
      %2 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %3 = "arith.addf"(%arg4, %2) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%3) : (f64) -> ()
    }) : (tensor<4x8xf64, #sparse>, tensor<8x4xf64, #sparse>, tensor<4x4xf64, #sparse>) -> tensor<4x4xf64, #sparse>
    "func.return"(%1) : (tensor<4x4xf64, #sparse>) -> ()
  }) : () -> ()
}) : () -> ()

