"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = dense<[1.000000e+00, 0.000000e+00, 0.000000e+00, 2.000000e+00, 4.000000e+00, 3.000000e+00, 5.000000e+00, 7.000000e+00, 8.000000e+00, 1.000000e+00, 5.000000e+00, 5.000000e+00, 3.000000e+00, 1.000000e+00, 0.000000e+00, 7.000000e+00]> : vector<16xf32>}> : () -> vector<16xf32>
    %2 = "arith.constant"() <{value = dense<[true, false, true, true, true, false, false, false, false, false, true, true, true, true, true, false]> : vector<16xi1>}> : () -> vector<16xi1>
    %3 = "x86vector.avx512.mask.compress"(%2, %1) : (vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    %4 = "x86vector.avx512.mask.compress"(%2, %1) <{constant_src = dense<5.000000e+00> : vector<16xf32>}> : (vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    "vector.print"(%3) <{punctuation = #vector.punctuation<newline>}> : (vector<16xf32>) -> ()
    "vector.print"(%4) <{punctuation = #vector.punctuation<newline>}> : (vector<16xf32>) -> ()
    %5 = "arith.constant"() <{value = dense<[0.000000e+00, 2.000000e+00, 1.000000e+00, 8.000000e+00, 6.000000e+00, 4.000000e+00, 4.000000e+00, 3.000000e+00, 2.000000e+00, 8.000000e+00, 5.000000e+00, 6.000000e+00, 3.000000e+00, 7.000000e+00, 6.000000e+00, 9.000000e+00]> : vector<16xf32>}> : () -> vector<16xf32>
    %6 = "x86vector.avx512.mask.compress"(%2, %1, %5) : (vector<16xi1>, vector<16xf32>, vector<16xf32>) -> vector<16xf32>
    "vector.print"(%6) <{punctuation = #vector.punctuation<newline>}> : (vector<16xf32>) -> ()
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

