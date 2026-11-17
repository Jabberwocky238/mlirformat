"builtin.module"() ({
  "wasmssa.func"() <{exported, functionType = (i32, i32) -> i32, sym_name = "rem_ui_32"}> ({
  ^bb0(%arg6: !wasmssa<local ref to i32> loc("<stdin>":3:8), %arg7: !wasmssa<local ref to i32> loc("<stdin>":3:43)):
    %9 = "wasmssa.local_get"(%arg6) : (!wasmssa<local ref to i32>) -> i32 loc("<stdin>":4:10)
    %10 = "wasmssa.local_get"(%arg7) : (!wasmssa<local ref to i32>) -> i32 loc("<stdin>":5:11)
    %11 = "wasmssa.rem_ui"(%9, %10) : (i32, i32) -> i32 loc("<stdin>":6:11)
    "wasmssa.return"(%11) : (i32) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
  "wasmssa.func"() <{exported, functionType = (i32, i32) -> i32, sym_name = "rem_si_32"}> ({
  ^bb0(%arg4: !wasmssa<local ref to i32> loc("<stdin>":10:8), %arg5: !wasmssa<local ref to i32> loc("<stdin>":10:43)):
    %6 = "wasmssa.local_get"(%arg4) : (!wasmssa<local ref to i32>) -> i32 loc("<stdin>":11:10)
    %7 = "wasmssa.local_get"(%arg5) : (!wasmssa<local ref to i32>) -> i32 loc("<stdin>":12:10)
    %8 = "wasmssa.rem_si"(%6, %7) : (i32, i32) -> i32 loc("<stdin>":13:10)
    "wasmssa.return"(%8) : (i32) -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":9:3)
  "wasmssa.func"() <{exported, functionType = (i64, i64) -> i64, sym_name = "rem_ui_64"}> ({
  ^bb0(%arg2: !wasmssa<local ref to i64> loc("<stdin>":17:8), %arg3: !wasmssa<local ref to i64> loc("<stdin>":17:43)):
    %3 = "wasmssa.local_get"(%arg2) : (!wasmssa<local ref to i64>) -> i64 loc("<stdin>":18:10)
    %4 = "wasmssa.local_get"(%arg3) : (!wasmssa<local ref to i64>) -> i64 loc("<stdin>":19:10)
    %5 = "wasmssa.rem_ui"(%3, %4) : (i64, i64) -> i64 loc("<stdin>":20:10)
    "wasmssa.return"(%5) : (i64) -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":16:3)
  "wasmssa.func"() <{exported, functionType = (i64, i64) -> i64, sym_name = "rem_si_64"}> ({
  ^bb0(%arg0: !wasmssa<local ref to i64> loc("<stdin>":24:8), %arg1: !wasmssa<local ref to i64> loc("<stdin>":24:43)):
    %0 = "wasmssa.local_get"(%arg0) : (!wasmssa<local ref to i64>) -> i64 loc("<stdin>":25:10)
    %1 = "wasmssa.local_get"(%arg1) : (!wasmssa<local ref to i64>) -> i64 loc("<stdin>":26:10)
    %2 = "wasmssa.rem_si"(%0, %1) : (i64, i64) -> i64 loc("<stdin>":27:10)
    "wasmssa.return"(%2) : (i64) -> () loc("<stdin>":28:5)
  }) : () -> () loc("<stdin>":23:3)
}) : () -> () loc("<stdin>":1:1)
