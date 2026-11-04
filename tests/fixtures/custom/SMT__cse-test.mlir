module {
  func.func @declare_const_cse(%arg0: i8) -> (!smt.bool, !smt.bool) {
    %a = smt.declare_fun "a" : !smt.bool
    %a_0 = smt.declare_fun "a" : !smt.bool
    %a_1 = smt.declare_fun "a" : !smt.bool
    return %a, %a_0 : !smt.bool, !smt.bool
  }
}

