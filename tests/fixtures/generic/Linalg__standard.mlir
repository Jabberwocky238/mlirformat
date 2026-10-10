#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32, strided<[1], offset: ?>>, memref<?xf32, strided<[1], offset: ?>>, memref<f32>) -> (), sym_name = "dot"}> ({
  ^bb0(%arg0: memref<?xf32, strided<[1], offset: ?>>, %arg1: memref<?xf32, strided<[1], offset: ?>>, %arg2: memref<f32>):
    "linalg.dot"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map, #map1]} : (memref<?xf32, strided<[1], offset: ?>>, memref<?xf32, strided<[1], offset: ?>>, memref<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xvector<4xf32>>, memref<?x?xvector<4xf32>>, memref<?x?xvector<4x4xf32>>) -> (), sym_name = "matmul_vec_impl"}> ({
  ^bb0(%arg0: memref<?x?xvector<4xf32>>, %arg1: memref<?x?xvector<4xf32>>, %arg2: memref<?x?xvector<4x4xf32>>):
    "linalg.generic"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], library_call = "external_outerproduct_matmul", operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: vector<4xf32>, %arg4: vector<4xf32>, %arg5: vector<4x4xf32>):
      %0 = "vector.outerproduct"(%arg3, %arg4, %arg5) <{kind = #vector.kind<add>}> : (vector<4xf32>, vector<4xf32>, vector<4x4xf32>) -> vector<4x4xf32>
      "linalg.yield"(%0) : (vector<4x4xf32>) -> ()
    }) : (memref<?x?xvector<4xf32>>, memref<?x?xvector<4xf32>>, memref<?x?xvector<4x4xf32>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?xf32>) -> (), sym_name = "func"}> ({
  ^bb0(%arg0: tensor<?x?xf32>, %arg1: tensor<?xf32>):
    %0 = "linalg.generic"(%arg0, %arg1) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      "linalg.yield"(%arg2) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?xf32>) -> tensor<?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8xf32>, tensor<4x8xf32>) -> tensor<4x8xf32>, sym_name = "func"}> ({
  ^bb0(%arg0: tensor<4x8xf32>, %arg1: tensor<4x8xf32>):
    %0 = "linalg.copy"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      "linalg.yield"(%arg2) : (f32) -> ()
    }) : (tensor<4x8xf32>, tensor<4x8xf32>) -> tensor<4x8xf32>
    "func.return"(%0) : (tensor<4x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

