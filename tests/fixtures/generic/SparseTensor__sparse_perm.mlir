#map = affine_map<(d0, d1, d2) -> (d2, d0, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : dense, d0 : dense, d1 : dense) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<10x20x30xf32, #sparse>, tensor<20x30x10xf32>) -> tensor<20x30x10xf32>, sym_name = "sparse_static_dims"}> ({
  ^bb0(%arg4: tensor<10x20x30xf32, #sparse>, %arg5: tensor<20x30x10xf32>):
    %1 = "linalg.generic"(%arg4, %arg5) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32):
      "linalg.yield"(%arg6) : (f32) -> ()
    }) : (tensor<10x20x30xf32, #sparse>, tensor<20x30x10xf32>) -> tensor<20x30x10xf32>
    "func.return"(%1) : (tensor<20x30x10xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?xf32, #sparse>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>, sym_name = "sparse_dynamic_dims"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32, #sparse>, %arg1: tensor<?x?x?xf32>):
    %0 = "linalg.generic"(%arg0, %arg1) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      "linalg.yield"(%arg2) : (f32) -> ()
    }) : (tensor<?x?x?xf32, #sparse>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

