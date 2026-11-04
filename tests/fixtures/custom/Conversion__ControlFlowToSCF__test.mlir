module {
  func.func @simple_if() {
    %0 = "test.test1"() : () -> i1
    cf.cond_br %0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    "test.test2"() : () -> ()
    cf.br ^bb3
  ^bb2:  // pred: ^bb0
    "test.test3"() : () -> ()
    cf.br ^bb3
  ^bb3:  // 2 preds: ^bb1, ^bb2
    "test.test4"() : () -> ()
    return
  }
}

// -----
module {
  func.func @if_with_block_args() -> index {
    %0 = "test.test1"() : () -> i1
    cf.cond_br %0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    %1 = "test.test2"() : () -> index
    cf.br ^bb3(%1 : index)
  ^bb2:  // pred: ^bb0
    %2 = "test.test3"() : () -> index
    cf.br ^bb3(%2 : index)
  ^bb3(%3: index):  // 2 preds: ^bb1, ^bb2
    "test.test4"() : () -> ()
    return %3 : index
  }
}

// -----
module {
  func.func @empty_else() {
    %0 = "test.test1"() : () -> i1
    cf.cond_br %0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    "test.test2"() : () -> ()
    cf.br ^bb2
  ^bb2:  // 2 preds: ^bb0, ^bb1
    "test.test4"() : () -> ()
    return
  }
}

// -----
module {
  func.func @while_loop() {
    "test.test1"() : () -> ()
    cf.br ^bb1
  ^bb1:  // 2 preds: ^bb0, ^bb2
    %0 = "test.test2"() : () -> i1
    cf.cond_br %0, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    "test.test3"() : () -> ()
    cf.br ^bb1
  ^bb3:  // pred: ^bb1
    "test.test4"() : () -> ()
    return
  }
}

// -----
module {
  func.func @while_loop_with_block_args() -> i64 {
    %0 = "test.test1"() : () -> index
    cf.br ^bb1(%0 : index)
  ^bb1(%1: index):  // 2 preds: ^bb0, ^bb2
    %2:2 = "test.test2"() : () -> (i1, i64)
    cf.cond_br %2#0, ^bb2(%2#1 : i64), ^bb3(%2#1 : i64)
  ^bb2(%3: i64):  // pred: ^bb1
    %4 = "test.test3"(%3) : (i64) -> index
    cf.br ^bb1(%4 : index)
  ^bb3(%5: i64):  // pred: ^bb1
    "test.test4"() : () -> ()
    return %5 : i64
  }
}

// -----
module {
  func.func @multi_exit_loop() {
    "test.test1"() : () -> ()
    cf.br ^bb1
  ^bb1:  // 2 preds: ^bb0, ^bb2
    %0 = "test.test2"() : () -> i1
    cf.cond_br %0, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    %1 = "test.test3"() : () -> i1
    cf.cond_br %1, ^bb3, ^bb1
  ^bb3:  // 2 preds: ^bb1, ^bb2
    "test.test4"() : () -> ()
    return
  }
}

// -----
module {
  func.func private @foo(f32) -> f32
  func.func private @bar(f32)
  func.func @switch_with_fallthrough(%arg0: i32, %arg1: f32, %arg2: f32) {
    cf.switch %arg0 : i32, [
      default: ^bb1(%arg1 : f32),
      0: ^bb2(%arg2 : f32),
      1: ^bb3
    ]
  ^bb1(%0: f32):  // pred: ^bb0
    %1 = call @foo(%0) : (f32) -> f32
    cf.br ^bb2(%1 : f32)
  ^bb2(%2: f32):  // 2 preds: ^bb0, ^bb1
    call @bar(%2) : (f32) -> ()
    cf.br ^bb3
  ^bb3:  // 2 preds: ^bb0, ^bb2
    return
  }
}

