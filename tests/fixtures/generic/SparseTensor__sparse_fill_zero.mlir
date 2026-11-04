#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<100x200xf64, #sparse>, tensor<200x300xf64, #sparse>) -> tensor<100x300xf64, #sparse>, sym_name = "fill_zero_after_alloc"}> ({
  ^bb0(%arg0: tensor<100x200xf64, #sparse>, %arg1: tensor<200x300xf64, #sparse>):
    %0 = "tensor.empty"() : () -> tensor<100x300xf64, #sparse>
    %1 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %2 = "linalg.fill"(%1, %0) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg5: f64, %arg6: f64):
      "linalg.yield"(%arg5) : (f64) -> ()
    }) : (f64, tensor<100x300xf64, #sparse>) -> tensor<100x300xf64, #sparse>
    %3 = "linalg.matmul"(%arg0, %arg1, %2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f64, %arg3: f64, %arg4: f64):
      %4 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %5 = "arith.addf"(%arg4, %4) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%5) : (f64) -> ()
    }) : (tensor<100x200xf64, #sparse>, tensor<200x300xf64, #sparse>, tensor<100x300xf64, #sparse>) -> tensor<100x300xf64, #sparse>
    "func.return"(%3) : (tensor<100x300xf64, #sparse>) -> ()
  }) : () -> ()
}) : () -> ()

