"builtin.module"() ({
  "func.func"() <{function_type = (complex<f32>, complex<f64>) -> (complex<f32>, complex<f64>), sym_name = "cpow_caller"}> ({
  ^bb0(%arg18: complex<f32> loc("<stdin>":3:8), %arg19: complex<f64> loc("<stdin>":3:30)):
    %18 = "complex.pow"(%arg18, %arg18) <{fastmath = #arith.fastmath<none>}> : (complex<f32>, complex<f32>) -> complex<f32> loc("<stdin>":4:11)
    %19 = "complex.pow"(%arg19, %arg19) <{fastmath = #arith.fastmath<none>}> : (complex<f64>, complex<f64>) -> complex<f64> loc("<stdin>":5:11)
    "func.return"(%18, %19) : (complex<f32>, complex<f64>) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (complex<f32>, complex<f64>) -> (complex<f32>, complex<f64>), sym_name = "csqrt_caller"}> ({
  ^bb0(%arg16: complex<f32> loc("<stdin>":9:8), %arg17: complex<f64> loc("<stdin>":9:30)):
    %16 = "complex.sqrt"(%arg16) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> complex<f32> loc("<stdin>":10:11)
    %17 = "complex.sqrt"(%arg17) <{fastmath = #arith.fastmath<none>}> : (complex<f64>) -> complex<f64> loc("<stdin>":11:11)
    "func.return"(%16, %17) : (complex<f32>, complex<f64>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = (complex<f32>, complex<f64>) -> (complex<f32>, complex<f64>), sym_name = "ctanh_caller"}> ({
  ^bb0(%arg14: complex<f32> loc("<stdin>":15:8), %arg15: complex<f64> loc("<stdin>":15:30)):
    %14 = "complex.tanh"(%arg14) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> complex<f32> loc("<stdin>":16:11)
    %15 = "complex.tanh"(%arg15) <{fastmath = #arith.fastmath<none>}> : (complex<f64>) -> complex<f64> loc("<stdin>":17:11)
    "func.return"(%14, %15) : (complex<f32>, complex<f64>) -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":14:3)
  "func.func"() <{function_type = (complex<f32>, complex<f64>) -> (complex<f32>, complex<f64>), sym_name = "ccos_caller"}> ({
  ^bb0(%arg12: complex<f32> loc("<stdin>":21:8), %arg13: complex<f64> loc("<stdin>":21:30)):
    %12 = "complex.cos"(%arg12) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> complex<f32> loc("<stdin>":22:11)
    %13 = "complex.cos"(%arg13) <{fastmath = #arith.fastmath<none>}> : (complex<f64>) -> complex<f64> loc("<stdin>":23:11)
    "func.return"(%12, %13) : (complex<f32>, complex<f64>) -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":20:3)
  "func.func"() <{function_type = (complex<f32>, complex<f64>) -> (complex<f32>, complex<f64>), sym_name = "csin_caller"}> ({
  ^bb0(%arg10: complex<f32> loc("<stdin>":27:8), %arg11: complex<f64> loc("<stdin>":27:30)):
    %10 = "complex.sin"(%arg10) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> complex<f32> loc("<stdin>":28:11)
    %11 = "complex.sin"(%arg11) <{fastmath = #arith.fastmath<none>}> : (complex<f64>) -> complex<f64> loc("<stdin>":29:11)
    "func.return"(%10, %11) : (complex<f32>, complex<f64>) -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":26:3)
  "func.func"() <{function_type = (complex<f32>, complex<f64>) -> (complex<f32>, complex<f64>), sym_name = "conj_caller"}> ({
  ^bb0(%arg8: complex<f32> loc("<stdin>":33:8), %arg9: complex<f64> loc("<stdin>":33:29)):
    %8 = "complex.conj"(%arg8) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> complex<f32> loc("<stdin>":34:10)
    %9 = "complex.conj"(%arg9) <{fastmath = #arith.fastmath<none>}> : (complex<f64>) -> complex<f64> loc("<stdin>":35:10)
    "func.return"(%8, %9) : (complex<f32>, complex<f64>) -> () loc("<stdin>":36:5)
  }) : () -> () loc("<stdin>":32:3)
  "func.func"() <{function_type = (complex<f32>, complex<f64>) -> (f32, f64), sym_name = "cabs_caller"}> ({
  ^bb0(%arg6: complex<f32> loc("<stdin>":39:8), %arg7: complex<f64> loc("<stdin>":39:29)):
    %6 = "complex.abs"(%arg6) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> f32 loc("<stdin>":40:10)
    %7 = "complex.abs"(%arg7) <{fastmath = #arith.fastmath<none>}> : (complex<f64>) -> f64 loc("<stdin>":41:10)
    "func.return"(%6, %7) : (f32, f64) -> () loc("<stdin>":42:5)
  }) : () -> () loc("<stdin>":38:3)
  "func.func"() <{function_type = (complex<f32>, complex<f64>) -> (f32, f64), sym_name = "carg_caller"}> ({
  ^bb0(%arg4: complex<f32> loc("<stdin>":45:8), %arg5: complex<f64> loc("<stdin>":45:29)):
    %4 = "complex.angle"(%arg4) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> f32 loc("<stdin>":46:10)
    %5 = "complex.angle"(%arg5) <{fastmath = #arith.fastmath<none>}> : (complex<f64>) -> f64 loc("<stdin>":47:10)
    "func.return"(%4, %5) : (f32, f64) -> () loc("<stdin>":48:5)
  }) : () -> () loc("<stdin>":44:3)
  "func.func"() <{function_type = (complex<f32>, complex<f64>) -> (complex<f32>, complex<f64>), sym_name = "clog_caller"}> ({
  ^bb0(%arg2: complex<f32> loc("<stdin>":51:8), %arg3: complex<f64> loc("<stdin>":51:29)):
    %2 = "complex.log"(%arg2) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> complex<f32> loc("<stdin>":52:10)
    %3 = "complex.log"(%arg3) <{fastmath = #arith.fastmath<none>}> : (complex<f64>) -> complex<f64> loc("<stdin>":53:10)
    "func.return"(%2, %3) : (complex<f32>, complex<f64>) -> () loc("<stdin>":54:5)
  }) : () -> () loc("<stdin>":50:3)
  "func.func"() <{function_type = (complex<f32>, complex<f64>) -> (complex<f32>, complex<f64>), sym_name = "ctan_caller"}> ({
  ^bb0(%arg0: complex<f32> loc("<stdin>":57:8), %arg1: complex<f64> loc("<stdin>":57:29)):
    %0 = "complex.tan"(%arg0) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> complex<f32> loc("<stdin>":58:10)
    %1 = "complex.tan"(%arg1) <{fastmath = #arith.fastmath<none>}> : (complex<f64>) -> complex<f64> loc("<stdin>":59:10)
    "func.return"(%0, %1) : (complex<f32>, complex<f64>) -> () loc("<stdin>":60:5)
  }) : () -> () loc("<stdin>":56:3)
}) : () -> () loc("<stdin>":1:1)
