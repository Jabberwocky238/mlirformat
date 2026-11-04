module {
  func.func @test_static_memref_alloc() {
    %alloca = memref.alloca() {test.ptr} : memref<10x20xf32>
    return
  }
}

// -----
module {
  func.func @test_dynamic_memref_alloc() {
    %c10 = arith.constant 10 : index
    %c20 = arith.constant 20 : index
    %alloc = memref.alloc(%c10, %c20) {test.ptr} : memref<?x?xf32>
    return
  }
}

