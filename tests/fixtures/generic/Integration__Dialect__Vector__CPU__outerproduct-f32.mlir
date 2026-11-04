"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32, f32) -> vector<8x8xf32>, sym_name = "vector_outerproduct_splat_8x8"}> ({
  ^bb0(%arg5: f32, %arg6: f32, %arg7: f32):
    %27 = "vector.broadcast"(%arg5) : (f32) -> vector<8xf32>
    %28 = "vector.broadcast"(%arg6) : (f32) -> vector<8xf32>
    %29 = "vector.broadcast"(%arg7) : (f32) -> vector<8x8xf32>
    %30 = "vector.outerproduct"(%27, %28, %29) <{kind = #vector.kind<add>}> : (vector<8xf32>, vector<8xf32>, vector<8x8xf32>) -> vector<8x8xf32>
    "func.return"(%30) : (vector<8x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf32>, vector<3xf32>) -> vector<2x3xf32>, sym_name = "vector_outerproduct_vec_2x3"}> ({
  ^bb0(%arg3: vector<2xf32>, %arg4: vector<3xf32>):
    %26 = "vector.outerproduct"(%arg3, %arg4) <{kind = #vector.kind<add>}> : (vector<2xf32>, vector<3xf32>) -> vector<2x3xf32>
    "func.return"(%26) : (vector<2x3xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf32>, vector<3xf32>, vector<2x3xf32>) -> vector<2x3xf32>, sym_name = "vector_outerproduct_vec_2x3_acc"}> ({
  ^bb0(%arg0: vector<2xf32>, %arg1: vector<3xf32>, %arg2: vector<2x3xf32>):
    %25 = "vector.outerproduct"(%arg0, %arg1, %arg2) <{kind = #vector.kind<add>}> : (vector<2xf32>, vector<3xf32>, vector<2x3xf32>) -> vector<2x3xf32>
    "func.return"(%25) : (vector<2x3xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %3 = "arith.constant"() <{value = 3.000000e+00 : f32}> : () -> f32
    %4 = "arith.constant"() <{value = 4.000000e+00 : f32}> : () -> f32
    %5 = "arith.constant"() <{value = 5.000000e+00 : f32}> : () -> f32
    %6 = "arith.constant"() <{value = 1.000000e+01 : f32}> : () -> f32
    %7 = "func.call"(%1, %2, %6) <{callee = @vector_outerproduct_splat_8x8}> : (f32, f32, f32) -> vector<8x8xf32>
    "vector.print"(%7) <{punctuation = #vector.punctuation<newline>}> : (vector<8x8xf32>) -> ()
    %8 = "vector.broadcast"(%1) : (f32) -> vector<2xf32>
    %9 = "vector.insert"(%2, %8) <{static_position = array<i64: 1>}> : (f32, vector<2xf32>) -> vector<2xf32>
    %10 = "vector.broadcast"(%3) : (f32) -> vector<3xf32>
    %11 = "vector.insert"(%4, %10) <{static_position = array<i64: 1>}> : (f32, vector<3xf32>) -> vector<3xf32>
    %12 = "vector.insert"(%5, %11) <{static_position = array<i64: 2>}> : (f32, vector<3xf32>) -> vector<3xf32>
    %13 = "func.call"(%9, %12) <{callee = @vector_outerproduct_vec_2x3}> : (vector<2xf32>, vector<3xf32>) -> vector<2x3xf32>
    "vector.print"(%13) <{punctuation = #vector.punctuation<newline>}> : (vector<2x3xf32>) -> ()
    %14 = "func.call"(%9, %12, %13) <{callee = @vector_outerproduct_vec_2x3_acc}> : (vector<2xf32>, vector<3xf32>, vector<2x3xf32>) -> vector<2x3xf32>
    "vector.print"(%14) <{punctuation = #vector.punctuation<newline>}> : (vector<2x3xf32>) -> ()
    %15 = "vector.broadcast"(%0) : (f32) -> vector<7xf32>
    %16 = "vector.insert"(%1, %15) <{static_position = array<i64: 1>}> : (f32, vector<7xf32>) -> vector<7xf32>
    %17 = "vector.insert"(%2, %16) <{static_position = array<i64: 2>}> : (f32, vector<7xf32>) -> vector<7xf32>
    %18 = "vector.insert"(%3, %17) <{static_position = array<i64: 3>}> : (f32, vector<7xf32>) -> vector<7xf32>
    %19 = "vector.insert"(%4, %18) <{static_position = array<i64: 4>}> : (f32, vector<7xf32>) -> vector<7xf32>
    %20 = "vector.insert"(%5, %19) <{static_position = array<i64: 5>}> : (f32, vector<7xf32>) -> vector<7xf32>
    %21 = "vector.insert"(%6, %20) <{static_position = array<i64: 6>}> : (f32, vector<7xf32>) -> vector<7xf32>
    %22 = "vector.broadcast"(%1) : (f32) -> vector<7xf32>
    %23 = "vector.outerproduct"(%21, %2) <{kind = #vector.kind<add>}> : (vector<7xf32>, f32) -> vector<7xf32>
    %24 = "vector.outerproduct"(%21, %2, %22) <{kind = #vector.kind<add>}> : (vector<7xf32>, f32, vector<7xf32>) -> vector<7xf32>
    "vector.print"(%23) <{punctuation = #vector.punctuation<newline>}> : (vector<7xf32>) -> ()
    "vector.print"(%24) <{punctuation = #vector.punctuation<newline>}> : (vector<7xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

