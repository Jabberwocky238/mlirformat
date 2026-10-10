#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<12x32xf32>, index, index, index, index) -> f32, sym_name = "fold_static_stride_subview_with_affine_load_store"}> ({
  ^bb0(%arg0: memref<12x32xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index):
    %0 = "memref.subview"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 4, 4>, static_strides = array<i64: 2, 3>}> : (memref<12x32xf32>, index, index) -> memref<4x4xf32, strided<[64, 3], offset: ?>>
    %1 = "affine.load"(%0, %arg3, %arg4) <{map = #map}> : (memref<4x4xf32, strided<[64, 3], offset: ?>>, index, index) -> f32
    "affine.store"(%1, %0, %arg3, %arg4) <{map = #map}> : (f32, memref<4x4xf32, strided<[64, 3], offset: ?>>, index, index) -> ()
    "func.return"(%1) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<12x32xf32>, index, index, index) -> f32, sym_name = "fold_static_stride_subview_with_affine_load_store_expand_shape"}> ({
  ^bb0(%arg0: memref<12x32xf32>, %arg1: index, %arg2: index, %arg3: index):
    %0 = "memref.expand_shape"(%arg0) <{reassociation = [[0, 1], [2]], static_output_shape = array<i64: 2, 6, 32>}> : (memref<12x32xf32>) -> memref<2x6x32xf32>
    %1 = "affine.load"(%0, %arg1, %arg2, %arg3) <{map = #map}> : (memref<2x6x32xf32>, index, index, index) -> f32
    "func.return"(%1) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2x6x32xf32>, index, index) -> f32, sym_name = "fold_static_stride_subview_with_affine_load_store_collapse_shape"}> ({
  ^bb0(%arg0: memref<2x6x32xf32>, %arg1: index, %arg2: index):
    %0 = "memref.collapse_shape"(%arg0) <{reassociation = [[0, 1], [2]]}> : (memref<2x6x32xf32>) -> memref<12x32xf32>
    %1 = "affine.load"(%0, %arg1, %arg2) <{map = #map}> : (memref<12x32xf32>, index, index) -> f32
    "func.return"(%1) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x6x32xf32>, index, index) -> f32, sym_name = "fold_dynamic_size_collapse_shape_with_affine_load"}> ({
  ^bb0(%arg0: memref<?x6x32xf32>, %arg1: index, %arg2: index):
    %0 = "memref.collapse_shape"(%arg0) <{reassociation = [[0, 1], [2]]}> : (memref<?x6x32xf32>) -> memref<?x32xf32>
    %1 = "affine.load"(%0, %arg1, %arg2) <{map = #map}> : (memref<?x32xf32>, index, index) -> f32
    "func.return"(%1) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32>, index, index) -> f32, sym_name = "fold_fully_dynamic_size_collapse_shape_with_affine_load"}> ({
  ^bb0(%arg0: memref<?x?x?xf32>, %arg1: index, %arg2: index):
    %0 = "memref.collapse_shape"(%arg0) <{reassociation = [[0, 1], [2]]}> : (memref<?x?x?xf32>) -> memref<?x?xf32>
    %1 = "affine.load"(%0, %arg1, %arg2) <{map = #map}> : (memref<?x?xf32>, index, index) -> f32
    "func.return"(%1) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<12x32xf32>, index, index, index, index) -> f32, sym_name = "fold_static_stride_subview_with_affine_load_store_expand_shape_3d"}> ({
  ^bb0(%arg0: memref<12x32xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index):
    %0 = "memref.expand_shape"(%arg0) <{reassociation = [[0, 1, 2], [3]], static_output_shape = array<i64: 2, 2, 3, 32>}> : (memref<12x32xf32>) -> memref<2x2x3x32xf32>
    %1 = "affine.load"(%0, %arg1, %arg2, %arg3, %arg4) <{map = #map}> : (memref<2x2x3x32xf32>, index, index, index, index) -> f32
    "func.return"(%1) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, 0, d1, d1)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (16)>
#map4 = affine_map<()[s0] -> (s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2048x16xf32>, index, index, index, index) -> (), sym_name = "fold_memref_alias_expand_shape_subview_load_store_dynamic_dim"}> ({
  ^bb0(%arg0: memref<2048x16xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index):
    %0 = "memref.subview"(%arg0, %arg2, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: -9223372036854775808, 16>, static_strides = array<i64: 1, 1>}> : (memref<2048x16xf32>, index, index) -> memref<?x16xf32, strided<[16, 1], offset: ?>>
    %1 = "memref.expand_shape"(%0, %arg4) <{reassociation = [[0], [1, 2, 3]], static_output_shape = array<i64: -9223372036854775808, 1, 8, 2>}> : (memref<?x16xf32, strided<[16, 1], offset: ?>>, index) -> memref<?x1x8x2xf32, strided<[16, 16, 2, 1], offset: ?>>
    %2 = "memref.dim"(%1, %arg3) : (memref<?x1x8x2xf32, strided<[16, 16, 2, 1], offset: ?>>, index) -> index
    "affine.for"(%2) <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 1, 0>, step = 64 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg5: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 16 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg6: index):
        %3 = "affine.load"(%1, %arg5, %arg6) <{map = #map}> : (memref<?x1x8x2xf32, strided<[16, 16, 2, 1], offset: ?>>, index, index) -> f32
        "affine.store"(%3, %0, %arg5, %arg6) <{map = #map1}> : (f32, memref<?x16xf32, strided<[16, 1], offset: ?>>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<(d0) -> (d0)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (1)>
#map4 = affine_map<() -> (1020)>
#map5 = affine_map<() -> (1024)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1024x1024xf32>, memref<1xf32>, index) -> f32, sym_name = "fold_static_stride_subview_with_affine_load_store_expand_shape_loops"}> ({
  ^bb0(%arg0: memref<1024x1024xf32>, %arg1: memref<1xf32>, %arg2: index):
    %0 = "memref.expand_shape"(%arg0) <{reassociation = [[0, 1], [2, 3]], static_output_shape = array<i64: 1, 1024, 1024, 1>}> : (memref<1024x1024xf32>) -> memref<1x1024x1024x1xf32>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg3: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
      ^bb0(%arg4: index):
        "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
        ^bb0(%arg5: index):
          "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
          ^bb0(%arg6: index):
            %2 = "affine.load"(%0, %arg3, %arg4, %arg5, %arg6) <{map = #map}> : (memref<1x1024x1024x1xf32>, index, index, index, index) -> f32
            "affine.store"(%2, %arg1, %arg2) <{map = #map1}> : (f32, memref<1xf32>, index) -> ()
            "affine.yield"() : () -> ()
          }) : () -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    %1 = "affine.load"(%arg1, %arg2) <{map = #map1}> : (memref<1xf32>, index) -> f32
    "func.return"(%1) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d0 + d1, d2, d3)>
#map1 = affine_map<(d0) -> (d0)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (1)>
#map4 = affine_map<() -> (1020)>
#map5 = affine_map<() -> (1024)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1024x1024xf32>, memref<1xf32>, index) -> f32, sym_name = "fold_static_stride_subview_with_affine_load_store_expand_shape_when_access_index_is_an_expression"}> ({
  ^bb0(%arg0: memref<1024x1024xf32>, %arg1: memref<1xf32>, %arg2: index):
    %0 = "memref.expand_shape"(%arg0) <{reassociation = [[0, 1], [2, 3]], static_output_shape = array<i64: 1, 1024, 1024, 1>}> : (memref<1024x1024xf32>) -> memref<1x1024x1024x1xf32>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg3: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
      ^bb0(%arg4: index):
        "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
        ^bb0(%arg5: index):
          "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
          ^bb0(%arg6: index):
            %2 = "affine.load"(%0, %arg3, %arg4, %arg5, %arg6) <{map = #map}> : (memref<1x1024x1024x1xf32>, index, index, index, index) -> f32
            "affine.store"(%2, %arg1, %arg2) <{map = #map1}> : (f32, memref<1xf32>, index) -> ()
            "affine.yield"() : () -> ()
          }) : () -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    %1 = "affine.load"(%arg1, %arg2) <{map = #map1}> : (memref<1xf32>, index) -> f32
    "func.return"(%1) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> ()>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1xf32>, memref<1xf32>) -> memref<1xf32>, sym_name = "fold_static_stride_subview_with_affine_load_store_collapse_shape_with_0d_result"}> ({
  ^bb0(%arg0: memref<1xf32>, %arg1: memref<1xf32>):
    %0 = "memref.collapse_shape"(%arg0) <{reassociation = []}> : (memref<1xf32>) -> memref<f32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      %1 = "affine.load"(%0) <{map = #map}> : (memref<f32>) -> f32
      "affine.store"(%1, %arg1) <{map = #map1}> : (f32, memref<1xf32>) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"(%arg1) : (memref<1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

