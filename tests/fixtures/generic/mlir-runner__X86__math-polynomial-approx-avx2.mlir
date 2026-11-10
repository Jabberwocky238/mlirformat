"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "rsqrt"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "math.rsqrt"(%0) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "vector.print"(%1) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    %2 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %3 = "math.rsqrt"(%2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "vector.print"(%3) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    %4 = "arith.constant"() <{value = dense<2.000000e+00> : vector<8xf32>}> : () -> vector<8xf32>
    %5 = "math.rsqrt"(%4) <{fastmath = #arith.fastmath<none>}> : (vector<8xf32>) -> vector<8xf32>
    "vector.print"(%5) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    "func.call"() <{callee = @rsqrt}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

