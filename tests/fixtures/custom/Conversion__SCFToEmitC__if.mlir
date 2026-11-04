module {
  func.func @test_if(%arg0: i1, %arg1: f32) {
    scf.if %arg0 {
      %0 = emitc.call_opaque "func_const"(%arg1) : (f32) -> i32
    }
    return
  }
  func.func @test_if_else(%arg0: i1, %arg1: f32) {
    scf.if %arg0 {
      %0 = emitc.call_opaque "func_true"(%arg1) : (f32) -> i32
    } else {
      %0 = emitc.call_opaque "func_false"(%arg1) : (f32) -> i32
    }
    return
  }
  func.func @test_if_yield(%arg0: i1, %arg1: f32) -> (i32, f64) {
    %c0_i8 = arith.constant 0 : i8
    %0:2 = scf.if %arg0 -> (i32, f64) {
      %1 = emitc.call_opaque "func_true_1"(%arg1) : (f32) -> i32
      %2 = emitc.call_opaque "func_true_2"(%arg1) : (f32) -> f64
      scf.yield %1, %2 : i32, f64
    } else {
      %1 = emitc.call_opaque "func_false_1"(%arg1) : (f32) -> i32
      %2 = emitc.call_opaque "func_false_2"(%arg1) : (f32) -> f64
      scf.yield %1, %2 : i32, f64
    }
    return %0#0, %0#1 : i32, f64
  }
}

