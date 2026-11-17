"builtin.module"() ({
  "func.func"() <{function_type = (!cmath.complex<f32>, !cmath.complex<f32>) -> f32, sym_name = "conorm"}> ({
  ^bb0(%arg2: !cmath.complex<f32> loc("<stdin>":3:8), %arg3: !cmath.complex<f32> loc("<stdin>":3:36)):
    %2 = "cmath.norm"(%arg2) : (!cmath.complex<f32>) -> f32 loc("<stdin>":4:10)
    %3 = "cmath.norm"(%arg3) : (!cmath.complex<f32>) -> f32 loc("<stdin>":5:10)
    %4 = "arith.mulf"(%2, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":6:10)
    "func.return"(%4) : (f32) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (!cmath.complex<f32>, !cmath.complex<f32>) -> f32, sym_name = "conorm2"}> ({
  ^bb0(%arg0: !cmath.complex<f32> loc("<stdin>":10:8), %arg1: !cmath.complex<f32> loc("<stdin>":10:36)):
    %0 = "cmath.mul"(%arg0, %arg1) : (!cmath.complex<f32>, !cmath.complex<f32>) -> !cmath.complex<f32> loc("<stdin>":11:10)
    %1 = "cmath.norm"(%0) : (!cmath.complex<f32>) -> f32 loc("<stdin>":12:10)
    "func.return"(%1) : (f32) -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":9:3)
}) : () -> () loc("<stdin>":1:1)
