#map = affine_map<()[s0] -> (s0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (10)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "slicing_memref_store_trivial"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index):
      %3 = "affine.apply"(%1) <{map = #map}> : (index) -> index
      "memref.store"(%2, %0, %3) : (f32, memref<10xf32>, index) -> ()
      %4 = "memref.load"(%0, %1) : (memref<10xf32>, index) -> f32
      %5 = "affine.apply"() <{map = #map1}> : () -> index
      "memref.store"(%2, %0, %5) : (f32, memref<10xf32>, index) -> ()
      "memref.store"(%4, %0, %1) : (f32, memref<10xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

