#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (10)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xf32>, memref<10xf32>) -> (), sym_name = "producer_consumer_fusion"}> ({
  ^bb0(%arg0: memref<10xf32>, %arg1: memref<10xf32>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg4: index):
      "affine.store"(%2, %0, %arg4) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.store"(%2, %1, %arg4) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg3: index):
      %5 = "affine.load"(%0, %arg3) <{map = #map}> : (memref<10xf32>, index) -> f32
      %6 = "arith.addf"(%5, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%6, %arg0, %arg3) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      %3 = "affine.load"(%1, %arg2) <{map = #map}> : (memref<10xf32>, index) -> f32
      %4 = "arith.mulf"(%3, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%4, %arg1, %arg2) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

