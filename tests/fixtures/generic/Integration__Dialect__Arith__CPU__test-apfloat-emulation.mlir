"builtin.module"() ({
  "func.func"() <{function_type = () -> (f8E4M3FN, f32), sym_name = "foo"}> ({
    %14 = "arith.constant"() <{value = 2.250000e+00 : f8E4M3FN}> : () -> f8E4M3FN
    %15 = "arith.constant"() <{value = 2.200000e+00 : f32}> : () -> f32
    "func.return"(%14, %15) : (f8E4M3FN, f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 1.375000e+00 : f8E4M3FN}> : () -> f8E4M3FN
    %1 = "arith.constant"() <{value = 1.400000e+00 : f32}> : () -> f32
    %2:2 = "func.call"() <{callee = @foo}> : () -> (f8E4M3FN, f32)
    "vector.print"(%2#1) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    %3 = "arith.addf"(%0, %2#0) <{fastmath = #arith.fastmath<none>}> : (f8E4M3FN, f8E4M3FN) -> f8E4M3FN
    "vector.print"(%3) <{punctuation = #vector.punctuation<newline>}> : (f8E4M3FN) -> ()
    %4 = "arith.addf"(%1, %2#1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "vector.print"(%4) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    %5 = "arith.truncf"(%2#1) : (f32) -> f8E4M3FN
    "vector.print"(%5) <{punctuation = #vector.punctuation<newline>}> : (f8E4M3FN) -> ()
    %6 = "arith.negf"(%5) <{fastmath = #arith.fastmath<none>}> : (f8E4M3FN) -> f8E4M3FN
    "vector.print"(%6) <{punctuation = #vector.punctuation<newline>}> : (f8E4M3FN) -> ()
    %7 = "arith.minimumf"(%5, %6) <{fastmath = #arith.fastmath<none>}> : (f8E4M3FN, f8E4M3FN) -> f8E4M3FN
    "vector.print"(%7) <{punctuation = #vector.punctuation<newline>}> : (f8E4M3FN) -> ()
    %8 = "arith.cmpf"(%5, %3) <{fastmath = #arith.fastmath<none>, predicate = 4 : i64}> : (f8E4M3FN, f8E4M3FN) -> i1
    "vector.print"(%8) <{punctuation = #vector.punctuation<newline>}> : (i1) -> ()
    %9 = "arith.fptosi"(%5) : (f8E4M3FN) -> i2
    "vector.print"(%9) <{punctuation = #vector.punctuation<newline>}> : (i2) -> ()
    %10 = "arith.fptoui"(%5) : (f8E4M3FN) -> i2
    "vector.print"(%10) <{punctuation = #vector.punctuation<newline>}> : (i2) -> ()
    %11 = "arith.constant"() <{value = -9 : i16}> : () -> i16
    %12 = "arith.sitofp"(%11) : (i16) -> f4E2M1FN
    "vector.print"(%12) <{punctuation = #vector.punctuation<newline>}> : (f4E2M1FN) -> ()
    %13 = "arith.uitofp"(%11) : (i16) -> f4E2M1FN
    "vector.print"(%13) <{punctuation = #vector.punctuation<newline>}> : (f4E2M1FN) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

