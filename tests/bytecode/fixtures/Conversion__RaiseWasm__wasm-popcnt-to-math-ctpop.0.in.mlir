"builtin.module"() ({
  "wasmssa.func"() <{exported, functionType = (i32) -> i32, sym_name = "popcnt_i32"}> ({
  ^bb0(%arg1: !wasmssa<local ref to i32> loc("<stdin>":3:8)):
    %2 = "wasmssa.local_get"(%arg1) : (!wasmssa<local ref to i32>) -> i32 loc("<stdin>":4:10)
    %3 = "wasmssa.popcnt"(%2) : (i32) -> i32 loc("<stdin>":5:10)
    "wasmssa.return"(%3) : (i32) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
  "wasmssa.func"() <{exported, functionType = (i64) -> i64, sym_name = "popcnt_i64"}> ({
  ^bb0(%arg0: !wasmssa<local ref to i64> loc("<stdin>":9:8)):
    %0 = "wasmssa.local_get"(%arg0) : (!wasmssa<local ref to i64>) -> i64 loc("<stdin>":10:10)
    %1 = "wasmssa.popcnt"(%0) : (i64) -> i64 loc("<stdin>":11:10)
    "wasmssa.return"(%1) : (i64) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":8:3)
}) : () -> () loc("<stdin>":1:1)
