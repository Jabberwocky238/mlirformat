module {
  func.func @integer_operations() {
    %c-123 = smt.int.constant -123 {smt.some_attr}
    %c184467440737095516152 = smt.int.constant 184467440737095516152 {smt.some_attr}
    %0 = smt.int.add %c-123, %c-123, %c-123 {smt.some_attr}
    %1 = smt.int.mul %c-123, %c-123, %c-123 {smt.some_attr}
    %2 = smt.int.sub %c-123, %c-123 {smt.some_attr}
    %3 = smt.int.div %c-123, %c-123 {smt.some_attr}
    %4 = smt.int.mod %c-123, %c-123 {smt.some_attr}
    %5 = smt.int.abs %c-123 {smt.some_attr}
    %6 = smt.int.cmp le %c-123, %c-123 {smt.some_attr}
    %7 = smt.int.cmp lt %c-123, %c-123 {smt.some_attr}
    %8 = smt.int.cmp ge %c-123, %c-123 {smt.some_attr}
    %9 = smt.int.cmp gt %c-123, %c-123 {smt.some_attr}
    %10 = smt.int2bv %c-123 {smt.some_attr} : !smt.bv<4>
    return
  }
}

