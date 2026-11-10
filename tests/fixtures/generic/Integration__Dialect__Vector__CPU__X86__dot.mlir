"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3 = "arith.constant"() <{value = dense<[1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00]> : vector<8xf32>}> : () -> vector<8xf32>
    %4 = "arith.constant"() <{value = dense<[9.000000e+00, 1.000000e+01, 1.100000e+01, 1.200000e+01, 1.300000e+01, 1.400000e+01, 1.500000e+01, 1.600000e+01]> : vector<8xf32>}> : () -> vector<8xf32>
    %5 = "x86.avx.intr.dot"(%3, %4) : (vector<8xf32>, vector<8xf32>) -> vector<8xf32>
    %6 = "vector.extract"(%5, %1) <{static_position = array<i64: -9223372036854775808>}> : (vector<8xf32>, index) -> f32
    %7 = "vector.extract"(%5, %2) <{static_position = array<i64: -9223372036854775808>}> : (vector<8xf32>, index) -> f32
    %8 = "arith.addf"(%6, %7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "vector.print"(%5) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> ()
    "vector.print"(%8) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

