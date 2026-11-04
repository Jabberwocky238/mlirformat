module {
  smt.solver() : () -> () {
    %c0_bv32 = smt.bv.constant #smt.bv<0> : !smt.bv<32>
    %true = smt.constant true
    %false = smt.constant false
    %b = smt.declare_fun "b" : !smt.bv<32>
    %0 = smt.eq %c0_bv32, %b : !smt.bv<32>
    smt.assert %0
    %1 = smt.distinct %c0_bv32, %c0_bv32 : !smt.bv<32>
    smt.assert %1
    %a = smt.declare_fun "a" : !smt.bool
    %2 = smt.ite %a, %c0_bv32, %b : !smt.bv<32>
    %3 = smt.eq %c0_bv32, %2 : !smt.bv<32>
    smt.assert %3
    %4 = smt.not %true
    %5 = smt.and %4, %true, %false
    %6 = smt.or %5, %4, %true
    %7 = smt.xor %4, %6
    %8 = smt.implies %7, %false
    smt.assert %8
    %func1 = smt.declare_fun "func1" : !smt.func<(!smt.bool, !smt.bool) !smt.bool>
    %9 = smt.apply_func %func1(%true, %false) : !smt.func<(!smt.bool, !smt.bool) !smt.bool>
    smt.assert %9
    %10 = smt.forall ["a", "b"] {
    ^bb0(%arg0: !smt.int, %arg1: !smt.int):
      %15 = smt.eq %arg0, %arg1 : !smt.int
      smt.yield %15 : !smt.bool
    }
    smt.assert %10
    %11 = smt.exists {
    ^bb0(%arg0: !smt.int, %arg1: !smt.int):
      %15 = smt.eq %arg0, %arg1 : !smt.int
      smt.yield %15 : !smt.bool
    }
    smt.assert %11
    %12 = smt.exists {
    ^bb0(%arg0: !smt.int, %arg1: !smt.int):
      %15 = smt.eq %arg0, %arg1 : !smt.int
      smt.yield %15 : !smt.bool
    }
    %13 = smt.exists {
    ^bb0(%arg0: !smt.int, %arg1: !smt.int):
      %15 = smt.eq %arg0, %arg1 : !smt.int
      smt.yield %15 : !smt.bool
    }
    %14 = smt.and %12, %13
    smt.assert %14
    smt.check sat {
    } unknown {
    } unsat {
    }
    smt.reset
    smt.push 1
    smt.pop 1
    smt.set_logic "AUFLIA"
  }
}

