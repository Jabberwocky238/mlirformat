module {
  func.func @simple(%arg0: i64, %arg1: i1) -> i64 {
    cf.cond_br %arg1, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    cf.br ^bb3(%arg0 : i64)
  ^bb2:  // pred: ^bb0
    %0 = emitc.call_opaque "add"(%arg0, %arg0)  : (i64, i64) -> i64
    cf.br ^bb3(%0 : i64)
  ^bb3(%1: i64):  // 2 preds: ^bb1, ^bb2
    cf.br ^bb4(%1, %arg0 : i64, i64)
  ^bb4(%2: i64, %3: i64):  // pred: ^bb3
    %4 = emitc.call_opaque "add"(%2, %3)  : (i64, i64) -> i64
    return %4 : i64
  }
  func.func @block_labels0() {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    return
  }
  func.func @block_labels1() {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    return
  }
  emitc.func @expression_inlining(%arg0: i32, %arg1: i32) {
    %0 = expression %arg0, %arg1 : (i32, i32) -> i1 {
      %1 = cmp lt, %arg0, %arg1 : (i32, i32) -> i1
      yield %1 : i1
    }
    cf.cond_br %0, ^bb1, ^bb1
  ^bb1:  // 2 preds: ^bb0, ^bb0
    return
  }
}

