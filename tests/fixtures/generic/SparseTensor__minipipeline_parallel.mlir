#map = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (f32, tensor<?x?xf32, #sparse>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "scale_ss"}> ({
  ^bb0(%arg0: f32, %arg1: tensor<?x?xf32, #sparse>, %arg2: tensor<?x?xf32>):
    %0 = "linalg.generic"(%arg1, %arg2) <{doc = "X(i,j) = A(i,j) * SCALE", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      %1 = "arith.mulf"(%arg3, %arg0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (tensor<?x?xf32, #sparse>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%0) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

