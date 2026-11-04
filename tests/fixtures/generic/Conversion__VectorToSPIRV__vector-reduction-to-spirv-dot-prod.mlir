"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xi8>, vector<4xi8>) -> i32, sym_name = "to_sdot"}> ({
  ^bb0(%arg25: vector<4xi8>, %arg26: vector<4xi8>):
    %40 = "arith.extsi"(%arg25) : (vector<4xi8>) -> vector<4xi32>
    %41 = "arith.extsi"(%arg26) : (vector<4xi8>) -> vector<4xi32>
    %42 = "arith.muli"(%40, %41) <{overflowFlags = #arith.overflow<none>}> : (vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    %43 = "vector.reduction"(%42) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<4xi32>) -> i32
    "func.return"(%43) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi8>, vector<4xi8>, i32) -> i32, sym_name = "to_sdot_acc"}> ({
  ^bb0(%arg22: vector<4xi8>, %arg23: vector<4xi8>, %arg24: i32):
    %36 = "arith.extsi"(%arg22) : (vector<4xi8>) -> vector<4xi32>
    %37 = "arith.extsi"(%arg23) : (vector<4xi8>) -> vector<4xi32>
    %38 = "arith.muli"(%36, %37) <{overflowFlags = #arith.overflow<none>}> : (vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    %39 = "vector.reduction"(%38, %arg24) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<4xi32>, i32) -> i32
    "func.return"(%39) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi8>, vector<4xi8>) -> i64, sym_name = "to_sdot_i64"}> ({
  ^bb0(%arg20: vector<4xi8>, %arg21: vector<4xi8>):
    %32 = "arith.extsi"(%arg20) : (vector<4xi8>) -> vector<4xi64>
    %33 = "arith.extsi"(%arg21) : (vector<4xi8>) -> vector<4xi64>
    %34 = "arith.muli"(%32, %33) <{overflowFlags = #arith.overflow<none>}> : (vector<4xi64>, vector<4xi64>) -> vector<4xi64>
    %35 = "vector.reduction"(%34) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<4xi64>) -> i64
    "func.return"(%35) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi8>, vector<4xi8>, i64) -> i64, sym_name = "to_sdot_acc_i64"}> ({
  ^bb0(%arg17: vector<4xi8>, %arg18: vector<4xi8>, %arg19: i64):
    %28 = "arith.extsi"(%arg17) : (vector<4xi8>) -> vector<4xi64>
    %29 = "arith.extsi"(%arg18) : (vector<4xi8>) -> vector<4xi64>
    %30 = "arith.muli"(%28, %29) <{overflowFlags = #arith.overflow<none>}> : (vector<4xi64>, vector<4xi64>) -> vector<4xi64>
    %31 = "vector.reduction"(%30, %arg19) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<4xi64>, i64) -> i64
    "func.return"(%31) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi8>, vector<4xi8>) -> i32, sym_name = "to_udot"}> ({
  ^bb0(%arg15: vector<4xi8>, %arg16: vector<4xi8>):
    %24 = "arith.extui"(%arg15) : (vector<4xi8>) -> vector<4xi32>
    %25 = "arith.extui"(%arg16) : (vector<4xi8>) -> vector<4xi32>
    %26 = "arith.muli"(%24, %25) <{overflowFlags = #arith.overflow<none>}> : (vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    %27 = "vector.reduction"(%26) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<4xi32>) -> i32
    "func.return"(%27) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi8>, vector<4xi8>, i32) -> i32, sym_name = "to_udot_acc"}> ({
  ^bb0(%arg12: vector<4xi8>, %arg13: vector<4xi8>, %arg14: i32):
    %20 = "arith.extui"(%arg12) : (vector<4xi8>) -> vector<4xi32>
    %21 = "arith.extui"(%arg13) : (vector<4xi8>) -> vector<4xi32>
    %22 = "arith.muli"(%20, %21) <{overflowFlags = #arith.overflow<none>}> : (vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    %23 = "vector.reduction"(%22, %arg14) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<4xi32>, i32) -> i32
    "func.return"(%23) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi8>, vector<4xi8>) -> i32, sym_name = "to_signed_unsigned_dot"}> ({
  ^bb0(%arg10: vector<4xi8>, %arg11: vector<4xi8>):
    %16 = "arith.extsi"(%arg10) : (vector<4xi8>) -> vector<4xi32>
    %17 = "arith.extui"(%arg11) : (vector<4xi8>) -> vector<4xi32>
    %18 = "arith.muli"(%16, %17) <{overflowFlags = #arith.overflow<none>}> : (vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    %19 = "vector.reduction"(%18) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<4xi32>) -> i32
    "func.return"(%19) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi8>, vector<4xi8>, i32) -> i32, sym_name = "to_signed_unsigned_dot_acc"}> ({
  ^bb0(%arg7: vector<4xi8>, %arg8: vector<4xi8>, %arg9: i32):
    %12 = "arith.extsi"(%arg7) : (vector<4xi8>) -> vector<4xi32>
    %13 = "arith.extui"(%arg8) : (vector<4xi8>) -> vector<4xi32>
    %14 = "arith.muli"(%12, %13) <{overflowFlags = #arith.overflow<none>}> : (vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    %15 = "vector.reduction"(%14, %arg9) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<4xi32>, i32) -> i32
    "func.return"(%15) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi8>, vector<4xi8>) -> i32, sym_name = "to_unsigned_signed_dot"}> ({
  ^bb0(%arg5: vector<4xi8>, %arg6: vector<4xi8>):
    %8 = "arith.extui"(%arg5) : (vector<4xi8>) -> vector<4xi32>
    %9 = "arith.extsi"(%arg6) : (vector<4xi8>) -> vector<4xi32>
    %10 = "arith.muli"(%8, %9) <{overflowFlags = #arith.overflow<none>}> : (vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    %11 = "vector.reduction"(%10) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<4xi32>) -> i32
    "func.return"(%11) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi8>, vector<4xi8>, i32) -> i32, sym_name = "to_unsigned_signed_dot_acc"}> ({
  ^bb0(%arg2: vector<4xi8>, %arg3: vector<4xi8>, %arg4: i32):
    %4 = "arith.extui"(%arg2) : (vector<4xi8>) -> vector<4xi32>
    %5 = "arith.extsi"(%arg3) : (vector<4xi8>) -> vector<4xi32>
    %6 = "arith.muli"(%4, %5) <{overflowFlags = #arith.overflow<none>}> : (vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    %7 = "vector.reduction"(%6, %arg4) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<4xi32>, i32) -> i32
    "func.return"(%7) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xi8>, vector<3xi8>) -> i32, sym_name = "to_sdot_vector3"}> ({
  ^bb0(%arg0: vector<3xi8>, %arg1: vector<3xi8>):
    %0 = "arith.extsi"(%arg0) : (vector<3xi8>) -> vector<3xi32>
    %1 = "arith.extsi"(%arg1) : (vector<3xi8>) -> vector<3xi32>
    %2 = "arith.muli"(%0, %1) <{overflowFlags = #arith.overflow<none>}> : (vector<3xi32>, vector<3xi32>) -> vector<3xi32>
    %3 = "vector.reduction"(%2) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<3xi32>) -> i32
    "func.return"(%3) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2xi8>, vector<2xi8>) -> i32, sym_name = "too_short"}> ({
  ^bb0(%arg6: vector<2xi8>, %arg7: vector<2xi8>):
    %12 = "arith.extsi"(%arg6) : (vector<2xi8>) -> vector<2xi32>
    %13 = "arith.extsi"(%arg7) : (vector<2xi8>) -> vector<2xi32>
    %14 = "arith.muli"(%12, %13) <{overflowFlags = #arith.overflow<none>}> : (vector<2xi32>, vector<2xi32>) -> vector<2xi32>
    %15 = "vector.reduction"(%14) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<2xi32>) -> i32
    "func.return"(%15) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<6xi8>, vector<6xi8>) -> i32, sym_name = "too_long"}> ({
  ^bb0(%arg4: vector<6xi8>, %arg5: vector<6xi8>):
    %8 = "arith.extsi"(%arg4) : (vector<6xi8>) -> vector<6xi32>
    %9 = "arith.extsi"(%arg5) : (vector<6xi8>) -> vector<6xi32>
    %10 = "arith.muli"(%8, %9) <{overflowFlags = #arith.overflow<none>}> : (vector<6xi32>, vector<6xi32>) -> vector<6xi32>
    %11 = "vector.reduction"(%10) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<6xi32>) -> i32
    "func.return"(%11) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi8>, vector<4xi8>) -> i32, sym_name = "wrong_reduction_kind"}> ({
  ^bb0(%arg2: vector<4xi8>, %arg3: vector<4xi8>):
    %4 = "arith.extsi"(%arg2) : (vector<4xi8>) -> vector<4xi32>
    %5 = "arith.extsi"(%arg3) : (vector<4xi8>) -> vector<4xi32>
    %6 = "arith.muli"(%4, %5) <{overflowFlags = #arith.overflow<none>}> : (vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    %7 = "vector.reduction"(%6) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<mul>}> : (vector<4xi32>) -> i32
    "func.return"(%7) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi8>, vector<4xi8>) -> i32, sym_name = "wrong_arith_op"}> ({
  ^bb0(%arg0: vector<4xi8>, %arg1: vector<4xi8>):
    %0 = "arith.extsi"(%arg0) : (vector<4xi8>) -> vector<4xi32>
    %1 = "arith.extsi"(%arg1) : (vector<4xi8>) -> vector<4xi32>
    %2 = "arith.addi"(%0, %1) <{overflowFlags = #arith.overflow<none>}> : (vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    %3 = "vector.reduction"(%2) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<mul>}> : (vector<4xi32>) -> i32
    "func.return"(%3) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

