"builtin.module"() ({
  "func.func"() <{function_type = (i64, i64, i64) -> vector<8x8xi64>, sym_name = "vector_outerproduct_splat_8x8"}> ({
  ^bb0(%arg5: i64, %arg6: i64, %arg7: i64):
    %27 = "vector.broadcast"(%arg5) : (i64) -> vector<8xi64>
    %28 = "vector.broadcast"(%arg6) : (i64) -> vector<8xi64>
    %29 = "vector.broadcast"(%arg7) : (i64) -> vector<8x8xi64>
    %30 = "vector.outerproduct"(%27, %28, %29) <{kind = #vector.kind<add>}> : (vector<8xi64>, vector<8xi64>, vector<8x8xi64>) -> vector<8x8xi64>
    "func.return"(%30) : (vector<8x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xi64>, vector<3xi64>) -> vector<2x3xi64>, sym_name = "vector_outerproduct_vec_2x3"}> ({
  ^bb0(%arg3: vector<2xi64>, %arg4: vector<3xi64>):
    %26 = "vector.outerproduct"(%arg3, %arg4) <{kind = #vector.kind<add>}> : (vector<2xi64>, vector<3xi64>) -> vector<2x3xi64>
    "func.return"(%26) : (vector<2x3xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xi64>, vector<3xi64>, vector<2x3xi64>) -> vector<2x3xi64>, sym_name = "vector_outerproduct_vec_2x3_acc"}> ({
  ^bb0(%arg0: vector<2xi64>, %arg1: vector<3xi64>, %arg2: vector<2x3xi64>):
    %25 = "vector.outerproduct"(%arg0, %arg1, %arg2) <{kind = #vector.kind<add>}> : (vector<2xi64>, vector<3xi64>, vector<2x3xi64>) -> vector<2x3xi64>
    "func.return"(%25) : (vector<2x3xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0 : i64}> : () -> i64
    %1 = "arith.constant"() <{value = 1 : i64}> : () -> i64
    %2 = "arith.constant"() <{value = 2 : i64}> : () -> i64
    %3 = "arith.constant"() <{value = 3 : i64}> : () -> i64
    %4 = "arith.constant"() <{value = 4 : i64}> : () -> i64
    %5 = "arith.constant"() <{value = 5 : i64}> : () -> i64
    %6 = "arith.constant"() <{value = 10 : i64}> : () -> i64
    %7 = "func.call"(%1, %2, %6) <{callee = @vector_outerproduct_splat_8x8}> : (i64, i64, i64) -> vector<8x8xi64>
    "vector.print"(%7) <{punctuation = #vector.punctuation<newline>}> : (vector<8x8xi64>) -> ()
    %8 = "vector.broadcast"(%1) : (i64) -> vector<2xi64>
    %9 = "vector.insert"(%2, %8) <{static_position = array<i64: 1>}> : (i64, vector<2xi64>) -> vector<2xi64>
    %10 = "vector.broadcast"(%3) : (i64) -> vector<3xi64>
    %11 = "vector.insert"(%4, %10) <{static_position = array<i64: 1>}> : (i64, vector<3xi64>) -> vector<3xi64>
    %12 = "vector.insert"(%5, %11) <{static_position = array<i64: 2>}> : (i64, vector<3xi64>) -> vector<3xi64>
    %13 = "func.call"(%9, %12) <{callee = @vector_outerproduct_vec_2x3}> : (vector<2xi64>, vector<3xi64>) -> vector<2x3xi64>
    "vector.print"(%13) <{punctuation = #vector.punctuation<newline>}> : (vector<2x3xi64>) -> ()
    %14 = "func.call"(%9, %12, %13) <{callee = @vector_outerproduct_vec_2x3_acc}> : (vector<2xi64>, vector<3xi64>, vector<2x3xi64>) -> vector<2x3xi64>
    "vector.print"(%14) <{punctuation = #vector.punctuation<newline>}> : (vector<2x3xi64>) -> ()
    %15 = "vector.broadcast"(%0) : (i64) -> vector<7xi64>
    %16 = "vector.insert"(%1, %15) <{static_position = array<i64: 1>}> : (i64, vector<7xi64>) -> vector<7xi64>
    %17 = "vector.insert"(%2, %16) <{static_position = array<i64: 2>}> : (i64, vector<7xi64>) -> vector<7xi64>
    %18 = "vector.insert"(%3, %17) <{static_position = array<i64: 3>}> : (i64, vector<7xi64>) -> vector<7xi64>
    %19 = "vector.insert"(%4, %18) <{static_position = array<i64: 4>}> : (i64, vector<7xi64>) -> vector<7xi64>
    %20 = "vector.insert"(%5, %19) <{static_position = array<i64: 5>}> : (i64, vector<7xi64>) -> vector<7xi64>
    %21 = "vector.insert"(%6, %20) <{static_position = array<i64: 6>}> : (i64, vector<7xi64>) -> vector<7xi64>
    %22 = "vector.broadcast"(%1) : (i64) -> vector<7xi64>
    %23 = "vector.outerproduct"(%21, %2) <{kind = #vector.kind<add>}> : (vector<7xi64>, i64) -> vector<7xi64>
    %24 = "vector.outerproduct"(%21, %2, %22) <{kind = #vector.kind<add>}> : (vector<7xi64>, i64, vector<7xi64>) -> vector<7xi64>
    "vector.print"(%23) <{punctuation = #vector.punctuation<newline>}> : (vector<7xi64>) -> ()
    "vector.print"(%24) <{punctuation = #vector.punctuation<newline>}> : (vector<7xi64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

