"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (64)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "valid_to_tile"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index):
      %1 = "affine.load"(%0, %arg0) <{map = #map}> : (memref<64xf32>, index) -> f32
      %2 = "arith.addf"(%1, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%2, %0, %arg0) <{map = #map}> : (f32, memref<64xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0, d1 - 1)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (64)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "illegal_loop_with_diag_dependence"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x64xf32>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg0: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg1: index):
        %1 = "affine.load"(%0, %arg1, %arg0) <{map = #map}> : (memref<64x64xf32>, index, index) -> f32
        %2 = "affine.load"(%0, %arg0, %arg1) <{map = #map1}> : (memref<64x64xf32>, index, index) -> f32
        %3 = "arith.addf"(%1, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%3, %0, %arg0, %arg1) <{map = #map}> : (f32, memref<64x64xf32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

