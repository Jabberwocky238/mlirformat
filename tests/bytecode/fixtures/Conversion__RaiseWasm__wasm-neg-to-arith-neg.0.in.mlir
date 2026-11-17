"builtin.module"() ({
  "wasmssa.func"() <{functionType = (f32) -> f32, sym_name = "neg_f32"}> ({
  ^bb0(%arg1: !wasmssa<local ref to f32> loc("<stdin>":3:8)):
    %2 = "wasmssa.local_get"(%arg1) : (!wasmssa<local ref to f32>) -> f32 loc("<stdin>":4:10)
    %3 = "wasmssa.neg"(%2) : (f32) -> f32 loc("<stdin>":5:10)
    "wasmssa.return"(%3) : (f32) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
  "wasmssa.func"() <{functionType = (f64) -> f64, sym_name = "neg_f64"}> ({
  ^bb0(%arg0: !wasmssa<local ref to f64> loc("<stdin>":9:8)):
    %0 = "wasmssa.local_get"(%arg0) : (!wasmssa<local ref to f64>) -> f64 loc("<stdin>":10:10)
    %1 = "wasmssa.neg"(%0) : (f64) -> f64 loc("<stdin>":11:10)
    "wasmssa.return"(%1) : (f64) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":8:3)
}) : () -> () loc("<stdin>":1:1)
