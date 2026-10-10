"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (32)>
#map3 = affine_map<() -> (8)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "loop_nest_dma"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<256xf32>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32xf32, 1>
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xf32>
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 32 : index}> : () -> index
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg0: index):
      "affine.dma_start"(%0, %arg0, %1, %arg0, %2, %3, %4) {dst_map = #map, src_map = #map, tag_map = #map} : (memref<256xf32>, index, memref<32xf32, 1>, index, memref<1xf32>, index, index) -> ()
      "affine.dma_wait"(%2, %3, %4) {tag_map = #map} : (memref<1xf32>, index, index) -> ()
      %5 = "affine.load"(%1, %arg0) <{map = #map}> : (memref<32xf32, 1>, index) -> f32
      %6 = "compute"(%5) : (f32) -> f32
      "affine.store"(%6, %1, %arg0) <{map = #map}> : (f32, memref<32xf32, 1>, index) -> ()
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg1: index):
        "do_more_compute"(%arg0, %arg1) : (index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "memref.dealloc"(%2) : (memref<1xf32>) -> ()
    "memref.dealloc"(%1) : (memref<32xf32, 1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (512)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<512xf32>, memref<512xf32>) -> (), sym_name = "loop_step"}> ({
  ^bb0(%arg0: memref<512xf32>, %arg1: memref<512xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 4 : index}> : () -> index
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 4 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4xf32, 1>
      %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xi32>
      "affine.dma_start"(%arg0, %arg2, %2, %0, %3, %0, %1) {dst_map = #map, src_map = #map, tag_map = #map} : (memref<512xf32>, index, memref<4xf32, 1>, index, memref<1xi32>, index, index) -> ()
      "affine.dma_wait"(%3, %0, %1) {tag_map = #map} : (memref<1xi32>, index, index) -> ()
      "compute"(%arg2) : (index) -> ()
      "memref.dealloc"(%3) : (memref<1xi32>) -> ()
      "memref.dealloc"(%2) : (memref<4xf32, 1>) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0 * 64)>
#map1 = affine_map<(d0) -> (d0, d0)>
#map2 = affine_map<(d0, d1) -> (d0, d1)>
#map3 = affine_map<(d0) -> (d0)>
#map4 = affine_map<(d0, d1) -> (d0 * 64 + d1 * 8)>
#map5 = affine_map<() -> (0)>
#map6 = affine_map<() -> (4)>
#map7 = affine_map<() -> (8)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<512x32xvector<8xf32>>, memref<512x32xvector<8xf32>>, memref<512x32xvector<8xf32>>) -> (), sym_name = "loop_dma_nested"}> ({
  ^bb0(%arg0: memref<512x32xvector<8xf32>>, %arg1: memref<512x32xvector<8xf32>>, %arg2: memref<512x32xvector<8xf32>>):
    %0 = "arith.constant"() <{value = 256 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x4xvector<8xf32>, 2>
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x4xvector<8xf32>, 2>
    %4 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x4xvector<8xf32>, 2>
    %5 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xi32>
    %6 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xi32>
    %7 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xi32>
    "affine.for"() <{lowerBoundMap = #map5, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map7}> ({
    ^bb0(%arg3: index):
      %8 = "affine.apply"(%arg3) <{map = #map}> : (index) -> index
      "affine.dma_start"(%arg2, %8, %1, %4, %1, %7, %1, %0) {dst_map = #map1, src_map = #map2, tag_map = #map3} : (memref<512x32xvector<8xf32>>, index, index, memref<64x4xvector<8xf32>, 2>, index, memref<2xi32>, index, index) -> ()
      "affine.dma_wait"(%7, %1, %0) {tag_map = #map3} : (memref<2xi32>, index, index) -> ()
      "affine.for"() <{lowerBoundMap = #map5, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map7}> ({
      ^bb0(%arg4: index):
        %9 = "affine.apply"(%arg3, %arg4) <{map = #map4}> : (index, index) -> index
        %10 = "affine.apply"(%arg4) <{map = #map}> : (index) -> index
        "affine.dma_start"(%arg0, %9, %1, %2, %1, %5, %1, %0) {dst_map = #map1, src_map = #map2, tag_map = #map3} : (memref<512x32xvector<8xf32>>, index, index, memref<64x4xvector<8xf32>, 2>, index, memref<2xi32>, index, index) -> ()
        "affine.dma_start"(%arg1, %10, %1, %3, %1, %6, %1, %0) {dst_map = #map1, src_map = #map2, tag_map = #map3} : (memref<512x32xvector<8xf32>>, index, index, memref<64x4xvector<8xf32>, 2>, index, memref<2xi32>, index, index) -> ()
        "affine.dma_wait"(%5, %1, %0) {tag_map = #map3} : (memref<2xi32>, index, index) -> ()
        "affine.dma_wait"(%6, %1, %0) {tag_map = #map3} : (memref<2xi32>, index, index) -> ()
        "affine.for"() <{lowerBoundMap = #map5, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map6}> ({
        ^bb0(%arg5: index):
          "foo"() : () -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "memref.dealloc"(%7) : (memref<2xi32>) -> ()
    "memref.dealloc"(%6) : (memref<2xi32>) -> ()
    "memref.dealloc"(%5) : (memref<2xi32>) -> ()
    "memref.dealloc"(%4) : (memref<64x4xvector<8xf32>, 2>) -> ()
    "memref.dealloc"(%3) : (memref<64x4xvector<8xf32>, 2>) -> ()
    "memref.dealloc"(%2) : (memref<64x4xvector<8xf32>, 2>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0 * 64)>
#map1 = affine_map<(d0) -> (d0, d0)>
#map2 = affine_map<(d0, d1) -> (d0, d1)>
#map3 = affine_map<(d0) -> (d0)>
#map4 = affine_map<() -> (0)>
#map5 = affine_map<() -> (8)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<512x32xvector<8xf32>>) -> (), sym_name = "loop_dma_dependent"}> ({
  ^bb0(%arg0: memref<512x32xvector<8xf32>>):
    %0 = "arith.constant"() <{value = 256 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x4xvector<8xf32>, 2>
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x4xvector<8xf32>, 2>
    %4 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x4xvector<8xf32>, 2>
    %5 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xi32>
    %6 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xi32>
    %7 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xi32>
    "affine.for"() <{lowerBoundMap = #map4, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
    ^bb0(%arg1: index):
      %8 = "affine.apply"(%arg1) <{map = #map}> : (index) -> index
      "affine.dma_start"(%arg0, %8, %1, %4, %1, %7, %1, %0) {dst_map = #map1, src_map = #map2, tag_map = #map3} : (memref<512x32xvector<8xf32>>, index, index, memref<64x4xvector<8xf32>, 2>, index, memref<2xi32>, index, index) -> ()
      "affine.dma_wait"(%7, %1, %0) {tag_map = #map3} : (memref<2xi32>, index, index) -> ()
      "affine.dma_start"(%4, %1, %arg0, %8, %1, %7, %1, %0) {dst_map = #map2, src_map = #map1, tag_map = #map3} : (memref<64x4xvector<8xf32>, 2>, index, memref<512x32xvector<8xf32>>, index, index, memref<2xi32>, index, index) -> ()
      "affine.dma_wait"(%7, %1, %0) {tag_map = #map3} : (memref<2xi32>, index, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "memref.dealloc"(%7) : (memref<2xi32>) -> ()
    "memref.dealloc"(%6) : (memref<2xi32>) -> ()
    "memref.dealloc"(%5) : (memref<2xi32>) -> ()
    "memref.dealloc"(%4) : (memref<64x4xvector<8xf32>, 2>) -> ()
    "memref.dealloc"(%3) : (memref<64x4xvector<8xf32>, 2>) -> ()
    "memref.dealloc"(%2) : (memref<64x4xvector<8xf32>, 2>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0, d0)>
#map1 = affine_map<(d0) -> (d0)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (16)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<512x32xf32>) -> (), sym_name = "escaping_use"}> ({
  ^bb0(%arg0: memref<512x32xf32>):
    %0 = "arith.constant"() <{value = 32 : index}> : () -> index
    %1 = "arith.constant"() <{value = 512 : index}> : () -> index
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32x32xf32, 2>
    %4 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xi32>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg1: index):
      "affine.dma_start"(%arg0, %2, %3, %2, %4, %2, %1) {dst_map = #map, src_map = #map, tag_map = #map1} : (memref<512x32xf32>, index, memref<32x32xf32, 2>, index, memref<1xi32>, index, index) -> ()
      "affine.dma_wait"(%4, %2, %1) {tag_map = #map1} : (memref<1xi32>, index, index) -> ()
      "foo"(%3) : (memref<32x32xf32, 2>) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "memref.dealloc"(%4) : (memref<1xi32>) -> ()
    "memref.dealloc"(%3) : (memref<32x32xf32, 2>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0, d0)>
#map1 = affine_map<(d0) -> (d0)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (16)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<512x32xf32>) -> (), sym_name = "escaping_tag"}> ({
  ^bb0(%arg0: memref<512x32xf32>):
    %0 = "arith.constant"() <{value = 32 : index}> : () -> index
    %1 = "arith.constant"() <{value = 512 : index}> : () -> index
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32x32xf32, 2>
    %4 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xi32>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg1: index):
      "affine.dma_start"(%arg0, %2, %3, %2, %4, %2, %1) {dst_map = #map, src_map = #map, tag_map = #map1} : (memref<512x32xf32>, index, memref<32x32xf32, 2>, index, memref<1xi32>, index, index) -> ()
      "affine.dma_wait"(%4, %2, %1) {tag_map = #map1} : (memref<1xi32>, index, index) -> ()
      "foo"(%4) : (memref<1xi32>) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "memref.dealloc"(%4) : (memref<1xi32>) -> ()
    "memref.dealloc"(%3) : (memref<32x32xf32, 2>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0, d0)>
#map1 = affine_map<(d0) -> (d0)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (16)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<512x32xf32>) -> f32, sym_name = "live_out_use"}> ({
  ^bb0(%arg0: memref<512x32xf32>):
    %0 = "arith.constant"() <{value = 32 : index}> : () -> index
    %1 = "arith.constant"() <{value = 512 : index}> : () -> index
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32x32xf32, 2>
    %4 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xi32>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg1: index):
      "affine.dma_start"(%arg0, %2, %3, %2, %4, %2, %1) {dst_map = #map, src_map = #map, tag_map = #map1} : (memref<512x32xf32>, index, memref<32x32xf32, 2>, index, memref<1xi32>, index, index) -> ()
      "affine.dma_wait"(%4, %2, %1) {tag_map = #map1} : (memref<1xi32>, index, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    %5 = "affine.load"(%3, %2) <{map = #map}> : (memref<32x32xf32, 2>, index) -> f32
    "memref.dealloc"(%4) : (memref<1xi32>) -> ()
    "memref.dealloc"(%3) : (memref<32x32xf32, 2>) -> ()
    "func.return"(%5) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0, d0)>
#map1 = affine_map<(d0) -> (d0)>
#map2 = affine_map<() -> (0)>
#map3 = affine_map<() -> (16)>
#map4 = affine_map<() -> (8)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<512x32xf32>, memref<?x?xf32, 2>) -> (), sym_name = "dynamic_shape_dma_buffer"}> ({
  ^bb0(%arg1: memref<512x32xf32>, %arg2: memref<?x?xf32, 2>):
    %6 = "arith.constant"() <{value = 512 : index}> : () -> index
    %7 = "arith.constant"() <{value = 0 : index}> : () -> index
    %8 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xi32>
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg3: index):
      "affine.dma_start"(%arg1, %7, %arg2, %7, %8, %7, %6) {dst_map = #map, src_map = #map, tag_map = #map1} : (memref<512x32xf32>, index, memref<?x?xf32, 2>, index, memref<1xi32>, index, index) -> ()
      "affine.dma_wait"(%8, %7, %6) {tag_map = #map1} : (memref<1xi32>, index, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "escaping_and_indexed_use_mix"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<256xf32>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32xf32, 1>
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xf32>
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 32 : index}> : () -> index
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg0: index):
      "affine.dma_start"(%0, %arg0, %1, %arg0, %2, %3, %4) {dst_map = #map1, src_map = #map1, tag_map = #map1} : (memref<256xf32>, index, memref<32xf32, 1>, index, memref<1xf32>, index, index) -> ()
      "affine.dma_wait"(%2, %3, %4) {tag_map = #map1} : (memref<1xf32>, index, index) -> ()
      "compute"(%1) : (memref<32xf32, 1>) -> ()
      %5 = "affine.load"(%1, %arg0) <{map = #map1}> : (memref<32xf32, 1>, index) -> f32
      "foo"(%5) : (f32) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "memref.dealloc"(%0) : (memref<256xf32>) -> ()
    "memref.dealloc"(%1) : (memref<32xf32, 1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

