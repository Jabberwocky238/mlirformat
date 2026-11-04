module {
  func.func @simple1(%arg0: i1, %arg1: memref<2xf32>, %arg2: memref<2xf32>) {
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    cf.br ^bb3(%arg1 : memref<2xf32>)
  ^bb2:  // pred: ^bb0
    %alloc = memref.alloc() : memref<2xf32>
    cf.br ^bb3(%alloc : memref<2xf32>)
  ^bb3(%0: memref<2xf32>):  // 2 preds: ^bb1, ^bb2
    return
  }
}

