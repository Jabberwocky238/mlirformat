"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = dense<[1, 2, 3, 4]> : vector<4xi8>}> : () -> vector<4xi8> loc("<stdin>":3:10)
    "vector.print"(%0) <{punctuation = #vector.punctuation<newline>}> : (vector<4xi8>) -> () loc("<stdin>":4:5)
    %1:2 = "vector.deinterleave"(%0) : (vector<4xi8>) -> (vector<2xi8>, vector<2xi8>) loc("<stdin>":5:12)
    "vector.print"(%1#0) <{punctuation = #vector.punctuation<newline>}> : (vector<2xi8>) -> () loc("<stdin>":6:5)
    "vector.print"(%1#1) <{punctuation = #vector.punctuation<newline>}> : (vector<2xi8>) -> () loc("<stdin>":7:5)
    "func.return"() : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
