module {
  func.func private @optimize_alloc_location(%arg0: memref<45x24x256xf32, 1>, %arg1: memref<24x256xf32, 1>, %arg2: memref<256xf32, 1>) {
    %c1 = arith.constant 1 : index
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<45x6144xf32, 1>
    %expand_shape = memref.expand_shape %alloc [[0], [1, 2]] output_shape [45, 24, 256] : memref<45x6144xf32, 1> into memref<45x24x256xf32, 1>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<24x256xf32, 1>
    %cst = arith.constant 1.000000e+00 : f32
    memref.store %cst, %alloc_0[%c1, %c1] : memref<24x256xf32, 1>
    memref.dealloc %alloc : memref<45x6144xf32, 1>
    memref.dealloc %alloc_0 : memref<24x256xf32, 1>
    return
  }
}

// -----
module {
  func.func private @test_multiple_deallocation_moves(%arg0: memref<45x24x256xf32, 1>, %arg1: memref<24x256xf32, 1>, %arg2: memref<256xf32, 1>) {
    %c1 = arith.constant 1 : index
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<45x6144xf32, 1>
    %expand_shape = memref.expand_shape %alloc [[0], [1, 2]] output_shape [45, 24, 256] : memref<45x6144xf32, 1> into memref<45x24x256xf32, 1>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<24x256xf32, 1>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<45x6144xf32, 1>
    %expand_shape_2 = memref.expand_shape %alloc_1 [[0], [1, 2]] output_shape [45, 24, 256] : memref<45x6144xf32, 1> into memref<45x24x256xf32, 1>
    %alloc_3 = memref.alloc() {alignment = 64 : i64} : memref<45x6144xf32, 1>
    %expand_shape_4 = memref.expand_shape %alloc_3 [[0], [1, 2]] output_shape [45, 24, 256] : memref<45x6144xf32, 1> into memref<45x24x256xf32, 1>
    %alloc_5 = memref.alloc() {alignment = 64 : i64} : memref<45x6144xf32, 1>
    %expand_shape_6 = memref.expand_shape %alloc_5 [[0], [1, 2]] output_shape [45, 24, 256] : memref<45x6144xf32, 1> into memref<45x24x256xf32, 1>
    %cst = arith.constant 1.000000e+00 : f32
    memref.store %cst, %alloc_0[%c1, %c1] : memref<24x256xf32, 1>
    memref.dealloc %alloc : memref<45x6144xf32, 1>
    memref.dealloc %alloc_0 : memref<24x256xf32, 1>
    memref.dealloc %alloc_1 : memref<45x6144xf32, 1>
    memref.dealloc %alloc_3 : memref<45x6144xf32, 1>
    memref.dealloc %alloc_5 : memref<45x6144xf32, 1>
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2, d3, d4)>
module {
  func.func private @test_users_in_different_blocks_linalig_generic(%arg0: memref<1x20x20xf32, 1>) -> memref<1x32x32xf32, 1> {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<1x32x32xf32, 1>
    %subview = memref.subview %alloc[0, 0, 0] [1, 20, 20] [1, 1, 1] : memref<1x32x32xf32, 1> to memref<1x20x20xf32, strided<[1024, 32, 1]>, 1>
    memref.copy %arg0, %subview : memref<1x20x20xf32, 1> to memref<1x20x20xf32, strided<[1024, 32, 1]>, 1>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<1x32x32x1xf32, 1>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<1x8x32x1x4xf32, 1>
    linalg.generic {indexing_maps = [#map], iterator_types = ["parallel", "parallel", "parallel", "parallel", "parallel"]} outs(%alloc_1 : memref<1x8x32x1x4xf32, 1>) {
    ^bb0(%out: f32):
      %0 = linalg.index 0 : index
      %1 = memref.load %alloc_0[%0, %0, %0, %c0] : memref<1x32x32x1xf32, 1>
      linalg.yield %1 : f32
    }
    %collapse_shape = memref.collapse_shape %alloc_1 [[0, 1], [2], [3], [4]] : memref<1x8x32x1x4xf32, 1> into memref<8x32x1x4xf32, 1>
    memref.dealloc %alloc_0 : memref<1x32x32x1xf32, 1>
    memref.dealloc %alloc_1 : memref<1x8x32x1x4xf32, 1>
    return %alloc : memref<1x32x32xf32, 1>
  }
}

// -----
module {
  func.func private @test_deallocs_in_different_block_forops(%arg0: memref<45x24x256xf32, 1>, %arg1: memref<24x256xf32, 1>, %arg2: memref<256xf32, 1>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    %c45 = arith.constant 45 : index
    %c24 = arith.constant 24 : index
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<45x6144xf32, 1>
    %expand_shape = memref.expand_shape %alloc [[0], [1, 2]] output_shape [45, 24, 256] : memref<45x6144xf32, 1> into memref<45x24x256xf32, 1>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<24x256xf32, 1>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<45x6144xf32, 1>
    %expand_shape_2 = memref.expand_shape %alloc_1 [[0], [1, 2]] output_shape [45, 24, 256] : memref<45x6144xf32, 1> into memref<45x24x256xf32, 1>
    scf.for %arg3 = %c0 to %c45 step %c1 {
      scf.for %arg4 = %c0 to %c24 step %c8 {
        %subview = memref.subview %expand_shape[%arg3, %arg4, 0] [1, 8, 256] [1, 1, 1] : memref<45x24x256xf32, 1> to memref<1x8x256xf32, strided<[6144, 256, 1], offset: ?>, 1>
        %subview_3 = memref.subview %alloc_0[%arg4, 0] [8, 256] [1, 1] : memref<24x256xf32, 1> to memref<8x256xf32, strided<[256, 1], offset: ?>, 1>
      }
    }
    memref.dealloc %alloc : memref<45x6144xf32, 1>
    memref.dealloc %alloc_0 : memref<24x256xf32, 1>
    memref.dealloc %alloc_1 : memref<45x6144xf32, 1>
    return
  }
}

// -----
module {
  func.func private @test_conditional_deallocation() -> memref<32xf32, 1> {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<32xf32, 1>
    %true = arith.constant true
    %0 = scf.if %true -> (memref<32xf32, 1>) {
      memref.dealloc %alloc : memref<32xf32, 1>
      %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<32xf32, 1>
      scf.yield %alloc_0 : memref<32xf32, 1>
    } else {
      scf.yield %alloc : memref<32xf32, 1>
    }
    return %0 : memref<32xf32, 1>
  }
}

// -----
module {
  func.func private @test_alloc_with_multiple_results() {
    %index, %memref = test.alloc_with_multiple_results : index, memref<64xf32>
    %expand_shape = memref.expand_shape %memref [[0, 1]] output_shape [8, 8] : memref<64xf32> into memref<8x8xf32>
    %index_0, %memref_1 = test.alloc_with_multiple_results : index, memref<64xf32>
    %expand_shape_2 = memref.expand_shape %memref_1 [[0, 1]] output_shape [8, 8] : memref<64xf32> into memref<8x8xf32>
    memref.dealloc %memref : memref<64xf32>
    memref.dealloc %memref_1 : memref<64xf32>
    return
  }
}

