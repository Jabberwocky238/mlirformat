"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = dense<[1, 2, 3, 4]> : vector<4xi8>}> : () -> vector<4xi8>
    "vector.print"(%0) <{punctuation = #vector.punctuation<newline>}> : (vector<4xi8>) -> ()
    %1:2 = "vector.deinterleave"(%0) : (vector<4xi8>) -> (vector<2xi8>, vector<2xi8>)
    "vector.print"(%1#0) <{punctuation = #vector.punctuation<newline>}> : (vector<2xi8>) -> ()
    "vector.print"(%1#1) <{punctuation = #vector.punctuation<newline>}> : (vector<2xi8>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

