"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0) -> (d0)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (10)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "test0"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100x100xf32>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100x100xf32, 2>
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xi32>
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 64 : index}> : () -> index
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg2: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg3: index):
        "affine.dma_start"(%0, %arg2, %arg3, %1, %arg2, %arg3, %2, %3, %4) {dst_map = #map, src_map = #map, tag_map = #map1} : (memref<100x100xf32>, index, index, memref<100x100xf32, 2>, index, index, memref<1xi32>, index, index) -> ()
        "affine.dma_wait"(%2, %3, %4) {tag_map = #map1} : (memref<1xi32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0) -> (d0)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (10)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "test1"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100x100xf32>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100x100xf32, 2>
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xi32>
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 64 : index}> : () -> index
    %5 = "arith.constant"() <{value = 128 : index}> : () -> index
    %6 = "arith.constant"() <{value = 256 : index}> : () -> index
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg2: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg3: index):
        "affine.dma_start"(%0, %arg2, %arg3, %1, %arg2, %arg3, %2, %3, %4, %5, %6) {dst_map = #map, src_map = #map, tag_map = #map1} : (memref<100x100xf32>, index, index, memref<100x100xf32, 2>, index, index, memref<1xi32>, index, index, index, index) -> ()
        "affine.dma_wait"(%2, %3, %4) {tag_map = #map1} : (memref<1xi32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1 + d2 + 5)>
#map1 = affine_map<(d0, d1, d2) -> (d0 + d1, d2)>
#map2 = affine_map<(d0) -> (d0)>
#map3 = affine_map<() -> (0)>
#map4 = affine_map<() -> (10)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "test2"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100x100xf32>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100x100xf32, 2>
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xi32>
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 64 : index}> : () -> index
    "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg2: index):
      "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
      ^bb0(%arg3: index):
        "affine.dma_start"(%0, %arg2, %arg0, %arg3, %1, %arg2, %arg3, %arg1, %2, %3, %4) {dst_map = #map, src_map = #map1, tag_map = #map2} : (memref<100x100xf32>, index, index, index, memref<100x100xf32, 2>, index, index, index, memref<1xi32>, index, index) -> ()
        "affine.dma_wait"(%2, %3, %4) {tag_map = #map2} : (memref<1xi32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1)[s0] -> (d0, d1 + s0 + 7)>
#map1 = affine_map<(d0, d1)[s0] -> (d0 + s0, d1)>
#map2 = affine_map<(d0, d1) -> (d0 + d1 + 11)>
#map3 = affine_map<(d0) -> (d0)>
#map4 = affine_map<() -> (0)>
#map5 = affine_map<() -> (10)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "test3"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100x100xf32>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100x100xf32, 2>
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xi32>
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 64 : index}> : () -> index
    "affine.for"() <{lowerBoundMap = #map4, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
    ^bb0(%arg2: index):
      "affine.for"() <{lowerBoundMap = #map4, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
      ^bb0(%arg3: index):
        "affine.dma_start"(%0, %arg2, %arg3, %arg0, %1, %arg2, %arg3, %arg1, %2, %arg2, %arg3, %4) {dst_map = #map, src_map = #map1, tag_map = #map2} : (memref<100x100xf32>, index, index, index, memref<100x100xf32, 2>, index, index, index, memref<1xi32>, index, index, index) -> ()
        "affine.dma_wait"(%2, %3, %4) {tag_map = #map3} : (memref<1xi32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1)[s0] -> (d0, (d1 + s0) mod 9 + 7)>
#map1 = affine_map<(d0, d1)[s0] -> ((d0 + s0) floordiv 3, d1)>
#map2 = affine_map<(d0, d1) -> (d0 + d1 + 11)>
#map3 = affine_map<() -> (0)>
#map4 = affine_map<() -> (10)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "test4"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100x100xf32>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100x100xf32, 2>
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xi32>
    %3 = "arith.constant"() <{value = 64 : index}> : () -> index
    "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg2: index):
      "affine.for"() <{lowerBoundMap = #map3, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
      ^bb0(%arg3: index):
        "affine.dma_start"(%0, %arg2, %arg3, %arg0, %1, %arg2, %arg3, %arg1, %2, %arg2, %arg3, %3) {dst_map = #map, src_map = #map1, tag_map = #map2} : (memref<100x100xf32>, index, index, index, memref<100x100xf32, 2>, index, index, index, memref<1xi32>, index, index, index) -> ()
        "affine.dma_wait"(%2, %arg2, %arg3, %3) {tag_map = #map2} : (memref<1xi32>, index, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

