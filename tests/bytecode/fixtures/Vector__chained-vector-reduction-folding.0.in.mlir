"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xf32>) -> f32, sym_name = "reduce_1x_fp32"}> ({
  ^bb0(%arg16: vector<8xf32> loc("<stdin>":3:8)):
    %25 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":4:11)
    %26 = "vector.reduction"(%arg16, %25) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<8xf32>, f32) -> f32 loc("<stdin>":5:11)
    "func.return"(%26) : (f32) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (vector<8xf32>, vector<8xf32>) -> f32, sym_name = "reduce_2x_fp32"}> ({
  ^bb0(%arg14: vector<8xf32> loc("<stdin>":9:8), %arg15: vector<8xf32> loc("<stdin>":9:31)):
    %22 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":10:11)
    %23 = "vector.reduction"(%arg14, %22) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<8xf32>, f32) -> f32 loc("<stdin>":11:11)
    %24 = "vector.reduction"(%arg15, %23) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<8xf32>, f32) -> f32 loc("<stdin>":12:11)
    "func.return"(%24) : (f32) -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = (vector<8xf32>, vector<8xf32>) -> f32, sym_name = "reduce_2x_no_acc_fp32"}> ({
  ^bb0(%arg12: vector<8xf32> loc("<stdin>":16:8), %arg13: vector<8xf32> loc("<stdin>":16:31)):
    %20 = "vector.reduction"(%arg12) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<8xf32>) -> f32 loc("<stdin>":17:11)
    %21 = "vector.reduction"(%arg13, %20) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<8xf32>, f32) -> f32 loc("<stdin>":18:11)
    "func.return"(%21) : (f32) -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":15:3)
  "func.func"() <{function_type = (vector<8xf32>, vector<8xf32>) -> f32, sym_name = "reduce_2x_zero_add_fp32"}> ({
  ^bb0(%arg10: vector<8xf32> loc("<stdin>":22:8), %arg11: vector<8xf32> loc("<stdin>":22:31)):
    %16 = "arith.constant"() <{value = dense<0.000000e+00> : vector<8xf32>}> : () -> vector<8xf32> loc("<stdin>":23:11)
    %17 = "arith.addf"(%arg10, %16) <{fastmath = #arith.fastmath<none>}> : (vector<8xf32>, vector<8xf32>) -> vector<8xf32> loc("<stdin>":24:11)
    %18 = "vector.reduction"(%17) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<8xf32>) -> f32 loc("<stdin>":25:11)
    %19 = "vector.reduction"(%arg11, %18) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<8xf32>, f32) -> f32 loc("<stdin>":26:11)
    "func.return"(%19) : (f32) -> () loc("<stdin>":27:5)
  }) : () -> () loc("<stdin>":21:3)
  "func.func"() <{function_type = (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> f32, sym_name = "reduce_3x_fp32"}> ({
  ^bb0(%arg7: vector<8xf32> loc("<stdin>":30:8), %arg8: vector<8xf32> loc("<stdin>":30:30), %arg9: vector<8xf32> loc("<stdin>":30:52)):
    %12 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":31:11)
    %13 = "vector.reduction"(%arg7, %12) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<8xf32>, f32) -> f32 loc("<stdin>":32:11)
    %14 = "vector.reduction"(%arg8, %13) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<8xf32>, f32) -> f32 loc("<stdin>":33:11)
    %15 = "vector.reduction"(%arg9, %14) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<8xf32>, f32) -> f32 loc("<stdin>":34:11)
    "func.return"(%15) : (f32) -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":29:3)
  "func.func"() <{function_type = (vector<8xi32>) -> i32, sym_name = "reduce_1x_i32"}> ({
  ^bb0(%arg6: vector<8xi32> loc("<stdin>":38:8)):
    %10 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":39:11)
    %11 = "vector.reduction"(%arg6, %10) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<8xi32>, i32) -> i32 loc("<stdin>":40:11)
    "func.return"(%11) : (i32) -> () loc("<stdin>":41:5)
  }) : () -> () loc("<stdin>":37:3)
  "func.func"() <{function_type = (vector<8xi32>, vector<8xi32>) -> i32, sym_name = "reduce_2x_i32"}> ({
  ^bb0(%arg4: vector<8xi32> loc("<stdin>":44:8), %arg5: vector<8xi32> loc("<stdin>":44:30)):
    %7 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":45:10)
    %8 = "vector.reduction"(%arg4, %7) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<8xi32>, i32) -> i32 loc("<stdin>":46:10)
    %9 = "vector.reduction"(%arg5, %8) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<8xi32>, i32) -> i32 loc("<stdin>":47:10)
    "func.return"(%9) : (i32) -> () loc("<stdin>":48:5)
  }) : () -> () loc("<stdin>":43:3)
  "func.func"() <{function_type = (vector<8xi32>, vector<8xi32>) -> i32, sym_name = "reduce_2x_no_acc_i32"}> ({
  ^bb0(%arg2: vector<8xi32> loc("<stdin>":51:8), %arg3: vector<8xi32> loc("<stdin>":51:30)):
    %5 = "vector.reduction"(%arg2) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<8xi32>) -> i32 loc("<stdin>":52:10)
    %6 = "vector.reduction"(%arg3, %5) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<8xi32>, i32) -> i32 loc("<stdin>":53:10)
    "func.return"(%6) : (i32) -> () loc("<stdin>":54:5)
  }) : () -> () loc("<stdin>":50:3)
  "func.func"() <{function_type = (vector<8xi32>, vector<8xi32>) -> i32, sym_name = "reduce_2x_zero_add_i32"}> ({
  ^bb0(%arg0: vector<8xi32> loc("<stdin>":57:8), %arg1: vector<8xi32> loc("<stdin>":57:30)):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":58:10)
    %1 = "arith.constant"() <{value = dense<0> : vector<8xi32>}> : () -> vector<8xi32> loc("<stdin>":59:10)
    %2 = "arith.addi"(%arg0, %1) <{overflowFlags = #arith.overflow<none>}> : (vector<8xi32>, vector<8xi32>) -> vector<8xi32> loc("<stdin>":60:10)
    %3 = "vector.reduction"(%2, %0) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<8xi32>, i32) -> i32 loc("<stdin>":61:10)
    %4 = "vector.reduction"(%arg1, %3) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<8xi32>, i32) -> i32 loc("<stdin>":62:10)
    "func.return"(%4) : (i32) -> () loc("<stdin>":63:5)
  }) : () -> () loc("<stdin>":56:3)
}) : () -> () loc("<stdin>":1:1)
