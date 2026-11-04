module {
  func.func @redundantOperations(%arg0: memref<2xf32>) {
    %alloc = memref.alloc() : memref<2xf32>
    test.buffer_based in(%arg0 : memref<2xf32>) out(%alloc : memref<2xf32>)
    %alloc_0 = memref.alloc() : memref<2xf32>
    test.buffer_based in(%alloc : memref<2xf32>) out(%alloc_0 : memref<2xf32>)
    return
  }
}

// -----
module {
  func.func @allocaIsNotDeallocated(%arg0: memref<2xf32>) {
    %alloc = memref.alloc() : memref<2xf32>
    test.buffer_based in(%arg0 : memref<2xf32>) out(%alloc : memref<2xf32>)
    %alloca = memref.alloca() : memref<2xf32>
    test.buffer_based in(%alloc : memref<2xf32>) out(%alloca : memref<2xf32>)
    return
  }
}

// -----
module {
  func.func @inserting_missing_dealloc_simple(%arg0: memref<2xf32>, %arg1: memref<2xf32>) {
    %alloc = memref.alloc() : memref<2xf32>
    test.buffer_based in(%arg0 : memref<2xf32>) out(%alloc : memref<2xf32>)
    test.copy(%alloc, %arg1) : (memref<2xf32>, memref<2xf32>)
    return
  }
}

// -----
module {
  func.func @alloca_ownership_indicator_is_false() {
    %alloca = memref.alloca() : memref<2xf32>
    cf.br ^bb1(%alloca : memref<2xf32>)
  ^bb1(%0: memref<2xf32>):  // pred: ^bb0
    return
  }
}

// -----
module {
  func.func @dealloc_existing_clones(%arg0: memref<?x?xf64>, %arg1: memref<?x?xf64>) -> memref<?x?xf64> {
    %0 = bufferization.clone %arg0 : memref<?x?xf64> to memref<?x?xf64>
    %1 = bufferization.clone %arg1 : memref<?x?xf64> to memref<?x?xf64>
    return %0 : memref<?x?xf64>
  }
}

// -----
module {
  memref.global "private" constant @__constant_4xf32 : memref<4xf32> = dense<[1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00]>
  func.func @op_without_aliasing_and_allocation() -> memref<4xf32> {
    %0 = memref.get_global @__constant_4xf32 : memref<4xf32>
    return %0 : memref<4xf32>
  }
}

// -----
module {
  func.func @manual_deallocation(%arg0: i1, %arg1: f32, %arg2: index) -> f32 {
    %alloc = memref.alloc() {bufferization.manual_deallocation} : memref<5xf32>
    linalg.fill ins(%arg1 : f32) outs(%alloc : memref<5xf32>)
    %alloc_0 = memref.alloc() : memref<5xf32>
    linalg.fill ins(%arg1 : f32) outs(%alloc_0 : memref<5xf32>)
    %0 = arith.select %arg0, %alloc, %alloc_0 : memref<5xf32>
    %1 = memref.load %0[%arg2] : memref<5xf32>
    memref.dealloc %alloc {bufferization.manual_deallocation} : memref<5xf32>
    return %1 : f32
  }
}

// -----
module {
  func.func private @properly_creates_deallocations_in_execute_region(%arg0: memref<1x16x252x380xui8>) -> memref<1x250x378x16xui8> {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<1x250x378x16xui8>
    scf.execute_region no_inline {
      %subview = memref.subview %arg0[0, 0, 0, 0] [1, 16, 65, 380] [1, 1, 1, 1] : memref<1x16x252x380xui8> to memref<1x16x65x380xui8, strided<[1532160, 95760, 380, 1]>>
      %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<1x63x378x16xui8>
      test.buffer_based in(%subview : memref<1x16x65x380xui8, strided<[1532160, 95760, 380, 1]>>) out(%alloc_0 : memref<1x63x378x16xui8>)
      %subview_1 = memref.subview %alloc[0, 0, 0, 0] [1, 63, 378, 16] [1, 1, 1, 1] : memref<1x250x378x16xui8> to memref<1x63x378x16xui8, strided<[1512000, 6048, 16, 1]>>
      test.copy(%alloc_0, %subview_1) : (memref<1x63x378x16xui8>, memref<1x63x378x16xui8, strided<[1512000, 6048, 16, 1]>>)
      scf.yield
    }
    return %alloc : memref<1x250x378x16xui8>
  }
}

