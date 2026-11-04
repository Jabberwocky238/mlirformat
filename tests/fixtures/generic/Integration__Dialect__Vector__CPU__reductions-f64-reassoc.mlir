"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 1.000000e+00 : f64}> : () -> f64
    %1 = "arith.constant"() <{value = 2.000000e+00 : f64}> : () -> f64
    %2 = "arith.constant"() <{value = 3.000000e+00 : f64}> : () -> f64
    %3 = "vector.broadcast"(%0) : (f64) -> vector<64xf64>
    %4 = "vector.insert"(%1, %3) <{static_position = array<i64: 11>}> : (f64, vector<64xf64>) -> vector<64xf64>
    %5 = "vector.insert"(%2, %4) <{static_position = array<i64: 52>}> : (f64, vector<64xf64>) -> vector<64xf64>
    "vector.print"(%5) <{punctuation = #vector.punctuation<newline>}> : (vector<64xf64>) -> ()
    %6 = "vector.reduction"(%5) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<64xf64>) -> f64
    "vector.print"(%6) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
    %7 = "vector.reduction"(%5) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<mul>}> : (vector<64xf64>) -> f64
    "vector.print"(%7) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
    %8 = "vector.reduction"(%5) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<minimumf>}> : (vector<64xf64>) -> f64
    "vector.print"(%8) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
    %9 = "vector.reduction"(%5) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<maximumf>}> : (vector<64xf64>) -> f64
    "vector.print"(%9) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
    %10 = "vector.reduction"(%5) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<minnumf>}> : (vector<64xf64>) -> f64
    "vector.print"(%10) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
    %11 = "vector.reduction"(%5) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<maxnumf>}> : (vector<64xf64>) -> f64
    "vector.print"(%11) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

