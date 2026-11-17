"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":3:10)
    %1 = "arith.constant"() <{value = dense<[1.250000e-01, 2.500000e-01, 5.000000e-01, 1.000000e+00, 2.000000e+00, 4.000000e+00, 8.000000e+00, 1.600000e+01]> : vector<8xf32>}> : () -> vector<8xf32> loc("<stdin>":4:10)
    %2 = "x86.avx.rsqrt"(%1) : (vector<8xf32>) -> vector<8xf32> loc("<stdin>":5:10)
    "vector.print"(%2) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> () loc("<stdin>":6:5)
    "func.return"(%0) : (i32) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
