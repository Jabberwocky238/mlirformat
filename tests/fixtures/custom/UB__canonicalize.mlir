module {
  func.func @merge_poison() -> (i32, i32) {
    %0 = ub.poison : i32
    %1 = ub.poison : i32
    return %0, %1 : i32, i32
  }
}

