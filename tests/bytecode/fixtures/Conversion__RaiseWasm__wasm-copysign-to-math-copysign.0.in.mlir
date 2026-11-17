"builtin.module"() ({
  "wasmssa.func"() <{exported, functionType = (f32, f32) -> f32, sym_name = "copysign_f32"}> ({
  ^bb0(%arg2: !wasmssa<local ref to f32> loc("<stdin>":3:8), %arg3: !wasmssa<local ref to f32> loc("<stdin>":3:43)):
    %3 = "wasmssa.local_get"(%arg2) : (!wasmssa<local ref to f32>) -> f32 loc("<stdin>":4:10)
    %4 = "wasmssa.local_get"(%arg3) : (!wasmssa<local ref to f32>) -> f32 loc("<stdin>":5:10)
    %5 = "wasmssa.copysign"(%3, %4) : (f32, f32) -> f32 loc("<stdin>":6:10)
    "wasmssa.return"(%5) : (f32) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
  "wasmssa.func"() <{exported, functionType = (f64, f64) -> f64, sym_name = "copysign_f64"}> ({
  ^bb0(%arg0: !wasmssa<local ref to f64> loc("<stdin>":10:8), %arg1: !wasmssa<local ref to f64> loc("<stdin>":10:43)):
    %0 = "wasmssa.local_get"(%arg0) : (!wasmssa<local ref to f64>) -> f64 loc("<stdin>":11:10)
    %1 = "wasmssa.local_get"(%arg1) : (!wasmssa<local ref to f64>) -> f64 loc("<stdin>":12:10)
    %2 = "wasmssa.copysign"(%0, %1) : (f64, f64) -> f64 loc("<stdin>":13:10)
    "wasmssa.return"(%2) : (f64) -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":9:3)
}) : () -> () loc("<stdin>":1:1)
