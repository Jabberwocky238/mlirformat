"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "check_ceildivsi"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %9 = "arith.ceildivsi"(%arg0, %arg1) : (i32, i32) -> i32
    "vector.print"(%9) <{punctuation = #vector.punctuation<newline>}> : (i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = -2147483648 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 2147483647 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = -3 : i32}> : () -> i32
    %3 = "arith.constant"() <{value = -2 : i32}> : () -> i32
    %4 = "arith.constant"() <{value = -1 : i32}> : () -> i32
    %5 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %6 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %7 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %8 = "arith.constant"() <{value = 3 : i32}> : () -> i32
    "func.call"(%1, %1) <{callee = @check_ceildivsi}> : (i32, i32) -> ()
    "func.call"(%1, %0) <{callee = @check_ceildivsi}> : (i32, i32) -> ()
    "func.call"(%1, %4) <{callee = @check_ceildivsi}> : (i32, i32) -> ()
    "func.call"(%1, %3) <{callee = @check_ceildivsi}> : (i32, i32) -> ()
    "func.call"(%1, %6) <{callee = @check_ceildivsi}> : (i32, i32) -> ()
    "func.call"(%1, %7) <{callee = @check_ceildivsi}> : (i32, i32) -> ()
    "func.call"(%0, %0) <{callee = @check_ceildivsi}> : (i32, i32) -> ()
    "func.call"(%0, %1) <{callee = @check_ceildivsi}> : (i32, i32) -> ()
    "func.call"(%0, %3) <{callee = @check_ceildivsi}> : (i32, i32) -> ()
    "func.call"(%0, %6) <{callee = @check_ceildivsi}> : (i32, i32) -> ()
    "func.call"(%0, %7) <{callee = @check_ceildivsi}> : (i32, i32) -> ()
    "func.call"(%6, %0) <{callee = @check_ceildivsi}> : (i32, i32) -> ()
    "func.call"(%7, %0) <{callee = @check_ceildivsi}> : (i32, i32) -> ()
    "func.call"(%4, %0) <{callee = @check_ceildivsi}> : (i32, i32) -> ()
    "func.call"(%3, %0) <{callee = @check_ceildivsi}> : (i32, i32) -> ()
    "func.call"(%6, %1) <{callee = @check_ceildivsi}> : (i32, i32) -> ()
    "func.call"(%7, %1) <{callee = @check_ceildivsi}> : (i32, i32) -> ()
    "func.call"(%4, %1) <{callee = @check_ceildivsi}> : (i32, i32) -> ()
    "func.call"(%3, %1) <{callee = @check_ceildivsi}> : (i32, i32) -> ()
    "func.call"(%2, %7) <{callee = @check_ceildivsi}> : (i32, i32) -> ()
    "func.call"(%3, %7) <{callee = @check_ceildivsi}> : (i32, i32) -> ()
    "func.call"(%4, %7) <{callee = @check_ceildivsi}> : (i32, i32) -> ()
    "func.call"(%5, %7) <{callee = @check_ceildivsi}> : (i32, i32) -> ()
    "func.call"(%6, %7) <{callee = @check_ceildivsi}> : (i32, i32) -> ()
    "func.call"(%7, %7) <{callee = @check_ceildivsi}> : (i32, i32) -> ()
    "func.call"(%8, %7) <{callee = @check_ceildivsi}> : (i32, i32) -> ()
    "func.call"(%2, %3) <{callee = @check_ceildivsi}> : (i32, i32) -> ()
    "func.call"(%3, %3) <{callee = @check_ceildivsi}> : (i32, i32) -> ()
    "func.call"(%4, %3) <{callee = @check_ceildivsi}> : (i32, i32) -> ()
    "func.call"(%5, %3) <{callee = @check_ceildivsi}> : (i32, i32) -> ()
    "func.call"(%6, %3) <{callee = @check_ceildivsi}> : (i32, i32) -> ()
    "func.call"(%7, %3) <{callee = @check_ceildivsi}> : (i32, i32) -> ()
    "func.call"(%8, %3) <{callee = @check_ceildivsi}> : (i32, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

