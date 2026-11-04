"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = dense<[0, 1, 2, 3, 4, 5, 6, 7, -8, -7, -6, -5, -4, -3, -2, -1]> : vector<16xi4>}> : () -> vector<16xi4>
    %1 = "vector.bitcast"(%0) : (vector<16xi4>) -> vector<16xui4>
    "vector.print"(%1) <{punctuation = #vector.punctuation<newline>}> : (vector<16xui4>) -> ()
    %2 = "vector.reduction"(%1) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<16xui4>) -> ui4
    "vector.print"(%2) <{punctuation = #vector.punctuation<newline>}> : (ui4) -> ()
    %3 = "vector.reduction"(%1) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<mul>}> : (vector<16xui4>) -> ui4
    "vector.print"(%3) <{punctuation = #vector.punctuation<newline>}> : (ui4) -> ()
    %4 = "vector.reduction"(%1) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<minui>}> : (vector<16xui4>) -> ui4
    "vector.print"(%4) <{punctuation = #vector.punctuation<newline>}> : (ui4) -> ()
    %5 = "vector.reduction"(%1) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<maxui>}> : (vector<16xui4>) -> ui4
    "vector.print"(%5) <{punctuation = #vector.punctuation<newline>}> : (ui4) -> ()
    %6 = "vector.reduction"(%1) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<and>}> : (vector<16xui4>) -> ui4
    "vector.print"(%6) <{punctuation = #vector.punctuation<newline>}> : (ui4) -> ()
    %7 = "vector.reduction"(%1) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<or>}> : (vector<16xui4>) -> ui4
    "vector.print"(%7) <{punctuation = #vector.punctuation<newline>}> : (ui4) -> ()
    %8 = "vector.reduction"(%1) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<xor>}> : (vector<16xui4>) -> ui4
    "vector.print"(%8) <{punctuation = #vector.punctuation<newline>}> : (ui4) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

