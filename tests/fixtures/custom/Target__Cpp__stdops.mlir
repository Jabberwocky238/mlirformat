module {
  func.func @std_call() {
    %0 = call @one_result() : () -> i32
    %1 = call @one_result() : () -> i32
    return
  }
  func.func @std_call_two_results() {
    %0:2 = call @two_results() : () -> (i32, f32)
    %1:2 = call @two_results() : () -> (i32, f32)
    return
  }
  func.func @one_result() -> i32 {
    %0 = "emitc.constant"() <{value = 0 : i32}> : () -> i32
    return %0 : i32
  }
  func.func @two_results() -> (i32, f32) {
    %0 = "emitc.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "emitc.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    return %0, %1 : i32, f32
  }
  func.func @single_return_statement(%arg0: i32) -> i32 {
    return %arg0 : i32
  }
}

