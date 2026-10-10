module {
  func.func @assert(%arg0: i1) {
    cf.assert %arg0, "Some message in case this assertion fails."
    return
  }
  func.func @switch(%arg0: i32, %arg1: i32) {
    cf.switch %arg0 : i32, [
      default: ^bb1(%arg1 : i32),
      42: ^bb2(%arg1 : i32),
      43: ^bb3(%arg1 : i32)
    ]
  ^bb1(%0: i32):  // pred: ^bb0
    return
  ^bb2(%1: i32):  // pred: ^bb0
    return
  ^bb3(%2: i32):  // pred: ^bb0
    return
  }
  func.func @switch_i64(%arg0: i64, %arg1: i32) {
    cf.switch %arg0 : i64, [
      default: ^bb1(%arg1 : i32),
      42: ^bb2(%arg1 : i32),
      43: ^bb3(%arg1 : i32)
    ]
  ^bb1(%0: i32):  // pred: ^bb0
    return
  ^bb2(%1: i32):  // pred: ^bb0
    return
  ^bb3(%2: i32):  // pred: ^bb0
    return
  }
  func.func @switch_result_number(%arg0: i32) {
    %0:2 = "test.op_with_two_results"() : () -> (i32, i32)
    cf.switch %arg0 : i32, [
      default: ^bb2,
      0: ^bb1(%0#0 : i32)
    ]
  ^bb1(%1: i32):  // pred: ^bb0
    return
  ^bb2:  // pred: ^bb0
    return
  }
  func.func @cond_weights(%arg0: i1) {
    cf.cond_br %arg0 weights([60, 40]), ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    return
  ^bb2:  // pred: ^bb0
    return
  }
}

