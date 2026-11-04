module {
  smt.solver() : () -> () {
    %c5 = smt.int.constant 5
    %c10 = smt.int.constant 10
    %0 = smt.int.add %c5, %c5, %c5
    %1 = smt.eq %0, %c10 : !smt.int
    smt.assert %1
    %2 = smt.int.mul %c5, %c5, %c5
    %3 = smt.eq %2, %c10 : !smt.int
    smt.assert %3
    %4 = smt.int.sub %c5, %c5
    %5 = smt.eq %4, %c10 : !smt.int
    smt.assert %5
    %6 = smt.int.div %c5, %c5
    %7 = smt.eq %6, %c10 : !smt.int
    smt.assert %7
    %8 = smt.int.mod %c5, %c5
    %9 = smt.eq %8, %c10 : !smt.int
    smt.assert %9
    %10 = smt.int.cmp le %c5, %c5
    smt.assert %10
    %11 = smt.int.cmp lt %c5, %c5
    smt.assert %11
    %12 = smt.int.cmp ge %c5, %c5
    smt.assert %12
    %13 = smt.int.cmp gt %c5, %c5
    smt.assert %13
  }
}

