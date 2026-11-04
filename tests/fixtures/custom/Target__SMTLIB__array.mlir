module {
  smt.solver() : () -> () {
    %c0 = smt.int.constant 0
    %true = smt.constant true
    %0 = smt.array.broadcast %true : !smt.array<[!smt.int -> !smt.bool]>
    %1 = smt.array.store %0[%c0], %true : !smt.array<[!smt.int -> !smt.bool]>
    %2 = smt.array.select %1[%c0] : !smt.array<[!smt.int -> !smt.bool]>
    smt.assert %2
  }
}