// -----
module {
  func.func private @bar(f32) -> (i1, f32)
  func.func @already_structured_loop(%arg0: f32) -> f32 {
    cf.br ^bb1
  ^bb1:  // 2 preds: ^bb0, ^bb1
    %0:2 = call @bar(%arg0) : (f32) -> (i1, f32)
    cf.cond_br %0#0, ^bb2, ^bb1
  ^bb2:  // pred: ^bb1
    return %0#1 : f32
  }
}

// -----
module {
  func.func private @bar(f32) -> (i1, f32)
  func.func @exit_loop_iter_use(%arg0: f32) -> f32 {
    cf.br ^bb1(%arg0 : f32)
  ^bb1(%0: f32):  // 2 preds: ^bb0, ^bb1
    %1:2 = call @bar(%0) : (f32) -> (i1, f32)
    cf.cond_br %1#0, ^bb2, ^bb1(%1#1 : f32)
  ^bb2:  // pred: ^bb1
    return %0 : f32
  }
}

// -----
module {
  func.func private @bar(f32) -> f32
  func.func @infinite_loop(%arg0: f32) -> f32 {
    cf.br ^bb1(%arg0 : f32)
  ^bb1(%0: f32):  // 2 preds: ^bb0, ^bb1
    %1 = call @bar(%0) : (f32) -> f32
    cf.br ^bb1(%1 : f32)
  }
}

// -----
module {
  func.func @multi_return() -> i32 {
    %0 = "test.test1"() : () -> i1
    cf.cond_br %0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    %1 = "test.test2"() : () -> i32
    return %1 : i32
  ^bb2:  // pred: ^bb0
    %2 = "test.test4"() : () -> i32
    return %2 : i32
  }
}

// -----
module {
  func.func private @bar(f32) -> f32
  func.func @conditional_infinite_loop(%arg0: f32, %arg1: i1) -> f32 {
    cf.cond_br %arg1, ^bb1(%arg0 : f32), ^bb2
  ^bb1(%0: f32):  // 2 preds: ^bb0, ^bb1
    %1 = call @bar(%0) : (f32) -> f32
    cf.br ^bb1(%1 : f32)
  ^bb2:  // pred: ^bb0
    return %arg0 : f32
  }
}

// -----
module {
  func.func private @bar(i32)
  func.func @mixing_return_like(%arg0: i1, %arg1: i1, %arg2: i1) {
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    cf.cond_br %arg0, ^bb1, ^bb3
  ^bb1:  // pred: ^bb0
    cf.cond_br %arg1, ^bb2(%c0_i32 : i32), ^bb2(%c1_i32 : i32)
  ^bb2(%0: i32):  // 2 preds: ^bb1, ^bb1
    call @bar(%0) : (i32) -> ()
    "test.returnLike"() : () -> ()
  ^bb3:  // pred: ^bb0
    cf.cond_br %arg2, ^bb4(%c1_i32 : i32), ^bb4(%c0_i32 : i32)
  ^bb4(%1: i32):  // 2 preds: ^bb3, ^bb3
    call @bar(%1) : (i32) -> ()
    return
  }
}

// -----
module {
  func.func @some_successors_with_different_return(%arg0: i32) -> i32 {
    %c5_i32 = arith.constant 5 : i32
    %c6_i32 = arith.constant 6 : i32
    cf.switch %arg0 : i32, [
      default: ^bb1,
      0: ^bb2(%c5_i32 : i32),
      1: ^bb2(%c6_i32 : i32)
    ]
  ^bb1:  // pred: ^bb0
    "test.returnLike"() : () -> ()
  ^bb2(%0: i32):  // 3 preds: ^bb0, ^bb0, ^bb2
    cf.br ^bb2(%0 : i32)
  }
}

// -----
module {
  func.func @select_like(%arg0: i1) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    cf.cond_br %arg0, ^bb1(%c0_i32 : i32), ^bb1(%c1_i32 : i32)
  ^bb1(%0: i32):  // 2 preds: ^bb0, ^bb0
    return %0 : i32
  }
}

