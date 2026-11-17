"builtin.module"() ({
  "func.func"() <{function_type = (f64) -> i64, sym_name = "emulate_fptoui"}> ({
  ^bb0(%arg1: f64 loc("<stdin>":3:8)):
    %10 = "arith.fptoui"(%arg1) : (f64) -> i64 loc("<stdin>":4:11)
    "func.return"(%10) : (i64) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (f64) -> (), sym_name = "check_fptoui"}> ({
  ^bb0(%arg0: f64 loc("<stdin>":8:8)):
    %9 = "func.call"(%arg0) <{callee = @emulate_fptoui}> : (f64) -> i64 loc("<stdin>":9:10)
    "vector.print"(%9) <{punctuation = #vector.punctuation<newline>}> : (i64) -> () loc("<stdin>":10:5)
    "func.return"() : () -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64 loc("<stdin>":14:10)
    %1 = "arith.constant"() <{value = 1.000000e+00 : f64}> : () -> f64 loc("<stdin>":15:10)
    %2 = "arith.constant"() <{value = 1.500000e+00 : f64}> : () -> f64 loc("<stdin>":16:10)
    %3 = "arith.constant"() <{value = 0x4130000000000000 : f64}> : () -> f64 loc("<stdin>":17:10)
    %4 = "arith.constant"() <{value = 0x41EFFFFFFFE00000 : f64}> : () -> f64 loc("<stdin>":18:10)
    %5 = "arith.constant"() <{value = 0x41F0000000000000 : f64}> : () -> f64 loc("<stdin>":19:10)
    %6 = "arith.constant"() <{value = 0x4270000000000000 : f64}> : () -> f64 loc("<stdin>":20:10)
    %7 = "arith.constant"() <{value = 0x4270000100000000 : f64}> : () -> f64 loc("<stdin>":21:10)
    %8 = "arith.constant"() <{value = -0.000000e+00 : f64}> : () -> f64 loc("<stdin>":22:10)
    "func.call"(%0) <{callee = @check_fptoui}> : (f64) -> () loc("<stdin>":23:5)
    "func.call"(%1) <{callee = @check_fptoui}> : (f64) -> () loc("<stdin>":24:5)
    "func.call"(%2) <{callee = @check_fptoui}> : (f64) -> () loc("<stdin>":25:5)
    "func.call"(%3) <{callee = @check_fptoui}> : (f64) -> () loc("<stdin>":26:5)
    "func.call"(%4) <{callee = @check_fptoui}> : (f64) -> () loc("<stdin>":27:5)
    "func.call"(%5) <{callee = @check_fptoui}> : (f64) -> () loc("<stdin>":28:5)
    "func.call"(%6) <{callee = @check_fptoui}> : (f64) -> () loc("<stdin>":29:5)
    "func.call"(%7) <{callee = @check_fptoui}> : (f64) -> () loc("<stdin>":30:5)
    "func.call"(%8) <{callee = @check_fptoui}> : (f64) -> () loc("<stdin>":31:5)
    "func.return"() : () -> () loc("<stdin>":32:5)
  }) : () -> () loc("<stdin>":13:3)
}) : () -> () loc("<stdin>":1:1)
