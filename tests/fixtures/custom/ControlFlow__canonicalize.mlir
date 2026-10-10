module {
  func.func @br_folding() -> i32 {
    %c0_i32 = arith.constant 0 : i32
    cf.br ^bb1(%c0_i32 : i32)
  ^bb1(%0: i32):  // pred: ^bb0
    return %0 : i32
  }
  func.func @br_passthrough(%arg0: i32, %arg1: i32) -> (i32, i32) {
    "foo.switch"()[^bb1, ^bb2, ^bb3] : () -> ()
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%arg0 : i32)
  ^bb2(%0: i32):  // 2 preds: ^bb0, ^bb1
    cf.br ^bb3(%0, %arg1 : i32, i32)
  ^bb3(%1: i32, %2: i32):  // 2 preds: ^bb0, ^bb2
    return %1, %2 : i32, i32
  }
  func.func @cond_br_folding(%arg0: i1, %arg1: i32) {
    %false = arith.constant false
    %true = arith.constant true
    cf.cond_br %arg0, ^bb1, ^bb2(%arg1 : i32)
  ^bb1:  // pred: ^bb0
    cf.cond_br %true, ^bb3, ^bb2(%arg1 : i32)
  ^bb2(%0: i32):  // 3 preds: ^bb0, ^bb1, ^bb2
    cf.cond_br %false, ^bb2(%0 : i32), ^bb3
  ^bb3:  // 2 preds: ^bb1, ^bb2
    return
  }
  func.func @cond_br_same_successor(%arg0: i1, %arg1: i32) {
    cf.cond_br %arg0, ^bb1(%arg1 : i32), ^bb1(%arg1 : i32)
  ^bb1(%0: i32):  // 2 preds: ^bb0, ^bb0
    return
  }
  func.func @cond_br_same_successor_insert_select(%arg0: i1, %arg1: i32, %arg2: i32, %arg3: tensor<2xi32>, %arg4: tensor<2xi32>) -> (i32, tensor<2xi32>) {
    cf.cond_br %arg0, ^bb1(%arg1, %arg3 : i32, tensor<2xi32>), ^bb1(%arg2, %arg4 : i32, tensor<2xi32>)
  ^bb1(%0: i32, %1: tensor<2xi32>):  // 2 preds: ^bb0, ^bb0
    return %0, %1 : i32, tensor<2xi32>
  }
  func.func @cond_br_and_br_folding(%arg0: i32) {
    %false = arith.constant false
    %true = arith.constant true
    cf.cond_br %true, ^bb2, ^bb1(%arg0 : i32)
  ^bb1(%0: i32):  // 2 preds: ^bb0, ^bb1
    cf.cond_br %false, ^bb1(%0 : i32), ^bb2
  ^bb2:  // 2 preds: ^bb0, ^bb1
    return
  }
  func.func @cond_br_passthrough_weights(%arg0: i32, %arg1: i32, %arg2: i1) -> i32 {
    cf.cond_br %arg2 weights([30, 70]), ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    cf.br ^bb3
  ^bb2:  // pred: ^bb0
    cf.br ^bb4
  ^bb3:  // pred: ^bb1
    return %arg0 : i32
  ^bb4:  // pred: ^bb2
    return %arg1 : i32
  }
  func.func @cond_br_passthrough(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i1) -> (i32, i32) {
    cf.cond_br %arg3, ^bb1(%arg0 : i32), ^bb2(%arg2, %arg2 : i32, i32)
  ^bb1(%0: i32):  // pred: ^bb0
    cf.br ^bb2(%0, %arg1 : i32, i32)
  ^bb2(%1: i32, %2: i32):  // 2 preds: ^bb0, ^bb1
    return %1, %2 : i32, i32
  }
  func.func @cond_br_pass_through_fail(%arg0: i1) {
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    "foo.op"() : () -> ()
    cf.br ^bb2
  ^bb2:  // 2 preds: ^bb0, ^bb1
    return
  }
  func.func @switch_only_default(%arg0: i32, %arg1: f32) {
    "foo.pred"()[^bb1, ^bb2] : () -> ()
  ^bb1:  // pred: ^bb0
    cf.switch %arg0 : i32, [
      default: ^bb2(%arg1 : f32)]
  ^bb2(%0: f32):  // 2 preds: ^bb0, ^bb1
    "foo.bb2Terminator"(%0) : (f32) -> ()
  }
  func.func @switch_case_matching_default(%arg0: i32, %arg1: f32, %arg2: f32) {
    "foo.pred"()[^bb1, ^bb2, ^bb3] : () -> ()
  ^bb1:  // pred: ^bb0
    cf.switch %arg0 : i32, [
      default: ^bb2(%arg1 : f32),
      42: ^bb2(%arg1 : f32),
      10: ^bb3(%arg2 : f32),
      17: ^bb2(%arg1 : f32)
    ]
  ^bb2(%0: f32):  // 4 preds: ^bb0, ^bb1, ^bb1, ^bb1
    "foo.bb2Terminator"(%0) : (f32) -> ()
  ^bb3(%1: f32):  // 2 preds: ^bb0, ^bb1
    "foo.bb3Terminator"(%1) : (f32) -> ()
  }
  func.func @switch_on_const_no_match(%arg0: f32, %arg1: f32, %arg2: f32) {
    "foo.pred"()[^bb1, ^bb2, ^bb3, ^bb4] : () -> ()
  ^bb1:  // pred: ^bb0
    %c0_i32 = arith.constant 0 : i32
    cf.switch %c0_i32 : i32, [
      default: ^bb2(%arg0 : f32),
      4294967295: ^bb3(%arg1 : f32),
      1: ^bb4(%arg2 : f32)
    ]
  ^bb2(%0: f32):  // 2 preds: ^bb0, ^bb1
    "foo.bb2Terminator"(%0) : (f32) -> ()
  ^bb3(%1: f32):  // 2 preds: ^bb0, ^bb1
    "foo.bb3Terminator"(%1) : (f32) -> ()
  ^bb4(%2: f32):  // 2 preds: ^bb0, ^bb1
    "foo.bb4Terminator"(%2) : (f32) -> ()
  }
  func.func @switch_on_const_with_match(%arg0: f32, %arg1: f32, %arg2: f32) {
    "foo.pred"()[^bb1, ^bb2, ^bb3, ^bb4] : () -> ()
  ^bb1:  // pred: ^bb0
    %c1_i32 = arith.constant 1 : i32
    cf.switch %c1_i32 : i32, [
      default: ^bb2(%arg0 : f32),
      4294967295: ^bb3(%arg1 : f32),
      1: ^bb4(%arg2 : f32)
    ]
  ^bb2(%0: f32):  // 2 preds: ^bb0, ^bb1
    "foo.bb2Terminator"(%0) : (f32) -> ()
  ^bb3(%1: f32):  // 2 preds: ^bb0, ^bb1
    "foo.bb3Terminator"(%1) : (f32) -> ()
  ^bb4(%2: f32):  // 2 preds: ^bb0, ^bb1
    "foo.bb4Terminator"(%2) : (f32) -> ()
  }
  func.func @switch_passthrough(%arg0: i32, %arg1: f32, %arg2: f32, %arg3: f32, %arg4: f32) {
    "foo.pred"()[^bb1, ^bb2, ^bb3, ^bb4, ^bb5, ^bb6] : () -> ()
  ^bb1:  // pred: ^bb0
    cf.switch %arg0 : i32, [
      default: ^bb2(%arg1 : f32),
      43: ^bb3(%arg2 : f32),
      44: ^bb4(%arg3 : f32)
    ]
  ^bb2(%0: f32):  // 2 preds: ^bb0, ^bb1
    cf.br ^bb5(%0 : f32)
  ^bb3(%1: f32):  // 2 preds: ^bb0, ^bb1
    cf.br ^bb6(%1 : f32)
  ^bb4(%2: f32):  // 2 preds: ^bb0, ^bb1
    "foo.bb4Terminator"(%2) : (f32) -> ()
  ^bb5(%3: f32):  // 2 preds: ^bb0, ^bb2
    "foo.bb5Terminator"(%3) : (f32) -> ()
  ^bb6(%4: f32):  // 2 preds: ^bb0, ^bb3
    "foo.bb6Terminator"(%4) : (f32) -> ()
  }
  func.func @switch_from_switch_with_same_value_with_match(%arg0: i32, %arg1: f32, %arg2: f32) {
    "foo.pred"()[^bb1, ^bb2, ^bb4, ^bb5] : () -> ()
  ^bb1:  // pred: ^bb0
    cf.switch %arg0 : i32, [
      default: ^bb2,
      42: ^bb3
    ]
  ^bb2:  // 2 preds: ^bb0, ^bb1
    "foo.bb2Terminator"() : () -> ()
  ^bb3:  // pred: ^bb1
    "foo.op"() : () -> ()
    cf.switch %arg0 : i32, [
      default: ^bb4(%arg1 : f32),
      42: ^bb5(%arg2 : f32)
    ]
  ^bb4(%0: f32):  // 2 preds: ^bb0, ^bb3
    "foo.bb4Terminator"(%0) : (f32) -> ()
  ^bb5(%1: f32):  // 2 preds: ^bb0, ^bb3
    "foo.bb5Terminator"(%1) : (f32) -> ()
  }
  func.func @switch_from_switch_with_same_value_no_match(%arg0: i32, %arg1: f32, %arg2: f32, %arg3: f32) {
    "foo.pred"()[^bb1, ^bb2, ^bb4, ^bb5, ^bb6] : () -> ()
  ^bb1:  // pred: ^bb0
    cf.switch %arg0 : i32, [
      default: ^bb2,
      42: ^bb3
    ]
  ^bb2:  // 2 preds: ^bb0, ^bb1
    "foo.bb2Terminator"() : () -> ()
  ^bb3:  // pred: ^bb1
    "foo.op"() : () -> ()
    cf.switch %arg0 : i32, [
      default: ^bb4(%arg1 : f32),
      0: ^bb5(%arg2 : f32),
      43: ^bb6(%arg3 : f32)
    ]
  ^bb4(%0: f32):  // 2 preds: ^bb0, ^bb3
    "foo.bb4Terminator"(%0) : (f32) -> ()
  ^bb5(%1: f32):  // 2 preds: ^bb0, ^bb3
    "foo.bb5Terminator"(%1) : (f32) -> ()
  ^bb6(%2: f32):  // 2 preds: ^bb0, ^bb3
    "foo.bb6Terminator"(%2) : (f32) -> ()
  }
  func.func @switch_from_switch_default_with_same_value(%arg0: i32, %arg1: f32, %arg2: f32, %arg3: f32) {
    "foo.pred"()[^bb1, ^bb2, ^bb4, ^bb5, ^bb6] : () -> ()
  ^bb1:  // pred: ^bb0
    cf.switch %arg0 : i32, [
      default: ^bb3,
      42: ^bb2
    ]
  ^bb2:  // 2 preds: ^bb0, ^bb1
    "foo.bb2Terminator"() : () -> ()
  ^bb3:  // pred: ^bb1
    "foo.op"() : () -> ()
    cf.switch %arg0 : i32, [
      default: ^bb4(%arg1 : f32),
      42: ^bb5(%arg2 : f32),
      43: ^bb6(%arg3 : f32)
    ]
  ^bb4(%0: f32):  // 2 preds: ^bb0, ^bb3
    "foo.bb4Terminator"(%0) : (f32) -> ()
  ^bb5(%1: f32):  // 2 preds: ^bb0, ^bb3
    "foo.bb5Terminator"(%1) : (f32) -> ()
  ^bb6(%2: f32):  // 2 preds: ^bb0, ^bb3
    "foo.bb6Terminator"(%2) : (f32) -> ()
  }
  func.func @cond_br_from_cond_br_with_same_condition(%arg0: i1) {
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    cf.cond_br %arg0, ^bb3, ^bb2
  ^bb2:  // 2 preds: ^bb0, ^bb1
    "foo.terminator"() : () -> ()
  ^bb3:  // pred: ^bb1
    return
  }
}

// -----
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

