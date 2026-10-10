#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (8)>
#map3 = affine_map<(d0) -> (d0 + 8)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8xf32>) -> (), sym_name = "disjoint_stores"}> ({
  ^bb0(%arg0: memref<8xf32>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      %3 = "affine.load"(%arg0, %arg2) <{map = #map}> : (memref<8xf32>, index) -> f32
      "affine.store"(%3, %0, %arg2) <{map = #map}> : (f32, memref<16xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg1: index):
      %1 = "affine.load"(%arg0, %arg1) <{map = #map}> : (memref<8xf32>, index) -> f32
      %2 = "arith.negf"(%1) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "affine.store"(%2, %0, %arg1) <{map = #map3}> : (f32, memref<16xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

