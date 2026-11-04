"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "arith.constant"() <{value = 2 : i64}> : () -> i64
    %2 = "arith.constant"() <{value = 3 : i64}> : () -> i64
    %3 = "arith.constant"() <{value = 4 : i64}> : () -> i64
    %4 = "arith.constant"() <{value = 5 : i64}> : () -> i64
    %5 = "arith.constant"() <{value = -1 : i64}> : () -> i64
    %6 = "arith.constant"() <{value = -2 : i64}> : () -> i64
    %7 = "arith.constant"() <{value = -4 : i64}> : () -> i64
    %8 = "arith.constant"() <{value = -80 : i64}> : () -> i64
    %9 = "arith.constant"() <{value = -16 : i64}> : () -> i64
    %10 = "vector.broadcast"(%0) : (i64) -> vector<10xi64>
    %11 = "vector.insert"(%1, %10) <{static_position = array<i64: 1>}> : (i64, vector<10xi64>) -> vector<10xi64>
    %12 = "vector.insert"(%2, %11) <{static_position = array<i64: 2>}> : (i64, vector<10xi64>) -> vector<10xi64>
    %13 = "vector.insert"(%3, %12) <{static_position = array<i64: 3>}> : (i64, vector<10xi64>) -> vector<10xi64>
    %14 = "vector.insert"(%4, %13) <{static_position = array<i64: 4>}> : (i64, vector<10xi64>) -> vector<10xi64>
    %15 = "vector.insert"(%5, %14) <{static_position = array<i64: 5>}> : (i64, vector<10xi64>) -> vector<10xi64>
    %16 = "vector.insert"(%6, %15) <{static_position = array<i64: 6>}> : (i64, vector<10xi64>) -> vector<10xi64>
    %17 = "vector.insert"(%7, %16) <{static_position = array<i64: 7>}> : (i64, vector<10xi64>) -> vector<10xi64>
    %18 = "vector.insert"(%8, %17) <{static_position = array<i64: 8>}> : (i64, vector<10xi64>) -> vector<10xi64>
    %19 = "vector.insert"(%9, %18) <{static_position = array<i64: 9>}> : (i64, vector<10xi64>) -> vector<10xi64>
    "vector.print"(%19) <{punctuation = #vector.punctuation<newline>}> : (vector<10xi64>) -> ()
    %20 = "vector.reduction"(%19) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<10xi64>) -> i64
    "vector.print"(%20) <{punctuation = #vector.punctuation<newline>}> : (i64) -> ()
    %21 = "vector.reduction"(%19) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<mul>}> : (vector<10xi64>) -> i64
    "vector.print"(%21) <{punctuation = #vector.punctuation<newline>}> : (i64) -> ()
    %22 = "vector.reduction"(%19) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<minsi>}> : (vector<10xi64>) -> i64
    "vector.print"(%22) <{punctuation = #vector.punctuation<newline>}> : (i64) -> ()
    %23 = "vector.reduction"(%19) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<maxsi>}> : (vector<10xi64>) -> i64
    "vector.print"(%23) <{punctuation = #vector.punctuation<newline>}> : (i64) -> ()
    %24 = "vector.reduction"(%19) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<and>}> : (vector<10xi64>) -> i64
    "vector.print"(%24) <{punctuation = #vector.punctuation<newline>}> : (i64) -> ()
    %25 = "vector.reduction"(%19) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<or>}> : (vector<10xi64>) -> i64
    "vector.print"(%25) <{punctuation = #vector.punctuation<newline>}> : (i64) -> ()
    %26 = "vector.reduction"(%19) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<xor>}> : (vector<10xi64>) -> i64
    "vector.print"(%26) <{punctuation = #vector.punctuation<newline>}> : (i64) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

