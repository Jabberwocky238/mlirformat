"builtin.module"() ({
  "wasmssa.func"() <{functionType = () -> f32, sym_name = "func_0"}> ({
    %6 = "wasmssa.local"() <{type = f32}> : () -> !wasmssa<local ref to f32>
    %7 = "wasmssa.local"() <{type = f32}> : () -> !wasmssa<local ref to f32>
    %8 = "wasmssa.const"() <{value = 8.000000e+00 : f32}> : () -> f32
    %9 = "wasmssa.const"() <{value = 1.200000e+01 : f32}> : () -> f32
    %10 = "wasmssa.add"(%8, %9) : (f32, f32) -> f32
    "wasmssa.return"(%10) : (f32) -> ()
  }) : () -> ()
  "wasmssa.func"() <{functionType = () -> i32, sym_name = "func_1"}> ({
    %1 = "wasmssa.local"() <{type = i32}> : () -> !wasmssa<local ref to i32>
    %2 = "wasmssa.local"() <{type = i32}> : () -> !wasmssa<local ref to i32>
    %3 = "wasmssa.const"() <{value = 8 : i32}> : () -> i32
    %4 = "wasmssa.const"() <{value = 12 : i32}> : () -> i32
    %5 = "wasmssa.add"(%3, %4) : (i32, i32) -> i32
    "wasmssa.return"(%5) : (i32) -> ()
  }) : () -> ()
  "wasmssa.func"() <{functionType = (i32) -> i32, sym_name = "func_2"}> ({
  ^bb0(%arg0: !wasmssa<local ref to i32>):
    %0 = "wasmssa.const"() <{value = 3 : i32}> : () -> i32
    "wasmssa.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

