"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>, f32) -> index, sym_name = "linalg_fill"}> ({
  ^bb0(%arg0: tensor<?xf32>, %arg1: f32):
    %0 = "linalg.fill"(%arg1, %arg0) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      "linalg.yield"(%arg2) : (f32) -> ()
    }) : (f32, tensor<?xf32>) -> tensor<?xf32>
    %1 = "test.reify_bound"(%0) <{dim = 0 : i64, type = "EQ"}> : (tensor<?xf32>) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2, d0 + d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x5x?xf32>) -> (), sym_name = "linalg_index"}> ({
  ^bb0(%arg0: memref<?x?xf32>, %arg1: memref<?x5x?xf32>):
    "linalg.generic"(%arg0, %arg1) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %0 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %1 = "test.reify_bound"(%0) <{type = "UB"}> : (index) -> index
      "test.some_use"(%1) : (index) -> ()
      %2 = "test.reify_bound"(%0) <{type = "LB"}> : (index) -> index
      "test.some_use"(%2) : (index) -> ()
      %3 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %4 = "test.reify_bound"(%3) <{type = "UB"}> : (index) -> index
      "test.some_use"(%4) : (index) -> ()
      %5 = "linalg.index"() <{dim = 2 : i64}> : () -> index
      %6 = "test.reify_bound"(%5) <{type = "UB"}> : (index) -> index
      "test.some_use"(%6) : (index) -> ()
      "linalg.yield"(%arg3) : (f32) -> ()
    }) : (memref<?x?xf32>, memref<?x5x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

