"builtin.module"() ({
  "wasmssa.func"() <{functionType = () -> f32, sym_name = "func_0"}> ({
    %0 = "wasmssa.const"() <{value = 2.240000e+00 : f64}> : () -> f64 loc("<stdin>":3:10)
    %1 = "wasmssa.demote"(%0) : (f64) -> f32 loc("<stdin>":4:10)
    "wasmssa.return"(%1) : (f32) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
