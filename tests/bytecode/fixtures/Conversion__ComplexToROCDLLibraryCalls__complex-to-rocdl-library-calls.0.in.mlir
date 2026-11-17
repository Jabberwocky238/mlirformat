"builtin.module"() ({
  "func.func"() <{function_type = (complex<f32>, complex<f64>) -> (f32, f64), sym_name = "abs_caller"}> ({
  ^bb0(%arg18: complex<f32> loc("<stdin>":3:8), %arg19: complex<f64> loc("<stdin>":3:30)):
    %16 = "complex.abs"(%arg18) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> f32 loc("<stdin>":4:11)
    %17 = "complex.abs"(%arg19) <{fastmath = #arith.fastmath<none>}> : (complex<f64>) -> f64 loc("<stdin>":5:11)
    "func.return"(%16, %17) : (f32, f64) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (complex<f32>, complex<f64>) -> (complex<f32>, complex<f64>), sym_name = "cos_caller"}> ({
  ^bb0(%arg16: complex<f32> loc("<stdin>":9:8), %arg17: complex<f64> loc("<stdin>":9:30)):
    %14 = "complex.cos"(%arg16) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> complex<f32> loc("<stdin>":10:11)
    %15 = "complex.cos"(%arg17) <{fastmath = #arith.fastmath<none>}> : (complex<f64>) -> complex<f64> loc("<stdin>":11:11)
    "func.return"(%14, %15) : (complex<f32>, complex<f64>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = (complex<f32>, complex<f64>) -> (complex<f32>, complex<f64>), sym_name = "exp_caller"}> ({
  ^bb0(%arg14: complex<f32> loc("<stdin>":15:8), %arg15: complex<f64> loc("<stdin>":15:30)):
    %12 = "complex.exp"(%arg14) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> complex<f32> loc("<stdin>":16:11)
    %13 = "complex.exp"(%arg15) <{fastmath = #arith.fastmath<none>}> : (complex<f64>) -> complex<f64> loc("<stdin>":17:11)
    "func.return"(%12, %13) : (complex<f32>, complex<f64>) -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":14:3)
  "func.func"() <{function_type = (complex<f32>, complex<f64>) -> (complex<f32>, complex<f64>), sym_name = "log_caller"}> ({
  ^bb0(%arg12: complex<f32> loc("<stdin>":21:8), %arg13: complex<f64> loc("<stdin>":21:30)):
    %10 = "complex.log"(%arg12) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> complex<f32> loc("<stdin>":22:11)
    %11 = "complex.log"(%arg13) <{fastmath = #arith.fastmath<none>}> : (complex<f64>) -> complex<f64> loc("<stdin>":23:11)
    "func.return"(%10, %11) : (complex<f32>, complex<f64>) -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":20:3)
  "func.func"() <{function_type = (complex<f32>, complex<f32>) -> complex<f32>, sym_name = "pow_caller"}> ({
  ^bb0(%arg10: complex<f32> loc("<stdin>":27:8), %arg11: complex<f32> loc("<stdin>":27:30)):
    %9 = "complex.pow"(%arg10, %arg11) <{fastmath = #arith.fastmath<none>}> : (complex<f32>, complex<f32>) -> complex<f32> loc("<stdin>":28:10)
    "func.return"(%9) : (complex<f32>) -> () loc("<stdin>":29:5)
  }) : () -> () loc("<stdin>":26:3)
  "func.func"() <{function_type = (complex<f32>, i32) -> complex<f32>, sym_name = "powi_caller"}> ({
  ^bb0(%arg8: complex<f32> loc("<stdin>":32:8), %arg9: i32 loc("<stdin>":32:29)):
    %8 = "complex.powi"(%arg8, %arg9) : (complex<f32>, i32) -> complex<f32> loc("<stdin>":33:10)
    "func.return"(%8) : (complex<f32>) -> () loc("<stdin>":34:5)
  }) : () -> () loc("<stdin>":31:3)
  "func.func"() <{function_type = (complex<f32>, complex<f64>) -> (complex<f32>, complex<f64>), sym_name = "sin_caller"}> ({
  ^bb0(%arg6: complex<f32> loc("<stdin>":37:8), %arg7: complex<f64> loc("<stdin>":37:29)):
    %6 = "complex.sin"(%arg6) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> complex<f32> loc("<stdin>":38:10)
    %7 = "complex.sin"(%arg7) <{fastmath = #arith.fastmath<none>}> : (complex<f64>) -> complex<f64> loc("<stdin>":39:10)
    "func.return"(%6, %7) : (complex<f32>, complex<f64>) -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":36:3)
  "func.func"() <{function_type = (complex<f32>, complex<f64>) -> (complex<f32>, complex<f64>), sym_name = "sqrt_caller"}> ({
  ^bb0(%arg4: complex<f32> loc("<stdin>":43:8), %arg5: complex<f64> loc("<stdin>":43:29)):
    %4 = "complex.sqrt"(%arg4) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> complex<f32> loc("<stdin>":44:10)
    %5 = "complex.sqrt"(%arg5) <{fastmath = #arith.fastmath<none>}> : (complex<f64>) -> complex<f64> loc("<stdin>":45:10)
    "func.return"(%4, %5) : (complex<f32>, complex<f64>) -> () loc("<stdin>":46:5)
  }) : () -> () loc("<stdin>":42:3)
  "func.func"() <{function_type = (complex<f32>, complex<f64>) -> (complex<f32>, complex<f64>), sym_name = "tan_caller"}> ({
  ^bb0(%arg2: complex<f32> loc("<stdin>":49:8), %arg3: complex<f64> loc("<stdin>":49:29)):
    %2 = "complex.tan"(%arg2) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> complex<f32> loc("<stdin>":50:10)
    %3 = "complex.tan"(%arg3) <{fastmath = #arith.fastmath<none>}> : (complex<f64>) -> complex<f64> loc("<stdin>":51:10)
    "func.return"(%2, %3) : (complex<f32>, complex<f64>) -> () loc("<stdin>":52:5)
  }) : () -> () loc("<stdin>":48:3)
  "func.func"() <{function_type = (complex<f32>, complex<f64>) -> (complex<f32>, complex<f64>), sym_name = "tanh_caller"}> ({
  ^bb0(%arg0: complex<f32> loc("<stdin>":55:8), %arg1: complex<f64> loc("<stdin>":55:29)):
    %0 = "complex.tanh"(%arg0) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> complex<f32> loc("<stdin>":56:10)
    %1 = "complex.tanh"(%arg1) <{fastmath = #arith.fastmath<none>}> : (complex<f64>) -> complex<f64> loc("<stdin>":57:10)
    "func.return"(%0, %1) : (complex<f32>, complex<f64>) -> () loc("<stdin>":58:5)
  }) : () -> () loc("<stdin>":54:3)
}) : () -> () loc("<stdin>":1:1)
