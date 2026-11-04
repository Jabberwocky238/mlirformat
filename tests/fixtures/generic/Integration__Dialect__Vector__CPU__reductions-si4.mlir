"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = dense<[-8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7]> : vector<16xi4>}> : () -> vector<16xi4>
    %1 = "vector.bitcast"(%0) : (vector<16xi4>) -> vector<16xsi4>
    "vector.print"(%1) <{punctuation = #vector.punctuation<newline>}> : (vector<16xsi4>) -> ()
    %2 = "vector.reduction"(%1) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<16xsi4>) -> si4
    "vector.print"(%2) <{punctuation = #vector.punctuation<newline>}> : (si4) -> ()
    %3 = "vector.reduction"(%1) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<mul>}> : (vector<16xsi4>) -> si4
    "vector.print"(%3) <{punctuation = #vector.punctuation<newline>}> : (si4) -> ()
    %4 = "vector.reduction"(%1) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<minsi>}> : (vector<16xsi4>) -> si4
    "vector.print"(%4) <{punctuation = #vector.punctuation<newline>}> : (si4) -> ()
    %5 = "vector.reduction"(%1) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<maxsi>}> : (vector<16xsi4>) -> si4
    "vector.print"(%5) <{punctuation = #vector.punctuation<newline>}> : (si4) -> ()
    %6 = "vector.reduction"(%1) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<and>}> : (vector<16xsi4>) -> si4
    "vector.print"(%6) <{punctuation = #vector.punctuation<newline>}> : (si4) -> ()
    %7 = "vector.reduction"(%1) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<or>}> : (vector<16xsi4>) -> si4
    "vector.print"(%7) <{punctuation = #vector.punctuation<newline>}> : (si4) -> ()
    %8 = "vector.reduction"(%1) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<xor>}> : (vector<16xsi4>) -> si4
    "vector.print"(%8) <{punctuation = #vector.punctuation<newline>}> : (si4) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

