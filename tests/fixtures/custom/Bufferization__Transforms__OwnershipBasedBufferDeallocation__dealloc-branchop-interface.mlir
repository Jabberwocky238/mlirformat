module {
  func.func @condBranch(%arg0: i1, %arg1: memref<2xf32>, %arg2: memref<2xf32>) {
    cf.cond_br %arg0, ^bb2(%arg1 : memref<2xf32>), ^bb1
  ^bb1:  // pred: ^bb0
    %alloc = memref.alloc() : memref<2xf32>
    test.buffer_based in(%arg1 : memref<2xf32>) out(%alloc : memref<2xf32>)
    cf.br ^bb2(%alloc : memref<2xf32>)
  ^bb2(%0: memref<2xf32>):  // 2 preds: ^bb0, ^bb1
    test.copy(%0, %arg2) : (memref<2xf32>, memref<2xf32>)
    return
  }
}

// -----
module {
  func.func @condBranchDynamicType(%arg0: i1, %arg1: memref<?xf32>, %arg2: memref<?xf32>, %arg3: index) {
    cf.cond_br %arg0, ^bb2(%arg1 : memref<?xf32>), ^bb1(%arg3 : index)
  ^bb1(%0: index):  // pred: ^bb0
    %alloc = memref.alloc(%0) : memref<?xf32>
    test.buffer_based in(%arg1 : memref<?xf32>) out(%alloc : memref<?xf32>)
    cf.br ^bb2(%alloc : memref<?xf32>)
  ^bb2(%1: memref<?xf32>):  // 2 preds: ^bb0, ^bb1
    test.copy(%1, %arg2) : (memref<?xf32>, memref<?xf32>)
    return
  }
}

// -----
module {
  func.func @condBranchUnrankedType(%arg0: i1, %arg1: memref<*xf32>, %arg2: memref<*xf32>, %arg3: index) {
    cf.cond_br %arg0, ^bb2(%arg1 : memref<*xf32>), ^bb1(%arg3 : index)
  ^bb1(%0: index):  // pred: ^bb0
    %alloc = memref.alloc(%0) : memref<?xf32>
    %cast = memref.cast %alloc : memref<?xf32> to memref<*xf32>
    test.buffer_based in(%arg1 : memref<*xf32>) out(%cast : memref<*xf32>)
    cf.br ^bb2(%cast : memref<*xf32>)
  ^bb2(%1: memref<*xf32>):  // 2 preds: ^bb0, ^bb1
    test.copy(%1, %arg2) : (memref<*xf32>, memref<*xf32>)
    return
  }
}

// -----
module {
  func.func @condBranchDynamicTypeNested(%arg0: i1, %arg1: memref<?xf32>, %arg2: memref<?xf32>, %arg3: index) {
    cf.cond_br %arg0, ^bb1, ^bb2(%arg3 : index)
  ^bb1:  // pred: ^bb0
    cf.br ^bb6(%arg1 : memref<?xf32>)
  ^bb2(%0: index):  // pred: ^bb0
    %alloc = memref.alloc(%0) : memref<?xf32>
    test.buffer_based in(%arg1 : memref<?xf32>) out(%alloc : memref<?xf32>)
    cf.cond_br %arg0, ^bb3, ^bb4
  ^bb3:  // pred: ^bb2
    cf.br ^bb5(%alloc : memref<?xf32>)
  ^bb4:  // pred: ^bb2
    cf.br ^bb5(%alloc : memref<?xf32>)
  ^bb5(%1: memref<?xf32>):  // 2 preds: ^bb3, ^bb4
    cf.br ^bb6(%1 : memref<?xf32>)
  ^bb6(%2: memref<?xf32>):  // 2 preds: ^bb1, ^bb5
    cf.br ^bb7(%2 : memref<?xf32>)
  ^bb7(%3: memref<?xf32>):  // pred: ^bb6
    test.copy(%3, %arg2) : (memref<?xf32>, memref<?xf32>)
    return
  }
}

// -----
module {
  func.func @criticalEdge(%arg0: i1, %arg1: memref<2xf32>, %arg2: memref<2xf32>) {
    cf.cond_br %arg0, ^bb1, ^bb2(%arg1 : memref<2xf32>)
  ^bb1:  // pred: ^bb0
    %alloc = memref.alloc() : memref<2xf32>
    test.buffer_based in(%arg1 : memref<2xf32>) out(%alloc : memref<2xf32>)
    cf.br ^bb2(%alloc : memref<2xf32>)
  ^bb2(%0: memref<2xf32>):  // 2 preds: ^bb0, ^bb1
    test.copy(%0, %arg2) : (memref<2xf32>, memref<2xf32>)
    return
  }
}

