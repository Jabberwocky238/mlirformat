#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
#map2 = affine_map<(d0, d1) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (f32, tensor<?x?xf32, #sparse>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "scale_dd"}> ({
  ^bb0(%arg11: f32, %arg12: tensor<?x?xf32, #sparse>, %arg13: tensor<?x?xf32>):
    %5 = "linalg.generic"(%arg12, %arg13) <{doc = "X(i,j) = A(i,j) * SCALE", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg14: f32, %arg15: f32):
      %6 = "arith.mulf"(%arg14, %arg11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%6) : (f32) -> ()
    }) : (tensor<?x?xf32, #sparse>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%5) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, tensor<?x?xf32, #sparse1>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "scale_ss"}> ({
  ^bb0(%arg6: f32, %arg7: tensor<?x?xf32, #sparse1>, %arg8: tensor<?x?xf32>):
    %3 = "linalg.generic"(%arg7, %arg8) <{doc = "X(i,j) = A(i,j) * SCALE", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg9: f32, %arg10: f32):
      %4 = "arith.mulf"(%arg9, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (tensor<?x?xf32, #sparse1>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%3) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<16x32xf32, #sparse2>, tensor<32xf32>, tensor<16xf32>) -> tensor<16xf32>, sym_name = "matvec"}> ({
  ^bb0(%arg0: tensor<16x32xf32, #sparse2>, %arg1: tensor<32xf32>, %arg2: tensor<16xf32>):
    %0 = "linalg.generic"(%arg0, %arg1, %arg2) <{doc = "x(i) += A(i,j) * b(j)", indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%1, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<16x32xf32, #sparse2>, tensor<32xf32>, tensor<16xf32>) -> tensor<16xf32>
    "func.return"(%0) : (tensor<16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

