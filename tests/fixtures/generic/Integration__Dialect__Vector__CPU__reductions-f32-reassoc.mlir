"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 3.000000e+00 : f32}> : () -> f32
    %3 = "vector.broadcast"(%0) : (f32) -> vector<64xf32>
    %4 = "vector.insert"(%1, %3) <{static_position = array<i64: 11>}> : (f32, vector<64xf32>) -> vector<64xf32>
    %5 = "vector.insert"(%2, %4) <{static_position = array<i64: 52>}> : (f32, vector<64xf32>) -> vector<64xf32>
    "vector.print"(%5) <{punctuation = #vector.punctuation<newline>}> : (vector<64xf32>) -> ()
    %6 = "vector.reduction"(%5) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<64xf32>) -> f32
    "vector.print"(%6) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    %7 = "vector.reduction"(%5) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<mul>}> : (vector<64xf32>) -> f32
    "vector.print"(%7) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    %8 = "vector.reduction"(%5) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<minimumf>}> : (vector<64xf32>) -> f32
    "vector.print"(%8) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    %9 = "vector.reduction"(%5) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<maximumf>}> : (vector<64xf32>) -> f32
    "vector.print"(%9) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    %10 = "vector.reduction"(%5) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<minnumf>}> : (vector<64xf32>) -> f32
    "vector.print"(%10) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    %11 = "vector.reduction"(%5) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<maxnumf>}> : (vector<64xf32>) -> f32
    "vector.print"(%11) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

