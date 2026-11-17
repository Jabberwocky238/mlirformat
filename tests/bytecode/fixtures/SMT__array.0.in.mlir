"builtin.module"() ({
  "func.func"() <{function_type = (!smt.bool) -> (), sym_name = "arrayOperations"}> ({
  ^bb0(%arg0: !smt.bool loc("<stdin>":3:8)):
    %0 = "smt.array.broadcast"(%arg0) {smt.some_attr} : (!smt.bool) -> !smt.array<[!smt.bool -> !smt.bool]> loc("<stdin>":4:10)
    %1 = "smt.array.select"(%0, %arg0) {smt.some_attr} : (!smt.array<[!smt.bool -> !smt.bool]>, !smt.bool) -> !smt.bool loc("<stdin>":5:10)
    %2 = "smt.array.store"(%0, %arg0, %arg0) {smt.some_attr} : (!smt.array<[!smt.bool -> !smt.bool]>, !smt.bool, !smt.bool) -> !smt.array<[!smt.bool -> !smt.bool]> loc("<stdin>":6:10)
    "func.return"() : () -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
