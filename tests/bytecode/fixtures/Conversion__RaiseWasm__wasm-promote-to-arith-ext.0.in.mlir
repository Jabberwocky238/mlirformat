"builtin.module"() ({
  "wasmssa.func"() <{functionType = () -> f64, sym_name = "promote_f32_to_f64"}> ({
    %0 = "wasmssa.const"() <{value = 3.140000e+00 : f32}> : () -> f32 loc("<stdin>":3:10)
    %1 = "wasmssa.promote"(%0) : (f32) -> f64 loc("<stdin>":4:10)
    "wasmssa.return"(%1) : (f64) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
