module {
  func.func @base_test(%arg0: !test.i32, %arg1: f32) {
    return
  }
}

// -----
module {
  func.func @base_test(%arg0: i32, %arg1: f32) {
    return
  }
}

// -----
module {
  func.func @test_memref_types(%arg0: memref<4xf32>, %arg1: memref<4x4xf32>) {
    return
  }
}

