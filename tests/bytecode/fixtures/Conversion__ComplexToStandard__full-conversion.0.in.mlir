"builtin.module"() ({
  "func.func"() <{function_type = (complex<f32>) -> f32, sym_name = "complex_abs"}> ({
  ^bb0(%arg4: complex<f32> loc("<stdin>":3:8)):
    %2 = "complex.abs"(%arg4) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> f32 loc("<stdin>":4:10)
    "func.return"(%2) : (f32) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (complex<f32>, complex<f32>) -> i1, sym_name = "complex_eq"}> ({
  ^bb0(%arg2: complex<f32> loc("<stdin>":8:8), %arg3: complex<f32> loc("<stdin>":8:29)):
    %1 = "complex.eq"(%arg2, %arg3) : (complex<f32>, complex<f32>) -> i1 loc("<stdin>":9:10)
    "func.return"(%1) : (i1) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (complex<f32>, complex<f32>) -> i1, sym_name = "complex_neq"}> ({
  ^bb0(%arg0: complex<f32> loc("<stdin>":13:8), %arg1: complex<f32> loc("<stdin>":13:29)):
    %0 = "complex.neq"(%arg0, %arg1) : (complex<f32>, complex<f32>) -> i1 loc("<stdin>":14:10)
    "func.return"(%0) : (i1) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
}) : () -> () loc("<stdin>":1:1)
