module {
  func.func @simple1() {
    return
  }
  func.func @simple2(%arg0: i32, %arg1: i32, %arg2: i32) {
    %0 = "test.op_crash_long"(%arg0, %arg1, %arg2) : (i32, i32, i32) -> i32
    return
  }
  func.func @simple5() {
    return
  }
}

// -----
module {
  func.func @simple1() {
    return
  }
  func.func @simple2() {
    return
  }
  func.func @simple3() {
    "test.op_crash"() : () -> ()
    return
  }
  func.func @simple4(%arg0: i1, %arg1: memref<2xf32>, %arg2: memref<2xf32>) {
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    cf.br ^bb3(%arg1 : memref<2xf32>)
  ^bb2:  // pred: ^bb0
    %alloc = memref.alloc() : memref<2xf32>
    cf.br ^bb3(%alloc : memref<2xf32>)
  ^bb3(%0: memref<2xf32>):  // 2 preds: ^bb1, ^bb2
    "test.op_crash"(%0, %arg2) : (memref<2xf32>, memref<2xf32>) -> ()
    return
  }
  func.func @simple5() {
    return
  }
}

