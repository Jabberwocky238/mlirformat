"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xi8>, vector<4xi8>) -> i32, sym_name = "to_sdot"}> ({
  ^bb0(%arg25: vector<4xi8> loc("<stdin>":3:8), %arg26: vector<4xi8> loc("<stdin>":3:30)):
    %40 = "arith.extsi"(%arg25) : (vector<4xi8>) -> vector<4xi32> loc("<stdin>":4:11)
    %41 = "arith.extsi"(%arg26) : (vector<4xi8>) -> vector<4xi32> loc("<stdin>":5:11)
    %42 = "arith.muli"(%40, %41) <{overflowFlags = #arith.overflow<none>}> : (vector<4xi32>, vector<4xi32>) -> vector<4xi32> loc("<stdin>":6:11)
    %43 = "vector.reduction"(%42) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<4xi32>) -> i32 loc("<stdin>":7:11)
    "func.return"(%43) : (i32) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (vector<4xi8>, vector<4xi8>, i32) -> i32, sym_name = "to_sdot_acc"}> ({
  ^bb0(%arg22: vector<4xi8> loc("<stdin>":11:8), %arg23: vector<4xi8> loc("<stdin>":11:30), %arg24: i32 loc("<stdin>":11:52)):
    %36 = "arith.extsi"(%arg22) : (vector<4xi8>) -> vector<4xi32> loc("<stdin>":12:11)
    %37 = "arith.extsi"(%arg23) : (vector<4xi8>) -> vector<4xi32> loc("<stdin>":13:11)
    %38 = "arith.muli"(%36, %37) <{overflowFlags = #arith.overflow<none>}> : (vector<4xi32>, vector<4xi32>) -> vector<4xi32> loc("<stdin>":14:11)
    %39 = "vector.reduction"(%38, %arg24) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<4xi32>, i32) -> i32 loc("<stdin>":15:11)
    "func.return"(%39) : (i32) -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":10:3)
  "func.func"() <{function_type = (vector<4xi8>, vector<4xi8>) -> i64, sym_name = "to_sdot_i64"}> ({
  ^bb0(%arg20: vector<4xi8> loc("<stdin>":19:8), %arg21: vector<4xi8> loc("<stdin>":19:30)):
    %32 = "arith.extsi"(%arg20) : (vector<4xi8>) -> vector<4xi64> loc("<stdin>":20:11)
    %33 = "arith.extsi"(%arg21) : (vector<4xi8>) -> vector<4xi64> loc("<stdin>":21:11)
    %34 = "arith.muli"(%32, %33) <{overflowFlags = #arith.overflow<none>}> : (vector<4xi64>, vector<4xi64>) -> vector<4xi64> loc("<stdin>":22:11)
    %35 = "vector.reduction"(%34) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<4xi64>) -> i64 loc("<stdin>":23:11)
    "func.return"(%35) : (i64) -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":18:3)
  "func.func"() <{function_type = (vector<4xi8>, vector<4xi8>, i64) -> i64, sym_name = "to_sdot_acc_i64"}> ({
  ^bb0(%arg17: vector<4xi8> loc("<stdin>":27:8), %arg18: vector<4xi8> loc("<stdin>":27:30), %arg19: i64 loc("<stdin>":27:52)):
    %28 = "arith.extsi"(%arg17) : (vector<4xi8>) -> vector<4xi64> loc("<stdin>":28:11)
    %29 = "arith.extsi"(%arg18) : (vector<4xi8>) -> vector<4xi64> loc("<stdin>":29:11)
    %30 = "arith.muli"(%28, %29) <{overflowFlags = #arith.overflow<none>}> : (vector<4xi64>, vector<4xi64>) -> vector<4xi64> loc("<stdin>":30:11)
    %31 = "vector.reduction"(%30, %arg19) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<4xi64>, i64) -> i64 loc("<stdin>":31:11)
    "func.return"(%31) : (i64) -> () loc("<stdin>":32:5)
  }) : () -> () loc("<stdin>":26:3)
  "func.func"() <{function_type = (vector<4xi8>, vector<4xi8>) -> i32, sym_name = "to_udot"}> ({
  ^bb0(%arg15: vector<4xi8> loc("<stdin>":35:8), %arg16: vector<4xi8> loc("<stdin>":35:30)):
    %24 = "arith.extui"(%arg15) : (vector<4xi8>) -> vector<4xi32> loc("<stdin>":36:11)
    %25 = "arith.extui"(%arg16) : (vector<4xi8>) -> vector<4xi32> loc("<stdin>":37:11)
    %26 = "arith.muli"(%24, %25) <{overflowFlags = #arith.overflow<none>}> : (vector<4xi32>, vector<4xi32>) -> vector<4xi32> loc("<stdin>":38:11)
    %27 = "vector.reduction"(%26) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<4xi32>) -> i32 loc("<stdin>":39:11)
    "func.return"(%27) : (i32) -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":34:3)
  "func.func"() <{function_type = (vector<4xi8>, vector<4xi8>, i32) -> i32, sym_name = "to_udot_acc"}> ({
  ^bb0(%arg12: vector<4xi8> loc("<stdin>":43:8), %arg13: vector<4xi8> loc("<stdin>":43:30), %arg14: i32 loc("<stdin>":43:52)):
    %20 = "arith.extui"(%arg12) : (vector<4xi8>) -> vector<4xi32> loc("<stdin>":44:11)
    %21 = "arith.extui"(%arg13) : (vector<4xi8>) -> vector<4xi32> loc("<stdin>":45:11)
    %22 = "arith.muli"(%20, %21) <{overflowFlags = #arith.overflow<none>}> : (vector<4xi32>, vector<4xi32>) -> vector<4xi32> loc("<stdin>":46:11)
    %23 = "vector.reduction"(%22, %arg14) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<4xi32>, i32) -> i32 loc("<stdin>":47:11)
    "func.return"(%23) : (i32) -> () loc("<stdin>":48:5)
  }) : () -> () loc("<stdin>":42:3)
  "func.func"() <{function_type = (vector<4xi8>, vector<4xi8>) -> i32, sym_name = "to_signed_unsigned_dot"}> ({
  ^bb0(%arg10: vector<4xi8> loc("<stdin>":51:8), %arg11: vector<4xi8> loc("<stdin>":51:30)):
    %16 = "arith.extsi"(%arg10) : (vector<4xi8>) -> vector<4xi32> loc("<stdin>":52:11)
    %17 = "arith.extui"(%arg11) : (vector<4xi8>) -> vector<4xi32> loc("<stdin>":53:11)
    %18 = "arith.muli"(%16, %17) <{overflowFlags = #arith.overflow<none>}> : (vector<4xi32>, vector<4xi32>) -> vector<4xi32> loc("<stdin>":54:11)
    %19 = "vector.reduction"(%18) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<4xi32>) -> i32 loc("<stdin>":55:11)
    "func.return"(%19) : (i32) -> () loc("<stdin>":56:5)
  }) : () -> () loc("<stdin>":50:3)
  "func.func"() <{function_type = (vector<4xi8>, vector<4xi8>, i32) -> i32, sym_name = "to_signed_unsigned_dot_acc"}> ({
  ^bb0(%arg7: vector<4xi8> loc("<stdin>":59:8), %arg8: vector<4xi8> loc("<stdin>":59:29), %arg9: i32 loc("<stdin>":59:50)):
    %12 = "arith.extsi"(%arg7) : (vector<4xi8>) -> vector<4xi32> loc("<stdin>":60:11)
    %13 = "arith.extui"(%arg8) : (vector<4xi8>) -> vector<4xi32> loc("<stdin>":61:11)
    %14 = "arith.muli"(%12, %13) <{overflowFlags = #arith.overflow<none>}> : (vector<4xi32>, vector<4xi32>) -> vector<4xi32> loc("<stdin>":62:11)
    %15 = "vector.reduction"(%14, %arg9) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<4xi32>, i32) -> i32 loc("<stdin>":63:11)
    "func.return"(%15) : (i32) -> () loc("<stdin>":64:5)
  }) : () -> () loc("<stdin>":58:3)
  "func.func"() <{function_type = (vector<4xi8>, vector<4xi8>) -> i32, sym_name = "to_unsigned_signed_dot"}> ({
  ^bb0(%arg5: vector<4xi8> loc("<stdin>":67:8), %arg6: vector<4xi8> loc("<stdin>":67:29)):
    %8 = "arith.extui"(%arg5) : (vector<4xi8>) -> vector<4xi32> loc("<stdin>":68:10)
    %9 = "arith.extsi"(%arg6) : (vector<4xi8>) -> vector<4xi32> loc("<stdin>":69:10)
    %10 = "arith.muli"(%8, %9) <{overflowFlags = #arith.overflow<none>}> : (vector<4xi32>, vector<4xi32>) -> vector<4xi32> loc("<stdin>":70:11)
    %11 = "vector.reduction"(%10) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<4xi32>) -> i32 loc("<stdin>":71:11)
    "func.return"(%11) : (i32) -> () loc("<stdin>":72:5)
  }) : () -> () loc("<stdin>":66:3)
  "func.func"() <{function_type = (vector<4xi8>, vector<4xi8>, i32) -> i32, sym_name = "to_unsigned_signed_dot_acc"}> ({
  ^bb0(%arg2: vector<4xi8> loc("<stdin>":75:8), %arg3: vector<4xi8> loc("<stdin>":75:29), %arg4: i32 loc("<stdin>":75:50)):
    %4 = "arith.extui"(%arg2) : (vector<4xi8>) -> vector<4xi32> loc("<stdin>":76:10)
    %5 = "arith.extsi"(%arg3) : (vector<4xi8>) -> vector<4xi32> loc("<stdin>":77:10)
    %6 = "arith.muli"(%4, %5) <{overflowFlags = #arith.overflow<none>}> : (vector<4xi32>, vector<4xi32>) -> vector<4xi32> loc("<stdin>":78:10)
    %7 = "vector.reduction"(%6, %arg4) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<4xi32>, i32) -> i32 loc("<stdin>":79:10)
    "func.return"(%7) : (i32) -> () loc("<stdin>":80:5)
  }) : () -> () loc("<stdin>":74:3)
  "func.func"() <{function_type = (vector<3xi8>, vector<3xi8>) -> i32, sym_name = "to_sdot_vector3"}> ({
  ^bb0(%arg0: vector<3xi8> loc("<stdin>":83:8), %arg1: vector<3xi8> loc("<stdin>":83:29)):
    %0 = "arith.extsi"(%arg0) : (vector<3xi8>) -> vector<3xi32> loc("<stdin>":84:10)
    %1 = "arith.extsi"(%arg1) : (vector<3xi8>) -> vector<3xi32> loc("<stdin>":85:10)
    %2 = "arith.muli"(%0, %1) <{overflowFlags = #arith.overflow<none>}> : (vector<3xi32>, vector<3xi32>) -> vector<3xi32> loc("<stdin>":86:10)
    %3 = "vector.reduction"(%2) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<3xi32>) -> i32 loc("<stdin>":87:10)
    "func.return"(%3) : (i32) -> () loc("<stdin>":88:5)
  }) : () -> () loc("<stdin>":82:3)
}) : () -> () loc("<stdin>":1:1)
