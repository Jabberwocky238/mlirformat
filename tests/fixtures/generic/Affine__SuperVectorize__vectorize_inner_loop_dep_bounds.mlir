#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 + 6)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (6)>
#map4 = affine_map<() -> (64)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<32xf32>) -> (), sym_name = "inner_loop_dep_bounds"}> ({
  ^bb0(%arg3: memref<32xf32>):
    %1 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 32 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg4: index):
      "affine.for"(%arg4, %arg4) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg5: index):
        "affine.store"(%1, %arg3, %arg5) <{map = #map}> : (f32, memref<32xf32>, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<64xf32>) -> (), sym_name = "inner_loop_dep_upper_bound"}> ({
  ^bb0(%arg0: memref<64xf32>):
    %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 32 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg1: index):
      "affine.for"(%arg1) <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map1}> ({
      ^bb0(%arg2: index):
        "affine.store"(%0, %arg0, %arg2) <{map = #map}> : (f32, memref<64xf32>, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

