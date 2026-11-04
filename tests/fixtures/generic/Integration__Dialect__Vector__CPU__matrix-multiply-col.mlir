"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %1 = "arith.constant"() <{value = 1.000000e+00 : f64}> : () -> f64
    %2 = "arith.constant"() <{value = 2.000000e+00 : f64}> : () -> f64
    %3 = "arith.constant"() <{value = 3.000000e+00 : f64}> : () -> f64
    %4 = "arith.constant"() <{value = 4.000000e+00 : f64}> : () -> f64
    %5 = "arith.constant"() <{value = 5.000000e+00 : f64}> : () -> f64
    %6 = "arith.constant"() <{value = 6.000000e+00 : f64}> : () -> f64
    %7 = "arith.constant"() <{value = 7.000000e+00 : f64}> : () -> f64
    %8 = "vector.broadcast"(%0) : (f64) -> vector<4xf64>
    %9 = "vector.insert"(%1, %8) <{static_position = array<i64: 1>}> : (f64, vector<4xf64>) -> vector<4xf64>
    %10 = "vector.insert"(%2, %9) <{static_position = array<i64: 2>}> : (f64, vector<4xf64>) -> vector<4xf64>
    %11 = "vector.insert"(%3, %10) <{static_position = array<i64: 3>}> : (f64, vector<4xf64>) -> vector<4xf64>
    %12 = "vector.broadcast"(%4) : (f64) -> vector<4xf64>
    %13 = "vector.insert"(%5, %12) <{static_position = array<i64: 1>}> : (f64, vector<4xf64>) -> vector<4xf64>
    %14 = "vector.insert"(%6, %13) <{static_position = array<i64: 2>}> : (f64, vector<4xf64>) -> vector<4xf64>
    %15 = "vector.insert"(%7, %14) <{static_position = array<i64: 3>}> : (f64, vector<4xf64>) -> vector<4xf64>
    "vector.print"(%11) <{punctuation = #vector.punctuation<newline>}> : (vector<4xf64>) -> ()
    "vector.print"(%15) <{punctuation = #vector.punctuation<newline>}> : (vector<4xf64>) -> ()
    %16 = "llvm.intr.matrix.multiply"(%11, %15) <{lhs_columns = 2 : i32, lhs_rows = 2 : i32, rhs_columns = 2 : i32}> : (vector<4xf64>, vector<4xf64>) -> vector<4xf64>
    "vector.print"(%16) <{punctuation = #vector.punctuation<newline>}> : (vector<4xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

