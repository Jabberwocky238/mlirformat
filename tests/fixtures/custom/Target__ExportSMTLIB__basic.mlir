module {
  smt.solver() : () -> () {
    %b = smt.declare_fun "b" : !smt.bv<32>
    %0 = smt.declare_fun : !smt.int
    %1 = smt.declare_fun : !smt.func<(!smt.int, !smt.bv<32>) !smt.bool>
    %2 = smt.apply_func %1(%0, %b) : !smt.func<(!smt.int, !smt.bv<32>) !smt.bool>
    smt.assert %2
    %3 = smt.declare_fun : !smt.sort<"uninterpreted">
    %4 = smt.declare_fun : !smt.sort<"other"[!smt.sort<"uninterpreted">]>
    %5 = smt.declare_fun : !smt.func<(!smt.sort<"other"[!smt.sort<"uninterpreted">]>, !smt.sort<"uninterpreted">) !smt.bool>
    %6 = smt.apply_func %5(%4, %3) : !smt.func<(!smt.sort<"other"[!smt.sort<"uninterpreted">]>, !smt.sort<"uninterpreted">) !smt.bool>
    smt.assert %6
    smt.check sat {
    } unknown {
    } unsat {
    }
  }
  smt.solver() : () -> () {
    %true = smt.constant true
    %false = smt.constant false
    %0 = smt.not %true
    %1 = smt.and %0, %true, %false
    %2 = smt.or %1, %0, %true
    %3 = smt.xor %0, %2
    %4 = smt.implies %3, %false
    %5 = smt.implies %4, %true
    smt.assert %5
    smt.check sat {
    } unknown {
    } unsat {
    }
  }
  smt.solver() : () -> () {
    %true = smt.constant true
    %false = smt.constant false
    %c0 = smt.int.constant 0
    %0 = smt.array.broadcast %true : !smt.array<[!smt.int -> !smt.bool]>
    %1 = smt.array.store %0[%c0], %false : !smt.array<[!smt.int -> !smt.bool]>
    %2 = smt.array.select %1[%c0] : !smt.array<[!smt.int -> !smt.bool]>
    smt.assert %2
    smt.check sat {
    } unknown {
    } unsat {
    }
  }
  smt.solver() : () -> () {
    %c-1_bv4 = smt.bv.constant #smt.bv<-1> : !smt.bv<4>
    %c0_bv4 = smt.bv.constant #smt.bv<0> : !smt.bv<4>
    %c-1_bv8 = smt.bv.constant #smt.bv<-1> : !smt.bv<8>
    %0 = smt.bv.concat %c-1_bv4, %c0_bv4 : !smt.bv<4>, !smt.bv<4>
    %1 = smt.bv.extract %0 from 4 : (!smt.bv<8>) -> !smt.bv<4>
    %2 = smt.bv.repeat 2 times %1 : !smt.bv<4>
    %3 = smt.eq %2, %c-1_bv8 : !smt.bv<8>
    smt.assert %3
    smt.check sat {
    } unknown {
    } unsat {
    }
  }
  smt.solver() : () -> () {
    %0 = smt.forall ["a"] {
    ^bb0(%arg0: !smt.int):
      %c2 = smt.int.constant 2
      %1 = smt.int.mul %arg0, %c2
      %2 = smt.exists {
      ^bb0(%arg1: !smt.int):
        %c2_0 = smt.int.constant 2
        %3 = smt.int.mul %c2_0, %arg1
        %4 = smt.eq %3, %1 : !smt.int
        smt.yield %4 : !smt.bool
      }
      smt.yield %2 : !smt.bool
    }
    smt.assert %0
    smt.check sat {
    } unknown {
    } unsat {
    }
  }
  smt.solver() : () -> () {
    %c3 = smt.int.constant 3
    %c4 = smt.int.constant 4
    %0 = smt.eq %c3, %c4 : !smt.int
    %1 = smt.eq %c3, %c3 : !smt.int
    smt.push 1
    smt.assert %0
    smt.check sat {
    } unknown {
    } unsat {
    }
    smt.pop 1
    smt.assert %1
    smt.check sat {
    } unknown {
    } unsat {
    }
  }
  smt.solver() : () -> () {
    %c3 = smt.int.constant 3
    %c4 = smt.int.constant 4
    %0 = smt.eq %c3, %c4 : !smt.int
    %1 = smt.eq %c3, %c3 : !smt.int
    smt.assert %0
    smt.check sat {
    } unknown {
    } unsat {
    }
    smt.reset
    smt.assert %1
    smt.check sat {
    } unknown {
    } unsat {
    }
  }
  smt.solver() : () -> () {
    smt.set_logic "HORN"
    %0 = smt.declare_fun : !smt.int
    %c4 = smt.int.constant 4
    %1 = smt.eq %0, %c4 : !smt.int
    smt.assert %1
    smt.check sat {
    } unknown {
    } unsat {
    }
  }
}

