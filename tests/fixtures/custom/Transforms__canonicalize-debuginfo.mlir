module {
  func.func @merge_constants() -> (index, index, index, index) {
    %c42 = arith.constant 42 : index
    %c42_0 = arith.constant 42 : index
    %c42_1 = arith.constant 42 : index
    %c42_2 = arith.constant 42 : index
    return %c42, %c42_0, %c42_1, %c42_2 : index, index, index, index
  }
}

// -----
module {
  func.func @simple_hoist(%arg0: memref<8xi32>) -> i32 {
    %c42_i32 = arith.constant 42 : i32
    %c0 = arith.constant 0 : index
    memref.store %c42_i32, %arg0[%c0] : memref<8xi32>
    %c88_i32 = arith.constant 88 : i32
    return %c88_i32 : i32
  }
}

// -----
module {
  func.func @hoist_and_merge(%arg0: memref<8xi32>) {
    affine.for %arg1 = 0 to 8 {
      %c42_i32 = arith.constant 42 : i32
      %c42_i32_0 = arith.constant 42 : i32
      memref.store %c42_i32, %arg0[%arg1] : memref<8xi32>
      memref.store %c42_i32_0, %arg0[%arg1] : memref<8xi32>
    }
    return
  }
}

