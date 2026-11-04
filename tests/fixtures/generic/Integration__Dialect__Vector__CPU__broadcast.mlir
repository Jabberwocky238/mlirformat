"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 2147483647 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 9223372036854775807 : i64}> : () -> i64
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %4 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %5 = "arith.constant"() <{value = 3.000000e+00 : f32}> : () -> f32
    %6 = "arith.constant"() <{value = 4.000000e+00 : f32}> : () -> f32
    %7 = "arith.constant"() <{value = 5.000000e+00 : f32}> : () -> f32
    %8 = "vector.broadcast"(%0) : (i32) -> vector<2xi32>
    %9 = "vector.broadcast"(%1) : (i64) -> vector<2xi64>
    %10 = "vector.broadcast"(%3) : (f32) -> vector<2x2x2xf32>
    "vector.print"(%8) <{punctuation = #vector.punctuation<newline>}> : (vector<2xi32>) -> ()
    "vector.print"(%9) <{punctuation = #vector.punctuation<newline>}> : (vector<2xi64>) -> ()
    "vector.print"(%10) <{punctuation = #vector.punctuation<newline>}> : (vector<2x2x2xf32>) -> ()
    %11 = "vector.broadcast"(%3) : (f32) -> vector<4xf32>
    %12 = "vector.insert"(%4, %11) <{static_position = array<i64: 1>}> : (f32, vector<4xf32>) -> vector<4xf32>
    %13 = "vector.insert"(%5, %12) <{static_position = array<i64: 2>}> : (f32, vector<4xf32>) -> vector<4xf32>
    %14 = "vector.insert"(%6, %13) <{static_position = array<i64: 3>}> : (f32, vector<4xf32>) -> vector<4xf32>
    %15 = "vector.broadcast"(%14) : (vector<4xf32>) -> vector<3x4xf32>
    %16 = "vector.broadcast"(%14) : (vector<4xf32>) -> vector<2x2x4xf32>
    "vector.print"(%14) <{punctuation = #vector.punctuation<newline>}> : (vector<4xf32>) -> ()
    "vector.print"(%15) <{punctuation = #vector.punctuation<newline>}> : (vector<3x4xf32>) -> ()
    "vector.print"(%16) <{punctuation = #vector.punctuation<newline>}> : (vector<2x2x4xf32>) -> ()
    %17 = "vector.broadcast"(%7) : (f32) -> vector<1xf32>
    %18 = "vector.broadcast"(%17) : (vector<1xf32>) -> vector<8xf32>
    "vector.print"(%18) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> ()
    %19 = "vector.broadcast"(%14) : (vector<4xf32>) -> vector<1x4xf32>
    %20 = "vector.broadcast"(%19) : (vector<1x4xf32>) -> vector<3x4xf32>
    "vector.print"(%19) <{punctuation = #vector.punctuation<newline>}> : (vector<1x4xf32>) -> ()
    "vector.print"(%20) <{punctuation = #vector.punctuation<newline>}> : (vector<3x4xf32>) -> ()
    %21 = "vector.broadcast"(%3) : (f32) -> vector<3x1xf32>
    %22 = "vector.insert"(%4, %21) <{static_position = array<i64: 1, 0>}> : (f32, vector<3x1xf32>) -> vector<3x1xf32>
    %23 = "vector.insert"(%5, %22) <{static_position = array<i64: 2, 0>}> : (f32, vector<3x1xf32>) -> vector<3x1xf32>
    %24 = "vector.broadcast"(%23) : (vector<3x1xf32>) -> vector<3x4xf32>
    "vector.print"(%23) <{punctuation = #vector.punctuation<newline>}> : (vector<3x1xf32>) -> ()
    "vector.print"(%24) <{punctuation = #vector.punctuation<newline>}> : (vector<3x4xf32>) -> ()
    %25 = "vector.broadcast"(%2) : (f32) -> vector<3x1x2xf32>
    %26 = "vector.insert"(%3, %25) <{static_position = array<i64: 0, 0, 1>}> : (f32, vector<3x1x2xf32>) -> vector<3x1x2xf32>
    %27 = "vector.insert"(%4, %26) <{static_position = array<i64: 1, 0, 0>}> : (f32, vector<3x1x2xf32>) -> vector<3x1x2xf32>
    %28 = "vector.insert"(%5, %27) <{static_position = array<i64: 1, 0, 1>}> : (f32, vector<3x1x2xf32>) -> vector<3x1x2xf32>
    %29 = "vector.insert"(%6, %28) <{static_position = array<i64: 2, 0, 0>}> : (f32, vector<3x1x2xf32>) -> vector<3x1x2xf32>
    %30 = "vector.insert"(%7, %29) <{static_position = array<i64: 2, 0, 1>}> : (f32, vector<3x1x2xf32>) -> vector<3x1x2xf32>
    %31 = "vector.broadcast"(%30) : (vector<3x1x2xf32>) -> vector<3x4x2xf32>
    "vector.print"(%30) <{punctuation = #vector.punctuation<newline>}> : (vector<3x1x2xf32>) -> ()
    "vector.print"(%31) <{punctuation = #vector.punctuation<newline>}> : (vector<3x4x2xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

