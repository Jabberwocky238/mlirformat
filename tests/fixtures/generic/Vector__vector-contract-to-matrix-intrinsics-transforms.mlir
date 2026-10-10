#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x4xf32>, vector<4x3xf32>, vector<2x3xf32>) -> vector<2x3xf32>, sym_name = "matmul"}> ({
  ^bb0(%arg3: vector<2x4xf32>, %arg4: vector<4x3xf32>, %arg5: vector<2x3xf32>):
    %1 = "vector.contract"(%arg3, %arg4, %arg5) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x4xf32>, vector<4x3xf32>, vector<2x3xf32>) -> vector<2x3xf32>
    "func.return"(%1) : (vector<2x3xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x4xf32>, vector<4x[3]xf32>, vector<2x[3]xf32>) -> vector<2x[3]xf32>, sym_name = "matmul_scalable"}> ({
  ^bb0(%arg0: vector<2x4xf32>, %arg1: vector<4x[3]xf32>, %arg2: vector<2x[3]xf32>):
    %0 = "vector.contract"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x4xf32>, vector<4x[3]xf32>, vector<2x[3]xf32>) -> vector<2x[3]xf32>
    "func.return"(%0) : (vector<2x[3]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