// -----
module {
  func.func @return_like_dominated_by_condition(%arg0: i1, %arg1: i1, %arg2: i1) {
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    return
  ^bb2:  // pred: ^bb0
    cf.cond_br %arg1, ^bb3, ^bb4
  ^bb3:  // 2 preds: ^bb2, ^bb4
    "test.unreachable"() : () -> ()
  ^bb4:  // pred: ^bb2
    cf.cond_br %arg2, ^bb3, ^bb5
  ^bb5:  // pred: ^bb4
    return
  }
}

// -----
module {
  func.func @dominator_issue(%arg0: i1, %arg1: i1) -> i32 {
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // 2 preds: ^bb0, ^bb2
    "test.unreachable"() : () -> ()
  ^bb2:  // pred: ^bb0
    %0 = "test.def"() : () -> i32
    cf.cond_br %arg1, ^bb1, ^bb3
  ^bb3:  // pred: ^bb2
    return %0 : i32
  }
}

// -----
module {
  func.func private @bar(i32)
  func.func @dominator_issue_loop(%arg0: i1, %arg1: i1) -> i32 {
    %c5_i32 = arith.constant 5 : i32
    cf.br ^bb1
  ^bb1:  // 2 preds: ^bb0, ^bb2
    cf.cond_br %arg0, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    %0 = "test.def"() : () -> i32
    cf.cond_br %arg1, ^bb1, ^bb4
  ^bb3:  // pred: ^bb1
    return %c5_i32 : i32
  ^bb4:  // pred: ^bb2
    return %0 : i32
  }
}

// -----
module {
  func.func private @comp1(i32) -> i1
  func.func private @comp2(i32) -> i1
  func.func private @foo(i32)
  func.func @multi_entry_loop(%arg0: i1) {
    %c6_i32 = arith.constant 6 : i32
    %c5_i32 = arith.constant 5 : i32
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // 2 preds: ^bb0, ^bb2
    %0 = call @comp1(%c6_i32) : (i32) -> i1
    cf.cond_br %0, ^bb3(%c6_i32 : i32), ^bb2
  ^bb2:  // 2 preds: ^bb0, ^bb1
    %1 = call @comp2(%c5_i32) : (i32) -> i1
    cf.cond_br %1, ^bb3(%c5_i32 : i32), ^bb1
  ^bb3(%2: i32):  // 2 preds: ^bb1, ^bb2
    call @foo(%2) : (i32) -> ()
    return
  }
}

// -----
module {
  func.func @nested_region() {
    scf.execute_region {
      %0 = "test.test1"() : () -> i1
      cf.cond_br %0, ^bb1, ^bb2
    ^bb1:  // pred: ^bb0
      "test.test2"() : () -> ()
      cf.br ^bb3
    ^bb2:  // pred: ^bb0
      "test.test3"() : () -> ()
      cf.br ^bb3
    ^bb3:  // 2 preds: ^bb1, ^bb2
      "test.test4"() : () -> ()
      scf.yield
    }
    return
  }
}

// -----
module {
  func.func @nested_region_inside_loop_use() {
    cf.br ^bb1
  ^bb1:  // 2 preds: ^bb0, ^bb1
    %0 = "test.test1"() : () -> i32
    scf.execute_region {
      "test.foo"(%0) : (i32) -> ()
      scf.yield
    }
    cf.br ^bb1
  }
}

// -----
module {
  func.func @nested_region_outside_loop_use() {
    cf.br ^bb1
  ^bb1:  // 2 preds: ^bb0, ^bb1
    %0 = "test.test1"() : () -> i32
    %1 = "test.test2"() : () -> i1
    cf.cond_br %1, ^bb1, ^bb2
  ^bb2:  // pred: ^bb1
    scf.execute_region {
      "test.foo"(%0) : (i32) -> ()
      scf.yield
    }
    return
  }
}

