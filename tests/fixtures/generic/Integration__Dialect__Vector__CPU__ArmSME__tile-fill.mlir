"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = dense<123> : vector<[4]x[4]xi32>}> : () -> vector<[4]x[4]xi32>
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE BEGIN\0A"}> : () -> ()
    "vector.print"(%0) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]x[4]xi32>) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE END\0A"}> : () -> ()
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    "func.return"(%1) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

