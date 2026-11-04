module {
  func.func @subview_strided(%arg0: memref<4x1024xf32>) -> memref<1x128xf32, strided<[1024, 1], offset: 3456>> {
    %subview = memref.subview %arg0[2, 256] [2, 256] [1, 1] : memref<4x1024xf32> to memref<2x256xf32, strided<[1024, 1], offset: 2304>>
    %subview_0 = memref.subview %subview[1, 128] [1, 128] [1, 1] : memref<2x256xf32, strided<[1024, 1], offset: 2304>> to memref<1x128xf32, strided<[1024, 1], offset: 3456>>
    return %subview_0 : memref<1x128xf32, strided<[1024, 1], offset: 3456>>
  }
}

// -----
module {
  func.func @subview_strided(%arg0: memref<4x1024xf32>) -> memref<1x10xf32, strided<[1024, 1], offset: 3745>> {
    %subview = memref.subview %arg0[1, 512] [3, 256] [1, 1] : memref<4x1024xf32> to memref<3x256xf32, strided<[1024, 1], offset: 1536>>
    %subview_0 = memref.subview %subview[1, 128] [2, 128] [1, 1] : memref<3x256xf32, strided<[1024, 1], offset: 1536>> to memref<2x128xf32, strided<[1024, 1], offset: 2688>>
    %subview_1 = memref.subview %subview_0[1, 33] [1, 10] [1, 1] : memref<2x128xf32, strided<[1024, 1], offset: 2688>> to memref<1x10xf32, strided<[1024, 1], offset: 3745>>
    return %subview_1 : memref<1x10xf32, strided<[1024, 1], offset: 3745>>
  }
}

// -----
module {
  func.func @subview_strided(%arg0: memref<4x1024xf32>) -> memref<1x128xf32, strided<[1024, 1], offset: ?>> {
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %subview = memref.subview %arg0[%c2, 256] [2, 256] [1, 1] : memref<4x1024xf32> to memref<2x256xf32, strided<[1024, 1], offset: ?>>
    %subview_0 = memref.subview %subview[%c1, 128] [1, 128] [1, 1] : memref<2x256xf32, strided<[1024, 1], offset: ?>> to memref<1x128xf32, strided<[1024, 1], offset: ?>>
    return %subview_0 : memref<1x128xf32, strided<[1024, 1], offset: ?>>
  }
}

// -----
module {
  func.func @subview_strided(%arg0: memref<4x1024xf32>) -> memref<1x128xf32, strided<[1024, 1], offset: ?>> {
    %c2 = arith.constant 2 : index
    %c128 = arith.constant 128 : index
    %subview = memref.subview %arg0[%c2, 256] [2, 256] [1, 1] : memref<4x1024xf32> to memref<2x256xf32, strided<[1024, 1], offset: ?>>
    %subview_0 = memref.subview %subview[1, %c128] [1, 128] [1, 1] : memref<2x256xf32, strided<[1024, 1], offset: ?>> to memref<1x128xf32, strided<[1024, 1], offset: ?>>
    return %subview_0 : memref<1x128xf32, strided<[1024, 1], offset: ?>>
  }
}

// -----
module {
  func.func @subview_strided(%arg0: memref<8x1024xf32>) -> memref<1x64xf32, strided<[4096, 4], offset: 4480>> {
    %subview = memref.subview %arg0[2, 256] [2, 256] [2, 2] : memref<8x1024xf32> to memref<2x256xf32, strided<[2048, 2], offset: 2304>>
    %subview_0 = memref.subview %subview[1, 64] [1, 64] [2, 2] : memref<2x256xf32, strided<[2048, 2], offset: 2304>> to memref<1x64xf32, strided<[4096, 4], offset: 4480>>
    return %subview_0 : memref<1x64xf32, strided<[4096, 4], offset: 4480>>
  }
}

// -----
module {
  func.func @subview_strided(%arg0: memref<30x30xf32>) -> memref<2x2xf32, strided<[240, 8], offset: 217>> {
    %subview = memref.subview %arg0[1, 1] [12, 12] [2, 2] : memref<30x30xf32> to memref<12x12xf32, strided<[60, 2], offset: 31>>
    %subview_0 = memref.subview %subview[1, 1] [5, 5] [2, 2] : memref<12x12xf32, strided<[60, 2], offset: 31>> to memref<5x5xf32, strided<[120, 4], offset: 93>>
    %subview_1 = memref.subview %subview_0[1, 1] [2, 2] [2, 2] : memref<5x5xf32, strided<[120, 4], offset: 93>> to memref<2x2xf32, strided<[240, 8], offset: 217>>
    return %subview_1 : memref<2x2xf32, strided<[240, 8], offset: 217>>
  }
}

// -----
module {
  func.func @subview_strided(%arg0: memref<4x1024xf32>) -> memref<1x64xf32, strided<[4096, 4], offset: ?>> {
    %c2 = arith.constant 2 : index
    %c64 = arith.constant 64 : index
    %subview = memref.subview %arg0[%c2, 256] [2, 256] [2, 2] : memref<4x1024xf32> to memref<2x256xf32, strided<[2048, 2], offset: ?>>
    %subview_0 = memref.subview %subview[1, %c64] [1, 64] [2, 2] : memref<2x256xf32, strided<[2048, 2], offset: ?>> to memref<1x64xf32, strided<[4096, 4], offset: ?>>
    return %subview_0 : memref<1x64xf32, strided<[4096, 4], offset: ?>>
  }
}

// -----
module {
  func.func @subview_strided(%arg0: memref<4x1024xf32>) -> memref<1x64xf32, strided<[4096, 4], offset: ?>> {
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %subview = memref.subview %arg0[%c2, 256] [2, 256] [2, 2] : memref<4x1024xf32> to memref<2x256xf32, strided<[2048, 2], offset: ?>>
    %subview_0 = memref.subview %subview[%c1, 64] [1, 64] [2, 2] : memref<2x256xf32, strided<[2048, 2], offset: ?>> to memref<1x64xf32, strided<[4096, 4], offset: ?>>
    return %subview_0 : memref<1x64xf32, strided<[4096, 4], offset: ?>>
  }
}

// -----
module {
  func.func @single_dynamic_size_subview(%arg0: memref<256x?xf32>, %arg1: index, %arg2: index) -> memref<8x?xf32> {
    %subview = memref.subview %arg0[0, 0] [8, %arg1] [1, 1] : memref<256x?xf32> to memref<8x?xf32>
    %subview_0 = memref.subview %subview[0, 0] [8, %arg2] [1, 1] : memref<8x?xf32> to memref<8x?xf32>
    return %subview_0 : memref<8x?xf32>
  }
}

// -----
module {
  func.func @all_dynamic_size_subview(%arg0: memref<256x?xf32>, %arg1: index, %arg2: index) -> memref<?x?xf32> {
    %subview = memref.subview %arg0[0, 0] [%arg1, %arg1] [1, 1] : memref<256x?xf32> to memref<?x?xf32>
    %subview_0 = memref.subview %subview[0, 0] [%arg2, %arg2] [1, 1] : memref<?x?xf32> to memref<?x?xf32>
    return %subview_0 : memref<?x?xf32>
  }
}

