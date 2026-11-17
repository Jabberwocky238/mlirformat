"builtin.module"() ({
  "func.func"() <{function_type = () -> (vector<4xf8E4M3FN>, vector<4xf32>), sym_name = "foo_vec"}> ({
    %3 = "arith.constant"() <{value = dense<2.250000e+00> : vector<4xf8E4M3FN>}> : () -> vector<4xf8E4M3FN> loc("<stdin>":3:10)
    %4 = "arith.constant"() <{value = dense<2.200000e+00> : vector<4xf32>}> : () -> vector<4xf32> loc("<stdin>":4:10)
    "func.return"(%3, %4) : (vector<4xf8E4M3FN>, vector<4xf32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = dense<1.375000e+00> : vector<4xf8E4M3FN>}> : () -> vector<4xf8E4M3FN> loc("<stdin>":8:10)
    %1:2 = "func.call"() <{callee = @foo_vec}> : () -> (vector<4xf8E4M3FN>, vector<4xf32>) loc("<stdin>":9:12)
    %2 = "arith.addf"(%0, %1#0) <{fastmath = #arith.fastmath<none>}> : (vector<4xf8E4M3FN>, vector<4xf8E4M3FN>) -> vector<4xf8E4M3FN> loc("<stdin>":10:10)
    "vector.print"(%2) <{punctuation = #vector.punctuation<newline>}> : (vector<4xf8E4M3FN>) -> () loc("<stdin>":11:5)
    "func.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":7:3)
}) : () -> () loc("<stdin>":1:1)
