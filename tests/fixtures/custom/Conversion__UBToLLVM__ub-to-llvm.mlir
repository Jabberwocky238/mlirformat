module {
  func.func @check_poison() {
    %0 = ub.poison : index
    %1 = ub.poison : i16
    %2 = ub.poison : f64
    %3 = ub.poison : !llvm.ptr
    return
  }
  func.func @check_unrechable() {
    ub.unreachable
  }
}

