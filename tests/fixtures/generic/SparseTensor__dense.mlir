#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x16xf32, #sparse>, tensor<32x16xf32>) -> tensor<32x16xf32>, sym_name = "dense1"}> ({
  ^bb0(%arg8: tensor<32x16xf32, #sparse>, %arg9: tensor<32x16xf32>):
    %5 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %6 = "linalg.generic"(%arg8, %arg9) <{doc = "X(i,j) = A(i,j) + 1", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg10: f32, %arg11: f32):
      %7 = "arith.addf"(%arg10, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) : (tensor<32x16xf32, #sparse>, tensor<32x16xf32>) -> tensor<32x16xf32>
    "func.return"(%6) : (tensor<32x16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32x16xf32>, tensor<32x16xf32, #sparse>) -> tensor<32x16xf32, #sparse>, sym_name = "dense2"}> ({
  ^bb0(%arg4: tensor<32x16xf32>, %arg5: tensor<32x16xf32, #sparse>):
    %2 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %3 = "linalg.generic"(%arg4, %arg5) <{doc = "X(i,j) = A(i,j) + 1", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32):
      %4 = "arith.addf"(%arg6, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (tensor<32x16xf32>, tensor<32x16xf32, #sparse>) -> tensor<32x16xf32, #sparse>
    "func.return"(%3) : (tensor<32x16xf32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32x16x8xf32>, tensor<32x16xf32, #sparse>) -> tensor<32x16xf32, #sparse>, sym_name = "dense3"}> ({
  ^bb0(%arg0: tensor<32x16x8xf32>, %arg1: tensor<32x16xf32, #sparse>):
    %0 = "linalg.generic"(%arg0, %arg1) <{doc = "X(i,j) += A(i,j,k)", indexing_maps = [#map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %1 = "arith.addf"(%arg3, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (tensor<32x16x8xf32>, tensor<32x16xf32, #sparse>) -> tensor<32x16xf32, #sparse>
    "func.return"(%0) : (tensor<32x16xf32, #sparse>) -> ()
  }) : () -> ()
}) : () -> ()

