module {
  func.func @subview(%arg0: index, %arg1: index, %arg2: memref<?x?xf32>) {
    %alloc = memref.alloc() : memref<64x4xf32, strided<[4, 1]>>
    %subview = memref.subview %alloc[%arg0, %arg1] [%arg0, %arg1] [%arg0, %arg1] : memref<64x4xf32, strided<[4, 1]>> to memref<?x?xf32, strided<[?, ?], offset: ?>>
    test.copy(%subview, %arg2) : (memref<?x?xf32, strided<[?, ?], offset: ?>>, memref<?x?xf32>)
    return
  }
}

