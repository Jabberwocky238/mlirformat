module {
  memref.global "private" constant @__constant_5x3xf32 : memref<5x3xf32> = dense<[[0.000000e+00, 1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00, 5.000000e+00], [6.000000e+00, 7.000000e+00, 8.000000e+00], [9.000000e+00, 1.000000e+01, 1.100000e+01], [1.200000e+01, 1.300000e+01, 1.400000e+01]]>
  func.func @main() {
    %0 = memref.get_global @__constant_5x3xf32 : memref<5x3xf32>
    %subview = memref.subview %0[2, 0] [3, 3] [1, 1] : memref<5x3xf32> to memref<3x3xf32, strided<[3, 1], offset: 6>>
    %cast = memref.cast %subview : memref<3x3xf32, strided<[3, 1], offset: 6>> to memref<*xf32>
    call @printMemrefF32(%cast) : (memref<*xf32>) -> ()
    %subview_0 = memref.subview %0[0, 2] [5, 1] [1, 1] : memref<5x3xf32> to memref<5x1xf32, strided<[3, 1], offset: 2>>
    %cast_1 = memref.cast %subview_0 : memref<5x1xf32, strided<[3, 1], offset: 2>> to memref<*xf32>
    call @printMemrefF32(%cast_1) : (memref<*xf32>) -> ()
    %subview_2 = memref.subview %0[0, 2] [5, 1] [1, 1] : memref<5x3xf32> to memref<5xf32, strided<[3], offset: 2>>
    %cast_3 = memref.cast %subview_2 : memref<5xf32, strided<[3], offset: 2>> to memref<*xf32>
    call @printMemrefF32(%cast_3) : (memref<*xf32>) -> ()
    %subview_4 = memref.subview %0[1, 0] [1, 3] [1, 1] : memref<5x3xf32> to memref<3xf32, strided<[1], offset: 3>>
    %cast_5 = memref.cast %subview_4 : memref<3xf32, strided<[1], offset: 3>> to memref<*xf32>
    call @printMemrefF32(%cast_5) : (memref<*xf32>) -> ()
    return
  }
  func.func private @printMemrefF32(memref<*xf32>)
}

