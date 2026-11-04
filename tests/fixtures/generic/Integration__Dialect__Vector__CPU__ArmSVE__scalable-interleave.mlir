"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %2 = "vector.broadcast"(%0) : (f32) -> vector<[4]xf32>
    %3 = "vector.broadcast"(%1) : (f32) -> vector<[4]xf32>
    "vector.print"(%2) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]xf32>) -> ()
    "vector.print"(%3) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]xf32>) -> ()
    %4 = "vector.interleave"(%2, %3) : (vector<[4]xf32>, vector<[4]xf32>) -> vector<[8]xf32>
    "vector.print"(%4) <{punctuation = #vector.punctuation<newline>}> : (vector<[8]xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

