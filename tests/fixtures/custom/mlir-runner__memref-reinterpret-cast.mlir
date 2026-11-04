module {
  func.func private @printMemrefF32(memref<*xf32>) attributes {llvm.emit_c_interface}
  func.func @main() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
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
    call @cast_ranked_memref_to_static_shape(%alloc) : (memref<2x3xf32>) -> ()
    call @cast_ranked_memref_to_dynamic_shape(%alloc) : (memref<2x3xf32>) -> ()
    call @cast_unranked_memref_to_static_shape(%alloc) : (memref<2x3xf32>) -> ()
    call @cast_unranked_memref_to_dynamic_shape(%alloc) : (memref<2x3xf32>) -> ()
    memref.dealloc %alloc : memref<2x3xf32>
    return
  }
  func.func @cast_ranked_memref_to_static_shape(%arg0: memref<2x3xf32>) {
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [0], sizes: [6, 1], strides: [1, 1] : memref<2x3xf32> to memref<6x1xf32>
    %cast = memref.cast %reinterpret_cast : memref<6x1xf32> to memref<*xf32>
    call @printMemrefF32(%cast) : (memref<*xf32>) -> ()
    return
  }
  func.func @cast_ranked_memref_to_dynamic_shape(%arg0: memref<2x3xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c6 = arith.constant 6 : index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%c0], sizes: [%c1, %c6], strides: [%c6, %c1] : memref<2x3xf32> to memref<?x?xf32, strided<[?, ?], offset: ?>>
    %cast = memref.cast %reinterpret_cast : memref<?x?xf32, strided<[?, ?], offset: ?>> to memref<*xf32>
    call @printMemrefF32(%cast) : (memref<*xf32>) -> ()
    return
  }
  func.func @cast_unranked_memref_to_static_shape(%arg0: memref<2x3xf32>) {
    %cast = memref.cast %arg0 : memref<2x3xf32> to memref<*xf32>
    %reinterpret_cast = memref.reinterpret_cast %cast to offset: [0], sizes: [6, 1], strides: [1, 1] : memref<*xf32> to memref<6x1xf32>
    %cast_0 = memref.cast %reinterpret_cast : memref<6x1xf32> to memref<*xf32>
    call @printMemrefF32(%cast_0) : (memref<*xf32>) -> ()
    return
  }
  func.func @cast_unranked_memref_to_dynamic_shape(%arg0: memref<2x3xf32>) {
    %cast = memref.cast %arg0 : memref<2x3xf32> to memref<*xf32>
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c6 = arith.constant 6 : index
    %reinterpret_cast = memref.reinterpret_cast %cast to offset: [%c0], sizes: [%c1, %c6], strides: [%c6, %c1] : memref<*xf32> to memref<?x?xf32, strided<[?, ?], offset: ?>>
    %cast_0 = memref.cast %reinterpret_cast : memref<?x?xf32, strided<[?, ?], offset: ?>> to memref<*xf32>
    call @printMemrefF32(%cast_0) : (memref<*xf32>) -> ()
    return
  }
}

