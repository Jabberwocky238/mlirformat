"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "int32_scalar"}> ({
  ^bb0(%arg10: i32 loc("<stdin>":3:8), %arg11: i32 loc("<stdin>":3:21)):
    %5 = "arith.addi"(%arg10, %arg11) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":4:10)
    %6 = "arith.subi"(%arg10, %arg11) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":5:10)
    %7 = "arith.muli"(%arg10, %arg11) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":6:10)
    %8 = "arith.divsi"(%arg10, %arg11) : (i32, i32) -> i32 loc("<stdin>":7:10)
    %9 = "arith.divui"(%arg10, %arg11) : (i32, i32) -> i32 loc("<stdin>":8:10)
    %10 = "arith.remui"(%arg10, %arg11) : (i32, i32) -> i32 loc("<stdin>":9:11)
    "func.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "int32_scalar_srem"}> ({
  ^bb0(%arg8: i32 loc("<stdin>":13:8), %arg9: i32 loc("<stdin>":13:20)):
    %4 = "arith.remsi"(%arg8, %arg9) : (i32, i32) -> i32 loc("<stdin>":14:10)
    "func.return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "scalar_ceildivui"}> ({
  ^bb0(%arg6: i32 loc("<stdin>":18:8), %arg7: i32 loc("<stdin>":18:20)):
    %3 = "arith.ceildivui"(%arg6, %arg7) : (i32, i32) -> i32 loc("<stdin>":19:10)
    "func.return"(%3) : (i32) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "scalar_ceildivsi"}> ({
  ^bb0(%arg4: i32 loc("<stdin>":23:8), %arg5: i32 loc("<stdin>":23:20)):
    %2 = "arith.ceildivsi"(%arg4, %arg5) : (i32, i32) -> i32 loc("<stdin>":24:10)
    "func.return"(%2) : (i32) -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":22:3)
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "scalar_floordivsi"}> ({
  ^bb0(%arg2: i32 loc("<stdin>":28:8), %arg3: i32 loc("<stdin>":28:20)):
    %1 = "arith.floordivsi"(%arg2, %arg3) : (i32, i32) -> i32 loc("<stdin>":29:10)
    "func.return"(%1) : (i32) -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":27:3)
  "func.func"() <{function_type = (vector<4xi32>, vector<4xi32>) -> vector<4xi32>, sym_name = "vector_ceildivsi"}> ({
  ^bb0(%arg0: vector<4xi32> loc("<stdin>":33:8), %arg1: vector<4xi32> loc("<stdin>":33:30)):
    %0 = "arith.ceildivsi"(%arg0, %arg1) : (vector<4xi32>, vector<4xi32>) -> vector<4xi32> loc("<stdin>":34:10)
    "func.return"(%0) : (vector<4xi32>) -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":32:3)
}) : () -> () loc("<stdin>":1:1)
