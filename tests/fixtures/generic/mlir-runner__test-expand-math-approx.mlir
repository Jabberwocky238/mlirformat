"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f64) -> (), sym_name = "func_exp2f"}> ({
  ^bb0(%arg0: f64):
    %11 = "math.exp2"(%arg0) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64
    "vector.print"(%11) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "exp2f"}> ({
    %0 = "arith.constant"() <{value = 1.000000e+00 : f64}> : () -> f64
    "func.call"(%0) <{callee = @func_exp2f}> : (f64) -> ()
    %1 = "arith.constant"() <{value = 2.000000e+00 : f64}> : () -> f64
    "func.call"(%1) <{callee = @func_exp2f}> : (f64) -> ()
    %2 = "arith.constant"() <{value = 2.500000e+00 : f64}> : () -> f64
    "func.call"(%2) <{callee = @func_exp2f}> : (f64) -> ()
    %3 = "arith.constant"() <{value = -1.750000e+00 : f64}> : () -> f64
    "func.call"(%3) <{callee = @func_exp2f}> : (f64) -> ()
    %4 = "arith.constant"() <{value = 1.320000e-01 : f64}> : () -> f64
    "func.call"(%4) <{callee = @func_exp2f}> : (f64) -> ()
    %5 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %6 = "arith.constant"() <{value = 1.000000e+00 : f64}> : () -> f64
    %7 = "arith.divf"(%6, %5) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
    "func.call"(%7) <{callee = @func_exp2f}> : (f64) -> ()
    %8 = "arith.constant"() <{value = 0x415338D6C0000000 : f64}> : () -> f64
    "func.call"(%8) <{callee = @func_exp2f}> : (f64) -> ()
    %9 = "arith.constant"() <{value = -1.4044477616111843E+306 : f64}> : () -> f64
    "func.call"(%9) <{callee = @func_exp2f}> : (f64) -> ()
    %10 = "arith.constant"() <{value = 2.2471164185778949E+307 : f64}> : () -> f64
    "func.call"(%10) <{callee = @func_exp2f}> : (f64) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "func_roundf"}> ({
  ^bb0(%arg2: f32):
    %28 = "math.round"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "vector.print"(%28) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> (), sym_name = "func_roundf$bitcast_result_to_int"}> ({
  ^bb0(%arg1: f32):
    %26 = "math.round"(%arg1) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    %27 = "arith.bitcast"(%26) : (f32) -> i32
    "vector.print"(%27) <{punctuation = #vector.punctuation<newline>}> : (i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1xf32>) -> (), sym_name = "func_roundf$vector"}> ({
  ^bb0(%arg0: vector<1xf32>):
    %25 = "math.round"(%arg0) <{fastmath = #arith.fastmath<none>}> : (vector<1xf32>) -> vector<1xf32>
    "vector.print"(%25) <{punctuation = #vector.punctuation<newline>}> : (vector<1xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "roundf"}> ({
    %0 = "arith.constant"() <{value = 3.800000e+00 : f32}> : () -> f32
    "func.call"(%0) <{callee = @func_roundf}> : (f32) -> ()
    %1 = "arith.constant"() <{value = -3.800000e+00 : f32}> : () -> f32
    "func.call"(%1) <{callee = @func_roundf}> : (f32) -> ()
    %2 = "arith.constant"() <{value = -4.200000e+00 : f32}> : () -> f32
    "func.call"(%2) <{callee = @func_roundf}> : (f32) -> ()
    %3 = "arith.constant"() <{value = -4.950000e+02 : f32}> : () -> f32
    "func.call"(%3) <{callee = @func_roundf}> : (f32) -> ()
    %4 = "arith.constant"() <{value = 4.950000e+02 : f32}> : () -> f32
    "func.call"(%4) <{callee = @func_roundf}> : (f32) -> ()
    %5 = "arith.constant"() <{value = 8.500000e+00 : f32}> : () -> f32
    "func.call"(%5) <{callee = @func_roundf}> : (f32) -> ()
    %6 = "arith.constant"() <{value = -8.500000e+00 : f32}> : () -> f32
    "func.call"(%6) <{callee = @func_roundf}> : (f32) -> ()
    %7 = "arith.constant"() <{value = -4.000000e-01 : f32}> : () -> f32
    "func.call"(%7) <{callee = @func_roundf}> : (f32) -> ()
    %8 = "arith.constant"() <{value = -0.000000e+00 : f32}> : () -> f32
    %9 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %10 = "arith.constant"() <{value = 2139095040 : i32}> : () -> i32
    %11 = "arith.bitcast"(%10) : (i32) -> f32
    %12 = "arith.constant"() <{value = -8388608 : i32}> : () -> i32
    %13 = "arith.bitcast"(%12) : (i32) -> f32
    %14 = "arith.constant"() <{value = 2143289344 : i32}> : () -> i32
    %15 = "arith.bitcast"(%14) : (i32) -> f32
    %16 = "arith.constant"() <{value = -4194304 : i32}> : () -> i32
    %17 = "arith.bitcast"(%16) : (i32) -> f32
    "func.call"(%8) <{callee = @func_roundf}> : (f32) -> ()
    "func.call"(%9) <{callee = @func_roundf}> : (f32) -> ()
    "func.call"(%11) <{callee = @func_roundf}> : (f32) -> ()
    "func.call"(%13) <{callee = @func_roundf}> : (f32) -> ()
    "func.call"(%15) <{callee = @func_roundf$bitcast_result_to_int}> : (f32) -> ()
    "vector.print"(%14) <{punctuation = #vector.punctuation<newline>}> : (i32) -> ()
    "func.call"(%17) <{callee = @func_roundf$bitcast_result_to_int}> : (f32) -> ()
    "vector.print"(%16) <{punctuation = #vector.punctuation<newline>}> : (i32) -> ()
    %18 = "arith.constant"() <{value = 1.268000e+30 : f32}> : () -> f32
    "func.call"(%18) <{callee = @func_roundf}> : (f32) -> ()
    %19 = "arith.constant"() <{value = 8388606.5 : f32}> : () -> f32
    %20 = "arith.constant"() <{value = 0x4AFFFFFE : f32}> : () -> f32
    %21 = "arith.constant"() <{value = 8388607.5 : f32}> : () -> f32
    %22 = "arith.constant"() <{value = 0x4B000000 : f32}> : () -> f32
    %23 = "arith.constant"() <{value = 0x4B000001 : f32}> : () -> f32
    "func.call"(%19) <{callee = @func_roundf$bitcast_result_to_int}> : (f32) -> ()
    "func.call"(%20) <{callee = @func_roundf$bitcast_result_to_int}> : (f32) -> ()
    "func.call"(%21) <{callee = @func_roundf$bitcast_result_to_int}> : (f32) -> ()
    "func.call"(%22) <{callee = @func_roundf$bitcast_result_to_int}> : (f32) -> ()
    "func.call"(%23) <{callee = @func_roundf$bitcast_result_to_int}> : (f32) -> ()
    %24 = "arith.constant"() <{value = dense<5.000000e-01> : vector<1xf32>}> : () -> vector<1xf32>
    "func.call"(%24) <{callee = @func_roundf$vector}> : (vector<1xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f64, f64) -> (), sym_name = "func_powff64"}> ({
  ^bb0(%arg2: f64, %arg3: f64):
    %27 = "math.powf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
    "vector.print"(%27) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, f32) -> (), sym_name = "func_powff32"}> ({
  ^bb0(%arg0: f32, %arg1: f32):
    %26 = "math.powf"(%arg0, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "vector.print"(%26) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "powf"}> ({
    %0 = "arith.constant"() <{value = 4.000000e+00 : f64}> : () -> f64
    %1 = "arith.constant"() <{value = 2.000000e+00 : f64}> : () -> f64
    "func.call"(%0, %1) <{callee = @func_powff64}> : (f64, f64) -> ()
    %2 = "arith.constant"() <{value = 2.343000e+00 : f64}> : () -> f64
    %3 = "arith.constant"() <{value = 1.000000e+00 : f64}> : () -> f64
    "func.call"(%2, %3) <{callee = @func_powff64}> : (f64, f64) -> ()
    %4 = "arith.constant"() <{value = 4.250000e+00 : f64}> : () -> f64
    %5 = "arith.constant"() <{value = -1.200000e+00 : f64}> : () -> f64
    "func.call"(%4, %5) <{callee = @func_powff64}> : (f64, f64) -> ()
    %6 = "arith.constant"() <{value = 4.385000e+00 : f64}> : () -> f64
    %7 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    "func.call"(%6, %7) <{callee = @func_powff64}> : (f64, f64) -> ()
    %8 = "arith.constant"() <{value = 4.835000e+00 : f64}> : () -> f64
    %9 = "arith.constant"() <{value = 1.200000e+00 : f64}> : () -> f64
    "func.call"(%8, %9) <{callee = @func_powff64}> : (f64, f64) -> ()
    %10 = "arith.constant"() <{value = 1.000000e+00 : f64}> : () -> f64
    %11 = "arith.constant"() <{value = 0x7FFFFFFFFFFFFFFF : f64}> : () -> f64
    "func.call"(%10, %11) <{callee = @func_powff64}> : (f64, f64) -> ()
    %12 = "arith.constant"() <{value = 2.938500e+04 : f64}> : () -> f64
    %13 = "arith.constant"() <{value = 2.359800e+04 : f64}> : () -> f64
    "func.call"(%12, %13) <{callee = @func_powff64}> : (f64, f64) -> ()
    %14 = "arith.constant"() <{value = 1.000000e+00 : f64}> : () -> f64
    %15 = "arith.constant"() <{value = 0xFFF0000001000000 : f64}> : () -> f64
    "func.call"(%14, %15) <{callee = @func_powff64}> : (f64, f64) -> ()
    %16 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %17 = "arith.constant"() <{value = 0xFFFFFFFF : f32}> : () -> f32
    "func.call"(%16, %17) <{callee = @func_powff32}> : (f32, f32) -> ()
    %18 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %19 = "math.powf"(%18, %18) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "vector.print"(%19) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    %20 = "arith.constant"() <{value = -2.000000e+00 : f32}> : () -> f32
    %21 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %22 = "math.powf"(%20, %21) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "vector.print"(%22) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    %23 = "arith.constant"() <{value = -2.000000e+00 : f32}> : () -> f32
    %24 = "arith.constant"() <{value = -2.000000e+00 : f32}> : () -> f32
    %25 = "math.powf"(%20, %24) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "vector.print"(%25) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "func_roundeven32"}> ({
  ^bb0(%arg5: f32):
    %99 = "math.roundeven"(%arg5) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "vector.print"(%99) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> (), sym_name = "func_roundeven32$bitcast_result_to_int"}> ({
  ^bb0(%arg4: f32):
    %97 = "math.roundeven"(%arg4) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    %98 = "arith.bitcast"(%97) : (f32) -> i32
    "vector.print"(%98) <{punctuation = #vector.punctuation<newline>}> : (i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1xf32>) -> (), sym_name = "func_roundeven32$vector"}> ({
  ^bb0(%arg3: vector<1xf32>):
    %96 = "math.roundeven"(%arg3) <{fastmath = #arith.fastmath<none>}> : (vector<1xf32>) -> vector<1xf32>
    "vector.print"(%96) <{punctuation = #vector.punctuation<newline>}> : (vector<1xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "roundeven32"}> ({
    %50 = "arith.constant"() <{value = 2.500000e-01 : f32}> : () -> f32
    %51 = "arith.constant"() <{value = 5.000000e-01 : f32}> : () -> f32
    %52 = "arith.constant"() <{value = 7.500000e-01 : f32}> : () -> f32
    %53 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %54 = "arith.constant"() <{value = 1.250000e+00 : f32}> : () -> f32
    %55 = "arith.constant"() <{value = 1.500000e+00 : f32}> : () -> f32
    %56 = "arith.constant"() <{value = 1.750000e+00 : f32}> : () -> f32
    %57 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %58 = "arith.constant"() <{value = 2.250000e+00 : f32}> : () -> f32
    %59 = "arith.constant"() <{value = 2.500000e+00 : f32}> : () -> f32
    %60 = "arith.constant"() <{value = 2.750000e+00 : f32}> : () -> f32
    %61 = "arith.constant"() <{value = 3.000000e+00 : f32}> : () -> f32
    %62 = "arith.constant"() <{value = 3.250000e+00 : f32}> : () -> f32
    %63 = "arith.constant"() <{value = 3.500000e+00 : f32}> : () -> f32
    %64 = "arith.constant"() <{value = 3.750000e+00 : f32}> : () -> f32
    %65 = "arith.constant"() <{value = -2.500000e-01 : f32}> : () -> f32
    %66 = "arith.constant"() <{value = -5.000000e-01 : f32}> : () -> f32
    %67 = "arith.constant"() <{value = -7.500000e-01 : f32}> : () -> f32
    %68 = "arith.constant"() <{value = -1.000000e+00 : f32}> : () -> f32
    %69 = "arith.constant"() <{value = -1.250000e+00 : f32}> : () -> f32
    %70 = "arith.constant"() <{value = -1.500000e+00 : f32}> : () -> f32
    %71 = "arith.constant"() <{value = -1.750000e+00 : f32}> : () -> f32
    %72 = "arith.constant"() <{value = -2.000000e+00 : f32}> : () -> f32
    %73 = "arith.constant"() <{value = -2.250000e+00 : f32}> : () -> f32
    %74 = "arith.constant"() <{value = -2.500000e+00 : f32}> : () -> f32
    %75 = "arith.constant"() <{value = -2.750000e+00 : f32}> : () -> f32
    %76 = "arith.constant"() <{value = -3.000000e+00 : f32}> : () -> f32
    %77 = "arith.constant"() <{value = -3.250000e+00 : f32}> : () -> f32
    %78 = "arith.constant"() <{value = -3.500000e+00 : f32}> : () -> f32
    %79 = "arith.constant"() <{value = -3.750000e+00 : f32}> : () -> f32
    "func.call"(%50) <{callee = @func_roundeven32}> : (f32) -> ()
    "func.call"(%51) <{callee = @func_roundeven32}> : (f32) -> ()
    "func.call"(%52) <{callee = @func_roundeven32}> : (f32) -> ()
    "func.call"(%53) <{callee = @func_roundeven32}> : (f32) -> ()
    "func.call"(%54) <{callee = @func_roundeven32}> : (f32) -> ()
    "func.call"(%55) <{callee = @func_roundeven32}> : (f32) -> ()
    "func.call"(%56) <{callee = @func_roundeven32}> : (f32) -> ()
    "func.call"(%57) <{callee = @func_roundeven32}> : (f32) -> ()
    "func.call"(%58) <{callee = @func_roundeven32}> : (f32) -> ()
    "func.call"(%59) <{callee = @func_roundeven32}> : (f32) -> ()
    "func.call"(%60) <{callee = @func_roundeven32}> : (f32) -> ()
    "func.call"(%61) <{callee = @func_roundeven32}> : (f32) -> ()
    "func.call"(%62) <{callee = @func_roundeven32}> : (f32) -> ()
    "func.call"(%63) <{callee = @func_roundeven32}> : (f32) -> ()
    "func.call"(%64) <{callee = @func_roundeven32}> : (f32) -> ()
    "func.call"(%65) <{callee = @func_roundeven32}> : (f32) -> ()
    "func.call"(%66) <{callee = @func_roundeven32}> : (f32) -> ()
    "func.call"(%67) <{callee = @func_roundeven32}> : (f32) -> ()
    "func.call"(%68) <{callee = @func_roundeven32}> : (f32) -> ()
    "func.call"(%69) <{callee = @func_roundeven32}> : (f32) -> ()
    "func.call"(%70) <{callee = @func_roundeven32}> : (f32) -> ()
    "func.call"(%71) <{callee = @func_roundeven32}> : (f32) -> ()
    "func.call"(%72) <{callee = @func_roundeven32}> : (f32) -> ()
    "func.call"(%73) <{callee = @func_roundeven32}> : (f32) -> ()
    "func.call"(%74) <{callee = @func_roundeven32}> : (f32) -> ()
    "func.call"(%75) <{callee = @func_roundeven32}> : (f32) -> ()
    "func.call"(%76) <{callee = @func_roundeven32}> : (f32) -> ()
    "func.call"(%77) <{callee = @func_roundeven32}> : (f32) -> ()
    "func.call"(%78) <{callee = @func_roundeven32}> : (f32) -> ()
    "func.call"(%79) <{callee = @func_roundeven32}> : (f32) -> ()
    %80 = "arith.constant"() <{value = -0.000000e+00 : f32}> : () -> f32
    %81 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %82 = "arith.constant"() <{value = 2139095040 : i32}> : () -> i32
    %83 = "arith.bitcast"(%82) : (i32) -> f32
    %84 = "arith.constant"() <{value = -8388608 : i32}> : () -> i32
    %85 = "arith.bitcast"(%84) : (i32) -> f32
    %86 = "arith.constant"() <{value = 2143289344 : i32}> : () -> i32
    %87 = "arith.bitcast"(%86) : (i32) -> f32
    %88 = "arith.constant"() <{value = -4194304 : i32}> : () -> i32
    %89 = "arith.bitcast"(%88) : (i32) -> f32
    "func.call"(%80) <{callee = @func_roundeven32}> : (f32) -> ()
    "func.call"(%81) <{callee = @func_roundeven32}> : (f32) -> ()
    "func.call"(%83) <{callee = @func_roundeven32}> : (f32) -> ()
    "func.call"(%85) <{callee = @func_roundeven32}> : (f32) -> ()
    "func.call"(%87) <{callee = @func_roundeven32$bitcast_result_to_int}> : (f32) -> ()
    "vector.print"(%86) <{punctuation = #vector.punctuation<newline>}> : (i32) -> ()
    "func.call"(%89) <{callee = @func_roundeven32$bitcast_result_to_int}> : (f32) -> ()
    "vector.print"(%88) <{punctuation = #vector.punctuation<newline>}> : (i32) -> ()
    %90 = "arith.constant"() <{value = 8388606.5 : f32}> : () -> f32
    %91 = "arith.constant"() <{value = 0x4AFFFFFE : f32}> : () -> f32
    %92 = "arith.constant"() <{value = 8388607.5 : f32}> : () -> f32
    %93 = "arith.constant"() <{value = 0x4B000000 : f32}> : () -> f32
    %94 = "arith.constant"() <{value = 0x4B000001 : f32}> : () -> f32
    "func.call"(%90) <{callee = @func_roundeven32$bitcast_result_to_int}> : (f32) -> ()
    "func.call"(%91) <{callee = @func_roundeven32$bitcast_result_to_int}> : (f32) -> ()
    "func.call"(%92) <{callee = @func_roundeven32$bitcast_result_to_int}> : (f32) -> ()
    "func.call"(%93) <{callee = @func_roundeven32$bitcast_result_to_int}> : (f32) -> ()
    "func.call"(%94) <{callee = @func_roundeven32$bitcast_result_to_int}> : (f32) -> ()
    %95 = "arith.constant"() <{value = dense<5.000000e-01> : vector<1xf32>}> : () -> vector<1xf32>
    "func.call"(%95) <{callee = @func_roundeven32$vector}> : (vector<1xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64) -> (), sym_name = "func_roundeven64"}> ({
  ^bb0(%arg2: f64):
    %49 = "math.roundeven"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64
    "vector.print"(%49) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64) -> (), sym_name = "func_roundeven64$bitcast_result_to_int"}> ({
  ^bb0(%arg1: f64):
    %47 = "math.roundeven"(%arg1) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64
    %48 = "arith.bitcast"(%47) : (f64) -> i64
    "vector.print"(%48) <{punctuation = #vector.punctuation<newline>}> : (i64) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1xf64>) -> (), sym_name = "func_roundeven64$vector"}> ({
  ^bb0(%arg0: vector<1xf64>):
    %46 = "math.roundeven"(%arg0) <{fastmath = #arith.fastmath<none>}> : (vector<1xf64>) -> vector<1xf64>
    "vector.print"(%46) <{punctuation = #vector.punctuation<newline>}> : (vector<1xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "roundeven64"}> ({
    %0 = "arith.constant"() <{value = 2.500000e-01 : f64}> : () -> f64
    %1 = "arith.constant"() <{value = 5.000000e-01 : f64}> : () -> f64
    %2 = "arith.constant"() <{value = 7.500000e-01 : f64}> : () -> f64
    %3 = "arith.constant"() <{value = 1.000000e+00 : f64}> : () -> f64
    %4 = "arith.constant"() <{value = 1.250000e+00 : f64}> : () -> f64
    %5 = "arith.constant"() <{value = 1.500000e+00 : f64}> : () -> f64
    %6 = "arith.constant"() <{value = 1.750000e+00 : f64}> : () -> f64
    %7 = "arith.constant"() <{value = 2.000000e+00 : f64}> : () -> f64
    %8 = "arith.constant"() <{value = 2.250000e+00 : f64}> : () -> f64
    %9 = "arith.constant"() <{value = 2.500000e+00 : f64}> : () -> f64
    %10 = "arith.constant"() <{value = 2.750000e+00 : f64}> : () -> f64
    %11 = "arith.constant"() <{value = 3.000000e+00 : f64}> : () -> f64
    %12 = "arith.constant"() <{value = 3.250000e+00 : f64}> : () -> f64
    %13 = "arith.constant"() <{value = 3.500000e+00 : f64}> : () -> f64
    %14 = "arith.constant"() <{value = 3.750000e+00 : f64}> : () -> f64
    %15 = "arith.constant"() <{value = -2.500000e-01 : f64}> : () -> f64
    %16 = "arith.constant"() <{value = -5.000000e-01 : f64}> : () -> f64
    %17 = "arith.constant"() <{value = -7.500000e-01 : f64}> : () -> f64
    %18 = "arith.constant"() <{value = -1.000000e+00 : f64}> : () -> f64
    %19 = "arith.constant"() <{value = -1.250000e+00 : f64}> : () -> f64
    %20 = "arith.constant"() <{value = -1.500000e+00 : f64}> : () -> f64
    %21 = "arith.constant"() <{value = -1.750000e+00 : f64}> : () -> f64
    %22 = "arith.constant"() <{value = -2.000000e+00 : f64}> : () -> f64
    %23 = "arith.constant"() <{value = -2.250000e+00 : f64}> : () -> f64
    %24 = "arith.constant"() <{value = -2.500000e+00 : f64}> : () -> f64
    %25 = "arith.constant"() <{value = -2.750000e+00 : f64}> : () -> f64
    %26 = "arith.constant"() <{value = -3.000000e+00 : f64}> : () -> f64
    %27 = "arith.constant"() <{value = -3.250000e+00 : f64}> : () -> f64
    %28 = "arith.constant"() <{value = -3.500000e+00 : f64}> : () -> f64
    %29 = "arith.constant"() <{value = -3.750000e+00 : f64}> : () -> f64
    "func.call"(%0) <{callee = @func_roundeven64}> : (f64) -> ()
    "func.call"(%1) <{callee = @func_roundeven64}> : (f64) -> ()
    "func.call"(%2) <{callee = @func_roundeven64}> : (f64) -> ()
    "func.call"(%3) <{callee = @func_roundeven64}> : (f64) -> ()
    "func.call"(%4) <{callee = @func_roundeven64}> : (f64) -> ()
    "func.call"(%5) <{callee = @func_roundeven64}> : (f64) -> ()
    "func.call"(%6) <{callee = @func_roundeven64}> : (f64) -> ()
    "func.call"(%7) <{callee = @func_roundeven64}> : (f64) -> ()
    "func.call"(%8) <{callee = @func_roundeven64}> : (f64) -> ()
    "func.call"(%9) <{callee = @func_roundeven64}> : (f64) -> ()
    "func.call"(%10) <{callee = @func_roundeven64}> : (f64) -> ()
    "func.call"(%11) <{callee = @func_roundeven64}> : (f64) -> ()
    "func.call"(%12) <{callee = @func_roundeven64}> : (f64) -> ()
    "func.call"(%13) <{callee = @func_roundeven64}> : (f64) -> ()
    "func.call"(%14) <{callee = @func_roundeven64}> : (f64) -> ()
    "func.call"(%15) <{callee = @func_roundeven64}> : (f64) -> ()
    "func.call"(%16) <{callee = @func_roundeven64}> : (f64) -> ()
    "func.call"(%17) <{callee = @func_roundeven64}> : (f64) -> ()
    "func.call"(%18) <{callee = @func_roundeven64}> : (f64) -> ()
    "func.call"(%19) <{callee = @func_roundeven64}> : (f64) -> ()
    "func.call"(%20) <{callee = @func_roundeven64}> : (f64) -> ()
    "func.call"(%21) <{callee = @func_roundeven64}> : (f64) -> ()
    "func.call"(%22) <{callee = @func_roundeven64}> : (f64) -> ()
    "func.call"(%23) <{callee = @func_roundeven64}> : (f64) -> ()
    "func.call"(%24) <{callee = @func_roundeven64}> : (f64) -> ()
    "func.call"(%25) <{callee = @func_roundeven64}> : (f64) -> ()
    "func.call"(%26) <{callee = @func_roundeven64}> : (f64) -> ()
    "func.call"(%27) <{callee = @func_roundeven64}> : (f64) -> ()
    "func.call"(%28) <{callee = @func_roundeven64}> : (f64) -> ()
    "func.call"(%29) <{callee = @func_roundeven64}> : (f64) -> ()
    %30 = "arith.constant"() <{value = -0.000000e+00 : f64}> : () -> f64
    %31 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %32 = "arith.constant"() <{value = 9218868437227405312 : i64}> : () -> i64
    %33 = "arith.bitcast"(%32) : (i64) -> f64
    %34 = "arith.constant"() <{value = -4503599627370496 : i64}> : () -> i64
    %35 = "arith.bitcast"(%34) : (i64) -> f64
    %36 = "arith.constant"() <{value = 9218868437227405313 : i64}> : () -> i64
    %37 = "arith.bitcast"(%36) : (i64) -> f64
    %38 = "arith.constant"() <{value = -4503599627370495 : i64}> : () -> i64
    %39 = "arith.bitcast"(%38) : (i64) -> f64
    "func.call"(%30) <{callee = @func_roundeven64}> : (f64) -> ()
    "func.call"(%31) <{callee = @func_roundeven64}> : (f64) -> ()
    "func.call"(%33) <{callee = @func_roundeven64}> : (f64) -> ()
    "func.call"(%35) <{callee = @func_roundeven64}> : (f64) -> ()
    %40 = "arith.constant"() <{value = 4503599627370494.5 : f64}> : () -> f64
    %41 = "arith.constant"() <{value = 0x432FFFFFFFFFFFFE : f64}> : () -> f64
    %42 = "arith.constant"() <{value = 4503599627370495.5 : f64}> : () -> f64
    %43 = "arith.constant"() <{value = 0x4330000000000000 : f64}> : () -> f64
    %44 = "arith.constant"() <{value = 0x4330000000000001 : f64}> : () -> f64
    "func.call"(%40) <{callee = @func_roundeven64$bitcast_result_to_int}> : (f64) -> ()
    "func.call"(%41) <{callee = @func_roundeven64$bitcast_result_to_int}> : (f64) -> ()
    "func.call"(%42) <{callee = @func_roundeven64$bitcast_result_to_int}> : (f64) -> ()
    "func.call"(%43) <{callee = @func_roundeven64$bitcast_result_to_int}> : (f64) -> ()
    "func.call"(%44) <{callee = @func_roundeven64$bitcast_result_to_int}> : (f64) -> ()
    %45 = "arith.constant"() <{value = dense<5.000000e-01> : vector<1xf64>}> : () -> vector<1xf64>
    "func.call"(%45) <{callee = @func_roundeven64$vector}> : (vector<1xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "roundeven"}> ({
    "func.call"() <{callee = @roundeven32}> : () -> ()
    "func.call"() <{callee = @roundeven64}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "sinh_f32"}> ({
  ^bb0(%arg2: f32):
    %7 = "math.sinh"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "vector.print"(%7) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf32>) -> (), sym_name = "sinh_4xf32"}> ({
  ^bb0(%arg1: vector<4xf32>):
    %6 = "math.sinh"(%arg1) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> vector<4xf32>
    "vector.print"(%6) <{punctuation = #vector.punctuation<newline>}> : (vector<4xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf32>) -> (), sym_name = "sinh_8xf32"}> ({
  ^bb0(%arg0: vector<8xf32>):
    %5 = "math.sinh"(%arg0) <{fastmath = #arith.fastmath<none>}> : (vector<8xf32>) -> vector<8xf32>
    "vector.print"(%5) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "sinh"}> ({
    %0 = "arith.constant"() <{value = 1.250000e+00 : f32}> : () -> f32
    "func.call"(%0) <{callee = @sinh_f32}> : (f32) -> ()
    %1 = "arith.constant"() <{value = dense<[2.500000e-01, 7.500000e-01, 1.000000e+00, 1.250000e+00]> : vector<4xf32>}> : () -> vector<4xf32>
    "func.call"(%1) <{callee = @sinh_4xf32}> : (vector<4xf32>) -> ()
    %2 = "arith.constant"() <{value = dense<[1.000000e-01, 2.000000e-01, 3.000000e-01, 4.000000e-01, 5.000000e-01, 6.000000e-01, 0.699999988, 8.000000e-01]> : vector<8xf32>}> : () -> vector<8xf32>
    "func.call"(%2) <{callee = @sinh_8xf32}> : (vector<8xf32>) -> ()
    %3 = "arith.constant"() <{value = dense<[-1.000000e-01, -2.000000e-01, -3.000000e-01, -4.000000e-01, -5.000000e-01, -6.000000e-01, -0.699999988, -8.000000e-01]> : vector<8xf32>}> : () -> vector<8xf32>
    "func.call"(%3) <{callee = @sinh_8xf32}> : (vector<8xf32>) -> ()
    %4 = "arith.constant"() <{value = 0x7FC00000 : f32}> : () -> f32
    "func.call"(%4) <{callee = @sinh_f32}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "cosh_f32"}> ({
  ^bb0(%arg2: f32):
    %7 = "math.cosh"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "vector.print"(%7) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf32>) -> (), sym_name = "cosh_4xf32"}> ({
  ^bb0(%arg1: vector<4xf32>):
    %6 = "math.cosh"(%arg1) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> vector<4xf32>
    "vector.print"(%6) <{punctuation = #vector.punctuation<newline>}> : (vector<4xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf32>) -> (), sym_name = "cosh_8xf32"}> ({
  ^bb0(%arg0: vector<8xf32>):
    %5 = "math.cosh"(%arg0) <{fastmath = #arith.fastmath<none>}> : (vector<8xf32>) -> vector<8xf32>
    "vector.print"(%5) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "cosh"}> ({
    %0 = "arith.constant"() <{value = 1.250000e+00 : f32}> : () -> f32
    "func.call"(%0) <{callee = @cosh_f32}> : (f32) -> ()
    %1 = "arith.constant"() <{value = dense<[2.500000e-01, 7.500000e-01, 1.000000e+00, 1.250000e+00]> : vector<4xf32>}> : () -> vector<4xf32>
    "func.call"(%1) <{callee = @cosh_4xf32}> : (vector<4xf32>) -> ()
    %2 = "arith.constant"() <{value = dense<[1.000000e-01, 2.000000e-01, 3.000000e-01, 4.000000e-01, 5.000000e-01, 6.000000e-01, 0.699999988, 8.000000e-01]> : vector<8xf32>}> : () -> vector<8xf32>
    "func.call"(%2) <{callee = @cosh_8xf32}> : (vector<8xf32>) -> ()
    %3 = "arith.constant"() <{value = dense<[-1.000000e-01, -2.000000e-01, -3.000000e-01, -4.000000e-01, -5.000000e-01, -6.000000e-01, -0.699999988, -8.000000e-01]> : vector<8xf32>}> : () -> vector<8xf32>
    "func.call"(%3) <{callee = @cosh_8xf32}> : (vector<8xf32>) -> ()
    %4 = "arith.constant"() <{value = 0x7FC00000 : f32}> : () -> f32
    "func.call"(%4) <{callee = @cosh_f32}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xf32>) -> (), sym_name = "tanh_8xf32"}> ({
  ^bb0(%arg0: vector<8xf32>):
    %1 = "math.tanh"(%arg0) <{fastmath = #arith.fastmath<none>}> : (vector<8xf32>) -> vector<8xf32>
    "vector.print"(%1) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "tanh"}> ({
    %0 = "arith.constant"() <{value = dense<[0xFF800000, -1.000000e+00, -3.000000e-01, 0.000000e+00, 3.000000e-01, 1.000000e+00, 1.000000e+01, 0x7F800000]> : vector<8xf32>}> : () -> vector<8xf32>
    "func.call"(%0) <{callee = @tanh_8xf32}> : (vector<8xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "asinh_f32"}> ({
  ^bb0(%arg1: f32):
    %6 = "math.asinh"(%arg1) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "vector.print"(%6) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf32>) -> (), sym_name = "asinh_3xf32"}> ({
  ^bb0(%arg0: vector<3xf32>):
    %5 = "math.asinh"(%arg0) <{fastmath = #arith.fastmath<none>}> : (vector<3xf32>) -> vector<3xf32>
    "vector.print"(%5) <{punctuation = #vector.punctuation<newline>}> : (vector<3xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "asinh"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "func.call"(%0) <{callee = @asinh_f32}> : (f32) -> ()
    %1 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "func.call"(%1) <{callee = @asinh_f32}> : (f32) -> ()
    %2 = "arith.constant"() <{value = -1.000000e+00 : f32}> : () -> f32
    "func.call"(%2) <{callee = @asinh_f32}> : (f32) -> ()
    %3 = "arith.constant"() <{value = 3.000000e+00 : f32}> : () -> f32
    "func.call"(%3) <{callee = @asinh_f32}> : (f32) -> ()
    %4 = "arith.constant"() <{value = dense<[2.500000e-01, 8.750000e-01, 2.000000e+00]> : vector<3xf32>}> : () -> vector<3xf32>
    "func.call"(%4) <{callee = @asinh_3xf32}> : (vector<3xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "acosh_f32"}> ({
  ^bb0(%arg1: f32):
    %5 = "math.acosh"(%arg1) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "vector.print"(%5) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf32>) -> (), sym_name = "acosh_3xf32"}> ({
  ^bb0(%arg0: vector<3xf32>):
    %4 = "math.acosh"(%arg0) <{fastmath = #arith.fastmath<none>}> : (vector<3xf32>) -> vector<3xf32>
    "vector.print"(%4) <{punctuation = #vector.punctuation<newline>}> : (vector<3xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "acosh"}> ({
    %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "func.call"(%0) <{callee = @acosh_f32}> : (f32) -> ()
    %1 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    "func.call"(%1) <{callee = @acosh_f32}> : (f32) -> ()
    %2 = "arith.constant"() <{value = 1.000000e+01 : f32}> : () -> f32
    "func.call"(%2) <{callee = @acosh_f32}> : (f32) -> ()
    %3 = "arith.constant"() <{value = dense<[1.500000e+00, 3.000000e+00, 6.000000e+00]> : vector<3xf32>}> : () -> vector<3xf32>
    "func.call"(%3) <{callee = @acosh_3xf32}> : (vector<3xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "atanh_f32"}> ({
  ^bb0(%arg1: f32):
    %6 = "math.atanh"(%arg1) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "vector.print"(%6) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf32>) -> (), sym_name = "atanh_3xf32"}> ({
  ^bb0(%arg0: vector<3xf32>):
    %5 = "math.atanh"(%arg0) <{fastmath = #arith.fastmath<none>}> : (vector<3xf32>) -> vector<3xf32>
    "vector.print"(%5) <{punctuation = #vector.punctuation<newline>}> : (vector<3xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "atanh"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "func.call"(%0) <{callee = @atanh_f32}> : (f32) -> ()
    %1 = "arith.constant"() <{value = 5.000000e-01 : f32}> : () -> f32
    "func.call"(%1) <{callee = @atanh_f32}> : (f32) -> ()
    %2 = "arith.constant"() <{value = -5.000000e-01 : f32}> : () -> f32
    "func.call"(%2) <{callee = @atanh_f32}> : (f32) -> ()
    %3 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "func.call"(%3) <{callee = @atanh_f32}> : (f32) -> ()
    %4 = "arith.constant"() <{value = dense<[2.500000e-01, 3.750000e-01, 9.950000e-01]> : vector<3xf32>}> : () -> vector<3xf32>
    "func.call"(%4) <{callee = @atanh_3xf32}> : (vector<3xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

