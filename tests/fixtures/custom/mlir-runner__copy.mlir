module {
  func.func private @printMemrefF32(memref<*xf32>) attributes {llvm.emit_c_interface}
  func.func @main() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 4.200000e+01 : f32
    %alloc = memref.alloc() : memref<2x3xf32>
    %dim = memref.dim %alloc, %c0 : memref<2x3xf32>
    %dim_0 = memref.dim %alloc, %c1 : memref<2x3xf32>
    scf.parallel (%arg0, %arg1) = (%c0, %c0) to (%dim, %dim_0) step (%c1, %c1) {
      %0 = arith.muli %arg0, %dim_0 : index
      %1 = arith.addi %0, %arg1 : index
      %2 = arith.index_cast %1 : index to i64
      %3 = arith.sitofp %2 : i64 to f32
      memref.store %3, %alloc[%arg0, %arg1] : memref<2x3xf32>
      scf.reduce 
    }
    %cast = memref.cast %alloc : memref<2x3xf32> to memref<*xf32>
    call @printMemrefF32(%cast) : (memref<*xf32>) -> ()
    %alloc_1 = memref.alloc() : memref<2x3xf32>
    memref.copy %alloc, %alloc_1 : memref<2x3xf32> to memref<2x3xf32>
    %cast_2 = memref.cast %alloc_1 : memref<2x3xf32> to memref<*xf32>
    call @printMemrefF32(%cast_2) : (memref<*xf32>) -> ()
    %alloc_3 = memref.alloc() : memref<3x2xf32>
    %reinterpret_cast = memref.reinterpret_cast %alloc_3 to offset: [0], sizes: [2, 3], strides: [1, 2] : memref<3x2xf32> to memref<2x3xf32, strided<[1, 2]>>
    memref.copy %alloc, %reinterpret_cast : memref<2x3xf32> to memref<2x3xf32, strided<[1, 2]>>
    %cast_4 = memref.cast %alloc_3 : memref<3x2xf32> to memref<*xf32>
    call @printMemrefF32(%cast_4) : (memref<*xf32>) -> ()
    %alloc_5 = memref.alloc() : memref<3x0x1xf32>
    %alloc_6 = memref.alloc() : memref<3x0x1xf32>
    memref.copy %alloc_5, %alloc_6 : memref<3x0x1xf32> to memref<3x0x1xf32>
    %reinterpret_cast_7 = memref.reinterpret_cast %alloc_5 to offset: [0], sizes: [0, 3, 1], strides: [3, 1, 1] : memref<3x0x1xf32> to memref<0x3x1xf32, strided<[3, 1, 1]>>
    %alloc_8 = memref.alloc() : memref<0x3x1xf32>
    memref.copy %reinterpret_cast_7, %alloc_8 : memref<0x3x1xf32, strided<[3, 1, 1]>> to memref<0x3x1xf32>
    %alloc_9 = memref.alloc() : memref<f32>
    memref.store %cst, %alloc_9[] : memref<f32>
    %alloc_10 = memref.alloc() : memref<f32>
    memref.copy %alloc_9, %alloc_10 : memref<f32> to memref<f32>
    %cast_11 = memref.cast %alloc_10 : memref<f32> to memref<*xf32>
    call @printMemrefF32(%cast_11) : (memref<*xf32>) -> ()
    memref.dealloc %alloc_6 : memref<3x0x1xf32>
    memref.dealloc %alloc_8 : memref<0x3x1xf32>
    memref.dealloc %alloc_5 : memref<3x0x1xf32>
    memref.dealloc %alloc_3 : memref<3x2xf32>
    memref.dealloc %alloc_1 : memref<2x3xf32>
    memref.dealloc %alloc : memref<2x3xf32>
    memref.dealloc %alloc_9 : memref<f32>
    memref.dealloc %alloc_10 : memref<f32>
    return
  }
}

