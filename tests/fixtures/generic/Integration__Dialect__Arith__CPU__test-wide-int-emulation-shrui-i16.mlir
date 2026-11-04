"builtin.module"() ({
  "func.func"() <{function_type = (i16, i16) -> i16, sym_name = "emulate_shrui"}> ({
  ^bb0(%arg2: i16, %arg3: i16):
    %12 = "arith.shrui"(%arg2, %arg3) : (i16, i16) -> i16
    "func.return"(%12) : (i16) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16, i16) -> (), sym_name = "check_shrui"}> ({
  ^bb0(%arg0: i16, %arg1: i16):
    %11 = "func.call"(%arg0, %arg1) <{callee = @emulate_shrui}> : (i16, i16) -> i16
    "vector.print"(%11) <{punctuation = #vector.punctuation<newline>}> : (i16) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0 : i16}> : () -> i16
    %1 = "arith.constant"() <{value = 1 : i16}> : () -> i16
    %2 = "arith.constant"() <{value = 2 : i16}> : () -> i16
    %3 = "arith.constant"() <{value = 7 : i16}> : () -> i16
    %4 = "arith.constant"() <{value = 8 : i16}> : () -> i16
    %5 = "arith.constant"() <{value = 9 : i16}> : () -> i16
    %6 = "arith.constant"() <{value = 15 : i16}> : () -> i16
    %7 = "arith.constant"() <{value = -1 : i16}> : () -> i16
    %8 = "arith.constant"() <{value = 1337 : i16}> : () -> i16
    %9 = "arith.constant"() <{value = -1337 : i16}> : () -> i16
    %10 = "arith.constant"() <{value = -32768 : i16}> : () -> i16
    "func.call"(%0, %0) <{callee = @check_shrui}> : (i16, i16) -> ()
    "func.call"(%0, %1) <{callee = @check_shrui}> : (i16, i16) -> ()
    "func.call"(%1, %1) <{callee = @check_shrui}> : (i16, i16) -> ()
    "func.call"(%1, %0) <{callee = @check_shrui}> : (i16, i16) -> ()
    "func.call"(%7, %1) <{callee = @check_shrui}> : (i16, i16) -> ()
    "func.call"(%7, %6) <{callee = @check_shrui}> : (i16, i16) -> ()
    "func.call"(%8, %0) <{callee = @check_shrui}> : (i16, i16) -> ()
    "func.call"(%8, %2) <{callee = @check_shrui}> : (i16, i16) -> ()
    "func.call"(%8, %3) <{callee = @check_shrui}> : (i16, i16) -> ()
    "func.call"(%8, %4) <{callee = @check_shrui}> : (i16, i16) -> ()
    "func.call"(%8, %5) <{callee = @check_shrui}> : (i16, i16) -> ()
    "func.call"(%8, %6) <{callee = @check_shrui}> : (i16, i16) -> ()
    "func.call"(%9, %0) <{callee = @check_shrui}> : (i16, i16) -> ()
    "func.call"(%9, %2) <{callee = @check_shrui}> : (i16, i16) -> ()
    "func.call"(%9, %3) <{callee = @check_shrui}> : (i16, i16) -> ()
    "func.call"(%9, %4) <{callee = @check_shrui}> : (i16, i16) -> ()
    "func.call"(%9, %5) <{callee = @check_shrui}> : (i16, i16) -> ()
    "func.call"(%9, %6) <{callee = @check_shrui}> : (i16, i16) -> ()
    "func.call"(%10, %1) <{callee = @check_shrui}> : (i16, i16) -> ()
    "func.call"(%10, %2) <{callee = @check_shrui}> : (i16, i16) -> ()
    "func.call"(%10, %3) <{callee = @check_shrui}> : (i16, i16) -> ()
    "func.call"(%10, %4) <{callee = @check_shrui}> : (i16, i16) -> ()
    "func.call"(%10, %5) <{callee = @check_shrui}> : (i16, i16) -> ()
    "func.call"(%10, %6) <{callee = @check_shrui}> : (i16, i16) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

