"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = dense<[0, 1, 2, 3]> : vector<4xindex>}> : () -> vector<4xindex>
    %1 = "arith.constant"() <{value = dense<[0, 1]> : vector<2xindex>}> : () -> vector<2xindex>
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "vector.broadcast"(%0) : (vector<4xindex>) -> vector<2x4xindex>
    %4 = "vector.broadcast"(%1) : (vector<2xindex>) -> vector<4x2xindex>
    %5 = "vector.transpose"(%4) <{permutation = array<i64: 1, 0>}> : (vector<4x2xindex>) -> vector<2x4xindex>
    %6 = "vector.broadcast"(%2) : (index) -> vector<2x4xindex>
    %7 = "arith.addi"(%3, %5) <{overflowFlags = #arith.overflow<none>}> : (vector<2x4xindex>, vector<2x4xindex>) -> vector<2x4xindex>
    "vector.print"(%3) <{punctuation = #vector.punctuation<newline>}> : (vector<2x4xindex>) -> ()
    "vector.print"(%5) <{punctuation = #vector.punctuation<newline>}> : (vector<2x4xindex>) -> ()
    "vector.print"(%6) <{punctuation = #vector.punctuation<newline>}> : (vector<2x4xindex>) -> ()
    "vector.print"(%7) <{punctuation = #vector.punctuation<newline>}> : (vector<2x4xindex>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

