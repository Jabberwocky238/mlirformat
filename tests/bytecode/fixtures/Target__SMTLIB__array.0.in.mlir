"builtin.module"() ({
  "smt.solver"() ({
    %0 = "smt.int.constant"() <{value = 0 : ui64}> : () -> !smt.int loc("<stdin>":3:10)
    %1 = "smt.constant"() <{value = true}> : () -> !smt.bool loc("<stdin>":4:10)
    %2 = "smt.array.broadcast"(%1) : (!smt.bool) -> !smt.array<[!smt.int -> !smt.bool]> loc("<stdin>":5:10)
    %3 = "smt.array.store"(%2, %0, %1) : (!smt.array<[!smt.int -> !smt.bool]>, !smt.int, !smt.bool) -> !smt.array<[!smt.int -> !smt.bool]> loc("<stdin>":6:10)
    %4 = "smt.array.select"(%3, %0) : (!smt.array<[!smt.int -> !smt.bool]>, !smt.int) -> !smt.bool loc("<stdin>":7:10)
    "smt.assert"(%4) : (!smt.bool) -> () loc("<stdin>":8:5)
    "smt.yield"() : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
