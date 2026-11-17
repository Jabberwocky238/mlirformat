"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32, f32) -> f32, sym_name = "mixedOperations"}> ({
  ^bb0(%arg0: f32 loc("<stdin>":3:8), %arg1: f32 loc("<stdin>":3:20), %arg2: f32 loc("<stdin>":3:32)):
    %0 = "arith.addf"(%arg0, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":4:10)
    %1 = "arith.subf"(%0, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":5:10)
    %2 = "arith.mulf"(%arg0, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":6:10)
    %3 = "arith.addf"(%arg1, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":7:10)
    %4 = "arith.mulf"(%3, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":8:10)
    %5 = "arith.subf"(%4, %arg0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":9:10)
    %6 = "arith.addf"(%4, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":10:10)
    %7 = "arith.mulf"(%5, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":11:10)
    "func.return"(%7) : (f32) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
