"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 3.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %3 = "vector.broadcast"(%0) : (f32) -> vector<8xf32>
    %4 = "vector.broadcast"(%1) : (f32) -> vector<8xf32>
    %5 = "vector.broadcast"(%2) : (f32) -> vector<8xf32>
    "vector.print"(%3) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> ()
    "vector.print"(%4) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> ()
    "vector.print"(%5) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> ()
    %6 = "vector.fma"(%4, %5, %3) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
    "vector.print"(%6) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

