"builtin.module"() ({
  "func.func"() <{function_type = (f4E2M1FN) -> (), sym_name = "check_extf"}> ({
  ^bb0(%arg1: f4E2M1FN):
    %40 = "arith.extf"(%arg1) : (f4E2M1FN) -> f32
    "vector.print"(%40) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> (), sym_name = "check_truncf"}> ({
  ^bb0(%arg0: f32):
    %37 = "arith.truncf"(%arg0) : (f32) -> f4E2M1FN
    %38 = "arith.bitcast"(%37) : (f4E2M1FN) -> i4
    %39 = "arith.extui"(%38) : (i4) -> i64
    "vector.print"(%39) <{punctuation = #vector.punctuation<newline>}> : (i64) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 5.000000e-01 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %3 = "arith.constant"() <{value = 1.500000e+00 : f32}> : () -> f32
    %4 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %5 = "arith.constant"() <{value = 3.000000e+00 : f32}> : () -> f32
    %6 = "arith.constant"() <{value = 4.000000e+00 : f32}> : () -> f32
    %7 = "arith.constant"() <{value = 6.000000e+00 : f32}> : () -> f32
    %8 = "arith.constant"() <{value = -0.000000e+00 : f32}> : () -> f32
    %9 = "arith.constant"() <{value = -5.000000e-01 : f32}> : () -> f32
    %10 = "arith.constant"() <{value = -1.000000e+00 : f32}> : () -> f32
    %11 = "arith.constant"() <{value = -1.500000e+00 : f32}> : () -> f32
    %12 = "arith.constant"() <{value = -2.000000e+00 : f32}> : () -> f32
    %13 = "arith.constant"() <{value = -3.000000e+00 : f32}> : () -> f32
    %14 = "arith.constant"() <{value = -4.000000e+00 : f32}> : () -> f32
    %15 = "arith.constant"() <{value = -6.000000e+00 : f32}> : () -> f32
    %16 = "arith.constant"() <{value = -1.000000e+06 : f32}> : () -> f32
    %17 = "arith.constant"() <{value = 1.000000e+06 : f32}> : () -> f32
    %18 = "arith.constant"() <{value = -3.140000e+00 : f32}> : () -> f32
    %19 = "arith.constant"() <{value = 3.73148927E-34 : f32}> : () -> f32
    "func.call"(%0) <{callee = @check_truncf}> : (f32) -> ()
    "func.call"(%1) <{callee = @check_truncf}> : (f32) -> ()
    "func.call"(%2) <{callee = @check_truncf}> : (f32) -> ()
    "func.call"(%3) <{callee = @check_truncf}> : (f32) -> ()
    "func.call"(%4) <{callee = @check_truncf}> : (f32) -> ()
    "func.call"(%5) <{callee = @check_truncf}> : (f32) -> ()
    "func.call"(%6) <{callee = @check_truncf}> : (f32) -> ()
    "func.call"(%7) <{callee = @check_truncf}> : (f32) -> ()
    "func.call"(%9) <{callee = @check_truncf}> : (f32) -> ()
    "func.call"(%10) <{callee = @check_truncf}> : (f32) -> ()
    "func.call"(%11) <{callee = @check_truncf}> : (f32) -> ()
    "func.call"(%12) <{callee = @check_truncf}> : (f32) -> ()
    "func.call"(%13) <{callee = @check_truncf}> : (f32) -> ()
    "func.call"(%14) <{callee = @check_truncf}> : (f32) -> ()
    "func.call"(%15) <{callee = @check_truncf}> : (f32) -> ()
    "func.call"(%17) <{callee = @check_truncf}> : (f32) -> ()
    "func.call"(%16) <{callee = @check_truncf}> : (f32) -> ()
    "func.call"(%18) <{callee = @check_truncf}> : (f32) -> ()
    "func.call"(%19) <{callee = @check_truncf}> : (f32) -> ()
    %20 = "arith.truncf"(%0) : (f32) -> f4E2M1FN
    "func.call"(%20) <{callee = @check_extf}> : (f4E2M1FN) -> ()
    %21 = "arith.truncf"(%1) : (f32) -> f4E2M1FN
    "func.call"(%21) <{callee = @check_extf}> : (f4E2M1FN) -> ()
    %22 = "arith.truncf"(%2) : (f32) -> f4E2M1FN
    "func.call"(%22) <{callee = @check_extf}> : (f4E2M1FN) -> ()
    %23 = "arith.truncf"(%3) : (f32) -> f4E2M1FN
    "func.call"(%23) <{callee = @check_extf}> : (f4E2M1FN) -> ()
    %24 = "arith.truncf"(%4) : (f32) -> f4E2M1FN
    "func.call"(%24) <{callee = @check_extf}> : (f4E2M1FN) -> ()
    %25 = "arith.truncf"(%5) : (f32) -> f4E2M1FN
    "func.call"(%25) <{callee = @check_extf}> : (f4E2M1FN) -> ()
    %26 = "arith.truncf"(%6) : (f32) -> f4E2M1FN
    "func.call"(%26) <{callee = @check_extf}> : (f4E2M1FN) -> ()
    %27 = "arith.truncf"(%17) : (f32) -> f4E2M1FN
    "func.call"(%27) <{callee = @check_extf}> : (f4E2M1FN) -> ()
    %28 = "arith.truncf"(%8) : (f32) -> f4E2M1FN
    "func.call"(%28) <{callee = @check_extf}> : (f4E2M1FN) -> ()
    %29 = "arith.truncf"(%9) : (f32) -> f4E2M1FN
    "func.call"(%29) <{callee = @check_extf}> : (f4E2M1FN) -> ()
    %30 = "arith.truncf"(%10) : (f32) -> f4E2M1FN
    "func.call"(%30) <{callee = @check_extf}> : (f4E2M1FN) -> ()
    %31 = "arith.truncf"(%11) : (f32) -> f4E2M1FN
    "func.call"(%31) <{callee = @check_extf}> : (f4E2M1FN) -> ()
    %32 = "arith.truncf"(%12) : (f32) -> f4E2M1FN
    "func.call"(%32) <{callee = @check_extf}> : (f4E2M1FN) -> ()
    %33 = "arith.truncf"(%13) : (f32) -> f4E2M1FN
    "func.call"(%33) <{callee = @check_extf}> : (f4E2M1FN) -> ()
    %34 = "arith.truncf"(%14) : (f32) -> f4E2M1FN
    "func.call"(%34) <{callee = @check_extf}> : (f4E2M1FN) -> ()
    %35 = "arith.truncf"(%16) : (f32) -> f4E2M1FN
    "func.call"(%35) <{callee = @check_extf}> : (f4E2M1FN) -> ()
    %36 = "arith.truncf"(%18) : (f32) -> f4E2M1FN
    "func.call"(%36) <{callee = @check_extf}> : (f4E2M1FN) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

