"builtin.module"() ({
  "wasmssa.func"() <{functionType = () -> i32, sym_name = "i32.reinterpret_f32"}> ({
    %6 = "wasmssa.const"() <{value = -1.000000e+00 : f32}> : () -> f32 loc("<stdin>":3:10)
    %7 = "wasmssa.reinterpret"(%6) : (f32) -> i32 loc("<stdin>":4:10)
    "wasmssa.return"(%7) : (i32) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "wasmssa.func"() <{functionType = () -> i64, sym_name = "i64.reinterpret_f64"}> ({
    %4 = "wasmssa.const"() <{value = -1.000000e+00 : f64}> : () -> f64 loc("<stdin>":8:10)
    %5 = "wasmssa.reinterpret"(%4) : (f64) -> i64 loc("<stdin>":9:10)
    "wasmssa.return"(%5) : (i64) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "wasmssa.func"() <{functionType = () -> f32, sym_name = "f32.reinterpret_i32"}> ({
    %2 = "wasmssa.const"() <{value = -1 : i32}> : () -> i32 loc("<stdin>":13:10)
    %3 = "wasmssa.reinterpret"(%2) : (i32) -> f32 loc("<stdin>":14:10)
    "wasmssa.return"(%3) : (f32) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "wasmssa.func"() <{functionType = () -> f64, sym_name = "f64.reinterpret_i64"}> ({
    %0 = "wasmssa.const"() <{value = -1 : i64}> : () -> i64 loc("<stdin>":18:10)
    %1 = "wasmssa.reinterpret"(%0) : (i64) -> f64 loc("<stdin>":19:10)
    "wasmssa.return"(%1) : (f64) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
}) : () -> () loc("<stdin>":1:1)
