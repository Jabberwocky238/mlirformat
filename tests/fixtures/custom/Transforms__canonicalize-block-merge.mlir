module {
  func.func @return_blocks() {
    "foo.cond_br"()[^bb1, ^bb2] : () -> ()
  ^bb1:  // pred: ^bb0
    return
  ^bb2:  // pred: ^bb0
    return
  }
  func.func @matching_arguments() -> i32 {
    "foo.cond_br"()[^bb1, ^bb2] : () -> ()
  ^bb1(%0: i32):  // pred: ^bb0
    return %0 : i32
  ^bb2(%1: i32):  // pred: ^bb0
    return %1 : i32
  }
  func.func @mismatch_unknown_terminator(%arg0: i32, %arg1: i32) -> i32 {
    "foo.cond_br"()[^bb1, ^bb2] : () -> ()
  ^bb1:  // pred: ^bb0
    return %arg0 : i32
  ^bb2:  // pred: ^bb0
    return %arg1 : i32
  }
  func.func @mismatch_operands(%arg0: i1, %arg1: i32, %arg2: i32) -> i32 {
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    return %arg1 : i32
  ^bb2:  // pred: ^bb0
    return %arg2 : i32
  }
  func.func @mismatch_operands_matching_arguments(%arg0: i1, %arg1: i32, %arg2: i32) -> (i32, i32) {
    cf.cond_br %arg0, ^bb1(%arg2 : i32), ^bb2(%arg1 : i32)
  ^bb1(%0: i32):  // pred: ^bb0
    return %arg1, %0 : i32, i32
  ^bb2(%1: i32):  // pred: ^bb0
    return %arg2, %1 : i32, i32
  }
  func.func @mismatch_argument_uses(%arg0: i1, %arg1: i32, %arg2: i32) -> (i32, i32) {
    cf.cond_br %arg0, ^bb1(%arg2 : i32), ^bb2(%arg1 : i32)
  ^bb1(%0: i32):  // pred: ^bb0
    return %arg1, %0 : i32, i32
  ^bb2(%1: i32):  // pred: ^bb0
    return %1, %arg2 : i32, i32
  }
  func.func @mismatch_argument_types(%arg0: i1, %arg1: i32, %arg2: i16) {
    cf.cond_br %arg0, ^bb1(%arg1 : i32), ^bb2(%arg2 : i16)
  ^bb1(%0: i32):  // pred: ^bb0
    "foo.return"(%0) : (i32) -> ()
  ^bb2(%1: i16):  // pred: ^bb0
    "foo.return"(%1) : (i16) -> ()
  }
  func.func @mismatch_argument_count(%arg0: i1, %arg1: i32) {
    cf.cond_br %arg0, ^bb1(%arg1 : i32), ^bb2
  ^bb1(%0: i32):  // pred: ^bb0
    "foo.return"(%0) : (i32) -> ()
  ^bb2:  // pred: ^bb0
    "foo.return"() : () -> ()
  }
  func.func @mismatch_operations(%arg0: i1) {
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    "foo.return"() : () -> ()
  ^bb2:  // pred: ^bb0
    return
  }
  func.func @mismatch_operation_count(%arg0: i1) {
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    "foo.op"() : () -> ()
    return
  ^bb2:  // pred: ^bb0
    return
  }
  func.func @contains_regions(%arg0: i1) {
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    scf.if %arg0 {
      "foo.op"() : () -> ()
    }
    return
  ^bb2:  // pred: ^bb0
    scf.if %arg0 {
      "foo.op"() : () -> ()
    }
    return
  }
  func.func @mismatch_loop(%arg0: i1, %arg1: i1) {
    %0 = "foo.op"() : () -> i1
    cf.cond_br %arg0, ^bb2, ^bb3
  ^bb1:  // 2 preds: ^bb1, ^bb2
    cf.cond_br %0, ^bb1, ^bb3
  ^bb2:  // pred: ^bb0
    cf.cond_br %arg1, ^bb1, ^bb3
  ^bb3:  // 3 preds: ^bb0, ^bb1, ^bb2
    return
  }
  func.func @mismatch_operand_types(%arg0: i1, %arg1: memref<i32>, %arg2: memref<i1>) {
    %c0_i32 = arith.constant 0 : i32
    %true = arith.constant true
    cf.br ^bb1
  ^bb1:  // 3 preds: ^bb0, ^bb2, ^bb3
    cf.cond_br %arg0, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    memref.store %c0_i32, %arg1[] : memref<i32>
    cf.br ^bb1
  ^bb3:  // pred: ^bb1
    memref.store %true, %arg2[] : memref<i1>
    cf.br ^bb1
  }
  func.func private @print(i32, i32)
  func.func @nomerge(%arg0: i32, %arg1: i32) {
    %c1_i32 = arith.constant 1 : i32
    %0 = arith.cmpi slt, %arg1, %arg0 : i32
    cf.cond_br %0, ^bb1, ^bb4
  ^bb1:  // pred: ^bb0
    %1 = arith.addi %arg1, %c1_i32 : i32
    cf.br ^bb3(%1 : i32)
  ^bb2:  // pred: ^bb3
    %2 = arith.addi %3, %c1_i32 : i32
    cf.br ^bb3(%2 : i32)
  ^bb3(%3: i32):  // 2 preds: ^bb1, ^bb2
    %4 = arith.cmpi slt, %3, %arg0 : i32
    call @print(%3, %1) : (i32, i32) -> ()
    cf.cond_br %4, ^bb2, ^bb4
  ^bb4:  // 2 preds: ^bb0, ^bb3
    return
  }
  func.func @mismatch_dominance() -> i32 {
    %0 = "test.producing_br"()[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 0, 0>}> : () -> i32
  ^bb1:  // pred: ^bb0
    "test.br"(%0)[^bb4] : (i32) -> ()
  ^bb2:  // pred: ^bb0
    %1 = "foo.def"() : () -> i32
    "test.br"()[^bb3] : () -> ()
  ^bb3:  // pred: ^bb2
    "test.br"(%1)[^bb4] : (i32) -> ()
  ^bb4(%2: i32):  // 2 preds: ^bb1, ^bb3
    return %2 : i32
  }
  func.func @dead_dealloc_fold_multi_use(%arg0: i1) {
    %alloc = memref.alloc() : memref<4xf32>
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    memref.dealloc %alloc : memref<4xf32>
    return
  ^bb2:  // pred: ^bb0
    memref.dealloc %alloc : memref<4xf32>
    return
  }
  func.func @nested_loop(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i1) {
    "test.foo_br"(%arg0, %arg4)[^bb2] : (i32, i32) -> ()
  ^bb1:  // 2 preds: ^bb2, ^bb3
    "test.foo_br2"(%0)[^bb4, ^bb2, ^bb3] : (i32) -> ()
  ^bb2(%0: i32):  // 2 preds: ^bb0, ^bb1
    %1 = "test.bar"(%0) : (i32) -> i32
    cf.br ^bb1
  ^bb3(%2: i32):  // pred: ^bb1
    %3 = "test.bar"(%2) : (i32) -> i32
    cf.br ^bb1
  ^bb4:  // pred: ^bb1
    return
  }
  func.func @produced_operand_not_dropped(%arg0: i1) -> i32 {
    %c42_i32 = arith.constant 42 : i32
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    "test.internal_br"(%c42_i32)[^bb3, ^bb4] <{operandSegmentSizes = array<i32: 0, 1>}> : (i32) -> ()
  ^bb2:  // pred: ^bb0
    "test.internal_br"(%c42_i32)[^bb3, ^bb4] <{operandSegmentSizes = array<i32: 0, 1>}> : (i32) -> ()
  ^bb3:  // 2 preds: ^bb1, ^bb2
    "test.terminator"() : () -> ()
  ^bb4(%0: i32, %1: i32):  // 2 preds: ^bb1, ^bb2
    %2 = arith.addi %0, %1 : i32
    return %2 : i32
  }
}

