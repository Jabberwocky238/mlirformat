module {
  func.func @memref_i32() {
    %c0 = arith.constant 0 : index
    %c1_i32 = arith.constant 1 : i32
    %alloc = memref.alloc() : memref<4xi32, 1>
    %0 = memref.load %alloc[%c0] : memref<4xi32, 1>
    memref.store %c1_i32, %alloc[%c0] : memref<4xi32, 1>
    return
  }
}

// -----
module {
  func.func @memref_f32() {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 1.000000e+00 : f32
    %alloc = memref.alloc() : memref<4xf32, 1>
    %0 = memref.load %alloc[%c0] : memref<4xf32, 1>
    memref.store %cst, %alloc[%c0] : memref<4xf32, 1>
    return
  }
}

// -----
module {
  func.func @alloc_load_store_i64() {
    %c0 = arith.constant 0 : index
    %c1_i64 = arith.constant 1 : i64
    %alloc = memref.alloc() : memref<4xi64, 1>
    %0 = memref.load %alloc[%c0] : memref<4xi64, 1>
    memref.store %c1_i64, %alloc[%c0] : memref<4xi64, 1>
    return
  }
}

// -----
module {
  func.func @alloc_load_store_i64_nontemporal() {
    %c0 = arith.constant 0 : index
    %c1_i64 = arith.constant 1 : i64
    %alloc = memref.alloc() : memref<4xi64, 1>
    %0 = memref.load %alloc[%c0] {nontemporal = true} : memref<4xi64, 1>
    memref.store %c1_i64, %alloc[%c0] {nontemporal = true} : memref<4xi64, 1>
    return
  }
}

