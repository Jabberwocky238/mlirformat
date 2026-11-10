module {
  func.func @expand_shape(%arg0: memref<?xf32>, %arg1: index) -> memref<?x5xf32> {
    %expand_shape = memref.expand_shape %arg0 [[0, 1]] output_shape [%arg1, 5] : memref<?xf32> into memref<?x5xf32>
    return %expand_shape : memref<?x5xf32>
  }
}

// -----
module {
  func.func @subview(%arg0: memref<1xf32>, %arg1: index) {
    %subview = memref.subview %arg0[%arg1] [1] [1] : memref<1xf32> to memref<1xf32, strided<[1], offset: ?>>
    return
  }
}

