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
    %12 = "vector.shape_cast"(%11) : (vector<3x2xf32>) -> vector<3x2xf32>
    %13 = "vector.shape_cast"(%11) : (vector<3x2xf32>) -> vector<2x3xf32>
    %14 = "vector.shape_cast"(%11) : (vector<3x2xf32>) -> vector<6xf32>
    %15 = "vector.shape_cast"(%14) : (vector<6xf32>) -> vector<2x3xf32>
    %16 = "vector.shape_cast"(%14) : (vector<6xf32>) -> vector<3x2xf32>
    "vector.print"(%12) <{punctuation = #vector.punctuation<newline>}> : (vector<3x2xf32>) -> ()
    "vector.print"(%13) <{punctuation = #vector.punctuation<newline>}> : (vector<2x3xf32>) -> ()
    "vector.print"(%14) <{punctuation = #vector.punctuation<newline>}> : (vector<6xf32>) -> ()
    "vector.print"(%15) <{punctuation = #vector.punctuation<newline>}> : (vector<2x3xf32>) -> ()
    "vector.print"(%16) <{punctuation = #vector.punctuation<newline>}> : (vector<3x2xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

