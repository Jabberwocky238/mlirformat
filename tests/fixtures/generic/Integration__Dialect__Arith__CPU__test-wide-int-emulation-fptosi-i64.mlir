"builtin.module"() ({
  "func.func"() <{function_type = (f64) -> i64, sym_name = "emulate_fptosi"}> ({
  ^bb0(%arg1: f64):
    %18 = "arith.fptosi"(%arg1) : (f64) -> i64
    "func.return"(%18) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64) -> (), sym_name = "check_fptosi"}> ({
  ^bb0(%arg0: f64):
    %17 = "func.call"(%arg0) <{callee = @emulate_fptosi}> : (f64) -> i64
    "vector.print"(%17) <{punctuation = #vector.punctuation<newline>}> : (i64) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %1 = "arith.constant"() <{value = -0.000000e+00 : f64}> : () -> f64
    %2 = "arith.constant"() <{value = 1.000000e+00 : f64}> : () -> f64
    %3 = "arith.constant"() <{value = -1.000000e+00 : f64}> : () -> f64
    %4 = "arith.constant"() <{value = -1.500000e+00 : f64}> : () -> f64
    %5 = "arith.constant"() <{value = 0x4130000000000000 : f64}> : () -> f64
    %6 = "arith.constant"() <{value = 0xC130000000000000 : f64}> : () -> f64
    %7 = "arith.constant"() <{value = 0x41EFFFFFFFE00000 : f64}> : () -> f64
    %8 = "arith.constant"() <{value = 0xC1F0000000000000 : f64}> : () -> f64
    %9 = "arith.constant"() <{value = 0x41F0000000000000 : f64}> : () -> f64
    %10 = "arith.constant"() <{value = 0xC1F0000000100000 : f64}> : () -> f64
    %11 = "arith.constant"() <{value = 0x4270000000000000 : f64}> : () -> f64
    %12 = "arith.constant"() <{value = 0xC270000000000000 : f64}> : () -> f64
    %13 = "arith.constant"() <{value = 0x4270000100000000 : f64}> : () -> f64
    %14 = "arith.constant"() <{value = 0xC270000100000000 : f64}> : () -> f64
    %15 = "arith.constant"() <{value = 0x4340000000000000 : f64}> : () -> f64
    %16 = "arith.constant"() <{value = 0xC340000000000000 : f64}> : () -> f64
    "func.call"(%0) <{callee = @check_fptosi}> : (f64) -> ()
    "func.call"(%1) <{callee = @check_fptosi}> : (f64) -> ()
    "func.call"(%2) <{callee = @check_fptosi}> : (f64) -> ()
    "func.call"(%3) <{callee = @check_fptosi}> : (f64) -> ()
    "func.call"(%4) <{callee = @check_fptosi}> : (f64) -> ()
    "func.call"(%5) <{callee = @check_fptosi}> : (f64) -> ()
    "func.call"(%6) <{callee = @check_fptosi}> : (f64) -> ()
    "func.call"(%7) <{callee = @check_fptosi}> : (f64) -> ()
    "func.call"(%8) <{callee = @check_fptosi}> : (f64) -> ()
    "func.call"(%9) <{callee = @check_fptosi}> : (f64) -> ()
    "func.call"(%10) <{callee = @check_fptosi}> : (f64) -> ()
    "func.call"(%11) <{callee = @check_fptosi}> : (f64) -> ()
    "func.call"(%12) <{callee = @check_fptosi}> : (f64) -> ()
    "func.call"(%13) <{callee = @check_fptosi}> : (f64) -> ()
    "func.call"(%14) <{callee = @check_fptosi}> : (f64) -> ()
    "func.call"(%15) <{callee = @check_fptosi}> : (f64) -> ()
    "func.call"(%16) <{callee = @check_fptosi}> : (f64) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

