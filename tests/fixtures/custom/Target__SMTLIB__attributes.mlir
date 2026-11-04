module {
  smt.solver() : () -> () {
    %true = smt.constant true
    %0 = smt.forall ["a", "b"] weight 2 {
    ^bb0(%arg0: !smt.int, %arg1: !smt.int):
      %7 = smt.eq %arg0, %arg1 : !smt.int
      smt.yield %7 : !smt.bool
    }
    smt.assert %0
    %1 = smt.exists weight 2 {
    ^bb0(%arg0: !smt.int, %arg1: !smt.int):
      %7 = smt.eq %arg0, %arg1 : !smt.int
      smt.yield %7 : !smt.bool
    }
    smt.assert %1
    %2 = smt.exists weight 2 {
    ^bb0(%arg0: !smt.int, %arg1: !smt.int):
      %7 = smt.eq %arg0, %arg1 : !smt.int
      %8 = smt.implies %7, %true
      smt.yield %8 : !smt.bool
    }
    smt.assert %2
    %3 = smt.exists {
    ^bb0(%arg0: !smt.int, %arg1: !smt.int):
      %7 = smt.eq %arg0, %arg1 : !smt.int
      %8 = smt.implies %7, %true
      smt.yield %8 : !smt.bool
    } patterns {
    ^bb0(%arg0: !smt.int, %arg1: !smt.int):
      %7 = smt.eq %arg0, %arg1 : !smt.int
      smt.yield %7 : !smt.bool
    }
    smt.assert %3
    %4 = smt.exists weight 2 {
    ^bb0(%arg0: !smt.int, %arg1: !smt.int):
      %7 = smt.eq %arg0, %arg1 : !smt.int
      %8 = smt.implies %7, %true
      smt.yield %8 : !smt.bool
    } patterns {
    ^bb0(%arg0: !smt.int, %arg1: !smt.int):
      %7 = smt.eq %arg0, %arg1 : !smt.int
      smt.yield %7 : !smt.bool
    }
    smt.assert %4
    %c3 = smt.int.constant 3
    %c4 = smt.int.constant 4
    %5 = smt.exists {
    ^bb0(%arg0: !smt.int, %arg1: !smt.int):
      %7 = smt.eq %arg0, %c3 : !smt.int
      %8 = smt.eq %arg1, %c4 : !smt.int
      %9 = smt.eq %7, %8 : !smt.bool
      smt.yield %9 : !smt.bool
    } patterns {
    ^bb0(%arg0: !smt.int, %arg1: !smt.int):
      %7 = smt.eq %arg0, %c3 : !smt.int
      smt.yield %7 : !smt.bool
    }, {
    ^bb0(%arg0: !smt.int, %arg1: !smt.int):
      %7 = smt.eq %arg1, %c4 : !smt.int
      smt.yield %7 : !smt.bool
    }
    smt.assert %5
    smt.check sat {
    } unknown {
    } unsat {
    }
    %6 = smt.exists {
    ^bb0(%arg0: !smt.int, %arg1: !smt.int):
      %7 = smt.eq %arg0, %c3 : !smt.int
      %8 = smt.eq %arg1, %c4 : !smt.int
      %9 = smt.eq %7, %8 : !smt.bool
      smt.yield %9 : !smt.bool
    } patterns {
    ^bb0(%arg0: !smt.int, %arg1: !smt.int):
      %7 = smt.eq %arg0, %c3 : !smt.int
      %8 = smt.eq %arg1, %c4 : !smt.int
      smt.yield %7, %8 : !smt.bool, !smt.bool
    }
    smt.assert %6
    smt.check sat {
    } unknown {
    } unsat {
    }
  }
}

