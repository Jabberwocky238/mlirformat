"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "emulate_subi"}> ({
  ^bb0(%arg2: i32, %arg3: i32):
    %18 = "arith.subi"(%arg2, %arg3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    "func.return"(%18) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "check_subi"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %17 = "func.call"(%arg0, %arg1) <{callee = @emulate_subi}> : (i32, i32) -> i32
    "vector.print"(%17) <{punctuation = #vector.punctuation<newline>}> : (i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    "func.call"(%0, %1) <{callee = @check_subi}> : (i32, i32) -> ()
    "func.call"(%1, %0) <{callee = @check_subi}> : (i32, i32) -> ()
    %2 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %3 = "arith.constant"() <{value = -2 : i32}> : () -> i32
    "func.call"(%2, %3) <{callee = @check_subi}> : (i32, i32) -> ()
    "func.call"(%3, %2) <{callee = @check_subi}> : (i32, i32) -> ()
    %4 = "arith.constant"() <{value = -1 : i32}> : () -> i32
    %5 = "arith.constant"() <{value = -2 : i32}> : () -> i32
    "func.call"(%4, %5) <{callee = @check_subi}> : (i32, i32) -> ()
    "func.call"(%5, %4) <{callee = @check_subi}> : (i32, i32) -> ()
    %6 = "arith.constant"() <{value = 131074 : i32}> : () -> i32
    %7 = "arith.constant"() <{value = 3 : i32}> : () -> i32
    "func.call"(%6, %7) <{callee = @check_subi}> : (i32, i32) -> ()
    "func.call"(%7, %6) <{callee = @check_subi}> : (i32, i32) -> ()
    %8 = "arith.constant"() <{value = 16385027 : i32}> : () -> i32
    %9 = "arith.constant"() <{value = 16450564 : i32}> : () -> i32
    "func.call"(%8, %9) <{callee = @check_subi}> : (i32, i32) -> ()
    "func.call"(%9, %8) <{callee = @check_subi}> : (i32, i32) -> ()
    %10 = "arith.constant"() <{value = 65536 : i32}> : () -> i32
    %11 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    "func.call"(%10, %11) <{callee = @check_subi}> : (i32, i32) -> ()
    "func.call"(%11, %10) <{callee = @check_subi}> : (i32, i32) -> ()
    %12 = "arith.constant"() <{value = 2147483647 : i32}> : () -> i32
    %13 = "arith.constant"() <{value = -2147483648 : i32}> : () -> i32
    %14 = "arith.constant"() <{value = -1 : i32}> : () -> i32
    %15 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %16 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    "func.call"(%12, %13) <{callee = @check_subi}> : (i32, i32) -> ()
    "func.call"(%13, %12) <{callee = @check_subi}> : (i32, i32) -> ()
    "func.call"(%13, %16) <{callee = @check_subi}> : (i32, i32) -> ()
    "func.call"(%12, %14) <{callee = @check_subi}> : (i32, i32) -> ()
    "func.call"(%14, %16) <{callee = @check_subi}> : (i32, i32) -> ()
    "func.call"(%14, %14) <{callee = @check_subi}> : (i32, i32) -> ()
    "func.call"(%15, %16) <{callee = @check_subi}> : (i32, i32) -> ()
    "func.call"(%15, %14) <{callee = @check_subi}> : (i32, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

