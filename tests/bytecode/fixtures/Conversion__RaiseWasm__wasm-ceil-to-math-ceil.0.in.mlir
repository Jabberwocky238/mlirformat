"builtin.module"() ({
  "wasmssa.func"() <{exported, functionType = () -> f64, sym_name = "func_0"}> ({
    %2 = "wasmssa.const"() <{value = -1.210000e+01 : f64}> : () -> f64 loc("<stdin>":3:10)
    %3 = "wasmssa.ceil"(%2) : (f64) -> f64 loc("<stdin>":4:10)
    "wasmssa.return"(%3) : (f64) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "wasmssa.func"() <{exported, functionType = () -> f32, sym_name = "func_1"}> ({
    %0 = "wasmssa.const"() <{value = 1.618000e+00 : f32}> : () -> f32 loc("<stdin>":8:10)
    %1 = "wasmssa.ceil"(%0) : (f32) -> f32 loc("<stdin>":9:10)
    "wasmssa.return"(%1) : (f32) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
}) : () -> () loc("<stdin>":1:1)
