"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 3 : i32}> : () -> i32
    %3 = "arith.constant"() <{value = 4 : i32}> : () -> i32
    %4 = "arith.constant"() <{value = 5 : i32}> : () -> i32
    %5 = "arith.constant"() <{value = -1 : i32}> : () -> i32
    %6 = "arith.constant"() <{value = -2 : i32}> : () -> i32
    %7 = "arith.constant"() <{value = -4 : i32}> : () -> i32
    %8 = "arith.constant"() <{value = -80 : i32}> : () -> i32
    %9 = "arith.constant"() <{value = -16 : i32}> : () -> i32
    %10 = "vector.broadcast"(%0) : (i32) -> vector<10xi32>
    %11 = "vector.insert"(%1, %10) <{static_position = array<i64: 1>}> : (i32, vector<10xi32>) -> vector<10xi32>
    %12 = "vector.insert"(%2, %11) <{static_position = array<i64: 2>}> : (i32, vector<10xi32>) -> vector<10xi32>
    %13 = "vector.insert"(%3, %12) <{static_position = array<i64: 3>}> : (i32, vector<10xi32>) -> vector<10xi32>
    %14 = "vector.insert"(%4, %13) <{static_position = array<i64: 4>}> : (i32, vector<10xi32>) -> vector<10xi32>
    %15 = "vector.insert"(%5, %14) <{static_position = array<i64: 5>}> : (i32, vector<10xi32>) -> vector<10xi32>
    %16 = "vector.insert"(%6, %15) <{static_position = array<i64: 6>}> : (i32, vector<10xi32>) -> vector<10xi32>
    %17 = "vector.insert"(%7, %16) <{static_position = array<i64: 7>}> : (i32, vector<10xi32>) -> vector<10xi32>
    %18 = "vector.insert"(%8, %17) <{static_position = array<i64: 8>}> : (i32, vector<10xi32>) -> vector<10xi32>
    %19 = "vector.insert"(%9, %18) <{static_position = array<i64: 9>}> : (i32, vector<10xi32>) -> vector<10xi32>
    "vector.print"(%19) <{punctuation = #vector.punctuation<newline>}> : (vector<10xi32>) -> ()
    %20 = "vector.reduction"(%19) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<10xi32>) -> i32
    "vector.print"(%20) <{punctuation = #vector.punctuation<newline>}> : (i32) -> ()
    %21 = "vector.reduction"(%19) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<mul>}> : (vector<10xi32>) -> i32
    "vector.print"(%21) <{punctuation = #vector.punctuation<newline>}> : (i32) -> ()
    %22 = "vector.reduction"(%19) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<minsi>}> : (vector<10xi32>) -> i32
    "vector.print"(%22) <{punctuation = #vector.punctuation<newline>}> : (i32) -> ()
    %23 = "vector.reduction"(%19) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<maxsi>}> : (vector<10xi32>) -> i32
    "vector.print"(%23) <{punctuation = #vector.punctuation<newline>}> : (i32) -> ()
    %24 = "vector.reduction"(%19) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<and>}> : (vector<10xi32>) -> i32
    "vector.print"(%24) <{punctuation = #vector.punctuation<newline>}> : (i32) -> ()
    %25 = "vector.reduction"(%19) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<or>}> : (vector<10xi32>) -> i32
    "vector.print"(%25) <{punctuation = #vector.punctuation<newline>}> : (i32) -> ()
    %26 = "vector.reduction"(%19) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<xor>}> : (vector<10xi32>) -> i32
    "vector.print"(%26) <{punctuation = #vector.punctuation<newline>}> : (i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

