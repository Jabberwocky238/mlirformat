#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 floordiv 4 : dense, d1 mod 4 : structured[2, 4]) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf16>, tensor<?x?xf16>, tensor<?x?xf16>) -> tensor<?x?xf16>, sym_name = "matmul"}> ({
  ^bb0(%arg0: tensor<?x?xf16>, %arg1: tensor<?x?xf16>, %arg2: tensor<?x?xf16>):
    %0 = "sparse_tensor.convert"(%arg0) : (tensor<?x?xf16>) -> tensor<?x?xf16, #sparse>
    %1 = "linalg.matmul"(%0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f16, %arg4: f16, %arg5: f16):
      %2 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f16, f16) -> f16
      %3 = "arith.addf"(%arg5, %2) <{fastmath = #arith.fastmath<none>}> : (f16, f16) -> f16
      "linalg.yield"(%3) : (f16) -> ()
    }) : (tensor<?x?xf16, #sparse>, tensor<?x?xf16>, tensor<?x?xf16>) -> tensor<?x?xf16>
    "func.return"(%1) : (tensor<?x?xf16>) -> ()
  }) : () -> ()
}) : () -> ()

