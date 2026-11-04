module {
  func.func @simple_branch(%arg0: vector<[4]x[4]xf32>) {
    cf.br ^bb1(%arg0 : vector<[4]x[4]xf32>)
  ^bb1(%0: vector<[4]x[4]xf32>):  // pred: ^bb0
    return
  }
}

// -----
module {
  func.func @cond_branch(%arg0: i1, %arg1: vector<[4]x[4]xf32>) {
    cf.cond_br %arg0, ^bb1(%arg1 : vector<[4]x[4]xf32>), ^bb2
  ^bb1(%0: vector<[4]x[4]xf32>):  // pred: ^bb0
    return
  ^bb2:  // pred: ^bb0
    return
  }
}

// -----
module {
  func.func @cond_branch_with_backedge(%arg0: vector<[4]x[4]xf32>, %arg1: vector<[4]x[4]xf32>, %arg2: vector<[4]x[4]xf32>, %arg3: vector<[4]x[4]xf32>, %arg4: vector<[4]xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    cf.br ^bb1(%c0, %arg0 : index, vector<[4]x[4]xf32>)
  ^bb1(%0: index, %1: vector<[4]x[4]xf32>):  // 2 preds: ^bb0, ^bb2
    %2 = arith.cmpi slt, %0, %c10 : index
    cf.cond_br %2, ^bb2, ^bb3(%1, %arg1, %arg2, %arg3 : vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>)
  ^bb2:  // pred: ^bb1
    %3 = arm_sme.insert_tile_slice %arg4, %1[%0] : vector<[4]xf32> into vector<[4]x[4]xf32>
    %4 = arith.addi %0, %c1 : index
    cf.br ^bb1(%4, %3 : index, vector<[4]x[4]xf32>)
  ^bb3(%5: vector<[4]x[4]xf32>, %6: vector<[4]x[4]xf32>, %7: vector<[4]x[4]xf32>, %8: vector<[4]x[4]xf32>):  // pred: ^bb1
    return
  }
}

// -----
module {
  func.func @tile_dominance(%arg0: vector<[4]x[4]xf32>) {
    cf.br ^bb1
  ^bb1:  // 2 preds: ^bb0, ^bb4
    "test.some_use"(%arg0) : (vector<[4]x[4]xf32>) -> ()
    return
  ^bb2:  // no predecessors
    %0 = arm_sme.get_tile : vector<[4]x[4]xf32>
    cf.br ^bb3
  ^bb3:  // pred: ^bb2
    "test.some_use"(%0) : (vector<[4]x[4]xf32>) -> ()
    return
  ^bb4:  // no predecessors
    cf.br ^bb1
  ^bb5:  // no predecessors
    return
  }
}

// -----
module {
  func.func @cond_branch_true_and_false_tile_args(%arg0: i1, %arg1: vector<[4]x[4]xf32>) {
    cf.cond_br %arg0, ^bb1(%arg1 : vector<[4]x[4]xf32>), ^bb2(%arg1 : vector<[4]x[4]xf32>)
  ^bb1(%0: vector<[4]x[4]xf32>):  // pred: ^bb0
    return
  ^bb2(%1: vector<[4]x[4]xf32>):  // pred: ^bb0
    return
  }
}

// -----
module {
  func.func @multiple_predecessors(%arg0: i1) {
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    %0 = arm_sme.get_tile : vector<[4]x[4]xf32>
    cf.br ^bb3(%0 : vector<[4]x[4]xf32>)
  ^bb2:  // pred: ^bb0
    %1 = arm_sme.zero : vector<[4]x[4]xf32>
    cf.br ^bb3(%1 : vector<[4]x[4]xf32>)
  ^bb3(%2: vector<[4]x[4]xf32>):  // 2 preds: ^bb1, ^bb2
    return
  }
}

