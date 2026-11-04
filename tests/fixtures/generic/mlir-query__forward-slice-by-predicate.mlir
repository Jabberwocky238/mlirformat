#map = affine_map<(d0) -> (d0 + 2)>
#map1 = affine_map<(d0) -> (d0)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (16)>
#map4 = affine_map<(d0) -> (d0 - 1)>
#map5 = affine_map<() -> (4)>
#map6 = affine_map<() -> (8)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "slice_depth1_loop_nest_with_offsets"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32>
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg1: index):
      %4 = "affine.apply"(%arg1) <{map = #map}> : (index) -> index
      "affine.store"(%1, %0, %4) <{map = #map1}> : (f32, memref<100xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map5, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map6}> ({
    ^bb0(%arg0: index):
      %2 = "affine.apply"(%arg0) <{map = #map4}> : (index) -> index
      %3 = "affine.load"(%0, %2) <{map = #map1}> : (memref<100xf32>, index) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

