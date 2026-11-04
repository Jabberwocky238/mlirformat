module {
  func.func @test_if(%arg0: i1, %arg1: f32) {
    emitc.if %arg0 {
      %0 = call_opaque "func_const"(%arg1) : (f32) -> i32
    }
    return
  }
  func.func @test_if_else(%arg0: i1, %arg1: f32) {
    emitc.if %arg0 {
      %0 = call_opaque "func_true"(%arg1) : (f32) -> i32
    } else {
      %0 = call_opaque "func_false"(%arg1) : (f32) -> i32
    }
    return
  }
  func.func @test_if_yield(%arg0: i1, %arg1: f32) {
    %0 = "emitc.constant"() <{value = 0 : i8}> : () -> i8
    %1 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    %2 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<f64>
    emitc.if %arg0 {
      %3 = call_opaque "func_true_1"(%arg1) : (f32) -> i32
      %4 = call_opaque "func_true_2"(%arg1) : (f32) -> f64
      assign %3 : i32 to %1 : <i32>
      assign %4 : f64 to %2 : <f64>
    } else {
      %3 = call_opaque "func_false_1"(%arg1) : (f32) -> i32
      %4 = call_opaque "func_false_2"(%arg1) : (f32) -> f64
      assign %3 : i32 to %1 : <i32>
      assign %4 : f64 to %2 : <f64>
    }
    return
  }
}

