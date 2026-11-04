module {
  func.func @subview_folder(%arg0: memref<100x100xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) -> memref<?x?xf32, strided<[100, 1], offset: ?>> {
    %subview = memref.subview %arg0[%arg1, %arg2] [%arg3, %arg4] [1, 1] : memref<100x100xf32> to memref<?x?xf32, strided<[100, 1], offset: ?>>
    return %subview : memref<?x?xf32, strided<[100, 1], offset: ?>>
  }
}

