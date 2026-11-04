"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 1.500000e+00 : f64}> : () -> f64
    %1 = "arith.constant"() <{value = 2.000000e+00 : f64}> : () -> f64
    %2 = "arith.constant"() <{value = 3.000000e+00 : f64}> : () -> f64
    %3 = "arith.constant"() <{value = 4.000000e+00 : f64}> : () -> f64
    %4 = "arith.constant"() <{value = 5.000000e+00 : f64}> : () -> f64
    %5 = "arith.constant"() <{value = -1.000000e+00 : f64}> : () -> f64
    %6 = "arith.constant"() <{value = -2.000000e+00 : f64}> : () -> f64
    %7 = "arith.constant"() <{value = -4.000000e+00 : f64}> : () -> f64
    %8 = "arith.constant"() <{value = -2.500000e-01 : f64}> : () -> f64
    %9 = "arith.constant"() <{value = -1.600000e+01 : f64}> : () -> f64
    %10 = "vector.broadcast"(%0) : (f64) -> vector<10xf64>
    %11 = "vector.insert"(%1, %10) <{static_position = array<i64: 1>}> : (f64, vector<10xf64>) -> vector<10xf64>
    %12 = "vector.insert"(%2, %11) <{static_position = array<i64: 2>}> : (f64, vector<10xf64>) -> vector<10xf64>
    %13 = "vector.insert"(%3, %12) <{static_position = array<i64: 3>}> : (f64, vector<10xf64>) -> vector<10xf64>
    %14 = "vector.insert"(%4, %13) <{static_position = array<i64: 4>}> : (f64, vector<10xf64>) -> vector<10xf64>
    %15 = "vector.insert"(%5, %14) <{static_position = array<i64: 5>}> : (f64, vector<10xf64>) -> vector<10xf64>
    %16 = "vector.insert"(%6, %15) <{static_position = array<i64: 6>}> : (f64, vector<10xf64>) -> vector<10xf64>
    %17 = "vector.insert"(%7, %16) <{static_position = array<i64: 7>}> : (f64, vector<10xf64>) -> vector<10xf64>
    %18 = "vector.insert"(%8, %17) <{static_position = array<i64: 8>}> : (f64, vector<10xf64>) -> vector<10xf64>
    %19 = "vector.insert"(%9, %18) <{static_position = array<i64: 9>}> : (f64, vector<10xf64>) -> vector<10xf64>
    "vector.print"(%19) <{punctuation = #vector.punctuation<newline>}> : (vector<10xf64>) -> ()
    %20 = "vector.reduction"(%19) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<10xf64>) -> f64
    "vector.print"(%20) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
    %21 = "vector.reduction"(%19) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<mul>}> : (vector<10xf64>) -> f64
    "vector.print"(%21) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
    %22 = "vector.reduction"(%19) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<minimumf>}> : (vector<10xf64>) -> f64
    "vector.print"(%22) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
    %23 = "vector.reduction"(%19) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<maximumf>}> : (vector<10xf64>) -> f64
    "vector.print"(%23) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
    %24 = "vector.reduction"(%19) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<minnumf>}> : (vector<10xf64>) -> f64
    "vector.print"(%24) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
    %25 = "vector.reduction"(%19) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<maxnumf>}> : (vector<10xf64>) -> f64
    "vector.print"(%25) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

