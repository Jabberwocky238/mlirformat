"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32) -> complex<f32>, sym_name = "complex_create"}> ({
  ^bb0(%arg11: f32 loc("<stdin>":3:8), %arg12: f32 loc("<stdin>":3:21)):
    %37 = "complex.create"(%arg11, %arg12) : (f32, f32) -> complex<f32> loc("<stdin>":4:11)
    "func.return"(%37) : (complex<f32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> complex<f64>, sym_name = "complex_constant"}> ({
    %36 = "complex.constant"() <{value = [1.000000e+00, 2.000000e+00]}> : () -> complex<f64> loc("<stdin>":8:11)
    "func.return"(%36) : (complex<f64>) -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (complex<f32>) -> (), sym_name = "complex_extract"}> ({
  ^bb0(%arg10: complex<f32> loc("<stdin>":12:8)):
    %34 = "complex.re"(%arg10) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> f32 loc("<stdin>":13:11)
    %35 = "complex.im"(%arg10) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> f32 loc("<stdin>":14:11)
    "func.return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":11:3)
  "func.func"() <{function_type = () -> (), sym_name = "complex_addition"}> ({
    %27 = "arith.constant"() <{value = 1.200000e+00 : f64}> : () -> f64 loc("<stdin>":18:11)
    %28 = "arith.constant"() <{value = 3.400000e+00 : f64}> : () -> f64 loc("<stdin>":19:11)
    %29 = "complex.create"(%27, %28) : (f64, f64) -> complex<f64> loc("<stdin>":20:11)
    %30 = "arith.constant"() <{value = 5.600000e+00 : f64}> : () -> f64 loc("<stdin>":21:11)
    %31 = "arith.constant"() <{value = 7.7999999999999998 : f64}> : () -> f64 loc("<stdin>":22:11)
    %32 = "complex.create"(%30, %31) : (f64, f64) -> complex<f64> loc("<stdin>":23:11)
    %33 = "complex.add"(%29, %32) <{fastmath = #arith.fastmath<none>}> : (complex<f64>, complex<f64>) -> complex<f64> loc("<stdin>":24:11)
    "func.return"() : () -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = () -> (), sym_name = "complex_substraction"}> ({
    %20 = "arith.constant"() <{value = 1.200000e+00 : f64}> : () -> f64 loc("<stdin>":28:11)
    %21 = "arith.constant"() <{value = 3.400000e+00 : f64}> : () -> f64 loc("<stdin>":29:11)
    %22 = "complex.create"(%20, %21) : (f64, f64) -> complex<f64> loc("<stdin>":30:11)
    %23 = "arith.constant"() <{value = 5.600000e+00 : f64}> : () -> f64 loc("<stdin>":31:11)
    %24 = "arith.constant"() <{value = 7.7999999999999998 : f64}> : () -> f64 loc("<stdin>":32:11)
    %25 = "complex.create"(%23, %24) : (f64, f64) -> complex<f64> loc("<stdin>":33:11)
    %26 = "complex.sub"(%22, %25) <{fastmath = #arith.fastmath<none>}> : (complex<f64>, complex<f64>) -> complex<f64> loc("<stdin>":34:11)
    "func.return"() : () -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":27:3)
  "func.func"() <{function_type = (complex<f32>, complex<f32>) -> complex<f32>, sym_name = "complex_div"}> ({
  ^bb0(%arg8: complex<f32> loc("<stdin>":38:8), %arg9: complex<f32> loc("<stdin>":38:29)):
    %19 = "complex.div"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>}> : (complex<f32>, complex<f32>) -> complex<f32> loc("<stdin>":39:11)
    "func.return"(%19) : (complex<f32>) -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":37:3)
  "func.func"() <{function_type = (complex<f32>, complex<f32>) -> complex<f32>, sym_name = "complex_mul"}> ({
  ^bb0(%arg6: complex<f32> loc("<stdin>":43:8), %arg7: complex<f32> loc("<stdin>":43:29)):
    %18 = "complex.mul"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (complex<f32>, complex<f32>) -> complex<f32> loc("<stdin>":44:11)
    "func.return"(%18) : (complex<f32>) -> () loc("<stdin>":45:5)
  }) : () -> () loc("<stdin>":42:3)
  "func.func"() <{function_type = (complex<f32>) -> f32, sym_name = "complex_abs"}> ({
  ^bb0(%arg5: complex<f32> loc("<stdin>":48:8)):
    %17 = "complex.abs"(%arg5) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> f32 loc("<stdin>":49:11)
    "func.return"(%17) : (f32) -> () loc("<stdin>":50:5)
  }) : () -> () loc("<stdin>":47:3)
  "func.func"() <{function_type = () -> (), sym_name = "complex_addition_with_fmf"}> ({
    %10 = "arith.constant"() <{value = 1.200000e+00 : f64}> : () -> f64 loc("<stdin>":53:11)
    %11 = "arith.constant"() <{value = 3.400000e+00 : f64}> : () -> f64 loc("<stdin>":54:11)
    %12 = "complex.create"(%10, %11) : (f64, f64) -> complex<f64> loc("<stdin>":55:11)
    %13 = "arith.constant"() <{value = 5.600000e+00 : f64}> : () -> f64 loc("<stdin>":56:11)
    %14 = "arith.constant"() <{value = 7.7999999999999998 : f64}> : () -> f64 loc("<stdin>":57:11)
    %15 = "complex.create"(%13, %14) : (f64, f64) -> complex<f64> loc("<stdin>":58:11)
    %16 = "complex.add"(%12, %15) <{fastmath = #arith.fastmath<reassoc>}> : (complex<f64>, complex<f64>) -> complex<f64> loc("<stdin>":59:11)
    "func.return"() : () -> () loc("<stdin>":60:5)
  }) : () -> () loc("<stdin>":52:3)
  "func.func"() <{function_type = () -> (), sym_name = "complex_substraction_with_fmf"}> ({
    %3 = "arith.constant"() <{value = 1.200000e+00 : f64}> : () -> f64 loc("<stdin>":63:10)
    %4 = "arith.constant"() <{value = 3.400000e+00 : f64}> : () -> f64 loc("<stdin>":64:10)
    %5 = "complex.create"(%3, %4) : (f64, f64) -> complex<f64> loc("<stdin>":65:10)
    %6 = "arith.constant"() <{value = 5.600000e+00 : f64}> : () -> f64 loc("<stdin>":66:10)
    %7 = "arith.constant"() <{value = 7.7999999999999998 : f64}> : () -> f64 loc("<stdin>":67:10)
    %8 = "complex.create"(%6, %7) : (f64, f64) -> complex<f64> loc("<stdin>":68:10)
    %9 = "complex.sub"(%5, %8) <{fastmath = #arith.fastmath<nnan,ninf>}> : (complex<f64>, complex<f64>) -> complex<f64> loc("<stdin>":69:10)
    "func.return"() : () -> () loc("<stdin>":70:5)
  }) : () -> () loc("<stdin>":62:3)
  "func.func"() <{function_type = (complex<f32>, complex<f32>) -> complex<f32>, sym_name = "complex_div_with_fmf"}> ({
  ^bb0(%arg3: complex<f32> loc("<stdin>":73:8), %arg4: complex<f32> loc("<stdin>":73:29)):
    %2 = "complex.div"(%arg3, %arg4) <{fastmath = #arith.fastmath<nsz,arcp>}> : (complex<f32>, complex<f32>) -> complex<f32> loc("<stdin>":74:10)
    "func.return"(%2) : (complex<f32>) -> () loc("<stdin>":75:5)
  }) : () -> () loc("<stdin>":72:3)
  "func.func"() <{function_type = (complex<f32>, complex<f32>) -> complex<f32>, sym_name = "complex_mul_with_fmf"}> ({
  ^bb0(%arg1: complex<f32> loc("<stdin>":78:8), %arg2: complex<f32> loc("<stdin>":78:29)):
    %1 = "complex.mul"(%arg1, %arg2) <{fastmath = #arith.fastmath<contract,afn>}> : (complex<f32>, complex<f32>) -> complex<f32> loc("<stdin>":79:10)
    "func.return"(%1) : (complex<f32>) -> () loc("<stdin>":80:5)
  }) : () -> () loc("<stdin>":77:3)
  "func.func"() <{function_type = (complex<f32>) -> f32, sym_name = "complex_abs_with_fmf"}> ({
  ^bb0(%arg0: complex<f32> loc("<stdin>":83:8)):
    %0 = "complex.abs"(%arg0) <{fastmath = #arith.fastmath<contract>}> : (complex<f32>) -> f32 loc("<stdin>":84:10)
    "func.return"(%0) : (f32) -> () loc("<stdin>":85:5)
  }) : () -> () loc("<stdin>":82:3)
}) : () -> () loc("<stdin>":1:1)
