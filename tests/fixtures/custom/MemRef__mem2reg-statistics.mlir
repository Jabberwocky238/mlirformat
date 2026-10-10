module {
  func.func @basic() -> i32 {
    %c5_i32 = arith.constant 5 : i32
    %alloca = memref.alloca() : memref<i32>
    memref.store %c5_i32, %alloca[] : memref<i32>
    %0 = memref.load %alloca[] : memref<i32>
    return %0 : i32
  }
}

// -----
module {
  func.func @no_alloca() -> i32 {
    %c5_i32 = arith.constant 5 : i32
    return %c5_i32 : i32
  }
}

// -----
module {
  func.func @cycle(%arg0: i64, %arg1: i1, %arg2: i64) {
    %alloca = memref.alloca() : memref<i64>
    memref.store %arg2, %alloca[] : memref<i64>
    cf.cond_br %arg1, ^bb1, ^bb2
  ^bb1:  // 2 preds: ^bb0, ^bb2
    %0 = memref.load %alloca[] : memref<i64>
    call @use(%0) : (i64) -> ()
    memref.store %arg0, %alloca[] : memref<i64>
    cf.br ^bb2
  ^bb2:  // 2 preds: ^bb0, ^bb1
    cf.br ^bb1
  }
  func.func @use(%arg0: i64) {
    return
  }
}

// -----
module {
  func.func @recursive(%arg0: i64) -> i64 {
    %alloca = memref.alloca() : memref<memref<memref<i64>>>
    %alloca_0 = memref.alloca() : memref<memref<i64>>
    %alloca_1 = memref.alloca() : memref<i64>
    memref.store %arg0, %alloca_1[] : memref<i64>
    memref.store %alloca_1, %alloca_0[] : memref<memref<i64>>
    memref.store %alloca_0, %alloca[] : memref<memref<memref<i64>>>
    %0 = memref.load %alloca[] : memref<memref<memref<i64>>>
    %1 = memref.load %0[] : memref<memref<i64>>
    %2 = memref.load %1[] : memref<i64>
    return %2 : i64
  }
}

