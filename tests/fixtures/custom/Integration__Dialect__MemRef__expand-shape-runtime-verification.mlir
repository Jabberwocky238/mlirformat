module {
  func.func @expand_shape_dynamic(%arg0: memref<?xf32>, %arg1: index, %arg2: index) {
    %expand_shape = memref.expand_shape %arg0 [[0, 1]] output_shape [%arg1, %arg2] : memref<?xf32> into memref<?x?xf32>
    return
  }
  func.func @expand_shape_mixed(%arg0: memref<?xf32>, %arg1: index) {
    %expand_shape = memref.expand_shape %arg0 [[0, 1]] output_shape [%arg1, 5] : memref<?xf32> into memref<?x5xf32>
    return
  }
  func.func @expand_shape_multi_group(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index) {
    %expand_shape = memref.expand_shape %arg0 [[0], [1, 2]] output_shape [%arg1, %arg2, 4] : memref<?x?xf32> into memref<?x?x4xf32>
    return
  }
  func.func @main() {
    %alloca = memref.alloca() : memref<10xf32>
    %cast = memref.cast %alloca : memref<10xf32> to memref<?xf32>
    %alloca_0 = memref.alloca() : memref<3x20xf32>
    %cast_1 = memref.cast %alloca_0 : memref<3x20xf32> to memref<?x?xf32>
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c4 = arith.constant 4 : index
    %c5 = arith.constant 5 : index
    call @expand_shape_dynamic(%cast, %c3, %c5) : (memref<?xf32>, index, index) -> ()
    call @expand_shape_mixed(%cast, %c4) : (memref<?xf32>, index) -> ()
    call @expand_shape_dynamic(%cast, %c2, %c5) : (memref<?xf32>, index, index) -> ()
    call @expand_shape_mixed(%cast, %c2) : (memref<?xf32>, index) -> ()
    call @expand_shape_multi_group(%cast_1, %c3, %c5) : (memref<?x?xf32>, index, index) -> ()
    return
  }
}

