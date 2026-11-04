"builtin.module"() ({
  "func.func"() <{function_type = (i16, i16) -> i16, sym_name = "emulate_maxui"}> ({
  ^bb0(%arg14: i16, %arg15: i16):
    %14 = "arith.maxui"(%arg14, %arg15) : (i16, i16) -> i16
    "func.return"(%14) : (i16) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16, i16) -> (), sym_name = "check_maxui"}> ({
  ^bb0(%arg12: i16, %arg13: i16):
    %13 = "func.call"(%arg12, %arg13) <{callee = @emulate_maxui}> : (i16, i16) -> i16
    "vector.print"(%13) <{punctuation = #vector.punctuation<newline>}> : (i16) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16, i16) -> i16, sym_name = "emulate_maxsi"}> ({
  ^bb0(%arg10: i16, %arg11: i16):
    %12 = "arith.maxsi"(%arg10, %arg11) : (i16, i16) -> i16
    "func.return"(%12) : (i16) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16, i16) -> (), sym_name = "check_maxsi"}> ({
  ^bb0(%arg8: i16, %arg9: i16):
    %11 = "func.call"(%arg8, %arg9) <{callee = @emulate_maxsi}> : (i16, i16) -> i16
    "vector.print"(%11) <{punctuation = #vector.punctuation<newline>}> : (i16) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16, i16) -> i16, sym_name = "emulate_minui"}> ({
  ^bb0(%arg6: i16, %arg7: i16):
    %10 = "arith.minui"(%arg6, %arg7) : (i16, i16) -> i16
    "func.return"(%10) : (i16) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16, i16) -> (), sym_name = "check_minui"}> ({
  ^bb0(%arg4: i16, %arg5: i16):
    %9 = "func.call"(%arg4, %arg5) <{callee = @emulate_minui}> : (i16, i16) -> i16
    "vector.print"(%9) <{punctuation = #vector.punctuation<newline>}> : (i16) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16, i16) -> i16, sym_name = "emulate_minsi"}> ({
  ^bb0(%arg2: i16, %arg3: i16):
    %8 = "arith.minsi"(%arg2, %arg3) : (i16, i16) -> i16
    "func.return"(%8) : (i16) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16, i16) -> (), sym_name = "check_minsi"}> ({
  ^bb0(%arg0: i16, %arg1: i16):
    %7 = "func.call"(%arg0, %arg1) <{callee = @emulate_minsi}> : (i16, i16) -> i16
    "vector.print"(%7) <{punctuation = #vector.punctuation<newline>}> : (i16) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0 : i16}> : () -> i16
    %1 = "arith.constant"() <{value = 1 : i16}> : () -> i16
    %2 = "arith.constant"() <{value = 7 : i16}> : () -> i16
    %3 = "arith.constant"() <{value = -1 : i16}> : () -> i16
    %4 = "arith.constant"() <{value = 1337 : i16}> : () -> i16
    %5 = "arith.constant"() <{value = 4096 : i16}> : () -> i16
    %6 = "arith.constant"() <{value = -32768 : i16}> : () -> i16
    "func.call"(%0, %0) <{callee = @check_maxui}> : (i16, i16) -> ()
    "func.call"(%0, %1) <{callee = @check_maxui}> : (i16, i16) -> ()
    "func.call"(%1, %0) <{callee = @check_maxui}> : (i16, i16) -> ()
    "func.call"(%1, %1) <{callee = @check_maxui}> : (i16, i16) -> ()
    "func.call"(%3, %1) <{callee = @check_maxui}> : (i16, i16) -> ()
    "func.call"(%1, %3) <{callee = @check_maxui}> : (i16, i16) -> ()
    "func.call"(%3, %4) <{callee = @check_maxui}> : (i16, i16) -> ()
    "func.call"(%4, %4) <{callee = @check_maxui}> : (i16, i16) -> ()
    "func.call"(%5, %5) <{callee = @check_maxui}> : (i16, i16) -> ()
    "func.call"(%4, %6) <{callee = @check_maxui}> : (i16, i16) -> ()
    "func.call"(%0, %0) <{callee = @check_maxsi}> : (i16, i16) -> ()
    "func.call"(%0, %1) <{callee = @check_maxsi}> : (i16, i16) -> ()
    "func.call"(%1, %0) <{callee = @check_maxsi}> : (i16, i16) -> ()
    "func.call"(%1, %1) <{callee = @check_maxsi}> : (i16, i16) -> ()
    "func.call"(%3, %1) <{callee = @check_maxsi}> : (i16, i16) -> ()
    "func.call"(%1, %3) <{callee = @check_maxsi}> : (i16, i16) -> ()
    "func.call"(%3, %4) <{callee = @check_maxsi}> : (i16, i16) -> ()
    "func.call"(%4, %4) <{callee = @check_maxsi}> : (i16, i16) -> ()
    "func.call"(%5, %5) <{callee = @check_maxsi}> : (i16, i16) -> ()
    "func.call"(%4, %6) <{callee = @check_maxsi}> : (i16, i16) -> ()
    "func.call"(%0, %0) <{callee = @check_minui}> : (i16, i16) -> ()
    "func.call"(%0, %1) <{callee = @check_minui}> : (i16, i16) -> ()
    "func.call"(%1, %0) <{callee = @check_minui}> : (i16, i16) -> ()
    "func.call"(%1, %1) <{callee = @check_minui}> : (i16, i16) -> ()
    "func.call"(%3, %1) <{callee = @check_minui}> : (i16, i16) -> ()
    "func.call"(%1, %3) <{callee = @check_minui}> : (i16, i16) -> ()
    "func.call"(%3, %4) <{callee = @check_minui}> : (i16, i16) -> ()
    "func.call"(%4, %4) <{callee = @check_minui}> : (i16, i16) -> ()
    "func.call"(%5, %5) <{callee = @check_minui}> : (i16, i16) -> ()
    "func.call"(%4, %6) <{callee = @check_minui}> : (i16, i16) -> ()
    "func.call"(%0, %0) <{callee = @check_minsi}> : (i16, i16) -> ()
    "func.call"(%0, %1) <{callee = @check_minsi}> : (i16, i16) -> ()
    "func.call"(%1, %0) <{callee = @check_minsi}> : (i16, i16) -> ()
    "func.call"(%1, %1) <{callee = @check_minsi}> : (i16, i16) -> ()
    "func.call"(%3, %1) <{callee = @check_minsi}> : (i16, i16) -> ()
    "func.call"(%1, %3) <{callee = @check_minsi}> : (i16, i16) -> ()
    "func.call"(%3, %4) <{callee = @check_minsi}> : (i16, i16) -> ()
    "func.call"(%4, %4) <{callee = @check_minsi}> : (i16, i16) -> ()
    "func.call"(%5, %5) <{callee = @check_minsi}> : (i16, i16) -> ()
    "func.call"(%4, %6) <{callee = @check_minsi}> : (i16, i16) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

