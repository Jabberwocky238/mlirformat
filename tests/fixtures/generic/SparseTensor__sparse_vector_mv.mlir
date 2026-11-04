#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
#map2 = affine_map<(d0, d1) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32, #sparse>, tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>, sym_name = "kernel_matvec"}> ({
  ^bb0(%arg0: tensor<?x?xf32, #sparse>, %arg1: tensor<?xf32>, %arg2: tensor<?xf32>):
    %0 = "linalg.generic"(%arg0, %arg1, %arg2) <{doc = "X(i) += A(i,j) * B(j)", indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<?x?xf32, #sparse>, tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
    "func.return"(%0) : (tensor<?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