// -----
module {
  func.func @invCriticalEdge(%arg0: i1, %arg1: memref<2xf32>, %arg2: memref<2xf32>) {
    %alloc = memref.alloc() : memref<2xf32>
    test.buffer_based in(%arg1 : memref<2xf32>) out(%alloc : memref<2xf32>)
    cf.cond_br %arg0, ^bb1, ^bb2(%arg1 : memref<2xf32>)
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%alloc : memref<2xf32>)
  ^bb2(%0: memref<2xf32>):  // 2 preds: ^bb0, ^bb1
    test.copy(%0, %arg2) : (memref<2xf32>, memref<2xf32>)
    return
  }
}

// -----
module {
  func.func @ifElse(%arg0: i1, %arg1: memref<2xf32>, %arg2: memref<2xf32>) {
    %alloc = memref.alloc() : memref<2xf32>
    test.buffer_based in(%arg1 : memref<2xf32>) out(%alloc : memref<2xf32>)
    cf.cond_br %arg0, ^bb1(%arg1, %alloc : memref<2xf32>, memref<2xf32>), ^bb2(%alloc, %arg1 : memref<2xf32>, memref<2xf32>)
  ^bb1(%0: memref<2xf32>, %1: memref<2xf32>):  // pred: ^bb0
    cf.br ^bb3(%0, %1 : memref<2xf32>, memref<2xf32>)
  ^bb2(%2: memref<2xf32>, %3: memref<2xf32>):  // pred: ^bb0
    cf.br ^bb3(%2, %3 : memref<2xf32>, memref<2xf32>)
  ^bb3(%4: memref<2xf32>, %5: memref<2xf32>):  // 2 preds: ^bb1, ^bb2
    %alloc_0 = memref.alloc() : memref<2xf32>
    test.buffer_based in(%4 : memref<2xf32>) out(%alloc_0 : memref<2xf32>)
    test.copy(%alloc_0, %arg2) : (memref<2xf32>, memref<2xf32>)
    return
  }
}

// -----
module {
  func.func @ifElseNoUsers(%arg0: i1, %arg1: memref<2xf32>, %arg2: memref<2xf32>) {
    %alloc = memref.alloc() : memref<2xf32>
    test.buffer_based in(%arg1 : memref<2xf32>) out(%alloc : memref<2xf32>)
    cf.cond_br %arg0, ^bb1(%arg1, %alloc : memref<2xf32>, memref<2xf32>), ^bb2(%alloc, %arg1 : memref<2xf32>, memref<2xf32>)
  ^bb1(%0: memref<2xf32>, %1: memref<2xf32>):  // pred: ^bb0
    cf.br ^bb3(%0, %1 : memref<2xf32>, memref<2xf32>)
  ^bb2(%2: memref<2xf32>, %3: memref<2xf32>):  // pred: ^bb0
    cf.br ^bb3(%2, %3 : memref<2xf32>, memref<2xf32>)
  ^bb3(%4: memref<2xf32>, %5: memref<2xf32>):  // 2 preds: ^bb1, ^bb2
    test.copy(%arg1, %arg2) : (memref<2xf32>, memref<2xf32>)
    return
  }
}

// -----
module {
  func.func @ifElseNested(%arg0: i1, %arg1: memref<2xf32>, %arg2: memref<2xf32>) {
    %alloc = memref.alloc() : memref<2xf32>
    test.buffer_based in(%arg1 : memref<2xf32>) out(%alloc : memref<2xf32>)
    cf.cond_br %arg0, ^bb1(%arg1, %alloc : memref<2xf32>, memref<2xf32>), ^bb2(%alloc, %arg1 : memref<2xf32>, memref<2xf32>)
  ^bb1(%0: memref<2xf32>, %1: memref<2xf32>):  // pred: ^bb0
    cf.br ^bb5(%0, %1 : memref<2xf32>, memref<2xf32>)
  ^bb2(%2: memref<2xf32>, %3: memref<2xf32>):  // pred: ^bb0
    cf.cond_br %arg0, ^bb3(%2 : memref<2xf32>), ^bb4(%3 : memref<2xf32>)
  ^bb3(%4: memref<2xf32>):  // pred: ^bb2
    cf.br ^bb5(%4, %2 : memref<2xf32>, memref<2xf32>)
  ^bb4(%5: memref<2xf32>):  // pred: ^bb2
    cf.br ^bb5(%2, %5 : memref<2xf32>, memref<2xf32>)
  ^bb5(%6: memref<2xf32>, %7: memref<2xf32>):  // 3 preds: ^bb1, ^bb3, ^bb4
    %alloc_0 = memref.alloc() : memref<2xf32>
    test.buffer_based in(%6 : memref<2xf32>) out(%alloc_0 : memref<2xf32>)
    test.copy(%alloc_0, %arg2) : (memref<2xf32>, memref<2xf32>)
    return
  }
}

