"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x2x2xf32>) -> vector<2x2x2xf32>, sym_name = "vec_bin"}> ({
  ^bb0(%arg15: vector<2x2x2xf32> loc("<stdin>":3:8)):
    %16 = "arith.addf"(%arg15, %arg15) <{fastmath = #arith.fastmath<none>}> : (vector<2x2x2xf32>, vector<2x2x2xf32>) -> vector<2x2x2xf32> loc("<stdin>":4:11)
    "func.return"(%16) : (vector<2x2x2xf32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (vector<1x2x3xi32>, vector<1x2x3xi64>) -> (), sym_name = "sexti_vector"}> ({
  ^bb0(%arg13: vector<1x2x3xi32> loc("<stdin>":8:8), %arg14: vector<1x2x3xi64> loc("<stdin>":8:35)):
    %15 = "arith.extsi"(%arg13) : (vector<1x2x3xi32>) -> vector<1x2x3xi64> loc("<stdin>":9:11)
    "func.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (vector<1x2x3xi32>, vector<1x2x3xi64>) -> (), sym_name = "zexti_vector"}> ({
  ^bb0(%arg11: vector<1x2x3xi32> loc("<stdin>":13:8), %arg12: vector<1x2x3xi64> loc("<stdin>":13:35)):
    %14 = "arith.extui"(%arg11) : (vector<1x2x3xi32>) -> vector<1x2x3xi64> loc("<stdin>":14:11)
    "func.return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (vector<1x2x3xi32>) -> vector<1x2x3xf32>, sym_name = "sitofp_vector"}> ({
  ^bb0(%arg10: vector<1x2x3xi32> loc("<stdin>":18:8)):
    %13 = "arith.sitofp"(%arg10) : (vector<1x2x3xi32>) -> vector<1x2x3xf32> loc("<stdin>":19:11)
    "func.return"(%13) : (vector<1x2x3xf32>) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (vector<1x2x3xi32>) -> vector<1x2x3xf32>, sym_name = "uitofp_vector"}> ({
  ^bb0(%arg9: vector<1x2x3xi32> loc("<stdin>":23:8)):
    %12 = "arith.uitofp"(%arg9) : (vector<1x2x3xi32>) -> vector<1x2x3xf32> loc("<stdin>":24:11)
    "func.return"(%12) : (vector<1x2x3xf32>) -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":22:3)
  "func.func"() <{function_type = (vector<1x2x3xf32>) -> vector<1x2x3xi32>, sym_name = "fptosi_vector"}> ({
  ^bb0(%arg8: vector<1x2x3xf32> loc("<stdin>":28:8)):
    %11 = "arith.fptosi"(%arg8) : (vector<1x2x3xf32>) -> vector<1x2x3xi32> loc("<stdin>":29:11)
    "func.return"(%11) : (vector<1x2x3xi32>) -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":27:3)
  "func.func"() <{function_type = (vector<1x2x3xf32>) -> vector<1x2x3xi32>, sym_name = "fptoui_vector"}> ({
  ^bb0(%arg7: vector<1x2x3xf32> loc("<stdin>":33:8)):
    %10 = "arith.fptoui"(%arg7) : (vector<1x2x3xf32>) -> vector<1x2x3xi32> loc("<stdin>":34:11)
    "func.return"(%10) : (vector<1x2x3xi32>) -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":32:3)
  "func.func"() <{function_type = (vector<1x2x3xf16>) -> vector<1x2x3xf64>, sym_name = "fpext_vector"}> ({
  ^bb0(%arg6: vector<1x2x3xf16> loc("<stdin>":38:8)):
    %9 = "arith.extf"(%arg6) : (vector<1x2x3xf16>) -> vector<1x2x3xf64> loc("<stdin>":39:10)
    "func.return"(%9) : (vector<1x2x3xf64>) -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":37:3)
  "func.func"() <{function_type = (vector<1x2x3xf64>) -> vector<1x2x3xf16>, sym_name = "fptrunc_vector"}> ({
  ^bb0(%arg5: vector<1x2x3xf64> loc("<stdin>":43:8)):
    %8 = "arith.truncf"(%arg5) : (vector<1x2x3xf64>) -> vector<1x2x3xf16> loc("<stdin>":44:10)
    "func.return"(%8) : (vector<1x2x3xf16>) -> () loc("<stdin>":45:5)
  }) : () -> () loc("<stdin>":42:3)
  "func.func"() <{function_type = (vector<1x2x3xf16>) -> vector<1x2x3xbf16>, sym_name = "convertf_vector"}> ({
  ^bb0(%arg4: vector<1x2x3xf16> loc("<stdin>":48:8)):
    %7 = "arith.convertf"(%arg4) : (vector<1x2x3xf16>) -> vector<1x2x3xbf16> loc("<stdin>":49:10)
    "func.return"(%7) : (vector<1x2x3xbf16>) -> () loc("<stdin>":50:5)
  }) : () -> () loc("<stdin>":47:3)
  "func.func"() <{function_type = (vector<1x2x3xi64>) -> vector<1x2x3xi16>, sym_name = "trunci_vector"}> ({
  ^bb0(%arg3: vector<1x2x3xi64> loc("<stdin>":53:8)):
    %6 = "arith.trunci"(%arg3) <{overflowFlags = #arith.overflow<none>}> : (vector<1x2x3xi64>) -> vector<1x2x3xi16> loc("<stdin>":54:10)
    "func.return"(%6) : (vector<1x2x3xi16>) -> () loc("<stdin>":55:5)
  }) : () -> () loc("<stdin>":52:3)
  "func.func"() <{function_type = (vector<1x2x3xi64>) -> vector<1x2x3xi64>, sym_name = "shl_vector"}> ({
  ^bb0(%arg2: vector<1x2x3xi64> loc("<stdin>":58:8)):
    %4 = "arith.constant"() <{value = dense<1> : vector<1x2x3xi64>}> : () -> vector<1x2x3xi64> loc("<stdin>":59:10)
    %5 = "arith.shli"(%arg2, %4) <{overflowFlags = #arith.overflow<none>}> : (vector<1x2x3xi64>, vector<1x2x3xi64>) -> vector<1x2x3xi64> loc("<stdin>":60:10)
    "func.return"(%5) : (vector<1x2x3xi64>) -> () loc("<stdin>":61:5)
  }) : () -> () loc("<stdin>":57:3)
  "func.func"() <{function_type = (vector<1x2x3xi64>) -> vector<1x2x3xi64>, sym_name = "shrs_vector"}> ({
  ^bb0(%arg1: vector<1x2x3xi64> loc("<stdin>":64:8)):
    %2 = "arith.constant"() <{value = dense<1> : vector<1x2x3xi64>}> : () -> vector<1x2x3xi64> loc("<stdin>":65:10)
    %3 = "arith.shrsi"(%arg1, %2) : (vector<1x2x3xi64>, vector<1x2x3xi64>) -> vector<1x2x3xi64> loc("<stdin>":66:10)
    "func.return"(%3) : (vector<1x2x3xi64>) -> () loc("<stdin>":67:5)
  }) : () -> () loc("<stdin>":63:3)
  "func.func"() <{function_type = (vector<1x2x3xi64>) -> vector<1x2x3xi64>, sym_name = "shru_vector"}> ({
  ^bb0(%arg0: vector<1x2x3xi64> loc("<stdin>":70:8)):
    %0 = "arith.constant"() <{value = dense<1> : vector<1x2x3xi64>}> : () -> vector<1x2x3xi64> loc("<stdin>":71:10)
    %1 = "arith.shrui"(%arg0, %0) : (vector<1x2x3xi64>, vector<1x2x3xi64>) -> vector<1x2x3xi64> loc("<stdin>":72:10)
    "func.return"(%1) : (vector<1x2x3xi64>) -> () loc("<stdin>":73:5)
  }) : () -> () loc("<stdin>":69:3)
}) : () -> () loc("<stdin>":1:1)
