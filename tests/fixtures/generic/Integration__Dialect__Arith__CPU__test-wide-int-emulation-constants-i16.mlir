"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %9 = "arith.constant"() <{value = 0 : i16}> : () -> i16
    "func.call"(%9) <{callee = @emulate_constant}> : (i16) -> ()
    "func.call"(%9) <{callee = @foo}> : (i16) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16) -> (), sym_name = "emulate_constant"}> ({
  ^bb0(%arg1: i16):
    "vector.print"(%arg1) <{punctuation = #vector.punctuation<newline>}> : (i16) -> ()
    %1 = "arith.constant"() <{value = 0 : i16}> : () -> i16
    %2 = "arith.constant"() <{value = 1 : i16}> : () -> i16
    %3 = "arith.constant"() <{value = -1 : i16}> : () -> i16
    %4 = "arith.constant"() <{value = -3 : i16}> : () -> i16
    %5 = "arith.constant"() <{value = 13 : i16}> : () -> i16
    %6 = "arith.constant"() <{value = 256 : i16}> : () -> i16
    %7 = "arith.constant"() <{value = 32767 : i16}> : () -> i16
    %8 = "arith.constant"() <{value = -32768 : i16}> : () -> i16
    "vector.print"(%1) <{punctuation = #vector.punctuation<newline>}> : (i16) -> ()
    "vector.print"(%2) <{punctuation = #vector.punctuation<newline>}> : (i16) -> ()
    "vector.print"(%3) <{punctuation = #vector.punctuation<newline>}> : (i16) -> ()
    "vector.print"(%4) <{punctuation = #vector.punctuation<newline>}> : (i16) -> ()
    "vector.print"(%5) <{punctuation = #vector.punctuation<newline>}> : (i16) -> ()
    "vector.print"(%6) <{punctuation = #vector.punctuation<newline>}> : (i16) -> ()
    "vector.print"(%7) <{punctuation = #vector.punctuation<newline>}> : (i16) -> ()
    "vector.print"(%8) <{punctuation = #vector.punctuation<newline>}> : (i16) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16) -> (), sym_name = "foo"}> ({
  ^bb0(%arg0: i16):
    "vector.print"(%arg0) <{punctuation = #vector.punctuation<newline>}> : (i16) -> ()
    %0 = "arith.constant"() <{value = 1 : i16}> : () -> i16
    "vector.print"(%0) <{punctuation = #vector.punctuation<newline>}> : (i16) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

