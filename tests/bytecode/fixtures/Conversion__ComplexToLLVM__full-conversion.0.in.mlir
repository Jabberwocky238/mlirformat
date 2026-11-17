"builtin.module"() ({
  "func.func"() <{function_type = (complex<f32>, complex<f32>) -> complex<f32>, sym_name = "complex_div"}> ({
  ^bb0(%arg3: complex<f32> loc("<stdin>":3:8), %arg4: complex<f32> loc("<stdin>":3:29)):
    %2 = "complex.div"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (complex<f32>, complex<f32>) -> complex<f32> loc("<stdin>":4:10)
    "func.return"(%2) : (complex<f32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (complex<f32>, complex<f32>) -> complex<f32>, sym_name = "complex_mul"}> ({
  ^bb0(%arg1: complex<f32> loc("<stdin>":8:8), %arg2: complex<f32> loc("<stdin>":8:29)):
    %1 = "complex.mul"(%arg1, %arg2) <{fastmath = #arith.fastmath<none>}> : (complex<f32>, complex<f32>) -> complex<f32> loc("<stdin>":9:10)
    "func.return"(%1) : (complex<f32>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (complex<f32>) -> f32, sym_name = "complex_abs"}> ({
  ^bb0(%arg0: complex<f32> loc("<stdin>":13:8)):
    %0 = "complex.abs"(%arg0) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> f32 loc("<stdin>":14:10)
    "func.return"(%0) : (f32) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
}) : () -> () loc("<stdin>":1:1)
