"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "omp_fuse_raw"}> ({
  ^bb0(%arg14: i32 loc("<stdin>":3:8), %arg15: i32 loc("<stdin>":3:21)):
    %10 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":4:11)
    %11 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":5:11)
    %12 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":6:11)
    "omp.canonical_loop"(%arg14, %10) ({
    ^bb0(%arg17: i32 loc("<stdin>":8:10)):
      "omp.terminator"() : () -> () loc("<stdin>":9:7)
    }) : (i32, !omp.cli) -> () loc("<stdin>":7:5)
    "omp.canonical_loop"(%arg15, %11) ({
    ^bb0(%arg16: i32 loc("<stdin>":12:10)):
      "omp.terminator"() : () -> () loc("<stdin>":13:7)
    }) : (i32, !omp.cli) -> () loc("<stdin>":11:5)
    "omp.fuse"(%12, %10, %11) <{operandSegmentSizes = array<i32: 1, 2>}> : (!omp.cli, !omp.cli, !omp.cli) -> () loc("<stdin>":15:5)
    "func.return"() : () -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "omp_fuse_pretty"}> ({
  ^bb0(%arg10: i32 loc("<stdin>":19:8), %arg11: i32 loc("<stdin>":19:21)):
    %7 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":20:10)
    %8 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":21:10)
    %9 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":22:10)
    "omp.canonical_loop"(%arg10, %7) ({
    ^bb0(%arg13: i32 loc("<stdin>":24:10)):
      "omp.terminator"() : () -> () loc("<stdin>":25:7)
    }) : (i32, !omp.cli) -> () loc("<stdin>":23:5)
    "omp.canonical_loop"(%arg11, %8) ({
    ^bb0(%arg12: i32 loc("<stdin>":28:10)):
      "omp.terminator"() : () -> () loc("<stdin>":29:7)
    }) : (i32, !omp.cli) -> () loc("<stdin>":27:5)
    "omp.fuse"(%9, %7, %8) <{operandSegmentSizes = array<i32: 1, 2>}> : (!omp.cli, !omp.cli, !omp.cli) -> () loc("<stdin>":31:5)
    "func.return"() : () -> () loc("<stdin>":32:5)
  }) : () -> () loc("<stdin>":18:3)
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "omp_fuse_optionalgen_pretty"}> ({
  ^bb0(%arg6: i32 loc("<stdin>":35:8), %arg7: i32 loc("<stdin>":35:20)):
    %5 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":36:10)
    "omp.canonical_loop"(%arg6, %5) ({
    ^bb0(%arg9: i32 loc("<stdin>":38:10)):
      "omp.terminator"() : () -> () loc("<stdin>":39:7)
    }) : (i32, !omp.cli) -> () loc("<stdin>":37:5)
    %6 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":41:10)
    "omp.canonical_loop"(%arg7, %6) ({
    ^bb0(%arg8: i32 loc("<stdin>":43:10)):
      "omp.terminator"() : () -> () loc("<stdin>":44:7)
    }) : (i32, !omp.cli) -> () loc("<stdin>":42:5)
    "omp.fuse"(%5, %6) <{operandSegmentSizes = array<i32: 0, 2>}> : (!omp.cli, !omp.cli) -> () loc("<stdin>":46:5)
    "func.return"() : () -> () loc("<stdin>":47:5)
  }) : () -> () loc("<stdin>":34:3)
  "func.func"() <{function_type = (i32, i32, i32) -> (), sym_name = "omp_fuse_looprange"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":50:8), %arg1: i32 loc("<stdin>":50:20), %arg2: i32 loc("<stdin>":50:32)):
    %0 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":51:10)
    %1 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":52:10)
    %2 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":53:10)
    %3 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":54:10)
    %4 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":55:10)
    "omp.canonical_loop"(%arg0, %0) ({
    ^bb0(%arg5: i32 loc("<stdin>":57:10)):
      "omp.terminator"() : () -> () loc("<stdin>":58:7)
    }) : (i32, !omp.cli) -> () loc("<stdin>":56:5)
    "omp.canonical_loop"(%arg1, %1) ({
    ^bb0(%arg4: i32 loc("<stdin>":61:10)):
      "omp.terminator"() : () -> () loc("<stdin>":62:7)
    }) : (i32, !omp.cli) -> () loc("<stdin>":60:5)
    "omp.canonical_loop"(%arg2, %2) ({
    ^bb0(%arg3: i32 loc("<stdin>":65:10)):
      "omp.terminator"() : () -> () loc("<stdin>":66:7)
    }) : (i32, !omp.cli) -> () loc("<stdin>":64:5)
    "omp.fuse"(%4, %3, %0, %1, %2) <{count = 2 : i64, first = 1 : i64, operandSegmentSizes = array<i32: 2, 3>}> : (!omp.cli, !omp.cli, !omp.cli, !omp.cli, !omp.cli) -> () loc("<stdin>":68:5)
    "func.return"() : () -> () loc("<stdin>":69:5)
  }) : () -> () loc("<stdin>":49:3)
}) : () -> () loc("<stdin>":1:1)
