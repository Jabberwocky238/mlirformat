module {
  func.func @test_memref_store_scalar() {
    %alloca = memref.alloca() {test.ptr} : memref<f32>
    return
  }
}

// -----
module {
  func.func @test_memref_store_int() {
    %alloca = memref.alloca() {test.ptr} : memref<i32>
    return
  }
}

// -----
module {
  func.func @test_memref_store_i64() {
    %alloca = memref.alloca() {test.ptr} : memref<i64>
    return
  }
}

// -----
module {
  func.func @test_memref_store_dynamic() {
    %c10 = arith.constant 10 : index
    %alloc = memref.alloc(%c10) {test.ptr} : memref<?xf32>
    return
  }
}

