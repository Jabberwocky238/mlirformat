module {
  func.func @main(%arg0: i32) -> index {
    %0 = call @f(%arg0) : (i32) -> index
    return %0 : index
  }
  func.func @f(%arg0: i32) -> index {
    %0 = index.castu %arg0 : i32 to index
    return %0 : index
  }
}

