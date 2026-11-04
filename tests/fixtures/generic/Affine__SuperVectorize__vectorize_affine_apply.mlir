#map = affine_map<(d0) -> (d0 mod 12)>
#map1 = affine_map<(d0) -> (d0 mod 16)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map3 = affine_map<() -> (0)>
#map4 = affine_map<() -> (48)>
#map5 = affine_map<() -> (24)>
#map6 = affine_map<() -> (8)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8x12x16xf32>, memref<8x24x48xf32>) -> (), sym_name = "vec_affine_apply"}> ({
  ^bb0(%arg0: memref<8x12x16xf32>, %arg1: memref<8x24x48xf32>):
    "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map6}> ({
    ^bb0(%arg2: index):
      "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
      ^bb0(%arg3: index):
        "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
        ^bb0(%arg4: index):
          %0 = "affine.apply"(%arg3) <{map = #map}> : (index) -> index
          %1 = "affine.apply"(%arg4) <{map = #map1}> : (index) -> index
          %2 = "affine.load"(%arg0, %arg2, %0, %1) <{map = #map2}> : (memref<8x12x16xf32>, index, index, index) -> f32
          "affine.store"(%2, %arg1, %arg2, %arg3, %arg4) <{map = #map2}> : (f32, memref<8x24x48xf32>, index, index, index) -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0 mod 16 + 1)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (48)>
#map4 = affine_map<() -> (12)>
#map5 = affine_map<() -> (8)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8x12x16xf32>, memref<8x24x48xf32>) -> (), sym_name = "vec_affine_apply_2"}> ({
  ^bb0(%arg0: memref<8x12x16xf32>, %arg1: memref<8x24x48xf32>):
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
    ^bb0(%arg2: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
      ^bb0(%arg3: index):
        "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
        ^bb0(%arg4: index):
          %0 = "affine.apply"(%arg4) <{map = #map}> : (index) -> index
          %1 = "affine.load"(%arg0, %arg2, %arg3, %0) <{map = #map1}> : (memref<8x12x16xf32>, index, index, index) -> f32
          "affine.store"(%1, %arg1, %arg2, %arg3, %arg4) <{map = #map1}> : (f32, memref<8x24x48xf32>, index, index, index) -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0 mod 12)>
#map1 = affine_map<(d0) -> (d0 mod 16)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map3 = affine_map<() -> (0)>
#map4 = affine_map<() -> (48)>
#map5 = affine_map<() -> (24)>
#map6 = affine_map<() -> (8)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8x12x16xi32>, memref<8x24x48xi32>) -> (), sym_name = "no_vec_affine_apply"}> ({
  ^bb0(%arg0: memref<8x12x16xi32>, %arg1: memref<8x24x48xi32>):
    "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map6}> ({
    ^bb0(%arg2: index):
      "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
      ^bb0(%arg3: index):
        "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
        ^bb0(%arg4: index):
          %0 = "affine.apply"(%arg3) <{map = #map}> : (index) -> index
          %1 = "affine.apply"(%arg4) <{map = #map1}> : (index) -> index
          %2 = "affine.load"(%arg0, %arg2, %0, %1) <{map = #map2}> : (memref<8x12x16xi32>, index, index, index) -> i32
          %3 = "arith.index_cast"(%2) : (i32) -> index
          %4 = "affine.apply"(%3) <{map = #map1}> : (index) -> index
          %5 = "arith.index_cast"(%4) : (index) -> i32
          "affine.store"(%5, %arg1, %arg2, %arg3, %arg4) <{map = #map2}> : (i32, memref<8x24x48xi32>, index, index, index) -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0 mod 16)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2 + 1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map3 = affine_map<() -> (0)>
#map4 = affine_map<() -> (48)>
#map5 = affine_map<() -> (12)>
#map6 = affine_map<() -> (8)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8x12x16xf32>, memref<8x24x48xf32>) -> (), sym_name = "affine_map_with_expr"}> ({
  ^bb0(%arg0: memref<8x12x16xf32>, %arg1: memref<8x24x48xf32>):
    "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map6}> ({
    ^bb0(%arg2: index):
      "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
      ^bb0(%arg3: index):
        "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
        ^bb0(%arg4: index):
          %0 = "affine.apply"(%arg4) <{map = #map}> : (index) -> index
          %1 = "affine.load"(%arg0, %arg2, %arg3, %0) <{map = #map1}> : (memref<8x12x16xf32>, index, index, index) -> f32
          "affine.store"(%1, %arg1, %arg2, %arg3, %arg4) <{map = #map2}> : (f32, memref<8x24x48xf32>, index, index, index) -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2 + 1)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (48)>
#map4 = affine_map<() -> (12)>
#map5 = affine_map<() -> (8)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8x12x16xf32>, memref<8x24x48xf32>, index) -> (), sym_name = "affine_map_with_expr_2"}> ({
  ^bb0(%arg0: memref<8x12x16xf32>, %arg1: memref<8x24x48xf32>, %arg2: index):
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
    ^bb0(%arg3: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
      ^bb0(%arg4: index):
        "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
        ^bb0(%arg5: index):
          %0 = "affine.load"(%arg0, %arg3, %arg4, %arg2) <{map = #map}> : (memref<8x12x16xf32>, index, index, index) -> f32
          "affine.store"(%0, %arg1, %arg3, %arg4, %arg5) <{map = #map1}> : (f32, memref<8x24x48xf32>, index, index, index) -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

