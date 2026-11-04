module {
  func.func @test_cfg(%arg0: i1) attributes {tag = "test_cfg"} {
    cf.br ^bb1
  ^bb1:  // 2 preds: ^bb0, ^bb1
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb2:  // pred: ^bb1
    return
  }
  func.func @test_region_control_flow(%arg0: i1, %arg1: i64, %arg2: i64) {
    scf.if %arg0 {
    } else {
    } {tag = "test_if"}
    %c2_i64 = arith.constant 2 : i64
    %0:2 = scf.while (%arg3 = %arg1) : (i64) -> (i64, i64) {
      %1 = arith.cmpi slt, %arg3, %arg2 : i64
      scf.condition(%1) %arg3, %arg3 : i64, i64
    } do {
    ^bb0(%arg3: i64, %arg4: i64):
      %1 = arith.muli %arg4, %c2_i64 : i64
      scf.yield %1 : i64
    } attributes {tag = "test_while"}
    return
  }
  func.func private @foo(%arg0: i32) -> i32 attributes {tag = "foo"} {
    return {a} %arg0 : i32
  }
  func.func @bar(%arg0: i1) -> i32 attributes {tag = "bar"} {
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    %c0_i32 = arith.constant 0 : i32
    return {b} %c0_i32 : i32
  ^bb2:  // pred: ^bb0
    %c1_i32 = arith.constant 1 : i32
    return {c} %c1_i32 : i32
  }
  func.func private @baz(i32) -> i32 attributes {tag = "baz"}
  func.func @test_callgraph(%arg0: i1, %arg1: i32) -> i32 {
    %0 = call @foo(%arg1) {tag = "a"} : (i32) -> i32
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    %1 = call @foo(%arg1) {tag = "b"} : (i32) -> i32
    return %1 : i32
  ^bb2:  // pred: ^bb0
    %2 = call @bar(%arg0) {tag = "c"} : (i1) -> i32
    %3 = call @baz(%arg1) {tag = "d"} : (i32) -> i32
    return %2 : i32
  }
  func.func private @bax(%arg0: i32) {
    return {void_return}
  }
  func.func @test_callgraph_void_return(%arg0: i32) -> i32 {
    call @bax(%arg0) {tag = "call_void_return"} : (i32) -> ()
    return %arg0 : i32
  }
  func.func @test_unknown_branch() attributes {tag = "test_unknown_branch"} {
    "test.unknown_br"()[^bb1, ^bb2] : () -> ()
  ^bb1:  // pred: ^bb0
    return
  ^bb2:  // pred: ^bb0
    return
  }
  func.func @test_unknown_region() {
    "test.unknown_region_br"() ({
      "test.unknown_region_end"() : () -> ()
    }, {
      "test.unknown_region_end"() : () -> ()
    }) {tag = "test_unknown_region"} : () -> ()
    return
  }
  func.func @test_known_dead_block() attributes {tag = "test_known_dead_block"} {
    %true = arith.constant true
    cf.cond_br %true, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    return
  ^bb2:  // pred: ^bb0
    return
  }
  func.func @test_known_dead_edge(%arg0: i1) attributes {tag = "test_known_dead_edge"} {
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    %true = arith.constant true
    cf.cond_br %true, ^bb3, ^bb2
  ^bb2:  // 2 preds: ^bb0, ^bb1
    return
  ^bb3:  // pred: ^bb1
    return
  }
  func.func @test_known_region_predecessors() {
    %false = arith.constant false
    scf.if %false {
    } else {
    } {tag = "test_known_if"}
    return
  }
  func.func @callable() attributes {tag = "callable"} {
    return
  }
  func.func @test_dead_callsite() {
    %true = arith.constant true
    scf.if %true {
      func.call @callable() {then} : () -> ()
    } else {
      func.call @callable() {else} : () -> ()
    }
    return
  }
  func.func private @test_dead_return(%arg0: i32) -> i32 {
    %true = arith.constant true
    cf.cond_br %true, ^bb1, ^bb1
  ^bb1:  // 2 preds: ^bb0, ^bb0
    return {true} %arg0 : i32
  ^bb2:  // no predecessors
    return {false} %arg0 : i32
  }
  func.func @test_call_dead_return(%arg0: i32) {
    %0 = call @test_dead_return(%arg0) {tag = "test_dead_return"} : (i32) -> i32
    return
  }
  func.func @test_dca_doesnt_crash() {
    %0 = scf.execute_region -> tensor<5x16xi16> {
      llvm.unreachable
    }
    return
  }
  func.func @test_dca_doesnt_crash_2() attributes {symbol = @notexistant} {
    return
  }
}

