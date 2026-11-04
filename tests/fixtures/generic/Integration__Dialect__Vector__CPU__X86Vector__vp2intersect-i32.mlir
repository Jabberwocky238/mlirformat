"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %3 = "arith.constant"() <{value = 7 : i32}> : () -> i32
    %4 = "arith.constant"() <{value = 12 : i32}> : () -> i32
    %5 = "arith.constant"() <{value = -10 : i32}> : () -> i32
    %6 = "arith.constant"() <{value = -219 : i32}> : () -> i32
    %7 = "vector.broadcast"(%1) : (i32) -> vector<16xi32>
    %8 = "vector.insert"(%2, %7) <{static_position = array<i64: 1>}> : (i32, vector<16xi32>) -> vector<16xi32>
    %9 = "vector.insert"(%3, %8) <{static_position = array<i64: 4>}> : (i32, vector<16xi32>) -> vector<16xi32>
    %10 = "vector.insert"(%4, %9) <{static_position = array<i64: 6>}> : (i32, vector<16xi32>) -> vector<16xi32>
    %11 = "vector.insert"(%5, %10) <{static_position = array<i64: 7>}> : (i32, vector<16xi32>) -> vector<16xi32>
    %12 = "vector.insert"(%0, %11) <{static_position = array<i64: 10>}> : (i32, vector<16xi32>) -> vector<16xi32>
    %13 = "vector.insert"(%0, %12) <{static_position = array<i64: 12>}> : (i32, vector<16xi32>) -> vector<16xi32>
    %14 = "vector.insert"(%3, %13) <{static_position = array<i64: 13>}> : (i32, vector<16xi32>) -> vector<16xi32>
    %15 = "vector.insert"(%3, %14) <{static_position = array<i64: 14>}> : (i32, vector<16xi32>) -> vector<16xi32>
    %16 = "vector.insert"(%0, %15) <{static_position = array<i64: 15>}> : (i32, vector<16xi32>) -> vector<16xi32>
    "vector.print"(%16) <{punctuation = #vector.punctuation<newline>}> : (vector<16xi32>) -> ()
    %17 = "vector.broadcast"(%1) : (i32) -> vector<16xi32>
    %18 = "vector.insert"(%2, %17) <{static_position = array<i64: 4>}> : (i32, vector<16xi32>) -> vector<16xi32>
    %19 = "vector.insert"(%6, %18) <{static_position = array<i64: 7>}> : (i32, vector<16xi32>) -> vector<16xi32>
    %20 = "vector.insert"(%4, %19) <{static_position = array<i64: 8>}> : (i32, vector<16xi32>) -> vector<16xi32>
    %21 = "vector.insert"(%4, %20) <{static_position = array<i64: 9>}> : (i32, vector<16xi32>) -> vector<16xi32>
    %22 = "vector.insert"(%4, %21) <{static_position = array<i64: 10>}> : (i32, vector<16xi32>) -> vector<16xi32>
    %23 = "vector.insert"(%0, %22) <{static_position = array<i64: 11>}> : (i32, vector<16xi32>) -> vector<16xi32>
    %24 = "vector.insert"(%0, %23) <{static_position = array<i64: 12>}> : (i32, vector<16xi32>) -> vector<16xi32>
    %25 = "vector.insert"(%0, %24) <{static_position = array<i64: 13>}> : (i32, vector<16xi32>) -> vector<16xi32>
    %26 = "vector.insert"(%0, %25) <{static_position = array<i64: 15>}> : (i32, vector<16xi32>) -> vector<16xi32>
    "vector.print"(%26) <{punctuation = #vector.punctuation<newline>}> : (vector<16xi32>) -> ()
    %27:2 = "x86vector.avx512.vp2intersect"(%16, %26) : (vector<16xi32>, vector<16xi32>) -> (vector<16xi1>, vector<16xi1>)
    "vector.print"(%27#0) <{punctuation = #vector.punctuation<newline>}> : (vector<16xi1>) -> ()
    "vector.print"(%27#1) <{punctuation = #vector.punctuation<newline>}> : (vector<16xi1>) -> ()
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

