#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d3, d4, d5)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d6, d7, d8)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d0, d1, d2)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : compressed, d2 : singleton) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : singleton, d2 : dense) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32, #sparse>, tensor<?x?x?xf32, #sparse1>, tensor<?x?x?xf32, #sparse>) -> tensor<?x?x?xf32, #sparse>, sym_name = "sparse_loop_ordering"}> ({
  ^bb0(%arg6: tensor<?x?x?xf32, #sparse>, %arg7: tensor<?x?x?xf32, #sparse1>, %arg8: tensor<?x?x?xf32, #sparse>):
    %3 = "linalg.generic"(%arg6, %arg7, %arg8) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg9: f32, %arg10: f32, %arg11: f32):
      %4 = "arith.mulf"(%arg9, %arg10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %5 = "arith.addf"(%arg11, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<?x?x?xf32, #sparse>, tensor<?x?x?xf32, #sparse1>, tensor<?x?x?xf32, #sparse>) -> tensor<?x?x?xf32, #sparse>
    "func.return"(%3) : (tensor<?x?x?xf32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?xf32, #sparse>, tensor<?x?x?xf32, #sparse1>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>, sym_name = "sparse_loop_ordering_lowered"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32, #sparse>, %arg1: tensor<?x?x?xf32, #sparse1>, %arg2: tensor<?x?x?xf32>):
    %0 = "linalg.generic"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<?x?x?xf32, #sparse>, tensor<?x?x?xf32, #sparse1>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

