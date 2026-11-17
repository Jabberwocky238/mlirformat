"builtin.module"() ({
  "wasmssa.func"() <{functionType = (i32, i32) -> i32, sym_name = "div_i32_si"}> ({
  ^bb0(%arg10: !wasmssa<local ref to i32> loc("<stdin>":3:8), %arg11: !wasmssa<local ref to i32> loc("<stdin>":3:44)):
    %15 = "wasmssa.local_get"(%arg10) : (!wasmssa<local ref to i32>) -> i32 loc("<stdin>":4:11)
    %16 = "wasmssa.local_get"(%arg11) : (!wasmssa<local ref to i32>) -> i32 loc("<stdin>":5:11)
    %17 = "wasmssa.div_si"(%15, %16) : (i32, i32) -> i32 loc("<stdin>":6:11)
    "wasmssa.return"(%17) : (i32) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
  "wasmssa.func"() <{functionType = (i64, i64) -> i64, sym_name = "div_i64_si"}> ({
  ^bb0(%arg8: !wasmssa<local ref to i64> loc("<stdin>":10:8), %arg9: !wasmssa<local ref to i64> loc("<stdin>":10:43)):
    %12 = "wasmssa.local_get"(%arg8) : (!wasmssa<local ref to i64>) -> i64 loc("<stdin>":11:11)
    %13 = "wasmssa.local_get"(%arg9) : (!wasmssa<local ref to i64>) -> i64 loc("<stdin>":12:11)
    %14 = "wasmssa.div_si"(%12, %13) : (i64, i64) -> i64 loc("<stdin>":13:11)
    "wasmssa.return"(%14) : (i64) -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":9:3)
  "wasmssa.func"() <{functionType = (i32, i32) -> i32, sym_name = "div_i32_ui"}> ({
  ^bb0(%arg6: !wasmssa<local ref to i32> loc("<stdin>":17:8), %arg7: !wasmssa<local ref to i32> loc("<stdin>":17:43)):
    %9 = "wasmssa.local_get"(%arg6) : (!wasmssa<local ref to i32>) -> i32 loc("<stdin>":18:10)
    %10 = "wasmssa.local_get"(%arg7) : (!wasmssa<local ref to i32>) -> i32 loc("<stdin>":19:11)
    %11 = "wasmssa.div_ui"(%9, %10) : (i32, i32) -> i32 loc("<stdin>":20:11)
    "wasmssa.return"(%11) : (i32) -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":16:3)
  "wasmssa.func"() <{functionType = (i64, i64) -> i64, sym_name = "div_i64_ui"}> ({
  ^bb0(%arg4: !wasmssa<local ref to i64> loc("<stdin>":24:8), %arg5: !wasmssa<local ref to i64> loc("<stdin>":24:43)):
    %6 = "wasmssa.local_get"(%arg4) : (!wasmssa<local ref to i64>) -> i64 loc("<stdin>":25:10)
    %7 = "wasmssa.local_get"(%arg5) : (!wasmssa<local ref to i64>) -> i64 loc("<stdin>":26:10)
    %8 = "wasmssa.div_ui"(%6, %7) : (i64, i64) -> i64 loc("<stdin>":27:10)
    "wasmssa.return"(%8) : (i64) -> () loc("<stdin>":28:5)
  }) : () -> () loc("<stdin>":23:3)
  "wasmssa.func"() <{functionType = (f32, f32) -> f32, sym_name = "div_f32"}> ({
  ^bb0(%arg2: !wasmssa<local ref to f32> loc("<stdin>":31:8), %arg3: !wasmssa<local ref to f32> loc("<stdin>":31:43)):
    %3 = "wasmssa.local_get"(%arg2) : (!wasmssa<local ref to f32>) -> f32 loc("<stdin>":32:10)
    %4 = "wasmssa.local_get"(%arg3) : (!wasmssa<local ref to f32>) -> f32 loc("<stdin>":33:10)
    %5 = "wasmssa.div"(%3, %4) : (f32, f32) -> f32 loc("<stdin>":34:10)
    "wasmssa.return"(%5) : (f32) -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":30:3)
  "wasmssa.func"() <{functionType = (f64, f64) -> f64, sym_name = "div_f64"}> ({
  ^bb0(%arg0: !wasmssa<local ref to f64> loc("<stdin>":38:8), %arg1: !wasmssa<local ref to f64> loc("<stdin>":38:43)):
    %0 = "wasmssa.local_get"(%arg0) : (!wasmssa<local ref to f64>) -> f64 loc("<stdin>":39:10)
    %1 = "wasmssa.local_get"(%arg1) : (!wasmssa<local ref to f64>) -> f64 loc("<stdin>":40:10)
    %2 = "wasmssa.div"(%0, %1) : (f64, f64) -> f64 loc("<stdin>":41:10)
    "wasmssa.return"(%2) : (f64) -> () loc("<stdin>":42:5)
  }) : () -> () loc("<stdin>":37:3)
}) : () -> () loc("<stdin>":1:1)
