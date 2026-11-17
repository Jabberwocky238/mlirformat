"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = dense<123> : vector<[4]x[4]xi32>}> : () -> vector<[4]x[4]xi32> loc("<stdin>":3:10)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE BEGIN\0A"}> : () -> () loc("<stdin>":4:5)
    "vector.print"(%0) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]x[4]xi32>) -> () loc("<stdin>":5:5)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE END\0A"}> : () -> () loc("<stdin>":6:5)
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":7:10)
    "func.return"(%1) : (i32) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
