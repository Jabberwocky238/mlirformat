"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 3.000000e+00 : f32}> : () -> f32
    %3 = "arith.constant"() <{value = 4.000000e+00 : f32}> : () -> f32
    %4 = "arith.constant"() <{value = 5.000000e+00 : f32}> : () -> f32
    %5 = "arith.constant"() <{value = 6.000000e+00 : f32}> : () -> f32
    %6 = "vector.broadcast"(%0) : (f32) -> vector<3x2xf32>
    %7 = "vector.insert"(%1, %6) <{static_position = array<i64: 0, 1>}> : (f32, vector<3x2xf32>) -> vector<3x2xf32>
    %8 = "vector.insert"(%2, %7) <{static_position = array<i64: 1, 0>}> : (f32, vector<3x2xf32>) -> vector<3x2xf32>
    %9 = "vector.insert"(%3, %8) <{static_position = array<i64: 1, 1>}> : (f32, vector<3x2xf32>) -> vector<3x2xf32>
    %10 = "vector.insert"(%4, %9) <{static_position = array<i64: 2, 0>}> : (f32, vector<3x2xf32>) -> vector<3x2xf32>
    %11 = "vector.insert"(%5, %10) <{static_position = array<i64: 2, 1>}> : (f32, vector<3x2xf32>) -> vector<3x2xf32>
    "vector.print"(%11) <{punctuation = #vector.punctuation<newline>}> : (vector<3x2xf32>) -> ()
    %12 = "vector.broadcast"(%5) : (f32) -> vector<2xf32>
    %13 = "vector.broadcast"(%5) : (f32) -> vector<3xf32>
    %14:2 = "vector.scan"(%11, %12) <{inclusive = true, kind = #vector.kind<add>, reduction_dim = 0 : i64}> : (vector<3x2xf32>, vector<2xf32>) -> (vector<3x2xf32>, vector<2xf32>)
    %15:2 = "vector.scan"(%11, %13) <{inclusive = true, kind = #vector.kind<add>, reduction_dim = 1 : i64}> : (vector<3x2xf32>, vector<3xf32>) -> (vector<3x2xf32>, vector<3xf32>)
    %16:2 = "vector.scan"(%11, %12) <{inclusive = false, kind = #vector.kind<add>, reduction_dim = 0 : i64}> : (vector<3x2xf32>, vector<2xf32>) -> (vector<3x2xf32>, vector<2xf32>)
    %17:2 = "vector.scan"(%11, %13) <{inclusive = false, kind = #vector.kind<add>, reduction_dim = 1 : i64}> : (vector<3x2xf32>, vector<3xf32>) -> (vector<3x2xf32>, vector<3xf32>)
    "vector.print"(%14#0) <{punctuation = #vector.punctuation<newline>}> : (vector<3x2xf32>) -> ()
    "vector.print"(%14#1) <{punctuation = #vector.punctuation<newline>}> : (vector<2xf32>) -> ()
    "vector.print"(%15#0) <{punctuation = #vector.punctuation<newline>}> : (vector<3x2xf32>) -> ()
    "vector.print"(%15#1) <{punctuation = #vector.punctuation<newline>}> : (vector<3xf32>) -> ()
    "vector.print"(%16#0) <{punctuation = #vector.punctuation<newline>}> : (vector<3x2xf32>) -> ()
    "vector.print"(%16#1) <{punctuation = #vector.punctuation<newline>}> : (vector<2xf32>) -> ()
    "vector.print"(%17#0) <{punctuation = #vector.punctuation<newline>}> : (vector<3x2xf32>) -> ()
    "vector.print"(%17#1) <{punctuation = #vector.punctuation<newline>}> : (vector<3xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

