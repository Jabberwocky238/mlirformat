module {
  func.func @test_scalar_from_firstprivate() {
    %alloca = memref.alloca() {test.var = "scalar"} : memref<f32>
    return
  }
}

// -----
module {
  func.func @test_dynamic_from_firstprivate(%arg0: index, %arg1: index) {
    %alloc = memref.alloc(%arg0, %arg1) {test.var = "dynamic_d2"} : memref<?x?xf32>
    return
  }
}

