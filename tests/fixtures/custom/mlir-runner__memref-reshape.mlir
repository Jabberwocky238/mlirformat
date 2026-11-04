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
    %alloc_1 = memref.alloc() : memref<2xindex>
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    memref.store %c3, %alloc_1[%c0] : memref<2xindex>
    memref.store %c2, %alloc_1[%c1] : memref<2xindex>
    call @reshape_ranked_memref_to_ranked(%alloc, %alloc_1) : (memref<2x3xf32>, memref<2xindex>) -> ()
    call @reshape_unranked_memref_to_ranked(%alloc, %alloc_1) : (memref<2x3xf32>, memref<2xindex>) -> ()
    call @reshape_ranked_memref_to_unranked(%alloc, %alloc_1) : (memref<2x3xf32>, memref<2xindex>) -> ()
    call @reshape_unranked_memref_to_unranked(%alloc, %alloc_1) : (memref<2x3xf32>, memref<2xindex>) -> ()
    memref.dealloc %alloc : memref<2x3xf32>
    memref.dealloc %alloc_1 : memref<2xindex>
    return
  }
  func.func @reshape_ranked_memref_to_ranked(%arg0: memref<2x3xf32>, %arg1: memref<2xindex>) {
    %reshape = memref.reshape %arg0(%arg1) : (memref<2x3xf32>, memref<2xindex>) -> memref<?x?xf32>
    %cast = memref.cast %reshape : memref<?x?xf32> to memref<*xf32>
    call @printMemrefF32(%cast) : (memref<*xf32>) -> ()
    return
  }
  func.func @reshape_unranked_memref_to_ranked(%arg0: memref<2x3xf32>, %arg1: memref<2xindex>) {
    %cast = memref.cast %arg0 : memref<2x3xf32> to memref<*xf32>
    %reshape = memref.reshape %cast(%arg1) : (memref<*xf32>, memref<2xindex>) -> memref<?x?xf32>
    %cast_0 = memref.cast %reshape : memref<?x?xf32> to memref<*xf32>
    call @printMemrefF32(%cast_0) : (memref<*xf32>) -> ()
    return
  }
  func.func @reshape_ranked_memref_to_unranked(%arg0: memref<2x3xf32>, %arg1: memref<2xindex>) {
    %cast = memref.cast %arg1 : memref<2xindex> to memref<?xindex>
    %reshape = memref.reshape %arg0(%cast) : (memref<2x3xf32>, memref<?xindex>) -> memref<*xf32>
    call @printMemrefF32(%reshape) : (memref<*xf32>) -> ()
    return
  }
  func.func @reshape_unranked_memref_to_unranked(%arg0: memref<2x3xf32>, %arg1: memref<2xindex>) {
    %cast = memref.cast %arg0 : memref<2x3xf32> to memref<*xf32>
    %cast_0 = memref.cast %arg1 : memref<2xindex> to memref<?xindex>
    %reshape = memref.reshape %cast(%cast_0) : (memref<*xf32>, memref<?xindex>) -> memref<*xf32>
    call @printMemrefF32(%reshape) : (memref<*xf32>) -> ()
    return
  }
}

