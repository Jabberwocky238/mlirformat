module {
  func.func @assert_true() {
    %true = arith.constant true
    cf.assert %true, "Computer says no"
    return
  }
}

// -----
module {
  func.func @cf.assert(%arg0: i1) {
    cf.assert %arg0, "Computer says no"
    return
  }
}

// -----
module {
  func.func @branchCondProp(%arg0: i1) {
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    "test.consumer1"(%arg0) : (i1) -> ()
    cf.br ^bb3
  ^bb2:  // pred: ^bb0
    "test.consumer2"(%arg0) : (i1) -> ()
    cf.br ^bb3
  ^bb3:  // 2 preds: ^bb1, ^bb2
    return
  }
}

// -----
module {
  func.func @cycle_2_blocks() {
    cf.br ^bb1
  ^bb1:  // 2 preds: ^bb0, ^bb2
    cf.br ^bb2
  ^bb2:  // pred: ^bb1
    cf.br ^bb1
  }
  func.func @no_cycle_2_blocks() -> i32 {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2
  ^bb2:  // pred: ^bb1
    cf.br ^bb3
  ^bb3:  // pred: ^bb2
    %c1_i32 = arith.constant 1 : i32
    return %c1_i32 : i32
  }
  func.func @cycle_4_blocks() {
    cf.br ^bb1
  ^bb1:  // 2 preds: ^bb0, ^bb4
    cf.br ^bb2
  ^bb2:  // pred: ^bb1
    cf.br ^bb3
  ^bb3:  // pred: ^bb2
    cf.br ^bb4
  ^bb4:  // pred: ^bb3
    cf.br ^bb1
  }
  func.func @no_cycle_4_blocks() -> i32 {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2
  ^bb2:  // pred: ^bb1
    cf.br ^bb3
  ^bb3:  // pred: ^bb2
    cf.br ^bb4
  ^bb4:  // pred: ^bb3
    cf.br ^bb5
  ^bb5:  // pred: ^bb4
    %c1_i32 = arith.constant 1 : i32
    return %c1_i32 : i32
  }
  func.func @delayed_3_cycle() {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2
  ^bb2:  // pred: ^bb1
    cf.br ^bb3
  ^bb3:  // 2 preds: ^bb2, ^bb5
    cf.br ^bb4
  ^bb4:  // pred: ^bb3
    cf.br ^bb5
  ^bb5:  // pred: ^bb4
    cf.br ^bb3
  }
  func.func @cycle_1_block() {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2
  ^bb2:  // 2 preds: ^bb1, ^bb2
    cf.br ^bb2
  }
  func.func @unsimplified_cycle_1(%arg0: i1) {
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    cf.br ^bb2
  ^bb2:  // 2 preds: ^bb0, ^bb1
    cf.br ^bb3
  ^bb3:  // 2 preds: ^bb2, ^bb4
    cf.br ^bb4
  ^bb4:  // pred: ^bb3
    cf.br ^bb3
  }
  func.func @unsimplified_cycle_2(%arg0: i1) {
    cf.cond_br %arg0, ^bb1, ^bb7
  ^bb1:  // 2 preds: ^bb0, ^bb7
    cf.br ^bb2 {F}
  ^bb2:  // pred: ^bb1
    cf.br ^bb3 {A}
  ^bb3:  // 2 preds: ^bb2, ^bb6
    cf.br ^bb4 {B}
  ^bb4:  // pred: ^bb3
    cf.br ^bb5 {C}
  ^bb5:  // pred: ^bb4
    cf.br ^bb6 {D}
  ^bb6:  // pred: ^bb5
    cf.br ^bb3 {E}
  ^bb7:  // pred: ^bb0
    cf.br ^bb1
  }
  func.func @drop_unreachable_branch_1(%arg0: i1) {
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    "test.foo"() : () -> ()
    return
  ^bb2:  // pred: ^bb0
    ub.unreachable
  }
  func.func @drop_unreachable_branch_2(%arg0: i1) {
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    ub.unreachable
  ^bb2:  // pred: ^bb0
    ub.unreachable
  }
}

// -----
module {
  func.func @no_merge_self_arg_loop(%arg0: i1) -> i1 {
    %true = arith.constant true
    cf.br ^bb1(%true : i1)
  ^bb1(%0: i1):  // pred: ^bb0
    cf.cond_br %0, ^bb4(%true : i1), ^bb2(%arg0, %true : i1, i1)
  ^bb2(%1: i1, %2: i1):  // 2 preds: ^bb1, ^bb3
    cf.cond_br %1, ^bb3, ^bb4(%2 : i1)
  ^bb3:  // pred: ^bb2
    cf.br ^bb2(%arg0, %2 : i1, i1)
  ^bb4(%3: i1):  // 2 preds: ^bb1, ^bb2
    return %3 : i1
  }
  func.func @fold_uniform_branch_block_arg(%arg0: i1, %arg1: i32) -> i32 {
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    "foo.op"() : () -> ()
    cf.br ^bb3(%arg1 : i32)
  ^bb2:  // pred: ^bb0
    "foo.op"() : () -> ()
    cf.br ^bb3(%arg1 : i32)
  ^bb3(%0: i32):  // 2 preds: ^bb1, ^bb2
    return %0 : i32
  }
  func.func @no_fold_non_uniform_block_arg(%arg0: i1, %arg1: i32, %arg2: i32) -> i32 {
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    "foo.op"() : () -> ()
    cf.br ^bb3(%arg1 : i32)
  ^bb2:  // pred: ^bb0
    "foo.op"() : () -> ()
    cf.br ^bb3(%arg2 : i32)
  ^bb3(%0: i32):  // 2 preds: ^bb1, ^bb2
    return %0 : i32
  }
  func.func @no_fold_same_dest_different_args(%arg0: i32, %arg1: i32) -> i32 {
    %0 = "test.producing_br"(%arg0, %arg1)[^bb1, ^bb1] <{operandSegmentSizes = array<i32: 1, 1>}> : (i32, i32) -> i32
  ^bb1(%1: i32):  // 2 preds: ^bb0, ^bb0
    return %1 : i32
  }
  func.func @fold_same_dest_same_args(%arg0: i32) -> i32 {
    %0 = "test.producing_br"(%arg0, %arg0)[^bb1, ^bb1] <{operandSegmentSizes = array<i32: 1, 1>}> : (i32, i32) -> i32
  ^bb1(%1: i32):  // 2 preds: ^bb0, ^bb0
    return %1 : i32
  }
  func.func @no_fold_unknown_terminator(%arg0: i32) -> i32 {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    "foo.two_successors"()[^bb2, ^bb3] : () -> ()
  ^bb2:  // pred: ^bb1
    cf.br ^bb3(%arg0 : i32)
  ^bb3(%0: i32):  // 2 preds: ^bb1, ^bb2
    return %0 : i32
  }
  func.func @skip_unused_block_arg(%arg0: i32, %arg1: i32, %arg2: i32) -> i32 {
    "foo.pred"()[^bb1, ^bb2] : () -> ()
  ^bb1:  // pred: ^bb0
    cf.br ^bb3(%arg2, %arg1 : i32, i32)
  ^bb2:  // pred: ^bb0
    cf.br ^bb3(%arg1, %arg1 : i32, i32)
  ^bb3(%0: i32, %1: i32):  // 2 preds: ^bb1, ^bb2
    "foo.use"(%0) : (i32) -> ()
    return %1 : i32
  }
}

