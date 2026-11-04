"builtin.module"() ({
  "smt.solver"() ({
    %0 = "smt.int.constant"() <{value = 0 : ui64}> : () -> !smt.int
    %1 = "smt.constant"() <{value = true}> : () -> !smt.bool
    %2 = "smt.array.broadcast"(%1) : (!smt.bool) -> !smt.array<[!smt.int -> !smt.bool]>
    %3 = "smt.array.store"(%2, %0, %1) : (!smt.array<[!smt.int -> !smt.bool]>, !smt.int, !smt.bool) -> !smt.array<[!smt.int -> !smt.bool]>
    %4 = "smt.array.select"(%3, %0) : (!smt.array<[!smt.int -> !smt.bool]>, !smt.int) -> !smt.bool
    "smt.assert"(%4) : (!smt.bool) -> ()
    "smt.yield"() : () -> ()
  }) : () -> ()
}) : () -> ()

