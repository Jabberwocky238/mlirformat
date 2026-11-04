"builtin.module"() ({
  "func.func"() <{function_type = (i16, i16) -> i1, sym_name = "emulate_cmpi_eq"}> ({
  ^bb0(%arg38: i16, %arg39: i16):
    %26 = "arith.cmpi"(%arg38, %arg39) <{predicate = 0 : i64}> : (i16, i16) -> i1
    "func.return"(%26) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16, i16) -> (), sym_name = "check_cmpi_eq"}> ({
  ^bb0(%arg36: i16, %arg37: i16):
    %25 = "func.call"(%arg36, %arg37) <{callee = @emulate_cmpi_eq}> : (i16, i16) -> i1
    "vector.print"(%25) <{punctuation = #vector.punctuation<newline>}> : (i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16, i16) -> i1, sym_name = "emulate_cmpi_ne"}> ({
  ^bb0(%arg34: i16, %arg35: i16):
    %24 = "arith.cmpi"(%arg34, %arg35) <{predicate = 1 : i64}> : (i16, i16) -> i1
    "func.return"(%24) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16, i16) -> (), sym_name = "check_cmpi_ne"}> ({
  ^bb0(%arg32: i16, %arg33: i16):
    %23 = "func.call"(%arg32, %arg33) <{callee = @emulate_cmpi_ne}> : (i16, i16) -> i1
    "vector.print"(%23) <{punctuation = #vector.punctuation<newline>}> : (i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16, i16) -> i1, sym_name = "emulate_cmpi_sge"}> ({
  ^bb0(%arg30: i16, %arg31: i16):
    %22 = "arith.cmpi"(%arg30, %arg31) <{predicate = 5 : i64}> : (i16, i16) -> i1
    "func.return"(%22) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16, i16) -> (), sym_name = "check_cmpi_sge"}> ({
  ^bb0(%arg28: i16, %arg29: i16):
    %21 = "func.call"(%arg28, %arg29) <{callee = @emulate_cmpi_sge}> : (i16, i16) -> i1
    "vector.print"(%21) <{punctuation = #vector.punctuation<newline>}> : (i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16, i16) -> i1, sym_name = "emulate_cmpi_sgt"}> ({
  ^bb0(%arg26: i16, %arg27: i16):
    %20 = "arith.cmpi"(%arg26, %arg27) <{predicate = 4 : i64}> : (i16, i16) -> i1
    "func.return"(%20) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16, i16) -> (), sym_name = "check_cmpi_sgt"}> ({
  ^bb0(%arg24: i16, %arg25: i16):
    %19 = "func.call"(%arg24, %arg25) <{callee = @emulate_cmpi_sgt}> : (i16, i16) -> i1
    "vector.print"(%19) <{punctuation = #vector.punctuation<newline>}> : (i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16, i16) -> i1, sym_name = "emulate_cmpi_sle"}> ({
  ^bb0(%arg22: i16, %arg23: i16):
    %18 = "arith.cmpi"(%arg22, %arg23) <{predicate = 3 : i64}> : (i16, i16) -> i1
    "func.return"(%18) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16, i16) -> (), sym_name = "check_cmpi_sle"}> ({
  ^bb0(%arg20: i16, %arg21: i16):
    %17 = "func.call"(%arg20, %arg21) <{callee = @emulate_cmpi_sle}> : (i16, i16) -> i1
    "vector.print"(%17) <{punctuation = #vector.punctuation<newline>}> : (i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16, i16) -> i1, sym_name = "emulate_cmpi_slt"}> ({
  ^bb0(%arg18: i16, %arg19: i16):
    %16 = "arith.cmpi"(%arg18, %arg19) <{predicate = 2 : i64}> : (i16, i16) -> i1
    "func.return"(%16) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16, i16) -> (), sym_name = "check_cmpi_slt"}> ({
  ^bb0(%arg16: i16, %arg17: i16):
    %15 = "func.call"(%arg16, %arg17) <{callee = @emulate_cmpi_slt}> : (i16, i16) -> i1
    "vector.print"(%15) <{punctuation = #vector.punctuation<newline>}> : (i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16, i16) -> i1, sym_name = "emulate_cmpi_uge"}> ({
  ^bb0(%arg14: i16, %arg15: i16):
    %14 = "arith.cmpi"(%arg14, %arg15) <{predicate = 9 : i64}> : (i16, i16) -> i1
    "func.return"(%14) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16, i16) -> (), sym_name = "check_cmpi_uge"}> ({
  ^bb0(%arg12: i16, %arg13: i16):
    %13 = "func.call"(%arg12, %arg13) <{callee = @emulate_cmpi_uge}> : (i16, i16) -> i1
    "vector.print"(%13) <{punctuation = #vector.punctuation<newline>}> : (i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16, i16) -> i1, sym_name = "emulate_cmpi_ugt"}> ({
  ^bb0(%arg10: i16, %arg11: i16):
    %12 = "arith.cmpi"(%arg10, %arg11) <{predicate = 8 : i64}> : (i16, i16) -> i1
    "func.return"(%12) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16, i16) -> (), sym_name = "check_cmpi_ugt"}> ({
  ^bb0(%arg8: i16, %arg9: i16):
    %11 = "func.call"(%arg8, %arg9) <{callee = @emulate_cmpi_ugt}> : (i16, i16) -> i1
    "vector.print"(%11) <{punctuation = #vector.punctuation<newline>}> : (i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16, i16) -> i1, sym_name = "emulate_cmpi_ule"}> ({
  ^bb0(%arg6: i16, %arg7: i16):
    %10 = "arith.cmpi"(%arg6, %arg7) <{predicate = 7 : i64}> : (i16, i16) -> i1
    "func.return"(%10) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16, i16) -> (), sym_name = "check_cmpi_ule"}> ({
  ^bb0(%arg4: i16, %arg5: i16):
    %9 = "func.call"(%arg4, %arg5) <{callee = @emulate_cmpi_ule}> : (i16, i16) -> i1
    "vector.print"(%9) <{punctuation = #vector.punctuation<newline>}> : (i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16, i16) -> i1, sym_name = "emulate_cmpi_ult"}> ({
  ^bb0(%arg2: i16, %arg3: i16):
    %8 = "arith.cmpi"(%arg2, %arg3) <{predicate = 6 : i64}> : (i16, i16) -> i1
    "func.return"(%8) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16, i16) -> (), sym_name = "check_cmpi_ult"}> ({
  ^bb0(%arg0: i16, %arg1: i16):
    %7 = "func.call"(%arg0, %arg1) <{callee = @emulate_cmpi_ult}> : (i16, i16) -> i1
    "vector.print"(%7) <{punctuation = #vector.punctuation<newline>}> : (i1) -> ()
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
    "func.call"(%0, %0) <{callee = @check_cmpi_eq}> : (i16, i16) -> ()
    "func.call"(%0, %1) <{callee = @check_cmpi_eq}> : (i16, i16) -> ()
    "func.call"(%1, %0) <{callee = @check_cmpi_eq}> : (i16, i16) -> ()
    "func.call"(%1, %1) <{callee = @check_cmpi_eq}> : (i16, i16) -> ()
    "func.call"(%3, %1) <{callee = @check_cmpi_eq}> : (i16, i16) -> ()
    "func.call"(%3, %4) <{callee = @check_cmpi_eq}> : (i16, i16) -> ()
    "func.call"(%4, %4) <{callee = @check_cmpi_eq}> : (i16, i16) -> ()
    "func.call"(%5, %5) <{callee = @check_cmpi_eq}> : (i16, i16) -> ()
    "func.call"(%4, %6) <{callee = @check_cmpi_eq}> : (i16, i16) -> ()
    "func.call"(%0, %0) <{callee = @check_cmpi_ne}> : (i16, i16) -> ()
    "func.call"(%0, %1) <{callee = @check_cmpi_ne}> : (i16, i16) -> ()
    "func.call"(%1, %0) <{callee = @check_cmpi_ne}> : (i16, i16) -> ()
    "func.call"(%1, %1) <{callee = @check_cmpi_ne}> : (i16, i16) -> ()
    "func.call"(%3, %1) <{callee = @check_cmpi_ne}> : (i16, i16) -> ()
    "func.call"(%3, %4) <{callee = @check_cmpi_ne}> : (i16, i16) -> ()
    "func.call"(%4, %4) <{callee = @check_cmpi_ne}> : (i16, i16) -> ()
    "func.call"(%5, %5) <{callee = @check_cmpi_ne}> : (i16, i16) -> ()
    "func.call"(%4, %6) <{callee = @check_cmpi_ne}> : (i16, i16) -> ()
    "func.call"(%0, %0) <{callee = @check_cmpi_sge}> : (i16, i16) -> ()
    "func.call"(%0, %1) <{callee = @check_cmpi_sge}> : (i16, i16) -> ()
    "func.call"(%1, %0) <{callee = @check_cmpi_sge}> : (i16, i16) -> ()
    "func.call"(%1, %1) <{callee = @check_cmpi_sge}> : (i16, i16) -> ()
    "func.call"(%3, %1) <{callee = @check_cmpi_sge}> : (i16, i16) -> ()
    "func.call"(%1, %3) <{callee = @check_cmpi_sge}> : (i16, i16) -> ()
    "func.call"(%3, %4) <{callee = @check_cmpi_sge}> : (i16, i16) -> ()
    "func.call"(%4, %4) <{callee = @check_cmpi_sge}> : (i16, i16) -> ()
    "func.call"(%5, %5) <{callee = @check_cmpi_sge}> : (i16, i16) -> ()
    "func.call"(%4, %6) <{callee = @check_cmpi_sge}> : (i16, i16) -> ()
    "func.call"(%0, %0) <{callee = @check_cmpi_sgt}> : (i16, i16) -> ()
    "func.call"(%0, %1) <{callee = @check_cmpi_sgt}> : (i16, i16) -> ()
    "func.call"(%1, %0) <{callee = @check_cmpi_sgt}> : (i16, i16) -> ()
    "func.call"(%1, %1) <{callee = @check_cmpi_sgt}> : (i16, i16) -> ()
    "func.call"(%3, %1) <{callee = @check_cmpi_sgt}> : (i16, i16) -> ()
    "func.call"(%1, %3) <{callee = @check_cmpi_sgt}> : (i16, i16) -> ()
    "func.call"(%3, %4) <{callee = @check_cmpi_sgt}> : (i16, i16) -> ()
    "func.call"(%4, %4) <{callee = @check_cmpi_sgt}> : (i16, i16) -> ()
    "func.call"(%5, %5) <{callee = @check_cmpi_sgt}> : (i16, i16) -> ()
    "func.call"(%4, %6) <{callee = @check_cmpi_sgt}> : (i16, i16) -> ()
    "func.call"(%0, %0) <{callee = @check_cmpi_sle}> : (i16, i16) -> ()
    "func.call"(%0, %1) <{callee = @check_cmpi_sle}> : (i16, i16) -> ()
    "func.call"(%1, %0) <{callee = @check_cmpi_sle}> : (i16, i16) -> ()
    "func.call"(%1, %1) <{callee = @check_cmpi_sle}> : (i16, i16) -> ()
    "func.call"(%3, %1) <{callee = @check_cmpi_sle}> : (i16, i16) -> ()
    "func.call"(%1, %3) <{callee = @check_cmpi_sle}> : (i16, i16) -> ()
    "func.call"(%3, %4) <{callee = @check_cmpi_sle}> : (i16, i16) -> ()
    "func.call"(%4, %4) <{callee = @check_cmpi_sle}> : (i16, i16) -> ()
    "func.call"(%5, %5) <{callee = @check_cmpi_sle}> : (i16, i16) -> ()
    "func.call"(%4, %6) <{callee = @check_cmpi_sle}> : (i16, i16) -> ()
    "func.call"(%0, %0) <{callee = @check_cmpi_slt}> : (i16, i16) -> ()
    "func.call"(%0, %1) <{callee = @check_cmpi_slt}> : (i16, i16) -> ()
    "func.call"(%1, %0) <{callee = @check_cmpi_slt}> : (i16, i16) -> ()
    "func.call"(%1, %1) <{callee = @check_cmpi_slt}> : (i16, i16) -> ()
    "func.call"(%3, %1) <{callee = @check_cmpi_slt}> : (i16, i16) -> ()
    "func.call"(%1, %3) <{callee = @check_cmpi_slt}> : (i16, i16) -> ()
    "func.call"(%3, %4) <{callee = @check_cmpi_slt}> : (i16, i16) -> ()
    "func.call"(%4, %4) <{callee = @check_cmpi_slt}> : (i16, i16) -> ()
    "func.call"(%5, %5) <{callee = @check_cmpi_slt}> : (i16, i16) -> ()
    "func.call"(%4, %6) <{callee = @check_cmpi_slt}> : (i16, i16) -> ()
    "func.call"(%0, %0) <{callee = @check_cmpi_uge}> : (i16, i16) -> ()
    "func.call"(%0, %1) <{callee = @check_cmpi_uge}> : (i16, i16) -> ()
    "func.call"(%1, %0) <{callee = @check_cmpi_uge}> : (i16, i16) -> ()
    "func.call"(%1, %1) <{callee = @check_cmpi_uge}> : (i16, i16) -> ()
    "func.call"(%3, %1) <{callee = @check_cmpi_uge}> : (i16, i16) -> ()
    "func.call"(%1, %3) <{callee = @check_cmpi_uge}> : (i16, i16) -> ()
    "func.call"(%3, %4) <{callee = @check_cmpi_uge}> : (i16, i16) -> ()
    "func.call"(%4, %4) <{callee = @check_cmpi_uge}> : (i16, i16) -> ()
    "func.call"(%5, %5) <{callee = @check_cmpi_uge}> : (i16, i16) -> ()
    "func.call"(%4, %6) <{callee = @check_cmpi_uge}> : (i16, i16) -> ()
    "func.call"(%0, %0) <{callee = @check_cmpi_ugt}> : (i16, i16) -> ()
    "func.call"(%0, %1) <{callee = @check_cmpi_ugt}> : (i16, i16) -> ()
    "func.call"(%1, %0) <{callee = @check_cmpi_ugt}> : (i16, i16) -> ()
    "func.call"(%1, %1) <{callee = @check_cmpi_ugt}> : (i16, i16) -> ()
    "func.call"(%3, %1) <{callee = @check_cmpi_ugt}> : (i16, i16) -> ()
    "func.call"(%1, %3) <{callee = @check_cmpi_ugt}> : (i16, i16) -> ()
    "func.call"(%3, %4) <{callee = @check_cmpi_ugt}> : (i16, i16) -> ()
    "func.call"(%4, %4) <{callee = @check_cmpi_ugt}> : (i16, i16) -> ()
    "func.call"(%5, %5) <{callee = @check_cmpi_ugt}> : (i16, i16) -> ()
    "func.call"(%4, %6) <{callee = @check_cmpi_ugt}> : (i16, i16) -> ()
    "func.call"(%0, %0) <{callee = @check_cmpi_ule}> : (i16, i16) -> ()
    "func.call"(%0, %1) <{callee = @check_cmpi_ule}> : (i16, i16) -> ()
    "func.call"(%1, %0) <{callee = @check_cmpi_ule}> : (i16, i16) -> ()
    "func.call"(%1, %1) <{callee = @check_cmpi_ule}> : (i16, i16) -> ()
    "func.call"(%3, %1) <{callee = @check_cmpi_ule}> : (i16, i16) -> ()
    "func.call"(%1, %3) <{callee = @check_cmpi_ule}> : (i16, i16) -> ()
    "func.call"(%3, %4) <{callee = @check_cmpi_ule}> : (i16, i16) -> ()
    "func.call"(%4, %4) <{callee = @check_cmpi_ule}> : (i16, i16) -> ()
    "func.call"(%5, %5) <{callee = @check_cmpi_ule}> : (i16, i16) -> ()
    "func.call"(%4, %6) <{callee = @check_cmpi_ule}> : (i16, i16) -> ()
    "func.call"(%0, %0) <{callee = @check_cmpi_ult}> : (i16, i16) -> ()
    "func.call"(%0, %1) <{callee = @check_cmpi_ult}> : (i16, i16) -> ()
    "func.call"(%1, %0) <{callee = @check_cmpi_ult}> : (i16, i16) -> ()
    "func.call"(%1, %1) <{callee = @check_cmpi_ult}> : (i16, i16) -> ()
    "func.call"(%3, %1) <{callee = @check_cmpi_ult}> : (i16, i16) -> ()
    "func.call"(%1, %3) <{callee = @check_cmpi_ult}> : (i16, i16) -> ()
    "func.call"(%3, %4) <{callee = @check_cmpi_ult}> : (i16, i16) -> ()
    "func.call"(%4, %4) <{callee = @check_cmpi_ult}> : (i16, i16) -> ()
    "func.call"(%5, %5) <{callee = @check_cmpi_ult}> : (i16, i16) -> ()
    "func.call"(%4, %6) <{callee = @check_cmpi_ult}> : (i16, i16) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

