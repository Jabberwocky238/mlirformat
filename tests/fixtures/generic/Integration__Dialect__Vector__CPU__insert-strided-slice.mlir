"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 3.000000e+00 : f32}> : () -> f32
    %3 = "arith.constant"() <{value = 4.000000e+00 : f32}> : () -> f32
    %4 = "vector.broadcast"(%0) : (f32) -> vector<4xf32>
    %5 = "vector.broadcast"(%1) : (f32) -> vector<3xf32>
    %6 = "vector.broadcast"(%2) : (f32) -> vector<4x4xf32>
    %7 = "vector.broadcast"(%3) : (f32) -> vector<1xf32>
    %8 = "vector.insert_strided_slice"(%4, %6) <{offsets = [2, 0], strides = [1]}> : (vector<4xf32>, vector<4x4xf32>) -> vector<4x4xf32>
    %9 = "vector.insert_strided_slice"(%5, %8) <{offsets = [1, 1], strides = [1]}> : (vector<3xf32>, vector<4x4xf32>) -> vector<4x4xf32>
    %10 = "vector.insert_strided_slice"(%5, %9) <{offsets = [0, 0], strides = [1]}> : (vector<3xf32>, vector<4x4xf32>) -> vector<4x4xf32>
    %11 = "vector.insert_strided_slice"(%7, %10) <{offsets = [3, 3], strides = [1]}> : (vector<1xf32>, vector<4x4xf32>) -> vector<4x4xf32>
    "vector.print"(%6) <{punctuation = #vector.punctuation<newline>}> : (vector<4x4xf32>) -> ()
    "vector.print"(%8) <{punctuation = #vector.punctuation<newline>}> : (vector<4x4xf32>) -> ()
    "vector.print"(%9) <{punctuation = #vector.punctuation<newline>}> : (vector<4x4xf32>) -> ()
    "vector.print"(%10) <{punctuation = #vector.punctuation<newline>}> : (vector<4x4xf32>) -> ()
    "vector.print"(%11) <{punctuation = #vector.punctuation<newline>}> : (vector<4x4xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

