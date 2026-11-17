"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = dense<[-1.000000e+03, -1.100000e+00, 0.000000e+00, 1.100000e+00, 1.000000e+03]> : vector<5xf64>}> : () -> vector<5xf64> loc("<stdin>":3:10)
    "vector.print"(%0) <{punctuation = #vector.punctuation<newline>}> : (vector<5xf64>) -> () loc("<stdin>":4:5)
    %1 = "arith.constant"() <{value = dense<[-1.000000e+03, -1.100000e+00, 0.000000e+00, 1.100000e+00, 1.000000e+03]> : vector<5xf32>}> : () -> vector<5xf32> loc("<stdin>":5:10)
    "vector.print"(%1) <{punctuation = #vector.punctuation<newline>}> : (vector<5xf32>) -> () loc("<stdin>":6:5)
    %2 = "arith.constant"() <{value = dense<[-1.000000e+03, -1.099610e+00, 0.000000e+00, 1.099610e+00, 1.000000e+03]> : vector<5xf16>}> : () -> vector<5xf16> loc("<stdin>":7:10)
    "vector.print"(%2) <{punctuation = #vector.punctuation<newline>}> : (vector<5xf16>) -> () loc("<stdin>":8:5)
    %3 = "arith.constant"() <{value = dense<[-1.000000e+03, -1.101560e+00, 0.000000e+00, 1.101560e+00, 1.000000e+03]> : vector<5xbf16>}> : () -> vector<5xbf16> loc("<stdin>":9:10)
    "vector.print"(%3) <{punctuation = #vector.punctuation<newline>}> : (vector<5xbf16>) -> () loc("<stdin>":10:5)
    "func.return"() : () -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
