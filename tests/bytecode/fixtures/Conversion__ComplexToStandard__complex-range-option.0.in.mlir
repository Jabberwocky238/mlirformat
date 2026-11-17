"builtin.module"() ({
  "func.func"() <{function_type = (complex<f32>, complex<f32>) -> complex<f32>, sym_name = "complex_div"}> ({
  ^bb0(%arg2: complex<f32> loc("<stdin>":3:8), %arg3: complex<f32> loc("<stdin>":3:29)):
    %1 = "complex.div"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (complex<f32>, complex<f32>) -> complex<f32> loc("<stdin>":4:10)
    "func.return"(%1) : (complex<f32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (complex<f32>, complex<f32>) -> complex<f32>, sym_name = "complex_div_with_fmf"}> ({
  ^bb0(%arg0: complex<f32> loc("<stdin>":8:8), %arg1: complex<f32> loc("<stdin>":8:29)):
    %0 = "complex.div"(%arg0, %arg1) <{fastmath = #arith.fastmath<nsz,arcp>}> : (complex<f32>, complex<f32>) -> complex<f32> loc("<stdin>":9:10)
    "func.return"(%0) : (complex<f32>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
}) : () -> () loc("<stdin>":1:1)
