module {
  func.func @test_copy_static() {
    %alloca = memref.alloca() {test.src_ptr} : memref<10x20xf32>
    %alloca_0 = memref.alloca() {test.dest_ptr} : memref<10x20xf32>
    return
  }
}

// -----
module {
  func.func @test_copy_dynamic() {
    %c10 = arith.constant 10 : index
    %c20 = arith.constant 20 : index
    %alloc = memref.alloc(%c10, %c20) {test.src_ptr} : memref<?x?xf32>
    %alloc_0 = memref.alloc(%c10, %c20) {test.dest_ptr} : memref<?x?xf32>
    return
  }
}

