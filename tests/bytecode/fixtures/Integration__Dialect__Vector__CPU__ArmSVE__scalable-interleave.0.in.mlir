"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":3:10)
    %1 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32 loc("<stdin>":4:10)
    %2 = "vector.broadcast"(%0) : (f32) -> vector<[4]xf32> loc("<stdin>":5:10)
    %3 = "vector.broadcast"(%1) : (f32) -> vector<[4]xf32> loc("<stdin>":6:10)
    "vector.print"(%2) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]xf32>) -> () loc("<stdin>":7:5)
    "vector.print"(%3) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]xf32>) -> () loc("<stdin>":8:5)
    %4 = "vector.interleave"(%2, %3) : (vector<[4]xf32>, vector<[4]xf32>) -> vector<[8]xf32> loc("<stdin>":9:10)
    "vector.print"(%4) <{punctuation = #vector.punctuation<newline>}> : (vector<[8]xf32>) -> () loc("<stdin>":10:5)
    "func.return"() : () -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
