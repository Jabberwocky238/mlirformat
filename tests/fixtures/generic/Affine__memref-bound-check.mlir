"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> ((d0 * 72 + d1) floordiv 2304 + (d1 mod 9) floordiv 3)>
#map1 = affine_map<(d0, d1) -> ((d0 * 72 + d1) mod 2304 - (((d0 * 72 + d1) mod 2304) floordiv 1152) * 1151 - (((d0 * 72 + d1) mod 1152) floordiv 9) * 9 - ((d1 mod 9) floordiv 3) * 3)>
#map2 = affine_map<(d0, d1) -> ((((d0 * 72 + d1) mod 1152) floordiv 9) floordiv 8)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d1, d2, d1)>
#map4 = affine_map<() -> (0)>
#map5 = affine_map<() -> (9)>
#map6 = affine_map<() -> (64)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x4x16x1xf32>) -> (), sym_name = "test_complex_mod_floordiv"}> ({
  ^bb0(%arg0: memref<4x4x16x1xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x2x3x3x16x1xf32>
    "affine.for"() <{lowerBoundMap = #map4, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map6}> ({
    ^bb0(%arg1: index):
      "affine.for"() <{lowerBoundMap = #map4, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
      ^bb0(%arg2: index):
        %2 = "affine.apply"(%arg1, %arg2) <{map = #map}> : (index, index) -> index
        %3 = "affine.apply"(%arg1, %arg2) <{map = #map1}> : (index, index) -> index
        %4 = "affine.apply"(%arg1, %arg2) <{map = #map2}> : (index, index) -> index
        %5 = "affine.load"(%arg0, %2, %0, %4) <{map = #map3}> : (memref<4x4x16x1xf32>, index, index, index) -> f32
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

