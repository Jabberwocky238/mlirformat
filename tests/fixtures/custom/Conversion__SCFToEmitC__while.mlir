module {
  emitc.func @payload_one_result(%arg0: i32) -> i32 {
    %0 = add %arg0, %arg0 : (i32, i32) -> i32
    return %0 : i32
  }
  func.func @one_result() -> i32 {
    %0 = emitc.literal "1.0" : i32
    %1 = emitc.literal "1.0" : i32
    %2 = emitc.literal "10.0" : i32
    %3 = scf.while (%arg0 = %0) : (i32) -> i32 {
      %4 = emitc.add %arg0, %1 : (i32, i32) -> i32
      %5 = emitc.cmp lt, %4, %2 : (i32, i32) -> i1
      %6 = emitc.add %arg0, %arg0 : (i32, i32) -> i32
      scf.condition(%5) %6 : i32
    } do {
    ^bb0(%arg0: i32):
      %4 = emitc.call @payload_one_result(%arg0) : (i32) -> i32
      scf.yield %4 : i32
    }
    return %3 : i32
  }
  emitc.func @payload_two_results(%arg0: i32) -> i32 {
    %0 = add %arg0, %arg0 : (i32, i32) -> i32
    return %0 : i32
  }
  func.func @two_results() -> i32 {
    %0 = emitc.literal "1.0" : i32
    %1 = emitc.literal "10.0" : i32
    %2:2 = scf.while (%arg0 = %0, %arg1 = %0) : (i32, i32) -> (i32, i32) {
      %3 = emitc.add %arg0, %arg1 : (i32, i32) -> i32
      %4 = emitc.cmp lt, %3, %1 : (i32, i32) -> i1
      scf.condition(%4) %0, %arg1 : i32, i32
    } do {
    ^bb0(%arg0: i32, %arg1: i32):
      %3 = emitc.call @payload_two_results(%arg0) : (i32) -> i32
      %4 = emitc.call @payload_two_results(%arg1) : (i32) -> i32
      scf.yield %3, %4 : i32, i32
    }
    return %2#0 : i32
  }
  emitc.func @payload_double_use(%arg0: i32) -> i32 {
    %0 = add %arg0, %arg0 : (i32, i32) -> i32
    return %0 : i32
  }
  emitc.func @foo_with_side_effect(%arg0: i32, %arg1: !emitc.ptr<i32>) -> i32 {
    %0 = add %arg0, %arg0 : (i32, i32) -> i32
    verbatim "{}[0] = {};" args %arg1, %0 : !emitc.ptr<i32>, i32
    return %0 : i32
  }
  func.func @double_use(%arg0: !emitc.ptr<i32>) -> i32 {
    %0 = emitc.literal "1.0" : i32
    %1 = emitc.literal "1.0" : i32
    %2 = emitc.literal "10.0" : i32
    %3 = scf.while (%arg1 = %0) : (i32) -> i32 {
      %4 = emitc.call @foo_with_side_effect(%arg1, %arg0) : (i32, !emitc.ptr<i32>) -> i32
      %5 = emitc.add %4, %4 : (i32, i32) -> i32
      %6 = emitc.add %arg1, %5 : (i32, i32) -> i32
      %7 = emitc.cmp lt, %6, %2 : (i32, i32) -> i1
      scf.condition(%7) %arg1 : i32
    } do {
    ^bb0(%arg1: i32):
      %4 = emitc.call @payload_double_use(%arg1) : (i32) -> i32
      scf.yield %4 : i32
    }
    return %3 : i32
  }
  emitc.func @payload_empty_after_region() -> i1 {
    %0 = literal "true" : i1
    return %0 : i1
  }
  func.func @empty_after_region() {
    scf.while : () -> () {
      %0 = emitc.call @payload_empty_after_region() : () -> i1
      scf.condition(%0)
    } do {
      scf.yield
    }
    return
  }
  emitc.func @payload_different_number_of_vars(%arg0: i32) -> i32 {
    %0 = add %arg0, %arg0 : (i32, i32) -> i32
    return %0 : i32
  }
  func.func @different_number_of_vars() -> (i32, i32) {
    %0 = emitc.literal "1.0" : i32
    %1 = emitc.literal "7.0" : i32
    %2 = emitc.literal "10.0" : i32
    %3:2 = scf.while (%arg0 = %0) : (i32) -> (i32, i32) {
      %4 = emitc.add %arg0, %1 : (i32, i32) -> i32
      %5 = emitc.cmp lt, %4, %2 : (i32, i32) -> i1
      %6 = emitc.add %arg0, %arg0 : (i32, i32) -> i32
      scf.condition(%5) %6, %4 : i32, i32
    } do {
    ^bb0(%arg0: i32, %arg1: i32):
      %4 = emitc.call @payload_different_number_of_vars(%arg0) : (i32) -> i32
      scf.yield %4 : i32
    }
    return %3#0, %3#1 : i32, i32
  }
}

