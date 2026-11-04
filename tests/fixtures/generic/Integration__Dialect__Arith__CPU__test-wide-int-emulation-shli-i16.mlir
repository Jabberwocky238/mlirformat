"builtin.module"() ({
  "func.func"() <{function_type = (i16, i16) -> i16, sym_name = "emulate_shli"}> ({
  ^bb0(%arg2: i16, %arg3: i16):
    %11 = "arith.shli"(%arg2, %arg3) <{overflowFlags = #arith.overflow<none>}> : (i16, i16) -> i16
    "func.return"(%11) : (i16) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16, i16) -> (), sym_name = "check_shli"}> ({
  ^bb0(%arg0: i16, %arg1: i16):
    %10 = "func.call"(%arg0, %arg1) <{callee = @emulate_shli}> : (i16, i16) -> i16
    "vector.print"(%10) <{punctuation = #vector.punctuation<newline>}> : (i16) -> ()
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
    %9 = "arith.constant"() <{value = -32768 : i16}> : () -> i16
    "func.call"(%0, %0) <{callee = @check_shli}> : (i16, i16) -> ()
    "func.call"(%0, %1) <{callee = @check_shli}> : (i16, i16) -> ()
    "func.call"(%1, %0) <{callee = @check_shli}> : (i16, i16) -> ()
    "func.call"(%1, %1) <{callee = @check_shli}> : (i16, i16) -> ()
    "func.call"(%7, %1) <{callee = @check_shli}> : (i16, i16) -> ()
    "func.call"(%7, %6) <{callee = @check_shli}> : (i16, i16) -> ()
    "func.call"(%8, %0) <{callee = @check_shli}> : (i16, i16) -> ()
    "func.call"(%8, %2) <{callee = @check_shli}> : (i16, i16) -> ()
    "func.call"(%8, %3) <{callee = @check_shli}> : (i16, i16) -> ()
    "func.call"(%8, %4) <{callee = @check_shli}> : (i16, i16) -> ()
    "func.call"(%8, %5) <{callee = @check_shli}> : (i16, i16) -> ()
    "func.call"(%8, %6) <{callee = @check_shli}> : (i16, i16) -> ()
    "func.call"(%9, %1) <{callee = @check_shli}> : (i16, i16) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

