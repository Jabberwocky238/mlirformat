module {
  smt.solver() : () -> () {
    %true = smt.constant true
    %0 = smt.exists weight 2 {
    ^bb0(%arg0: !smt.int, %arg1: !smt.int):
      %1 = smt.eq %arg0, %arg1 : !smt.int
      %2 = smt.implies %1, %true
      smt.yield %2 : !smt.bool
    }
    smt.assert %0
    smt.check sat {
    } unknown {
    } unsat {
    }
  }
  smt.solver() : () -> () {
    %true = smt.constant true
    %0 = smt.exists weight 2 {
    ^bb0(%arg0: !smt.int, %arg1: !smt.int):
      %1 = smt.eq %arg0, %arg1 : !smt.int
      %2 = smt.implies %1, %true
      smt.yield %2 : !smt.bool
    } patterns {
    ^bb0(%arg0: !smt.int, %arg1: !smt.int):
      %1 = smt.eq %arg0, %arg1 : !smt.int
      smt.yield %1 : !smt.bool
    }
    smt.assert %0
    smt.check sat {
    } unknown {
    } unsat {
    }
  }
  smt.solver() : () -> () {
    %true = smt.constant true
    %0 = smt.exists {
    ^bb0(%arg0: !smt.int, %arg1: !smt.int):
      %1 = smt.eq %arg0, %arg1 : !smt.int
      %2 = smt.implies %1, %true
      smt.yield %2 : !smt.bool
    } patterns {
    ^bb0(%arg0: !smt.int, %arg1: !smt.int):
      %1 = smt.eq %arg0, %arg1 : !smt.int
      smt.yield %1 : !smt.bool
    }
    smt.assert %0
    smt.check sat {
    } unknown {
    } unsat {
    }
  }
  smt.solver() : () -> () {
    %true = smt.constant true
    %c3 = smt.int.constant 3
    %c4 = smt.int.constant 4
    %0 = smt.exists {
    ^bb0(%arg0: !smt.int, %arg1: !smt.int):
      %1 = smt.eq %arg0, %c3 : !smt.int
      %2 = smt.eq %arg1, %c4 : !smt.int
      %3 = smt.eq %1, %2 : !smt.bool
      smt.yield %3 : !smt.bool
    } patterns {
    ^bb0(%arg0: !smt.int, %arg1: !smt.int):
      %1 = smt.eq %arg0, %c3 : !smt.int
      smt.yield %1 : !smt.bool
    }, {
    ^bb0(%arg0: !smt.int, %arg1: !smt.int):
      %1 = smt.eq %arg1, %c4 : !smt.int
      smt.yield %1 : !smt.bool
    }
    smt.assert %0
    smt.check sat {
    } unknown {
    } unsat {
    }
  }
  smt.solver() : () -> () {
    %true = smt.constant true
    %c3 = smt.int.constant 3
    %c4 = smt.int.constant 4
    %0 = smt.exists {
    ^bb0(%arg0: !smt.int, %arg1: !smt.int):
      %1 = smt.eq %arg0, %c3 : !smt.int
      %2 = smt.eq %arg1, %c4 : !smt.int
      %3 = smt.eq %1, %2 : !smt.bool
      smt.yield %3 : !smt.bool
    } patterns {
    ^bb0(%arg0: !smt.int, %arg1: !smt.int):
      %1 = smt.eq %arg0, %c3 : !smt.int
      %2 = smt.eq %arg1, %c4 : !smt.int
      smt.yield %1, %2 : !smt.bool, !smt.bool
    }
    smt.assert %0
    smt.check sat {
    } unknown {
    } unsat {
    }
  }
}

