"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = dense<-1.375000e+00> : vector<4xf8E4M3FN>}> : () -> vector<4xf8E4M3FN>
    %1 = "math.absf"(%0) <{fastmath = #arith.fastmath<none>}> : (vector<4xf8E4M3FN>) -> vector<4xf8E4M3FN>
    "vector.print"(%1) <{punctuation = #vector.punctuation<newline>}> : (vector<4xf8E4M3FN>) -> ()
    %2 = "arith.constant"() <{value = dense<2.000000e+00> : vector<4xf8E4M3FN>}> : () -> vector<4xf8E4M3FN>
    %3 = "arith.constant"() <{value = dense<4.000000e+00> : vector<4xf8E4M3FN>}> : () -> vector<4xf8E4M3FN>
    %4 = "arith.constant"() <{value = dense<8.000000e+00> : vector<4xf8E4M3FN>}> : () -> vector<4xf8E4M3FN>
    %5 = "math.fma"(%2, %3, %4) <{fastmath = #arith.fastmath<none>}> : (vector<4xf8E4M3FN>, vector<4xf8E4M3FN>, vector<4xf8E4M3FN>) -> vector<4xf8E4M3FN>
    "vector.print"(%5) <{punctuation = #vector.punctuation<newline>}> : (vector<4xf8E4M3FN>) -> ()
    %6 = "math.isinf"(%0) <{fastmath = #arith.fastmath<none>}> : (vector<4xf8E4M3FN>) -> vector<4xi1>
    "vector.print"(%6) <{punctuation = #vector.punctuation<newline>}> : (vector<4xi1>) -> ()
    %7 = "math.isnan"(%0) <{fastmath = #arith.fastmath<none>}> : (vector<4xf8E4M3FN>) -> vector<4xi1>
    "vector.print"(%7) <{punctuation = #vector.punctuation<newline>}> : (vector<4xi1>) -> ()
    %8 = "math.isnormal"(%0) <{fastmath = #arith.fastmath<none>}> : (vector<4xf8E4M3FN>) -> vector<4xi1>
    "vector.print"(%8) <{punctuation = #vector.punctuation<newline>}> : (vector<4xi1>) -> ()
    %9 = "math.isfinite"(%0) <{fastmath = #arith.fastmath<none>}> : (vector<4xf8E4M3FN>) -> vector<4xi1>
    "vector.print"(%9) <{punctuation = #vector.punctuation<newline>}> : (vector<4xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

