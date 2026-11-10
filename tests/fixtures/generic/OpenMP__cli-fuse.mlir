"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "omp_fuse_raw"}> ({
  ^bb0(%arg14: i32, %arg15: i32):
    %10 = "omp.new_cli"() : () -> !omp.cli
    %11 = "omp.new_cli"() : () -> !omp.cli
    %12 = "omp.new_cli"() : () -> !omp.cli
    "omp.canonical_loop"(%arg14, %10) ({
    ^bb0(%arg17: i32):
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    "omp.canonical_loop"(%arg15, %11) ({
    ^bb0(%arg16: i32):
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    "omp.fuse"(%12, %10, %11) <{operandSegmentSizes = array<i32: 1, 2>}> : (!omp.cli, !omp.cli, !omp.cli) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "omp_fuse_pretty"}> ({
  ^bb0(%arg10: i32, %arg11: i32):
    %7 = "omp.new_cli"() : () -> !omp.cli
    %8 = "omp.new_cli"() : () -> !omp.cli
    %9 = "omp.new_cli"() : () -> !omp.cli
    "omp.canonical_loop"(%arg10, %7) ({
    ^bb0(%arg13: i32):
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    "omp.canonical_loop"(%arg11, %8) ({
    ^bb0(%arg12: i32):
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    "omp.fuse"(%9, %7, %8) <{operandSegmentSizes = array<i32: 1, 2>}> : (!omp.cli, !omp.cli, !omp.cli) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "omp_fuse_optionalgen_pretty"}> ({
  ^bb0(%arg6: i32, %arg7: i32):
    %5 = "omp.new_cli"() : () -> !omp.cli
    "omp.canonical_loop"(%arg6, %5) ({
    ^bb0(%arg9: i32):
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    %6 = "omp.new_cli"() : () -> !omp.cli
    "omp.canonical_loop"(%arg7, %6) ({
    ^bb0(%arg8: i32):
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    "omp.fuse"(%5, %6) <{operandSegmentSizes = array<i32: 0, 2>}> : (!omp.cli, !omp.cli) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32) -> (), sym_name = "omp_fuse_looprange"}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i32):
    %0 = "omp.new_cli"() : () -> !omp.cli
    %1 = "omp.new_cli"() : () -> !omp.cli
    %2 = "omp.new_cli"() : () -> !omp.cli
    %3 = "omp.new_cli"() : () -> !omp.cli
    %4 = "omp.new_cli"() : () -> !omp.cli
    "omp.canonical_loop"(%arg0, %0) ({
    ^bb0(%arg5: i32):
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    "omp.canonical_loop"(%arg1, %1) ({
    ^bb0(%arg4: i32):
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    "omp.canonical_loop"(%arg2, %2) ({
    ^bb0(%arg3: i32):
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    "omp.fuse"(%4, %3, %0, %1, %2) <{count = 2 : i64, first = 1 : i64, operandSegmentSizes = array<i32: 2, 3>}> : (!omp.cli, !omp.cli, !omp.cli, !omp.cli, !omp.cli) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

