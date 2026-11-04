module {
  func.func private @printMemrefF32(memref<*xf32>)
  func.func @main() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    %cst_1 = arith.constant 2.000000e+00 : f32
    %cst_2 = arith.constant 3.000000e+00 : f32
    %alloc = memref.alloc(%c2, %c2) : memref<?x?xf32>
    memref.store %cst, %alloc[%c0, %c0] : memref<?x?xf32>
    memref.store %cst_0, %alloc[%c0, %c1] : memref<?x?xf32>
    memref.store %cst_1, %alloc[%c1, %c0] : memref<?x?xf32>
    memref.store %cst_2, %alloc[%c1, %c1] : memref<?x?xf32>
    %subview = memref.subview %alloc[%c1, 0] [1, %c2] [1, 1] : memref<?x?xf32> to memref<?xf32, strided<[1], offset: ?>>
    %subview_3 = memref.subview %alloc[0, %c1] [%c2, 1] [1, 1] : memref<?x?xf32> to memref<?xf32, strided<[?], offset: ?>>
    %cast = memref.cast %alloc : memref<?x?xf32> to memref<*xf32>
    call @printMemrefF32(%cast) : (memref<*xf32>) -> ()
    %cast_4 = memref.cast %subview : memref<?xf32, strided<[1], offset: ?>> to memref<*xf32>
    call @printMemrefF32(%cast_4) : (memref<*xf32>) -> ()
    %cast_5 = memref.cast %subview_3 : memref<?xf32, strided<[?], offset: ?>> to memref<*xf32>
    call @printMemrefF32(%cast_5) : (memref<*xf32>) -> ()
    memref.dealloc %alloc : memref<?x?xf32>
    return
  }
}

