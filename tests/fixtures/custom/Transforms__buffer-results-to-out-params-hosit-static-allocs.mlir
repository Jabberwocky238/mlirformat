module {
  func.func private @basic() -> memref<8x64xf32> {
    %alloc = memref.alloc() : memref<8x64xf32>
    "test.source"(%alloc) : (memref<8x64xf32>) -> ()
    return %alloc : memref<8x64xf32>
  }
  func.func private @basic_no_change() -> memref<f32> {
    %0 = "test.source"() : () -> memref<f32>
    return %0 : memref<f32>
  }
  func.func private @basic_dynamic(%arg0: index) -> memref<?xf32> {
    %alloc = memref.alloc(%arg0) : memref<?xf32>
    "test.source"(%alloc) : (memref<?xf32>) -> ()
    return %alloc : memref<?xf32>
  }
}

// -----
module {
  func.func private @return_arg(%arg0: memref<128x256xf32>, %arg1: memref<128x256xf32>) -> memref<128x256xf32> {
    "test.source"(%arg0, %arg1) : (memref<128x256xf32>, memref<128x256xf32>) -> ()
    return %arg0 : memref<128x256xf32>
  }
}