// -----
module {
  func.func @moving_alloc_and_inserting_missing_dealloc(%arg0: i1, %arg1: memref<2xf32>, %arg2: memref<2xf32>) {
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    %alloc = memref.alloc() : memref<2xf32>
    test.buffer_based in(%arg1 : memref<2xf32>) out(%alloc : memref<2xf32>)
    cf.br ^bb3(%alloc : memref<2xf32>)
  ^bb2:  // pred: ^bb0
    %alloc_0 = memref.alloc() : memref<2xf32>
    test.buffer_based in(%alloc_0 : memref<2xf32>) out(%arg1 : memref<2xf32>)
    cf.br ^bb3(%alloc_0 : memref<2xf32>)
  ^bb3(%0: memref<2xf32>):  // 2 preds: ^bb1, ^bb2
    test.copy(%0, %arg2) : (memref<2xf32>, memref<2xf32>)
    return
  }
}

// -----
module {
  func.func @select_aliases(%arg0: index, %arg1: memref<?xi8>, %arg2: i1) {
    %alloc = memref.alloc(%arg0) : memref<?xi8>
    %alloc_0 = memref.alloc(%arg0) : memref<?xi8>
    %0 = arith.select %arg2, %alloc, %alloc_0 : memref<?xi8>
    test.copy(%0, %arg1) : (memref<?xi8>, memref<?xi8>)
    return
  }
}

// -----
module {
  func.func @select_aliases_not_same_ownership(%arg0: index, %arg1: memref<?xi8>, %arg2: i1) {
    %alloc = memref.alloc(%arg0) : memref<?xi8>
    %alloca = memref.alloca(%arg0) : memref<?xi8>
    %0 = arith.select %arg2, %alloc, %alloca : memref<?xi8>
    cf.br ^bb1(%0 : memref<?xi8>)
  ^bb1(%1: memref<?xi8>):  // pred: ^bb0
    test.copy(%1, %arg1) : (memref<?xi8>, memref<?xi8>)
    return
  }
}

// -----
module {
  func.func @select_captured_in_next_block(%arg0: index, %arg1: memref<?xi8>, %arg2: i1, %arg3: i1) {
    %alloc = memref.alloc(%arg0) : memref<?xi8>
    %alloca = memref.alloca(%arg0) : memref<?xi8>
    %0 = arith.select %arg2, %alloc, %alloca : memref<?xi8>
    cf.cond_br %arg3, ^bb1(%alloc : memref<?xi8>), ^bb1(%arg1 : memref<?xi8>)
  ^bb1(%1: memref<?xi8>):  // 2 preds: ^bb0, ^bb0
    test.copy(%1, %0) : (memref<?xi8>, memref<?xi8>)
    return
  }
}

// -----
module {
  func.func @blocks_not_preordered_by_dominance() {
    cf.br ^bb2
  ^bb1:  // pred: ^bb2
    "test.read_buffer"(%alloc) : (memref<2xi32>) -> ()
    return
  ^bb2:  // pred: ^bb0
    %alloc = memref.alloc() : memref<2xi32>
    cf.br ^bb1
  }
}

// -----
module {
  func.func @region_branch_op_followed_by_cf_br(%arg0: f32) -> f32 {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    %0 = scf.for %arg1 = %c0 to %c10 step %c1 iter_args(%arg2 = %arg0) -> (f32) {
      %1 = arith.addf %arg2, %arg2 : f32
      scf.yield %1 : f32
    }
    cf.br ^bb2
  ^bb2:  // pred: ^bb1
    return %0 : f32
  }
}

