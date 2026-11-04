"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "omp_tile_raw"}> ({
  ^bb0(%arg17: i32, %arg18: i32):
    %19 = "omp.new_cli"() : () -> !omp.cli
    %20 = "omp.new_cli"() : () -> !omp.cli
    %21 = "omp.new_cli"() : () -> !omp.cli
    "omp.canonical_loop"(%arg17, %19) ({
    ^bb0(%arg19: i32):
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    "omp.tile"(%20, %21, %19, %arg18) <{operandSegmentSizes = array<i32: 2, 1, 1>}> : (!omp.cli, !omp.cli, !omp.cli, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "omp_tile_pretty"}> ({
  ^bb0(%arg14: i32, %arg15: i32):
    %16 = "omp.new_cli"() : () -> !omp.cli
    %17 = "omp.new_cli"() : () -> !omp.cli
    %18 = "omp.new_cli"() : () -> !omp.cli
    "omp.canonical_loop"(%arg14, %16) ({
    ^bb0(%arg16: i32):
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    "omp.tile"(%17, %18, %16, %arg15) <{operandSegmentSizes = array<i32: 2, 1, 1>}> : (!omp.cli, !omp.cli, !omp.cli, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "omp_tile_optionalgen_pretty"}> ({
  ^bb0(%arg11: i32, %arg12: i32):
    %15 = "omp.new_cli"() : () -> !omp.cli
    "omp.canonical_loop"(%arg11, %15) ({
    ^bb0(%arg13: i32):
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    "omp.tile"(%15, %arg12) <{operandSegmentSizes = array<i32: 0, 1, 1>}> : (!omp.cli, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i32) -> (), sym_name = "omp_tile_2d_pretty"}> ({
  ^bb0(%arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32):
    %9 = "omp.new_cli"() : () -> !omp.cli
    %10 = "omp.new_cli"() : () -> !omp.cli
    %11 = "omp.new_cli"() : () -> !omp.cli
    %12 = "omp.new_cli"() : () -> !omp.cli
    %13 = "omp.new_cli"() : () -> !omp.cli
    %14 = "omp.new_cli"() : () -> !omp.cli
    "omp.canonical_loop"(%arg5, %9) ({
    ^bb0(%arg9: i32):
      "omp.canonical_loop"(%arg6, %10) ({
      ^bb0(%arg10: i32):
        "omp.terminator"() : () -> ()
      }) : (i32, !omp.cli) -> ()
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    "omp.tile"(%11, %12, %13, %14, %9, %10, %arg7, %arg8) <{operandSegmentSizes = array<i32: 4, 2, 2>}> : (!omp.cli, !omp.cli, !omp.cli, !omp.cli, !omp.cli, !omp.cli, i32, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "omp_tile_3d_pretty"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "omp.new_cli"() : () -> !omp.cli
    %1 = "omp.new_cli"() : () -> !omp.cli
    %2 = "omp.new_cli"() : () -> !omp.cli
    %3 = "omp.new_cli"() : () -> !omp.cli
    %4 = "omp.new_cli"() : () -> !omp.cli
    %5 = "omp.new_cli"() : () -> !omp.cli
    %6 = "omp.new_cli"() : () -> !omp.cli
    %7 = "omp.new_cli"() : () -> !omp.cli
    %8 = "omp.new_cli"() : () -> !omp.cli
    "omp.canonical_loop"(%arg0, %0) ({
    ^bb0(%arg2: i32):
      "omp.canonical_loop"(%arg0, %1) ({
      ^bb0(%arg3: i32):
        "omp.canonical_loop"(%arg0, %2) ({
        ^bb0(%arg4: i32):
          "omp.terminator"() : () -> ()
        }) : (i32, !omp.cli) -> ()
        "omp.terminator"() : () -> ()
      }) : (i32, !omp.cli) -> ()
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    "omp.tile"(%3, %4, %5, %6, %7, %8, %0, %1, %2, %arg1, %arg1, %arg1) <{operandSegmentSizes = array<i32: 6, 3, 3>}> : (!omp.cli, !omp.cli, !omp.cli, !omp.cli, !omp.cli, !omp.cli, !omp.cli, !omp.cli, !omp.cli, i32, i32, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

