"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %3 = "arith.constant"() <{value = 3.000000e+00 : f32}> : () -> f32
    %4 = "arith.constant"() <{value = 4.000000e+00 : f32}> : () -> f32
    %5 = "vector.broadcast"(%1) : (f32) -> vector<8xf32>
    %6 = "vector.broadcast"(%2) : (f32) -> vector<8xf32>
    %7 = "vector.broadcast"(%3) : (f32) -> vector<8xf32>
    %8 = "vector.broadcast"(%4) : (f32) -> vector<8xf32>
    %9 = "vector.broadcast"(%0) : (f32) -> vector<4x4x8xf32>
    %10 = "vector.insert"(%5, %9) <{static_position = array<i64: 1, 1>}> : (vector<8xf32>, vector<4x4x8xf32>) -> vector<4x4x8xf32>
    %11 = "vector.insert"(%6, %10) <{static_position = array<i64: 1, 2>}> : (vector<8xf32>, vector<4x4x8xf32>) -> vector<4x4x8xf32>
    %12 = "vector.insert"(%7, %11) <{static_position = array<i64: 2, 1>}> : (vector<8xf32>, vector<4x4x8xf32>) -> vector<4x4x8xf32>
    %13 = "vector.insert"(%8, %12) <{static_position = array<i64: 2, 2>}> : (vector<8xf32>, vector<4x4x8xf32>) -> vector<4x4x8xf32>
    %14 = "vector.extract_strided_slice"(%13) <{offsets = [1, 1], sizes = [2, 2], strides = [1, 1]}> : (vector<4x4x8xf32>) -> vector<2x2x8xf32>
    "vector.print"(%14) <{punctuation = #vector.punctuation<newline>}> : (vector<2x2x8xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

