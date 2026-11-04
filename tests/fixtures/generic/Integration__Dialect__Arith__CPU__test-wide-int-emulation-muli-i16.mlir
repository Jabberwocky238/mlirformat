"builtin.module"() ({
  "func.func"() <{function_type = (i16, i16) -> i16, sym_name = "emulate_muli"}> ({
  ^bb0(%arg2: i16, %arg3: i16):
    %11 = "arith.muli"(%arg2, %arg3) <{overflowFlags = #arith.overflow<none>}> : (i16, i16) -> i16
    "func.return"(%11) : (i16) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16, i16) -> (), sym_name = "check_muli"}> ({
  ^bb0(%arg0: i16, %arg1: i16):
    %10 = "func.call"(%arg0, %arg1) <{callee = @emulate_muli}> : (i16, i16) -> i16
    "vector.print"(%10) <{punctuation = #vector.punctuation<newline>}> : (i16) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0 : i16}> : () -> i16
    %1 = "arith.constant"() <{value = 1 : i16}> : () -> i16
    %2 = "arith.constant"() <{value = -1 : i16}> : () -> i16
    %3 = "arith.constant"() <{value = -3 : i16}> : () -> i16
    %4 = "arith.constant"() <{value = 13 : i16}> : () -> i16
    %5 = "arith.constant"() <{value = 37 : i16}> : () -> i16
    %6 = "arith.constant"() <{value = 42 : i16}> : () -> i16
    %7 = "arith.constant"() <{value = 256 : i16}> : () -> i16
    %8 = "arith.constant"() <{value = 32767 : i16}> : () -> i16
    %9 = "arith.constant"() <{value = -32768 : i16}> : () -> i16
    "func.call"(%0, %0) <{callee = @check_muli}> : (i16, i16) -> ()
    "func.call"(%0, %1) <{callee = @check_muli}> : (i16, i16) -> ()
    "func.call"(%1, %1) <{callee = @check_muli}> : (i16, i16) -> ()
    "func.call"(%1, %2) <{callee = @check_muli}> : (i16, i16) -> ()
    "func.call"(%2, %2) <{callee = @check_muli}> : (i16, i16) -> ()
    "func.call"(%1, %3) <{callee = @check_muli}> : (i16, i16) -> ()
    "func.call"(%4, %4) <{callee = @check_muli}> : (i16, i16) -> ()
    "func.call"(%4, %5) <{callee = @check_muli}> : (i16, i16) -> ()
    "func.call"(%5, %6) <{callee = @check_muli}> : (i16, i16) -> ()
    "func.call"(%2, %7) <{callee = @check_muli}> : (i16, i16) -> ()
    "func.call"(%7, %4) <{callee = @check_muli}> : (i16, i16) -> ()
    "func.call"(%7, %5) <{callee = @check_muli}> : (i16, i16) -> ()
    "func.call"(%7, %3) <{callee = @check_muli}> : (i16, i16) -> ()
    "func.call"(%4, %8) <{callee = @check_muli}> : (i16, i16) -> ()
    "func.call"(%9, %5) <{callee = @check_muli}> : (i16, i16) -> ()
    "func.call"(%8, %8) <{callee = @check_muli}> : (i16, i16) -> ()
    "func.call"(%9, %4) <{callee = @check_muli}> : (i16, i16) -> ()
    "func.call"(%9, %9) <{callee = @check_muli}> : (i16, i16) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

