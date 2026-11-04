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
    %16 = "vector.broadcast"(%0) : (f64) -> vector<6xf64>
    %17 = "vector.insert"(%1, %16) <{static_position = array<i64: 1>}> : (f64, vector<6xf64>) -> vector<6xf64>
    %18 = "vector.insert"(%2, %17) <{static_position = array<i64: 2>}> : (f64, vector<6xf64>) -> vector<6xf64>
    %19 = "vector.insert"(%3, %18) <{static_position = array<i64: 3>}> : (f64, vector<6xf64>) -> vector<6xf64>
    %20 = "vector.insert"(%4, %19) <{static_position = array<i64: 4>}> : (f64, vector<6xf64>) -> vector<6xf64>
    %21 = "vector.insert"(%5, %20) <{static_position = array<i64: 5>}> : (f64, vector<6xf64>) -> vector<6xf64>
    "vector.print"(%11) <{punctuation = #vector.punctuation<newline>}> : (vector<4xf64>) -> ()
    "vector.print"(%15) <{punctuation = #vector.punctuation<newline>}> : (vector<4xf64>) -> ()
    "vector.print"(%21) <{punctuation = #vector.punctuation<newline>}> : (vector<6xf64>) -> ()
    %22 = "llvm.intr.matrix.transpose"(%11) <{columns = 2 : i32, rows = 2 : i32}> : (vector<4xf64>) -> vector<4xf64>
    %23 = "llvm.intr.matrix.transpose"(%15) <{columns = 2 : i32, rows = 2 : i32}> : (vector<4xf64>) -> vector<4xf64>
    %24 = "llvm.intr.matrix.transpose"(%21) <{columns = 3 : i32, rows = 2 : i32}> : (vector<6xf64>) -> vector<6xf64>
    %25 = "llvm.intr.matrix.transpose"(%21) <{columns = 2 : i32, rows = 3 : i32}> : (vector<6xf64>) -> vector<6xf64>
    "vector.print"(%22) <{punctuation = #vector.punctuation<newline>}> : (vector<4xf64>) -> ()
    "vector.print"(%23) <{punctuation = #vector.punctuation<newline>}> : (vector<4xf64>) -> ()
    "vector.print"(%24) <{punctuation = #vector.punctuation<newline>}> : (vector<6xf64>) -> ()
    "vector.print"(%25) <{punctuation = #vector.punctuation<newline>}> : (vector<6xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

