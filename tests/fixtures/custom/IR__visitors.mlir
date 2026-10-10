module {
  func.func @structured_cfg() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    scf.for %arg0 = %c1 to %c10 step %c1 {
      %0 = "use0"(%arg0) : (index) -> i1
      scf.if %0 {
        "use1"(%arg0) : (index) -> ()
      } else {
        "use2"(%arg0) : (index) -> ()
      }
      "use3"(%arg0) : (index) -> ()
    } {walk_blocks, walk_regions}
    return
  }
}

// -----
module {
  func.func @unstructured_cfg() {
    "regionOp0"() ({
      "op0"() : () -> ()
      cf.br ^bb2
    ^bb1:  // no predecessors
      "op1"() : () -> ()
      cf.br ^bb2
    ^bb2:  // 2 preds: ^bb0, ^bb1
      "op2"() : () -> ()
    }) : () -> ()
    return
  }
}

// -----
module {
  func.func @unordered_cfg_with_loop() {
    "regionOp0"() ({
      %0 = "op0"() : () -> i1
      cf.cond_br %0, ^bb2, ^bb3
    ^bb1:  // pred: ^bb2
      "op1"(%1) : (i32) -> ()
      cf.br ^bb5
    ^bb2:  // 3 preds: ^bb0, ^bb3, ^bb4
      %1 = "op2"() : () -> i32
      cf.br ^bb1
    ^bb3:  // pred: ^bb0
      "op3"() : () -> ()
      cf.br ^bb2
    ^bb4:  // no predecessors
      "op4"() : () -> ()
      cf.br ^bb2
    ^bb5:  // pred: ^bb1
      "op5"() : () -> ()
      cf.br ^bb7
    ^bb6:  // pred: ^bb6
      "op6"() : () -> ()
      cf.br ^bb6
    ^bb7:  // pred: ^bb5
      "op7"() : () -> ()
    }) : () -> ()
    return
  }
}

