module {
  func.func @test_scalar() {
    %alloca = memref.alloca() {test.var = "scalar"} : memref<f32>
    return
  }
}

// -----
module {
  func.func @test_static_2d() {
    %alloca = memref.alloca() {test.var = "static_2d"} : memref<10x20xf32>
    return
  }
}

// -----
module {
  func.func @test_dynamic_2d(%arg0: index, %arg1: index) {
    %alloc = memref.alloc(%arg0, %arg1) {test.var = "dynamic_2d"} : memref<?x?xf32>
    return
  }
}

// -----
module {
  func.func @test_mixed_dims(%arg0: index) {
    %alloc = memref.alloc(%arg0) {test.var = "mixed_dims"} : memref<10x?xf32>
    return
  }
}

// -----
module {
  func.func @test_scalar_int() {
    %alloca = memref.alloca() {test.var = "scalar_int"} : memref<i32>
    return
  }
}

