module {
}

// -----
module {
  func.func @loop_nest_dma() {
    %alloc = memref.alloc() : memref<256xf32>
    %alloc_0 = memref.alloc() : memref<32xf32, 1>
    %alloc_1 = memref.alloc() : memref<1xf32>
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    affine.for %arg0 = 0 to 8 {
      affine.dma_start %alloc[%arg0], %alloc_0[%arg0], %alloc_1[%c0], %c32 : memref<256xf32>, memref<32xf32, 1>, memref<1xf32>
      affine.dma_wait %alloc_1[%c0], %c32 : memref<1xf32>
      %0 = affine.load %alloc_0[%arg0] : memref<32xf32, 1>
      %1 = "compute"(%0) : (f32) -> f32
      affine.store %1, %alloc_0[%arg0] : memref<32xf32, 1>
      affine.for %arg1 = 0 to 32 {
        "do_more_compute"(%arg0, %arg1) : (index, index) -> ()
      }
    }
    memref.dealloc %alloc_1 : memref<1xf32>
    memref.dealloc %alloc_0 : memref<32xf32, 1>
    return
  }
}

// -----
module {
  func.func @loop_step(%arg0: memref<512xf32>, %arg1: memref<512xf32>) {
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    affine.for %arg2 = 0 to 512 step 4 {
      %alloc = memref.alloc() : memref<4xf32, 1>
      %alloc_0 = memref.alloc() : memref<1xi32>
      affine.dma_start %arg0[%arg2], %alloc[%c0], %alloc_0[%c0], %c4 : memref<512xf32>, memref<4xf32, 1>, memref<1xi32>
      affine.dma_wait %alloc_0[%c0], %c4 : memref<1xi32>
      "compute"(%arg2) : (index) -> ()
      memref.dealloc %alloc_0 : memref<1xi32>
      memref.dealloc %alloc : memref<4xf32, 1>
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0 * 64)>
#map1 = affine_map<(d0, d1) -> (d0 * 64 + d1 * 8)>
module {
  func.func @loop_dma_nested(%arg0: memref<512x32xvector<8xf32>>, %arg1: memref<512x32xvector<8xf32>>, %arg2: memref<512x32xvector<8xf32>>) {
    %c256 = arith.constant 256 : index
    %c0 = arith.constant 0 : index
    %alloc = memref.alloc() : memref<64x4xvector<8xf32>, 2>
    %alloc_0 = memref.alloc() : memref<64x4xvector<8xf32>, 2>
    %alloc_1 = memref.alloc() : memref<64x4xvector<8xf32>, 2>
    %alloc_2 = memref.alloc() : memref<2xi32>
    %alloc_3 = memref.alloc() : memref<2xi32>
    %alloc_4 = memref.alloc() : memref<2xi32>
    affine.for %arg3 = 0 to 8 {
      %0 = affine.apply #map(%arg3)
      affine.dma_start %arg2[%0, %c0], %alloc_1[%c0, %c0], %alloc_4[%c0], %c256 : memref<512x32xvector<8xf32>>, memref<64x4xvector<8xf32>, 2>, memref<2xi32>
      affine.dma_wait %alloc_4[%c0], %c256 : memref<2xi32>
      affine.for %arg4 = 0 to 8 {
        %1 = affine.apply #map1(%arg3, %arg4)
        %2 = affine.apply #map(%arg4)
        affine.dma_start %arg0[%1, %c0], %alloc[%c0, %c0], %alloc_2[%c0], %c256 : memref<512x32xvector<8xf32>>, memref<64x4xvector<8xf32>, 2>, memref<2xi32>
        affine.dma_start %arg1[%2, %c0], %alloc_0[%c0, %c0], %alloc_3[%c0], %c256 : memref<512x32xvector<8xf32>>, memref<64x4xvector<8xf32>, 2>, memref<2xi32>
        affine.dma_wait %alloc_2[%c0], %c256 : memref<2xi32>
        affine.dma_wait %alloc_3[%c0], %c256 : memref<2xi32>
        affine.for %arg5 = 0 to 4 {
          "foo"() : () -> ()
        }
      }
    }
    memref.dealloc %alloc_4 : memref<2xi32>
    memref.dealloc %alloc_3 : memref<2xi32>
    memref.dealloc %alloc_2 : memref<2xi32>
    memref.dealloc %alloc_1 : memref<64x4xvector<8xf32>, 2>
    memref.dealloc %alloc_0 : memref<64x4xvector<8xf32>, 2>
    memref.dealloc %alloc : memref<64x4xvector<8xf32>, 2>
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0 * 64)>
module {
  func.func @loop_dma_dependent(%arg0: memref<512x32xvector<8xf32>>) {
    %c256 = arith.constant 256 : index
    %c0 = arith.constant 0 : index
    %alloc = memref.alloc() : memref<64x4xvector<8xf32>, 2>
    %alloc_0 = memref.alloc() : memref<64x4xvector<8xf32>, 2>
    %alloc_1 = memref.alloc() : memref<64x4xvector<8xf32>, 2>
    %alloc_2 = memref.alloc() : memref<2xi32>
    %alloc_3 = memref.alloc() : memref<2xi32>
    %alloc_4 = memref.alloc() : memref<2xi32>
    affine.for %arg1 = 0 to 8 {
      %0 = affine.apply #map(%arg1)
      affine.dma_start %arg0[%0, %c0], %alloc_1[%c0, %c0], %alloc_4[%c0], %c256 : memref<512x32xvector<8xf32>>, memref<64x4xvector<8xf32>, 2>, memref<2xi32>
      affine.dma_wait %alloc_4[%c0], %c256 : memref<2xi32>
      affine.dma_start %alloc_1[%c0, %c0], %arg0[%0, %c0], %alloc_4[%c0], %c256 : memref<64x4xvector<8xf32>, 2>, memref<512x32xvector<8xf32>>, memref<2xi32>
      affine.dma_wait %alloc_4[%c0], %c256 : memref<2xi32>
    }
    memref.dealloc %alloc_4 : memref<2xi32>
    memref.dealloc %alloc_3 : memref<2xi32>
    memref.dealloc %alloc_2 : memref<2xi32>
    memref.dealloc %alloc_1 : memref<64x4xvector<8xf32>, 2>
    memref.dealloc %alloc_0 : memref<64x4xvector<8xf32>, 2>
    memref.dealloc %alloc : memref<64x4xvector<8xf32>, 2>
    return
  }
}

// -----
module {
  func.func @escaping_use(%arg0: memref<512x32xf32>) {
    %c32 = arith.constant 32 : index
    %c512 = arith.constant 512 : index
    %c0 = arith.constant 0 : index
    %alloc = memref.alloc() : memref<32x32xf32, 2>
    %alloc_0 = memref.alloc() : memref<1xi32>
    affine.for %arg1 = 0 to 16 {
      affine.dma_start %arg0[%c0, %c0], %alloc[%c0, %c0], %alloc_0[%c0], %c512 : memref<512x32xf32>, memref<32x32xf32, 2>, memref<1xi32>
      affine.dma_wait %alloc_0[%c0], %c512 : memref<1xi32>
      "foo"(%alloc) : (memref<32x32xf32, 2>) -> ()
    }
    memref.dealloc %alloc_0 : memref<1xi32>
    memref.dealloc %alloc : memref<32x32xf32, 2>
    return
  }
}

// -----
module {
  func.func @escaping_tag(%arg0: memref<512x32xf32>) {
    %c32 = arith.constant 32 : index
    %c512 = arith.constant 512 : index
    %c0 = arith.constant 0 : index
    %alloc = memref.alloc() : memref<32x32xf32, 2>
    %alloc_0 = memref.alloc() : memref<1xi32>
    affine.for %arg1 = 0 to 16 {
      affine.dma_start %arg0[%c0, %c0], %alloc[%c0, %c0], %alloc_0[%c0], %c512 : memref<512x32xf32>, memref<32x32xf32, 2>, memref<1xi32>
      affine.dma_wait %alloc_0[%c0], %c512 : memref<1xi32>
      "foo"(%alloc_0) : (memref<1xi32>) -> ()
    }
    memref.dealloc %alloc_0 : memref<1xi32>
    memref.dealloc %alloc : memref<32x32xf32, 2>
    return
  }
}

// -----
module {
  func.func @live_out_use(%arg0: memref<512x32xf32>) -> f32 {
    %c32 = arith.constant 32 : index
    %c512 = arith.constant 512 : index
    %c0 = arith.constant 0 : index
    %alloc = memref.alloc() : memref<32x32xf32, 2>
    %alloc_0 = memref.alloc() : memref<1xi32>
    affine.for %arg1 = 0 to 16 {
      affine.dma_start %arg0[%c0, %c0], %alloc[%c0, %c0], %alloc_0[%c0], %c512 : memref<512x32xf32>, memref<32x32xf32, 2>, memref<1xi32>
      affine.dma_wait %alloc_0[%c0], %c512 : memref<1xi32>
    }
    %0 = affine.load %alloc[%c0, %c0] : memref<32x32xf32, 2>
    memref.dealloc %alloc_0 : memref<1xi32>
    memref.dealloc %alloc : memref<32x32xf32, 2>
    return %0 : f32
  }
}

// -----
module {
  func.func @dynamic_shape_dma_buffer(%arg0: memref<512x32xf32>, %arg1: memref<?x?xf32, 2>) {
    %c512 = arith.constant 512 : index
    %c0 = arith.constant 0 : index
    %alloc = memref.alloc() : memref<1xi32>
    affine.for %arg2 = 0 to 16 {
      affine.dma_start %arg0[%c0, %c0], %arg1[%c0, %c0], %alloc[%c0], %c512 : memref<512x32xf32>, memref<?x?xf32, 2>, memref<1xi32>
      affine.dma_wait %alloc[%c0], %c512 : memref<1xi32>
    }
    return
  }
  func.func @escaping_and_indexed_use_mix() {
    %alloc = memref.alloc() : memref<256xf32>
    %alloc_0 = memref.alloc() : memref<32xf32, 1>
    %alloc_1 = memref.alloc() : memref<1xf32>
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    affine.for %arg0 = 0 to 8 {
      affine.dma_start %alloc[%arg0], %alloc_0[%arg0], %alloc_1[%c0], %c32 : memref<256xf32>, memref<32xf32, 1>, memref<1xf32>
      affine.dma_wait %alloc_1[%c0], %c32 : memref<1xf32>
      "compute"(%alloc_0) : (memref<32xf32, 1>) -> ()
      %0 = affine.load %alloc_0[%arg0] : memref<32xf32, 1>
      "foo"(%0) : (f32) -> ()
    }
    memref.dealloc %alloc : memref<256xf32>
    memref.dealloc %alloc_0 : memref<32xf32, 1>
    return
  }
}

