"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> f32, sym_name = "emulate_sitofp"}> ({
  ^bb0(%arg1: i32):
    %12 = "arith.sitofp"(%arg1) : (i32) -> f32
    "func.return"(%12) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "check_sitofp"}> ({
  ^bb0(%arg0: i32):
    %11 = "func.call"(%arg0) <{callee = @emulate_sitofp}> : (i32) -> f32
    "vector.print"(%11) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %3 = "arith.constant"() <{value = 7 : i32}> : () -> i32
    %4 = "arith.constant"() <{value = 1337 : i32}> : () -> i32
    %5 = "arith.constant"() <{value = -1 : i32}> : () -> i32
    %6 = "arith.constant"() <{value = -13 : i32}> : () -> i32
    %7 = "arith.constant"() <{value = -1337 : i32}> : () -> i32
    %8 = "arith.constant"() <{value = -32768 : i32}> : () -> i32
    %9 = "arith.constant"() <{value = 16777217 : i32}> : () -> i32
    %10 = "arith.constant"() <{value = -16777217 : i32}> : () -> i32
    "func.call"(%0) <{callee = @check_sitofp}> : (i32) -> ()
    "func.call"(%1) <{callee = @check_sitofp}> : (i32) -> ()
    "func.call"(%2) <{callee = @check_sitofp}> : (i32) -> ()
    "func.call"(%3) <{callee = @check_sitofp}> : (i32) -> ()
    "func.call"(%4) <{callee = @check_sitofp}> : (i32) -> ()
    "func.call"(%5) <{callee = @check_sitofp}> : (i32) -> ()
    "func.call"(%7) <{callee = @check_sitofp}> : (i32) -> ()
    "func.call"(%8) <{callee = @check_sitofp}> : (i32) -> ()
    "func.call"(%9) <{callee = @check_sitofp}> : (i32) -> ()
    "func.call"(%10) <{callee = @check_sitofp}> : (i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

