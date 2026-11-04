"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = dense<[-8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, -8, -7, -6, -5, -4, -3, -2, -1]> : vector<24xi4>}> : () -> vector<24xi4>
    "vector.print"(%0) <{punctuation = #vector.punctuation<newline>}> : (vector<24xi4>) -> ()
    %1 = "vector.reduction"(%0) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<24xi4>) -> i4
    "vector.print"(%1) <{punctuation = #vector.punctuation<newline>}> : (i4) -> ()
    %2 = "vector.reduction"(%0) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<mul>}> : (vector<24xi4>) -> i4
    "vector.print"(%2) <{punctuation = #vector.punctuation<newline>}> : (i4) -> ()
    %3 = "vector.reduction"(%0) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<minsi>}> : (vector<24xi4>) -> i4
    "vector.print"(%3) <{punctuation = #vector.punctuation<newline>}> : (i4) -> ()
    %4 = "vector.reduction"(%0) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<maxsi>}> : (vector<24xi4>) -> i4
    "vector.print"(%4) <{punctuation = #vector.punctuation<newline>}> : (i4) -> ()
    %5 = "vector.reduction"(%0) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<and>}> : (vector<24xi4>) -> i4
    "vector.print"(%5) <{punctuation = #vector.punctuation<newline>}> : (i4) -> ()
    %6 = "vector.reduction"(%0) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<or>}> : (vector<24xi4>) -> i4
    "vector.print"(%6) <{punctuation = #vector.punctuation<newline>}> : (i4) -> ()
    %7 = "vector.reduction"(%0) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<xor>}> : (vector<24xi4>) -> i4
    "vector.print"(%7) <{punctuation = #vector.punctuation<newline>}> : (i4) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

