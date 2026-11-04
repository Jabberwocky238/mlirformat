#map = affine_map<() -> (0)>
#map1 = affine_map<() -> (512)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<256x512xf32>, memref<256xf32>) -> (), sym_name = "unparallel_loop_reduction_unsupported"}> ({
  ^bb0(%arg0: memref<256x512xf32>, %arg1: memref<256xf32>):
    %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %1 = "affine.for"(%0) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg2: index, %arg3: f32):
      %2 = "arith.addf"(%arg3, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.yield"(%2) : (f32) -> ()
    }) : (f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0)[s0] -> (d0 floordiv s0)>
#map1 = affine_map<(d0)[s0] -> (d0 mod s0)>
#map2 = affine_map<(d0, d1) -> (d0, d1)>
#map3 = affine_map<() -> (0)>
#map4 = affine_map<() -> (4)>
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> memref<2x2xf32>, sym_name = "iv_mapped_to_multiple_indices_unsupported"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x2xf32>
    "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg1: index):
      %3 = "affine.apply"(%arg1, %0) <{map = #map}> : (index, index) -> index
      %4 = "affine.apply"(%arg1, %0) <{map = #map1}> : (index, index) -> index
      "affine.store"(%1, %2, %3, %4) <{map = #map2}> : (f32, memref<2x2xf32>, index, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"(%2) : (memref<2x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

