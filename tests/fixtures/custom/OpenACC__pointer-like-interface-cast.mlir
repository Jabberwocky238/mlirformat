module {
  func.func @test_memref_cast_identity() {
    %alloca = memref.alloca() {cast_dest = memref<f32>, test.cast} : memref<f32>
    return
  }
}

// -----
module {
  func.func @test_memref_cast_static_to_dynamic() {
    %alloca = memref.alloca() {cast_dest = memref<?xf32>, test.cast} : memref<4xf32>
    return
  }
}

// -----
module {
  func.func @test_memref_memory_space_cast() {
    %alloca = memref.alloca() {cast_dest = memref<4xf32, 1>, test.cast} : memref<4xf32>
    return
  }
}

// -----
module {
  func.func @test_memref_cast_incompatible() {
    %alloca = memref.alloca() {cast_dest = tensor<4xf32>, test.cast} : memref<4xf32>
    return
  }
}

