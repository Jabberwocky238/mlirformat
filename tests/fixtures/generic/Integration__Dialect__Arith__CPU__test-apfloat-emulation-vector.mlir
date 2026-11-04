"builtin.module"() ({
  "func.func"() <{function_type = () -> (vector<4xf8E4M3FN>, vector<4xf32>), sym_name = "foo_vec"}> ({
    %3 = "arith.constant"() <{value = dense<2.250000e+00> : vector<4xf8E4M3FN>}> : () -> vector<4xf8E4M3FN>
    %4 = "arith.constant"() <{value = dense<2.200000e+00> : vector<4xf32>}> : () -> vector<4xf32>
    "func.return"(%3, %4) : (vector<4xf8E4M3FN>, vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = dense<1.375000e+00> : vector<4xf8E4M3FN>}> : () -> vector<4xf8E4M3FN>
    %1:2 = "func.call"() <{callee = @foo_vec}> : () -> (vector<4xf8E4M3FN>, vector<4xf32>)
    %2 = "arith.addf"(%0, %1#0) <{fastmath = #arith.fastmath<none>}> : (vector<4xf8E4M3FN>, vector<4xf8E4M3FN>) -> vector<4xf8E4M3FN>
    "vector.print"(%2) <{punctuation = #vector.punctuation<newline>}> : (vector<4xf8E4M3FN>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

