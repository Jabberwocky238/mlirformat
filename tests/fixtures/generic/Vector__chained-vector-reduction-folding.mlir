"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xf32>) -> f32, sym_name = "reduce_1x_fp32"}> ({
  ^bb0(%arg16: vector<8xf32>):
    %25 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %26 = "vector.reduction"(%arg16, %25) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<8xf32>, f32) -> f32
    "func.return"(%26) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf32>, vector<8xf32>) -> f32, sym_name = "reduce_2x_fp32"}> ({
  ^bb0(%arg14: vector<8xf32>, %arg15: vector<8xf32>):
    %22 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %23 = "vector.reduction"(%arg14, %22) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<8xf32>, f32) -> f32
    %24 = "vector.reduction"(%arg15, %23) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<8xf32>, f32) -> f32
    "func.return"(%24) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf32>, vector<8xf32>) -> f32, sym_name = "reduce_2x_no_acc_fp32"}> ({
  ^bb0(%arg12: vector<8xf32>, %arg13: vector<8xf32>):
    %20 = "vector.reduction"(%arg12) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<8xf32>) -> f32
    %21 = "vector.reduction"(%arg13, %20) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<8xf32>, f32) -> f32
    "func.return"(%21) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf32>, vector<8xf32>) -> f32, sym_name = "reduce_2x_zero_add_fp32"}> ({
  ^bb0(%arg10: vector<8xf32>, %arg11: vector<8xf32>):
    %16 = "arith.constant"() <{value = dense<0.000000e+00> : vector<8xf32>}> : () -> vector<8xf32>
    %17 = "arith.addf"(%arg10, %16) <{fastmath = #arith.fastmath<none>}> : (vector<8xf32>, vector<8xf32>) -> vector<8xf32>
    %18 = "vector.reduction"(%17) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<8xf32>) -> f32
    %19 = "vector.reduction"(%arg11, %18) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<8xf32>, f32) -> f32
    "func.return"(%19) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> f32, sym_name = "reduce_3x_fp32"}> ({
  ^bb0(%arg7: vector<8xf32>, %arg8: vector<8xf32>, %arg9: vector<8xf32>):
    %12 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %13 = "vector.reduction"(%arg7, %12) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<8xf32>, f32) -> f32
    %14 = "vector.reduction"(%arg8, %13) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<8xf32>, f32) -> f32
    %15 = "vector.reduction"(%arg9, %14) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<8xf32>, f32) -> f32
    "func.return"(%15) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi32>) -> i32, sym_name = "reduce_1x_i32"}> ({
  ^bb0(%arg6: vector<8xi32>):
    %10 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %11 = "vector.reduction"(%arg6, %10) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<8xi32>, i32) -> i32
    "func.return"(%11) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi32>, vector<8xi32>) -> i32, sym_name = "reduce_2x_i32"}> ({
  ^bb0(%arg4: vector<8xi32>, %arg5: vector<8xi32>):
    %7 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %8 = "vector.reduction"(%arg4, %7) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<8xi32>, i32) -> i32
    %9 = "vector.reduction"(%arg5, %8) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<8xi32>, i32) -> i32
    "func.return"(%9) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi32>, vector<8xi32>) -> i32, sym_name = "reduce_2x_no_acc_i32"}> ({
  ^bb0(%arg2: vector<8xi32>, %arg3: vector<8xi32>):
    %5 = "vector.reduction"(%arg2) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<8xi32>) -> i32
    %6 = "vector.reduction"(%arg3, %5) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<8xi32>, i32) -> i32
    "func.return"(%6) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi32>, vector<8xi32>) -> i32, sym_name = "reduce_2x_zero_add_i32"}> ({
  ^bb0(%arg0: vector<8xi32>, %arg1: vector<8xi32>):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = dense<0> : vector<8xi32>}> : () -> vector<8xi32>
    %2 = "arith.addi"(%arg0, %1) <{overflowFlags = #arith.overflow<none>}> : (vector<8xi32>, vector<8xi32>) -> vector<8xi32>
    %3 = "vector.reduction"(%2, %0) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<8xi32>, i32) -> i32
    %4 = "vector.reduction"(%arg1, %3) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<8xi32>, i32) -> i32
    "func.return"(%4) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

