module {
  func.func @int(%arg0: i32) -> i32 {
    return %arg0 : i32
  }
  func.func @index(%arg0: index) -> index {
    return %arg0 : index
  }
  func.func @call_with_one_result(%arg0: index) -> index {
    %0 = call @index(%arg0) : (index) -> index
    return %0 : index
  }
}

