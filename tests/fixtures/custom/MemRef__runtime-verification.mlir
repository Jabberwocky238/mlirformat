module {
  func.func @expand_shape(%arg0: memref<?xf32>, %arg1: index) -> memref<?x5xf32> {
    %expand_shape = memref.expand_shape %arg0 [[0, 1]] output_shape [%arg1, 5] : memref<?xf32> into memref<?x5xf32>
    return %expand_shape : memref<?x5xf32>
  }
}

