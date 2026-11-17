"builtin.module"() ({
  "wasmssa.func"() <{functionType = () -> f32, sym_name = "func_0"}> ({
    %6 = "wasmssa.local"() <{type = f32}> : () -> !wasmssa<local ref to f32> loc("<stdin>":3:10)
    %7 = "wasmssa.local"() <{type = f32}> : () -> !wasmssa<local ref to f32> loc("<stdin>":4:10)
    %8 = "wasmssa.const"() <{value = 8.000000e+00 : f32}> : () -> f32 loc("<stdin>":5:10)
    %9 = "wasmssa.const"() <{value = 1.200000e+01 : f32}> : () -> f32 loc("<stdin>":6:10)
    %10 = "wasmssa.add"(%8, %9) : (f32, f32) -> f32 loc("<stdin>":7:11)
    "wasmssa.return"(%10) : (f32) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
  "wasmssa.func"() <{functionType = () -> i32, sym_name = "func_1"}> ({
    %1 = "wasmssa.local"() <{type = i32}> : () -> !wasmssa<local ref to i32> loc("<stdin>":11:10)
    %2 = "wasmssa.local"() <{type = i32}> : () -> !wasmssa<local ref to i32> loc("<stdin>":12:10)
    %3 = "wasmssa.const"() <{value = 8 : i32}> : () -> i32 loc("<stdin>":13:10)
    %4 = "wasmssa.const"() <{value = 12 : i32}> : () -> i32 loc("<stdin>":14:10)
    %5 = "wasmssa.add"(%3, %4) : (i32, i32) -> i32 loc("<stdin>":15:10)
    "wasmssa.return"(%5) : (i32) -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":10:3)
  "wasmssa.func"() <{functionType = (i32) -> i32, sym_name = "func_2"}> ({
  ^bb0(%arg0: !wasmssa<local ref to i32> loc("<stdin>":19:8)):
    %0 = "wasmssa.const"() <{value = 3 : i32}> : () -> i32 loc("<stdin>":20:10)
    "wasmssa.return"(%0) : (i32) -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":18:3)
}) : () -> () loc("<stdin>":1:1)
