module {
  func.func @memcpy_helper(%arg0: memref<?xf32>, %arg1: memref<?xf32>) {
    memref.copy %arg0, %arg1 : memref<?xf32> to memref<?xf32>
    return
  }
  func.func @main() {
    %alloca = memref.alloca() : memref<4xf32>
    %alloca_0 = memref.alloca() : memref<5xf32>
    %cast = memref.cast %alloca : memref<4xf32> to memref<?xf32>
    %cast_1 = memref.cast %alloca_0 : memref<5xf32> to memref<?xf32>
    call @memcpy_helper(%cast, %cast_1) : (memref<?xf32>, memref<?xf32>) -> ()
    return
  }
}

