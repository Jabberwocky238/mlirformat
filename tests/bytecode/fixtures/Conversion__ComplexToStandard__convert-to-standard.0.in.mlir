"builtin.module"() ({
  "func.func"() <{function_type = (complex<f32>) -> f32, sym_name = "complex_abs"}> ({
  ^bb0(%arg0: complex<f32> loc("<stdin>":3:8)):
    %0 = "complex.abs"(%arg0) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> f32 loc("<stdin>":4:10)
    "func.return"(%0) : (f32) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
