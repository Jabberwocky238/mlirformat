"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 1.500000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 3.000000e+00 : f32}> : () -> f32
    %3 = "arith.constant"() <{value = 4.000000e+00 : f32}> : () -> f32
    %4 = "arith.constant"() <{value = 5.000000e+00 : f32}> : () -> f32
    %5 = "arith.constant"() <{value = -1.000000e+00 : f32}> : () -> f32
    %6 = "arith.constant"() <{value = -2.000000e+00 : f32}> : () -> f32
    %7 = "arith.constant"() <{value = -4.000000e+00 : f32}> : () -> f32
    %8 = "arith.constant"() <{value = -2.500000e-01 : f32}> : () -> f32
    %9 = "arith.constant"() <{value = -1.600000e+01 : f32}> : () -> f32
    %10 = "vector.broadcast"(%0) : (f32) -> vector<10xf32>
    %11 = "vector.insert"(%1, %10) <{static_position = array<i64: 1>}> : (f32, vector<10xf32>) -> vector<10xf32>
    %12 = "vector.insert"(%2, %11) <{static_position = array<i64: 2>}> : (f32, vector<10xf32>) -> vector<10xf32>
    %13 = "vector.insert"(%3, %12) <{static_position = array<i64: 3>}> : (f32, vector<10xf32>) -> vector<10xf32>
    %14 = "vector.insert"(%4, %13) <{static_position = array<i64: 4>}> : (f32, vector<10xf32>) -> vector<10xf32>
    %15 = "vector.insert"(%5, %14) <{static_position = array<i64: 5>}> : (f32, vector<10xf32>) -> vector<10xf32>
    %16 = "vector.insert"(%6, %15) <{static_position = array<i64: 6>}> : (f32, vector<10xf32>) -> vector<10xf32>
    %17 = "vector.insert"(%7, %16) <{static_position = array<i64: 7>}> : (f32, vector<10xf32>) -> vector<10xf32>
    %18 = "vector.insert"(%8, %17) <{static_position = array<i64: 8>}> : (f32, vector<10xf32>) -> vector<10xf32>
    %19 = "vector.insert"(%9, %18) <{static_position = array<i64: 9>}> : (f32, vector<10xf32>) -> vector<10xf32>
    "vector.print"(%19) <{punctuation = #vector.punctuation<newline>}> : (vector<10xf32>) -> ()
    %20 = "vector.reduction"(%19) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<10xf32>) -> f32
    "vector.print"(%20) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    %21 = "vector.reduction"(%19) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<mul>}> : (vector<10xf32>) -> f32
    "vector.print"(%21) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    %22 = "vector.reduction"(%19) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<minimumf>}> : (vector<10xf32>) -> f32
    "vector.print"(%22) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    %23 = "vector.reduction"(%19) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<maximumf>}> : (vector<10xf32>) -> f32
    "vector.print"(%23) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    %24 = "vector.reduction"(%19) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<minnumf>}> : (vector<10xf32>) -> f32
    "vector.print"(%24) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    %25 = "vector.reduction"(%19) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<maxnumf>}> : (vector<10xf32>) -> f32
    "vector.print"(%25) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

