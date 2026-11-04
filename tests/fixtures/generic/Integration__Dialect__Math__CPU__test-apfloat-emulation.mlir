"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = -1.375000e+00 : f8E4M3FN}> : () -> f8E4M3FN
    %1 = "math.absf"(%0) <{fastmath = #arith.fastmath<none>}> : (f8E4M3FN) -> f8E4M3FN
    "vector.print"(%1) <{punctuation = #vector.punctuation<newline>}> : (f8E4M3FN) -> ()
    %2 = "arith.constant"() <{value = 2.000000e+00 : f8E8M0FNU}> : () -> f8E8M0FNU
    %3 = "arith.constant"() <{value = 4.000000e+00 : f8E8M0FNU}> : () -> f8E8M0FNU
    %4 = "arith.constant"() <{value = 8.000000e+00 : f8E8M0FNU}> : () -> f8E8M0FNU
    %5 = "math.fma"(%3, %2, %4) <{fastmath = #arith.fastmath<none>}> : (f8E8M0FNU, f8E8M0FNU, f8E8M0FNU) -> f8E8M0FNU
    "vector.print"(%5) <{punctuation = #vector.punctuation<newline>}> : (f8E8M0FNU) -> ()
    %6 = "math.isinf"(%0) <{fastmath = #arith.fastmath<none>}> : (f8E4M3FN) -> i1
    "vector.print"(%6) <{punctuation = #vector.punctuation<newline>}> : (i1) -> ()
    %7 = "math.isnan"(%0) <{fastmath = #arith.fastmath<none>}> : (f8E4M3FN) -> i1
    "vector.print"(%7) <{punctuation = #vector.punctuation<newline>}> : (i1) -> ()
    %8 = "math.isnormal"(%0) <{fastmath = #arith.fastmath<none>}> : (f8E4M3FN) -> i1
    "vector.print"(%8) <{punctuation = #vector.punctuation<newline>}> : (i1) -> ()
    %9 = "math.isfinite"(%0) <{fastmath = #arith.fastmath<none>}> : (f8E4M3FN) -> i1
    "vector.print"(%9) <{punctuation = #vector.punctuation<newline>}> : (i1) -> ()
    %10 = "arith.constant"() <{value = -1.400000e+00 : f32}> : () -> f32
    %11 = "math.absf"(%10) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "vector.print"(%11) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    %12 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %13 = "arith.constant"() <{value = 4.000000e+00 : f32}> : () -> f32
    %14 = "arith.constant"() <{value = 8.000000e+00 : f32}> : () -> f32
    %15 = "math.fma"(%13, %12, %14) <{fastmath = #arith.fastmath<none>}> : (f32, f32, f32) -> f32
    "vector.print"(%15) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    %16 = "math.isinf"(%10) <{fastmath = #arith.fastmath<none>}> : (f32) -> i1
    "vector.print"(%16) <{punctuation = #vector.punctuation<newline>}> : (i1) -> ()
    %17 = "math.isnan"(%10) <{fastmath = #arith.fastmath<none>}> : (f32) -> i1
    "vector.print"(%17) <{punctuation = #vector.punctuation<newline>}> : (i1) -> ()
    %18 = "math.isnormal"(%10) <{fastmath = #arith.fastmath<none>}> : (f32) -> i1
    "vector.print"(%18) <{punctuation = #vector.punctuation<newline>}> : (i1) -> ()
    %19 = "math.isfinite"(%10) <{fastmath = #arith.fastmath<none>}> : (f32) -> i1
    "vector.print"(%19) <{punctuation = #vector.punctuation<newline>}> : (i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

