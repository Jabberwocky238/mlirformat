#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
#map2 = affine_map<(d0, d1) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x32xf32, #sparse>, tensor<32xf32>, tensor<16xf32>) -> tensor<16xf32>, sym_name = "matvec"}> ({
  ^bb0(%arg0: tensor<16x32xf32, #sparse>, %arg1: tensor<32xf32>, %arg2: tensor<16xf32>):
    %0 = "linalg.generic"(%arg0, %arg1, %arg2) <{doc = "x(i) += A(i,j) * b(j)", indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%1, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<16x32xf32, #sparse>, tensor<32xf32>, tensor<16xf32>) -> tensor<16xf32>
    "func.return"(%0) : (tensor<16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

