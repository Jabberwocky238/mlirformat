"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "tanh_f32"}> ({
  ^bb0(%arg2: f32):
    %6 = "math.tanh"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "vector.print"(%6) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf32>) -> (), sym_name = "tanh_4xf32"}> ({
  ^bb0(%arg1: vector<4xf32>):
    %5 = "math.tanh"(%arg1) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> vector<4xf32>
    "vector.print"(%5) <{punctuation = #vector.punctuation<newline>}> : (vector<4xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf32>) -> (), sym_name = "tanh_8xf32"}> ({
  ^bb0(%arg0: vector<8xf32>):
    %4 = "math.tanh"(%arg0) <{fastmath = #arith.fastmath<none>}> : (vector<8xf32>) -> vector<8xf32>
    "vector.print"(%4) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "tanh"}> ({
    %0 = "arith.constant"() <{value = 1.250000e+00 : f32}> : () -> f32
    "func.call"(%0) <{callee = @tanh_f32}> : (f32) -> ()
    %1 = "arith.constant"() <{value = dense<[2.500000e-01, 7.500000e-01, 1.000000e+00, 1.250000e+00]> : vector<4xf32>}> : () -> vector<4xf32>
    "func.call"(%1) <{callee = @tanh_4xf32}> : (vector<4xf32>) -> ()
    %2 = "arith.constant"() <{value = dense<[1.000000e-01, 2.000000e-01, 3.000000e-01, 4.000000e-01, 5.000000e-01, 6.000000e-01, 0.699999988, 8.000000e-01]> : vector<8xf32>}> : () -> vector<8xf32>
    "func.call"(%2) <{callee = @tanh_8xf32}> : (vector<8xf32>) -> ()
    %3 = "arith.constant"() <{value = 0x7FC00000 : f32}> : () -> f32
    "func.call"(%3) <{callee = @tanh_f32}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "log_f32"}> ({
  ^bb0(%arg8: f32):
    %29 = "math.log"(%arg8) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "vector.print"(%29) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf32>) -> (), sym_name = "log_4xf32"}> ({
  ^bb0(%arg7: vector<4xf32>):
    %28 = "math.log"(%arg7) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> vector<4xf32>
    "vector.print"(%28) <{punctuation = #vector.punctuation<newline>}> : (vector<4xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf32>) -> (), sym_name = "log_8xf32"}> ({
  ^bb0(%arg6: vector<8xf32>):
    %27 = "math.log"(%arg6) <{fastmath = #arith.fastmath<none>}> : (vector<8xf32>) -> vector<8xf32>
    "vector.print"(%27) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "log"}> ({
    %20 = "arith.constant"() <{value = 14.1122332 : f32}> : () -> f32
    "func.call"(%20) <{callee = @log_f32}> : (f32) -> ()
    %21 = "arith.constant"() <{value = dense<[2.500000e-01, 7.500000e-01, 1.000000e+00, 1.250000e+00]> : vector<4xf32>}> : () -> vector<4xf32>
    "func.call"(%21) <{callee = @log_4xf32}> : (vector<4xf32>) -> ()
    %22 = "arith.constant"() <{value = dense<[1.000000e-01, 2.000000e-01, 3.000000e-01, 4.000000e-01, 5.000000e-01, 6.000000e-01, 0.699999988, 8.000000e-01]> : vector<8xf32>}> : () -> vector<8xf32>
    "func.call"(%22) <{callee = @log_8xf32}> : (vector<8xf32>) -> ()
    %23 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "func.call"(%23) <{callee = @log_f32}> : (f32) -> ()
    %24 = "arith.constant"() <{value = 0x7FC00000 : f32}> : () -> f32
    "func.call"(%24) <{callee = @log_f32}> : (f32) -> ()
    %25 = "arith.constant"() <{value = 0x7F800000 : f32}> : () -> f32
    "func.call"(%25) <{callee = @log_f32}> : (f32) -> ()
    %26 = "arith.constant"() <{value = dense<[0.000000e+00, -1.000000e+00, 0x7F800000, 2.000000e+00]> : vector<4xf32>}> : () -> vector<4xf32>
    "func.call"(%26) <{callee = @log_4xf32}> : (vector<4xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> (), sym_name = "log2_f32"}> ({
  ^bb0(%arg5: f32):
    %19 = "math.log2"(%arg5) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "vector.print"(%19) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf32>) -> (), sym_name = "log2_4xf32"}> ({
  ^bb0(%arg4: vector<4xf32>):
    %18 = "math.log2"(%arg4) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> vector<4xf32>
    "vector.print"(%18) <{punctuation = #vector.punctuation<newline>}> : (vector<4xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf32>) -> (), sym_name = "log2_8xf32"}> ({
  ^bb0(%arg3: vector<8xf32>):
    %17 = "math.log2"(%arg3) <{fastmath = #arith.fastmath<none>}> : (vector<8xf32>) -> vector<8xf32>
    "vector.print"(%17) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "log2"}> ({
    %10 = "arith.constant"() <{value = 14.1122332 : f32}> : () -> f32
    "func.call"(%10) <{callee = @log2_f32}> : (f32) -> ()
    %11 = "arith.constant"() <{value = dense<[2.500000e-01, 7.500000e-01, 1.000000e+00, 1.250000e+00]> : vector<4xf32>}> : () -> vector<4xf32>
    "func.call"(%11) <{callee = @log2_4xf32}> : (vector<4xf32>) -> ()
    %12 = "arith.constant"() <{value = dense<[1.000000e-01, 2.000000e-01, 3.000000e-01, 4.000000e-01, 5.000000e-01, 6.000000e-01, 0.699999988, 8.000000e-01]> : vector<8xf32>}> : () -> vector<8xf32>
    "func.call"(%12) <{callee = @log2_8xf32}> : (vector<8xf32>) -> ()
    %13 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "func.call"(%13) <{callee = @log2_f32}> : (f32) -> ()
    %14 = "arith.constant"() <{value = -1.000000e+00 : f32}> : () -> f32
    "func.call"(%14) <{callee = @log2_f32}> : (f32) -> ()
    %15 = "arith.constant"() <{value = 0x7F800000 : f32}> : () -> f32
    "func.call"(%15) <{callee = @log2_f32}> : (f32) -> ()
    %16 = "arith.constant"() <{value = dense<[0.000000e+00, -1.000000e+00, 0x7F800000, 3.000000e+00]> : vector<4xf32>}> : () -> vector<4xf32>
    "func.call"(%16) <{callee = @log2_4xf32}> : (vector<4xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> (), sym_name = "log1p_f32"}> ({
  ^bb0(%arg2: f32):
    %9 = "math.log1p"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "vector.print"(%9) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf32>) -> (), sym_name = "log1p_4xf32"}> ({
  ^bb0(%arg1: vector<4xf32>):
    %8 = "math.log1p"(%arg1) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> vector<4xf32>
    "vector.print"(%8) <{punctuation = #vector.punctuation<newline>}> : (vector<4xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf32>) -> (), sym_name = "log1p_8xf32"}> ({
  ^bb0(%arg0: vector<8xf32>):
    %7 = "math.log1p"(%arg0) <{fastmath = #arith.fastmath<none>}> : (vector<8xf32>) -> vector<8xf32>
    "vector.print"(%7) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "log1p"}> ({
    %0 = "arith.constant"() <{value = 0.00999999977 : f32}> : () -> f32
    "func.call"(%0) <{callee = @log1p_f32}> : (f32) -> ()
    %1 = "arith.constant"() <{value = dense<[-9.900000e-01, -5.000000e-01, 0.000000e+00, 3.000000e+00]> : vector<4xf32>}> : () -> vector<4xf32>
    "func.call"(%1) <{callee = @log1p_4xf32}> : (vector<4xf32>) -> ()
    %2 = "arith.constant"() <{value = dense<[1.000000e-01, 2.000000e-01, 3.000000e-01, 4.000000e-01, 5.000000e-01, 6.000000e-01, 0.699999988, 8.000000e-01]> : vector<8xf32>}> : () -> vector<8xf32>
    "func.call"(%2) <{callee = @log1p_8xf32}> : (vector<8xf32>) -> ()
    %3 = "arith.constant"() <{value = -1.000000e+00 : f32}> : () -> f32
    "func.call"(%3) <{callee = @log1p_f32}> : (f32) -> ()
    %4 = "arith.constant"() <{value = -2.000000e+00 : f32}> : () -> f32
    "func.call"(%4) <{callee = @log1p_f32}> : (f32) -> ()
    %5 = "arith.constant"() <{value = 0x7F800000 : f32}> : () -> f32
    "func.call"(%5) <{callee = @log1p_f32}> : (f32) -> ()
    %6 = "arith.constant"() <{value = dense<[-1.000000e+00, -1.100000e+00, 0x7F800000, 9.99999974E-6]> : vector<4xf32>}> : () -> vector<4xf32>
    "func.call"(%6) <{callee = @log1p_4xf32}> : (vector<4xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "erf_f32"}> ({
  ^bb0(%arg1: f32):
    %14 = "math.erf"(%arg1) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "vector.print"(%14) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf32>) -> (), sym_name = "erf_4xf32"}> ({
  ^bb0(%arg0: vector<4xf32>):
    %13 = "math.erf"(%arg0) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> vector<4xf32>
    "vector.print"(%13) <{punctuation = #vector.punctuation<newline>}> : (vector<4xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "erf"}> ({
    %0 = "arith.constant"() <{value = -2.43186398E-4 : f32}> : () -> f32
    "func.call"(%0) <{callee = @erf_f32}> : (f32) -> ()
    %1 = "arith.constant"() <{value = 0.799989998 : f32}> : () -> f32
    "func.call"(%1) <{callee = @erf_f32}> : (f32) -> ()
    %2 = "arith.constant"() <{value = 8.000000e-01 : f32}> : () -> f32
    "func.call"(%2) <{callee = @erf_f32}> : (f32) -> ()
    %3 = "arith.constant"() <{value = 1.999990e+00 : f32}> : () -> f32
    "func.call"(%3) <{callee = @erf_f32}> : (f32) -> ()
    %4 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    "func.call"(%4) <{callee = @erf_f32}> : (f32) -> ()
    %5 = "arith.constant"() <{value = 3.749990e+00 : f32}> : () -> f32
    "func.call"(%5) <{callee = @erf_f32}> : (f32) -> ()
    %6 = "arith.constant"() <{value = 3.750000e+00 : f32}> : () -> f32
    "func.call"(%6) <{callee = @erf_f32}> : (f32) -> ()
    %7 = "arith.constant"() <{value = 0xFF800000 : f32}> : () -> f32
    "func.call"(%7) <{callee = @erf_f32}> : (f32) -> ()
    %8 = "arith.constant"() <{value = dense<[-3.40282347E+38, -4.543180e+00, -1.213090e+00, -7.823420e-01]> : vector<4xf32>}> : () -> vector<4xf32>
    "func.call"(%8) <{callee = @erf_4xf32}> : (vector<4xf32>) -> ()
    %9 = "arith.constant"() <{value = dense<[-1.17549435E-38, 0.000000e+00, 1.17549435E-38, 0.107934102]> : vector<4xf32>}> : () -> vector<4xf32>
    "func.call"(%9) <{callee = @erf_4xf32}> : (vector<4xf32>) -> ()
    %10 = "arith.constant"() <{value = dense<[1.235780e+00, 2.340930e+00, 3.823420e+00, 3.40282347E+38]> : vector<4xf32>}> : () -> vector<4xf32>
    "func.call"(%10) <{callee = @erf_4xf32}> : (vector<4xf32>) -> ()
    %11 = "arith.constant"() <{value = 0x7F800000 : f32}> : () -> f32
    "func.call"(%11) <{callee = @erf_f32}> : (f32) -> ()
    %12 = "arith.constant"() <{value = 0x7FC00000 : f32}> : () -> f32
    "func.call"(%12) <{callee = @erf_f32}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "erfc_f32"}> ({
  ^bb0(%arg1: f32):
    %14 = "math.erfc"(%arg1) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "vector.print"(%14) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf32>) -> (), sym_name = "erfc_4xf32"}> ({
  ^bb0(%arg0: vector<4xf32>):
    %13 = "math.erfc"(%arg0) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> vector<4xf32>
    "vector.print"(%13) <{punctuation = #vector.punctuation<newline>}> : (vector<4xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "erfc"}> ({
    %0 = "arith.constant"() <{value = -2.43186398E-4 : f32}> : () -> f32
    "func.call"(%0) <{callee = @erfc_f32}> : (f32) -> ()
    %1 = "arith.constant"() <{value = 0.799989998 : f32}> : () -> f32
    "func.call"(%1) <{callee = @erfc_f32}> : (f32) -> ()
    %2 = "arith.constant"() <{value = 8.000000e-01 : f32}> : () -> f32
    "func.call"(%2) <{callee = @erfc_f32}> : (f32) -> ()
    %3 = "arith.constant"() <{value = 1.999990e+00 : f32}> : () -> f32
    "func.call"(%3) <{callee = @erfc_f32}> : (f32) -> ()
    %4 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    "func.call"(%4) <{callee = @erfc_f32}> : (f32) -> ()
    %5 = "arith.constant"() <{value = 3.749990e+00 : f32}> : () -> f32
    "func.call"(%5) <{callee = @erfc_f32}> : (f32) -> ()
    %6 = "arith.constant"() <{value = 3.750000e+00 : f32}> : () -> f32
    "func.call"(%6) <{callee = @erfc_f32}> : (f32) -> ()
    %7 = "arith.constant"() <{value = 0xFF800000 : f32}> : () -> f32
    "func.call"(%7) <{callee = @erfc_f32}> : (f32) -> ()
    %8 = "arith.constant"() <{value = dense<[-3.40282347E+38, -4.543180e+00, -1.213090e+00, -7.823420e-01]> : vector<4xf32>}> : () -> vector<4xf32>
    "func.call"(%8) <{callee = @erfc_4xf32}> : (vector<4xf32>) -> ()
    %9 = "arith.constant"() <{value = dense<[-1.17549435E-38, 0.000000e+00, 1.17549435E-38, 0.107934102]> : vector<4xf32>}> : () -> vector<4xf32>
    "func.call"(%9) <{callee = @erfc_4xf32}> : (vector<4xf32>) -> ()
    %10 = "arith.constant"() <{value = dense<[1.235780e+00, 2.340930e+00, 3.823420e+00, 3.40282347E+38]> : vector<4xf32>}> : () -> vector<4xf32>
    "func.call"(%10) <{callee = @erfc_4xf32}> : (vector<4xf32>) -> ()
    %11 = "arith.constant"() <{value = 0x7F800000 : f32}> : () -> f32
    "func.call"(%11) <{callee = @erfc_f32}> : (f32) -> ()
    %12 = "arith.constant"() <{value = 0x7FC00000 : f32}> : () -> f32
    "func.call"(%12) <{callee = @erfc_f32}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "exp_f32"}> ({
  ^bb0(%arg5: f32):
    %19 = "math.exp"(%arg5) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "vector.print"(%19) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf32>) -> (), sym_name = "exp_4xf32"}> ({
  ^bb0(%arg4: vector<4xf32>):
    %18 = "math.exp"(%arg4) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> vector<4xf32>
    "vector.print"(%18) <{punctuation = #vector.punctuation<newline>}> : (vector<4xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "exp"}> ({
    %11 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "func.call"(%11) <{callee = @exp_f32}> : (f32) -> ()
    %12 = "arith.constant"() <{value = dense<[-2.500000e-01, 7.500000e-01, 1.000000e+00, 1.350000e+00]> : vector<4xf32>}> : () -> vector<4xf32>
    "func.call"(%12) <{callee = @exp_4xf32}> : (vector<4xf32>) -> ()
    %13 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "func.call"(%13) <{callee = @exp_f32}> : (f32) -> ()
    %14 = "arith.constant"() <{value = dense<[-8.900000e+01, -2.500000e+01, 2.500000e+01, 8.900000e+01]> : vector<4xf32>}> : () -> vector<4xf32>
    "func.call"(%14) <{callee = @exp_4xf32}> : (vector<4xf32>) -> ()
    %15 = "arith.constant"() <{value = 0x7F800000 : f32}> : () -> f32
    "func.call"(%15) <{callee = @exp_f32}> : (f32) -> ()
    %16 = "arith.constant"() <{value = 0xFF800000 : f32}> : () -> f32
    "func.call"(%16) <{callee = @exp_f32}> : (f32) -> ()
    %17 = "arith.constant"() <{value = 0x7FC00000 : f32}> : () -> f32
    "func.call"(%17) <{callee = @exp_f32}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> (), sym_name = "expm1_f32"}> ({
  ^bb0(%arg3: f32):
    %10 = "math.expm1"(%arg3) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "vector.print"(%10) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf32>) -> (), sym_name = "expm1_3xf32"}> ({
  ^bb0(%arg2: vector<3xf32>):
    %9 = "math.expm1"(%arg2) <{fastmath = #arith.fastmath<none>}> : (vector<3xf32>) -> vector<3xf32>
    "vector.print"(%9) <{punctuation = #vector.punctuation<newline>}> : (vector<3xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf32>) -> (), sym_name = "expm1_4xf32"}> ({
  ^bb0(%arg1: vector<4xf32>):
    %8 = "math.expm1"(%arg1) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> vector<4xf32>
    "vector.print"(%8) <{punctuation = #vector.punctuation<newline>}> : (vector<4xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf32>) -> (), sym_name = "expm1_8xf32"}> ({
  ^bb0(%arg0: vector<8xf32>):
    %7 = "math.expm1"(%arg0) <{fastmath = #arith.fastmath<none>}> : (vector<8xf32>) -> vector<8xf32>
    "vector.print"(%7) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "expm1"}> ({
    %0 = "arith.constant"() <{value = 1.000000e-10 : f32}> : () -> f32
    "func.call"(%0) <{callee = @expm1_f32}> : (f32) -> ()
    %1 = "arith.constant"() <{value = dense<[-0.00999999977, 0.00999999977, 5.000000e-01, 2.000000e+00]> : vector<4xf32>}> : () -> vector<4xf32>
    "func.call"(%1) <{callee = @expm1_4xf32}> : (vector<4xf32>) -> ()
    %2 = "arith.constant"() <{value = dense<[-2.000000e-01, 0.000000e+00, 2.000000e-01, 4.000000e-01, 6.000000e-01, 8.000000e-01, 1.000000e+00, 1.200000e+00]> : vector<8xf32>}> : () -> vector<8xf32>
    "func.call"(%2) <{callee = @expm1_8xf32}> : (vector<8xf32>) -> ()
    %3 = "arith.constant"() <{value = 0xFF800000 : f32}> : () -> f32
    "func.call"(%3) <{callee = @expm1_f32}> : (f32) -> ()
    %4 = "arith.constant"() <{value = 0x7F800000 : f32}> : () -> f32
    "func.call"(%4) <{callee = @expm1_f32}> : (f32) -> ()
    %5 = "arith.constant"() <{value = dense<[0xFF800000, 0x7F800000, 1.000000e-10]> : vector<3xf32>}> : () -> vector<3xf32>
    "func.call"(%5) <{callee = @expm1_3xf32}> : (vector<3xf32>) -> ()
    %6 = "arith.constant"() <{value = 0x7FC00000 : f32}> : () -> f32
    "func.call"(%6) <{callee = @expm1_f32}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "sin_f32"}> ({
  ^bb0(%arg1: f32):
    %7 = "math.sin"(%arg1) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "vector.print"(%7) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf32>) -> (), sym_name = "sin_3xf32"}> ({
  ^bb0(%arg0: vector<3xf32>):
    %6 = "math.sin"(%arg0) <{fastmath = #arith.fastmath<none>}> : (vector<3xf32>) -> vector<3xf32>
    "vector.print"(%6) <{punctuation = #vector.punctuation<newline>}> : (vector<3xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "sin"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "func.call"(%0) <{callee = @sin_f32}> : (f32) -> ()
    %1 = "arith.constant"() <{value = 0.785398185 : f32}> : () -> f32
    "func.call"(%1) <{callee = @sin_f32}> : (f32) -> ()
    %2 = "arith.constant"() <{value = 1.57079637 : f32}> : () -> f32
    "func.call"(%2) <{callee = @sin_f32}> : (f32) -> ()
    %3 = "arith.constant"() <{value = 3.14159274 : f32}> : () -> f32
    "func.call"(%3) <{callee = @sin_f32}> : (f32) -> ()
    %4 = "arith.constant"() <{value = 4.71238899 : f32}> : () -> f32
    "func.call"(%4) <{callee = @sin_f32}> : (f32) -> ()
    %5 = "arith.constant"() <{value = dense<[9.42477798, 2.09439516, -1.57079637]> : vector<3xf32>}> : () -> vector<3xf32>
    "func.call"(%5) <{callee = @sin_3xf32}> : (vector<3xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "cos_f32"}> ({
  ^bb0(%arg1: f32):
    %7 = "math.cos"(%arg1) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "vector.print"(%7) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf32>) -> (), sym_name = "cos_3xf32"}> ({
  ^bb0(%arg0: vector<3xf32>):
    %6 = "math.cos"(%arg0) <{fastmath = #arith.fastmath<none>}> : (vector<3xf32>) -> vector<3xf32>
    "vector.print"(%6) <{punctuation = #vector.punctuation<newline>}> : (vector<3xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "cos"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "func.call"(%0) <{callee = @cos_f32}> : (f32) -> ()
    %1 = "arith.constant"() <{value = 0.785398185 : f32}> : () -> f32
    "func.call"(%1) <{callee = @cos_f32}> : (f32) -> ()
    %2 = "arith.constant"() <{value = 1.57079637 : f32}> : () -> f32
    "func.call"(%2) <{callee = @cos_f32}> : (f32) -> ()
    %3 = "arith.constant"() <{value = 3.14159274 : f32}> : () -> f32
    "func.call"(%3) <{callee = @cos_f32}> : (f32) -> ()
    %4 = "arith.constant"() <{value = 4.71238899 : f32}> : () -> f32
    "func.call"(%4) <{callee = @cos_f32}> : (f32) -> ()
    %5 = "arith.constant"() <{value = dense<[9.42477798, 2.09439516, -1.57079637]> : vector<3xf32>}> : () -> vector<3xf32>
    "func.call"(%5) <{callee = @cos_3xf32}> : (vector<3xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "asin_f32"}> ({
  ^bb0(%arg1: f32):
    %7 = "math.asin"(%arg1) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "vector.print"(%7) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf32>) -> (), sym_name = "asin_3xf32"}> ({
  ^bb0(%arg0: vector<3xf32>):
    %6 = "math.asin"(%arg0) <{fastmath = #arith.fastmath<none>}> : (vector<3xf32>) -> vector<3xf32>
    "vector.print"(%6) <{punctuation = #vector.punctuation<newline>}> : (vector<3xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "asin"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "func.call"(%0) <{callee = @asin_f32}> : (f32) -> ()
    %1 = "arith.constant"() <{value = -5.625000e-01 : f32}> : () -> f32
    "func.call"(%1) <{callee = @asin_f32}> : (f32) -> ()
    %2 = "arith.constant"() <{value = -3.750000e-01 : f32}> : () -> f32
    "func.call"(%2) <{callee = @asin_f32}> : (f32) -> ()
    %3 = "arith.constant"() <{value = -2.500000e-01 : f32}> : () -> f32
    "func.call"(%3) <{callee = @asin_f32}> : (f32) -> ()
    %4 = "arith.constant"() <{value = -0.899999976 : f32}> : () -> f32
    "func.call"(%4) <{callee = @asin_f32}> : (f32) -> ()
    %5 = "arith.constant"() <{value = dense<[2.500000e-01, 3.750000e-01, 5.625000e-01]> : vector<3xf32>}> : () -> vector<3xf32>
    "func.call"(%5) <{callee = @asin_3xf32}> : (vector<3xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "acos_f32"}> ({
  ^bb0(%arg1: f32):
    %6 = "math.acos"(%arg1) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "vector.print"(%6) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf32>) -> (), sym_name = "acos_3xf32"}> ({
  ^bb0(%arg0: vector<3xf32>):
    %5 = "math.acos"(%arg0) <{fastmath = #arith.fastmath<none>}> : (vector<3xf32>) -> vector<3xf32>
    "vector.print"(%5) <{punctuation = #vector.punctuation<newline>}> : (vector<3xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "acos"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "func.call"(%0) <{callee = @acos_f32}> : (f32) -> ()
    %1 = "arith.constant"() <{value = -5.625000e-01 : f32}> : () -> f32
    "func.call"(%1) <{callee = @acos_f32}> : (f32) -> ()
    %2 = "arith.constant"() <{value = -3.750000e-01 : f32}> : () -> f32
    "func.call"(%2) <{callee = @acos_f32}> : (f32) -> ()
    %3 = "arith.constant"() <{value = -2.500000e-01 : f32}> : () -> f32
    "func.call"(%3) <{callee = @acos_f32}> : (f32) -> ()
    %4 = "arith.constant"() <{value = dense<[2.500000e-01, 3.750000e-01, 5.625000e-01]> : vector<3xf32>}> : () -> vector<3xf32>
    "func.call"(%4) <{callee = @acos_3xf32}> : (vector<3xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "atan_f32"}> ({
  ^bb0(%arg0: f32):
    %7 = "math.atan"(%arg0) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "vector.print"(%7) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "atan"}> ({
    %0 = "arith.constant"() <{value = -1.000000e+00 : f32}> : () -> f32
    "func.call"(%0) <{callee = @atan_f32}> : (f32) -> ()
    %1 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "func.call"(%1) <{callee = @atan_f32}> : (f32) -> ()
    %2 = "arith.constant"() <{value = -5.000000e-01 : f32}> : () -> f32
    "func.call"(%2) <{callee = @atan_f32}> : (f32) -> ()
    %3 = "arith.constant"() <{value = 5.000000e-01 : f32}> : () -> f32
    "func.call"(%3) <{callee = @atan_f32}> : (f32) -> ()
    %4 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "func.call"(%4) <{callee = @atan_f32}> : (f32) -> ()
    %5 = "arith.constant"() <{value = -2.000000e+00 : f32}> : () -> f32
    "func.call"(%5) <{callee = @atan_f32}> : (f32) -> ()
    %6 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    "func.call"(%6) <{callee = @atan_f32}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32) -> (), sym_name = "atan2_f32"}> ({
  ^bb0(%arg0: f32, %arg1: f32):
    %11 = "math.atan2"(%arg0, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "vector.print"(%11) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "atan2"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %3 = "arith.constant"() <{value = -1.000000e+00 : f32}> : () -> f32
    %4 = "arith.constant"() <{value = -2.000000e+00 : f32}> : () -> f32
    "func.call"(%0, %1) <{callee = @atan2_f32}> : (f32, f32) -> ()
    "func.call"(%1, %0) <{callee = @atan2_f32}> : (f32, f32) -> ()
    "func.call"(%0, %3) <{callee = @atan2_f32}> : (f32, f32) -> ()
    "func.call"(%3, %0) <{callee = @atan2_f32}> : (f32, f32) -> ()
    "func.call"(%0, %0) <{callee = @atan2_f32}> : (f32, f32) -> ()
    "func.call"(%2, %1) <{callee = @atan2_f32}> : (f32, f32) -> ()
    %5 = "arith.constant"() <{value = -1.000000e+00 : f32}> : () -> f32
    %6 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    "func.call"(%2, %3) <{callee = @atan2_f32}> : (f32, f32) -> ()
    "func.call"(%4, %3) <{callee = @atan2_f32}> : (f32, f32) -> ()
    "func.call"(%4, %1) <{callee = @atan2_f32}> : (f32, f32) -> ()
    "func.call"(%1, %2) <{callee = @atan2_f32}> : (f32, f32) -> ()
    %7 = "arith.constant"() <{value = -2.000000e+00 : f32}> : () -> f32
    %8 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "func.call"(%1, %4) <{callee = @atan2_f32}> : (f32, f32) -> ()
    %9 = "arith.constant"() <{value = -2.000000e+00 : f32}> : () -> f32
    %10 = "arith.constant"() <{value = -1.000000e+00 : f32}> : () -> f32
    "func.call"(%3, %4) <{callee = @atan2_f32}> : (f32, f32) -> ()
    "func.call"(%3, %2) <{callee = @atan2_f32}> : (f32, f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "cbrt_f32"}> ({
  ^bb0(%arg0: f32):
    %7 = "math.cbrt"(%arg0) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "vector.print"(%7) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "cbrt"}> ({
    %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "func.call"(%0) <{callee = @cbrt_f32}> : (f32) -> ()
    %1 = "arith.constant"() <{value = -1.000000e+00 : f32}> : () -> f32
    "func.call"(%1) <{callee = @cbrt_f32}> : (f32) -> ()
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "func.call"(%2) <{callee = @cbrt_f32}> : (f32) -> ()
    %3 = "arith.constant"() <{value = -0.000000e+00 : f32}> : () -> f32
    "func.call"(%3) <{callee = @cbrt_f32}> : (f32) -> ()
    %4 = "arith.constant"() <{value = 1.000000e+03 : f32}> : () -> f32
    "func.call"(%4) <{callee = @cbrt_f32}> : (f32) -> ()
    %5 = "arith.constant"() <{value = -1.000000e+03 : f32}> : () -> f32
    "func.call"(%5) <{callee = @cbrt_f32}> : (f32) -> ()
    %6 = "arith.constant"() <{value = 1.700000e+01 : f32}> : () -> f32
    "func.call"(%6) <{callee = @cbrt_f32}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "func_floorf32"}> ({
  ^bb0(%arg0: f32):
    %6 = "math.floor"(%arg0) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "vector.print"(%6) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "floorf"}> ({
    %0 = "arith.constant"() <{value = 3.800000e+00 : f32}> : () -> f32
    "func.call"(%0) <{callee = @func_floorf32}> : (f32) -> ()
    %1 = "arith.constant"() <{value = -3.800000e+00 : f32}> : () -> f32
    "func.call"(%1) <{callee = @func_floorf32}> : (f32) -> ()
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "func.call"(%2) <{callee = @func_floorf32}> : (f32) -> ()
    %3 = "arith.constant"() <{value = -4.200000e+00 : f32}> : () -> f32
    "func.call"(%3) <{callee = @func_floorf32}> : (f32) -> ()
    %4 = "arith.constant"() <{value = -2.000000e+00 : f32}> : () -> f32
    "func.call"(%4) <{callee = @func_floorf32}> : (f32) -> ()
    %5 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    "func.call"(%5) <{callee = @func_floorf32}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

