module {
  func.func @memref_subview(%arg0: memref<8x16x4xf32, strided<[64, 4, 1]>>, %arg1: memref<1x128x1x32x1xf32, strided<[4096, 32, 32, 1, 1]>>, %arg2: memref<8x16x4xf32, strided<[1, 64, 8], offset: 16>>, %arg3: index, %arg4: index, %arg5: index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %0 = test.with_bounds {smax = 13 : index, smin = 11 : index, umax = 13 : index, umin = 11 : index} : index
    %1 = test.with_bounds {smax = 7 : index, smin = 5 : index, umax = 7 : index, umin = 5 : index} : index
    %subview = memref.subview %arg0[%c0, %c0, %c1] [%arg3, %arg4, %arg5] [%c1, %c1, %c1] : memref<8x16x4xf32, strided<[64, 4, 1]>> to memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
    %subview_0 = memref.subview %subview[%1, %1, %1] [%c2, %c2, %c2] [%0, %0, %0] : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>> to memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
    %subview_1 = memref.subview %subview_0[%c0, %c0, %c2] [%c2, %c2, %c2] [%c1, %c1, %c1] : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>> to memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
    %subview_2 = memref.subview %arg1[%arg4, %arg4, %arg4, %arg4, %arg4] [1, 64, 1, 16, 1] [%arg5, %arg5, %arg5, %arg5, %arg5] : memref<1x128x1x32x1xf32, strided<[4096, 32, 32, 1, 1]>> to memref<64x16xf32, strided<[?, ?], offset: ?>>
    %subview_3 = memref.subview %subview_2[%c0, %0] [1, %1] [%c1, %c2] : memref<64x16xf32, strided<[?, ?], offset: ?>> to memref<?xf32, strided<[?], offset: ?>>
    %subview_4 = memref.subview %arg2[%c0, %c0, %c2] [%0, %1, %arg5] [%c1, %c1, %c1] : memref<8x16x4xf32, strided<[1, 64, 8], offset: 16>> to memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
    return
  }
}

