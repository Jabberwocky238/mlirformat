"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "ops"}> ({
  ^bb0(%arg0: f32):
    %0 = "complex.constant"() <{value = [1.000000e-01, -1.000000e+00]}> : () -> complex<f64>
    %1 = "complex.constant"() <{value = [1.000000e-01 : f32, -1.000000e+00 : f32]}> : () -> complex<f32>
    %2 = "complex.constant"() <{value = [true, false]}> : () -> complex<i1>
    %3 = "complex.create"(%arg0, %arg0) : (f32, f32) -> complex<f32>
    %4 = "complex.re"(%3) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> f32
    %5 = "complex.im"(%3) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> f32
    %6 = "complex.abs"(%3) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> f32
    %7 = "complex.add"(%3, %3) <{fastmath = #arith.fastmath<none>}> : (complex<f32>, complex<f32>) -> complex<f32>
    %8 = "complex.cos"(%3) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> complex<f32>
    %9 = "complex.div"(%3, %3) <{fastmath = #arith.fastmath<none>}> : (complex<f32>, complex<f32>) -> complex<f32>
    %10 = "complex.eq"(%3, %3) : (complex<f32>, complex<f32>) -> i1
    %11 = "complex.exp"(%3) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> complex<f32>
    %12 = "complex.expm1"(%3) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> complex<f32>
    %13 = "complex.log"(%3) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> complex<f32>
    %14 = "complex.log1p"(%3) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> complex<f32>
    %15 = "complex.mul"(%3, %3) <{fastmath = #arith.fastmath<none>}> : (complex<f32>, complex<f32>) -> complex<f32>
    %16 = "complex.neg"(%3) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> complex<f32>
    %17 = "complex.neq"(%3, %3) : (complex<f32>, complex<f32>) -> i1
    %18 = "complex.sign"(%3) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> complex<f32>
    %19 = "complex.sin"(%3) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> complex<f32>
    %20 = "complex.sub"(%3, %3) <{fastmath = #arith.fastmath<none>}> : (complex<f32>, complex<f32>) -> complex<f32>
    %21 = "complex.tanh"(%3) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> complex<f32>
    %22 = "complex.pow"(%3, %3) <{fastmath = #arith.fastmath<none>}> : (complex<f32>, complex<f32>) -> complex<f32>
    %23 = "complex.sqrt"(%3) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> complex<f32>
    %24 = "complex.rsqrt"(%3) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> complex<f32>
    %25 = "complex.atan2"(%3, %3) <{fastmath = #arith.fastmath<none>}> : (complex<f32>, complex<f32>) -> complex<f32>
    %26 = "complex.tan"(%3) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> complex<f32>
    %27 = "complex.bitcast"(%3) : (complex<f32>) -> i64
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

