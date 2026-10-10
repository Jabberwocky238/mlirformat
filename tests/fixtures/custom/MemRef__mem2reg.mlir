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
  func.func @basic_default() -> i32 {
    %c5_i32 = arith.constant 5 : i32
    %alloca = memref.alloca() : memref<i32>
    %0 = memref.load %alloca[] : memref<i32>
    memref.store %c5_i32, %alloca[] : memref<i32>
    return %0 : i32
  }
}

// -----
module {
  func.func @basic_float() -> f32 {
    %cst = arith.constant 5.200000e+00 : f32
    %alloca = memref.alloca() : memref<f32>
    memref.store %cst, %alloca[] : memref<f32>
    %0 = memref.load %alloca[] : memref<f32>
    return %0 : f32
  }
}

// -----
module {
  func.func @basic_ranked() -> i32 {
    %c0 = arith.constant 0 : index
    %c5_i32 = arith.constant 5 : i32
    %alloca = memref.alloca() : memref<1x1xi32>
    memref.store %c5_i32, %alloca[%c0, %c0] : memref<1x1xi32>
    %0 = memref.load %alloca[%c0, %c0] : memref<1x1xi32>
    return %0 : i32
  }
}

// -----
module {
  func.func @reject_multiple_elements() -> i32 {
    %c0 = arith.constant 0 : index
    %c5_i32 = arith.constant 5 : i32
    %alloca = memref.alloca() : memref<1x2xi32>
    memref.store %c5_i32, %alloca[%c0, %c0] : memref<1x2xi32>
    %0 = memref.load %alloca[%c0, %c0] : memref<1x2xi32>
    return %0 : i32
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

// -----
module {
  func.func @deny_store_of_alloca(%arg0: memref<memref<i32>>) -> i32 {
    %c5_i32 = arith.constant 5 : i32
    %alloca = memref.alloca() : memref<i32>
    memref.store %c5_i32, %alloca[] : memref<i32>
    memref.store %alloca, %arg0[] : memref<memref<i32>>
    %0 = memref.load %alloca[] : memref<i32>
    return %0 : i32
  }
}

// -----
module {
  func.func @promotable_nonpromotable_intertwined() -> i32 {
    %alloca = memref.alloca() : memref<i32>
    %alloca_0 = memref.alloca() : memref<memref<i32>>
    memref.store %alloca, %alloca_0[] : memref<memref<i32>>
    %0 = memref.load %alloca_0[] : memref<memref<i32>>
    call @use(%alloca) : (memref<i32>) -> ()
    %1 = memref.load %alloca[] : memref<i32>
    return %1 : i32
  }
  func.func @use(%arg0: memref<i32>) {
    return
  }
}

