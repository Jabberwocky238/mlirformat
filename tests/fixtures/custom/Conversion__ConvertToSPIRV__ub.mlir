module {
  func.func @ub() -> index {
    %0 = ub.poison : index
    return %0 : index
  }
}

