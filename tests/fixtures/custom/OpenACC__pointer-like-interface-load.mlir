module {
  func.func @test_memref_load_scalar() {
    %alloca = memref.alloca() {test.ptr} : memref<f32>
    return
  }
}

// -----
module {
  func.func @test_memref_load_int() {
    %alloca = memref.alloca() {test.ptr} : memref<i64>
    return
  }
}

// -----
module {
  func.func @test_memref_load_dynamic() {
    %c10 = arith.constant 10 : index
    %alloc = memref.alloc(%c10) {test.ptr} : memref<?xf32>
    return
  }
}

