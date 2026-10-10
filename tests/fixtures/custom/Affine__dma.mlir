module {
}

// -----
module {
  func.func @test0(%arg0: index, %arg1: index) {
    %alloc = memref.alloc() : memref<100x100xf32>
    %alloc_0 = memref.alloc() : memref<100x100xf32, 2>
    %alloc_1 = memref.alloc() : memref<1xi32>
    %c0 = arith.constant 0 : index
    %c64 = arith.constant 64 : index
    affine.for %arg2 = 0 to 10 {
      affine.for %arg3 = 0 to 10 {
        affine.dma_start %alloc[%arg2, %arg3], %alloc_0[%arg2, %arg3], %alloc_1[%c0], %c64 : memref<100x100xf32>, memref<100x100xf32, 2>, memref<1xi32>
        affine.dma_wait %alloc_1[%c0], %c64 : memref<1xi32>
      }
    }
    return
  }
}

// -----
module {
  func.func @test1(%arg0: index, %arg1: index) {
    %alloc = memref.alloc() : memref<100x100xf32>
    %alloc_0 = memref.alloc() : memref<100x100xf32, 2>
    %alloc_1 = memref.alloc() : memref<1xi32>
    %c0 = arith.constant 0 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c256 = arith.constant 256 : index
    affine.for %arg2 = 0 to 10 {
      affine.for %arg3 = 0 to 10 {
        affine.dma_start %alloc[%arg2, %arg3], %alloc_0[%arg2, %arg3], %alloc_1[%c0], %c64, %c128, %c256 : memref<100x100xf32>, memref<100x100xf32, 2>, memref<1xi32>
        affine.dma_wait %alloc_1[%c0], %c64 : memref<1xi32>
      }
    }
    return
  }
}

// -----
module {
  func.func @test2(%arg0: index, %arg1: index) {
    %alloc = memref.alloc() : memref<100x100xf32>
    %alloc_0 = memref.alloc() : memref<100x100xf32, 2>
    %alloc_1 = memref.alloc() : memref<1xi32>
    %c0 = arith.constant 0 : index
    %c64 = arith.constant 64 : index
    affine.for %arg2 = 0 to 10 {
      affine.for %arg3 = 0 to 10 {
        affine.dma_start %alloc[%arg2 + %arg0, %arg3], %alloc_0[%arg2, %arg3 + %arg1 + 5], %alloc_1[%c0], %c64 : memref<100x100xf32>, memref<100x100xf32, 2>, memref<1xi32>
        affine.dma_wait %alloc_1[%c0], %c64 : memref<1xi32>
      }
    }
    return
  }
}

// -----
module {
  func.func @test3(%arg0: index, %arg1: index) {
    %alloc = memref.alloc() : memref<100x100xf32>
    %alloc_0 = memref.alloc() : memref<100x100xf32, 2>
    %alloc_1 = memref.alloc() : memref<1xi32>
    %c0 = arith.constant 0 : index
    %c64 = arith.constant 64 : index
    affine.for %arg2 = 0 to 10 {
      affine.for %arg3 = 0 to 10 {
        affine.dma_start %alloc[%arg2 + symbol(%arg0), %arg3], %alloc_0[%arg2, %arg3 + symbol(%arg1) + 7], %alloc_1[%arg2 + %arg3 + 11], %c64 : memref<100x100xf32>, memref<100x100xf32, 2>, memref<1xi32>
        affine.dma_wait %alloc_1[%c0], %c64 : memref<1xi32>
      }
    }
    return
  }
}

// -----
module {
  func.func @test4(%arg0: index, %arg1: index) {
    %alloc = memref.alloc() : memref<100x100xf32>
    %alloc_0 = memref.alloc() : memref<100x100xf32, 2>
    %alloc_1 = memref.alloc() : memref<1xi32>
    %c64 = arith.constant 64 : index
    affine.for %arg2 = 0 to 10 {
      affine.for %arg3 = 0 to 10 {
        affine.dma_start %alloc[(%arg2 + symbol(%arg0)) floordiv 3, %arg3], %alloc_0[%arg2, (%arg3 + symbol(%arg1)) mod 9 + 7], %alloc_1[%arg2 + %arg3 + 11], %c64 : memref<100x100xf32>, memref<100x100xf32, 2>, memref<1xi32>
        affine.dma_wait %alloc_1[%arg2 + %arg3 + 11], %c64 : memref<1xi32>
      }
    }
    return
  }
}

