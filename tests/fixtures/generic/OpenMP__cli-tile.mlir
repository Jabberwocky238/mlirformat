"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "omp_tile_raw"}> ({
  ^bb0(%arg27: i32, %arg28: i32):
    %40 = "omp.new_cli"() : () -> !omp.cli
    %41 = "omp.new_cli"() : () -> !omp.cli
    %42 = "omp.new_cli"() : () -> !omp.cli
    "omp.canonical_loop"(%arg27, %40) ({
    ^bb0(%arg29: i32):
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    "omp.tile"(%41, %42, %40, %arg28) <{operandSegmentSizes = array<i32: 2, 1, 1>}> : (!omp.cli, !omp.cli, !omp.cli, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "omp_tile_pretty"}> ({
  ^bb0(%arg24: i32, %arg25: i32):
    %37 = "omp.new_cli"() : () -> !omp.cli
    %38 = "omp.new_cli"() : () -> !omp.cli
    %39 = "omp.new_cli"() : () -> !omp.cli
    "omp.canonical_loop"(%arg24, %37) ({
    ^bb0(%arg26: i32):
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    "omp.tile"(%38, %39, %37, %arg25) <{operandSegmentSizes = array<i32: 2, 1, 1>}> : (!omp.cli, !omp.cli, !omp.cli, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "omp_tile_optionalgen_pretty"}> ({
  ^bb0(%arg21: i32, %arg22: i32):
    %36 = "omp.new_cli"() : () -> !omp.cli
    "omp.canonical_loop"(%arg21, %36) ({
    ^bb0(%arg23: i32):
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    "omp.tile"(%36, %arg22) <{operandSegmentSizes = array<i32: 0, 1, 1>}> : (!omp.cli, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i32) -> (), sym_name = "omp_tile_2d_pretty"}> ({
  ^bb0(%arg15: i32, %arg16: i32, %arg17: i32, %arg18: i32):
    %30 = "omp.new_cli"() : () -> !omp.cli
    %31 = "omp.new_cli"() : () -> !omp.cli
    %32 = "omp.new_cli"() : () -> !omp.cli
    %33 = "omp.new_cli"() : () -> !omp.cli
    %34 = "omp.new_cli"() : () -> !omp.cli
    %35 = "omp.new_cli"() : () -> !omp.cli
    "omp.canonical_loop"(%arg15, %30) ({
    ^bb0(%arg19: i32):
      "omp.canonical_loop"(%arg16, %31) ({
      ^bb0(%arg20: i32):
        "omp.terminator"() : () -> ()
      }) : (i32, !omp.cli) -> ()
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    "omp.tile"(%32, %33, %34, %35, %30, %31, %arg17, %arg18) <{operandSegmentSizes = array<i32: 4, 2, 2>}> : (!omp.cli, !omp.cli, !omp.cli, !omp.cli, !omp.cli, !omp.cli, i32, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "omp_tile_3d_pretty"}> ({
  ^bb0(%arg10: i32, %arg11: i32):
    %21 = "omp.new_cli"() : () -> !omp.cli
    %22 = "omp.new_cli"() : () -> !omp.cli
    %23 = "omp.new_cli"() : () -> !omp.cli
    %24 = "omp.new_cli"() : () -> !omp.cli
    %25 = "omp.new_cli"() : () -> !omp.cli
    %26 = "omp.new_cli"() : () -> !omp.cli
    %27 = "omp.new_cli"() : () -> !omp.cli
    %28 = "omp.new_cli"() : () -> !omp.cli
    %29 = "omp.new_cli"() : () -> !omp.cli
    "omp.canonical_loop"(%arg10, %21) ({
    ^bb0(%arg12: i32):
      "omp.canonical_loop"(%arg10, %22) ({
      ^bb0(%arg13: i32):
        "omp.canonical_loop"(%arg10, %23) ({
        ^bb0(%arg14: i32):
          "omp.terminator"() : () -> ()
        }) : (i32, !omp.cli) -> ()
        "omp.terminator"() : () -> ()
      }) : (i32, !omp.cli) -> ()
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    "omp.tile"(%24, %25, %26, %27, %28, %29, %21, %22, %23, %arg11, %arg11, %arg11) <{operandSegmentSizes = array<i32: 6, 3, 3>}> : (!omp.cli, !omp.cli, !omp.cli, !omp.cli, !omp.cli, !omp.cli, !omp.cli, !omp.cli, !omp.cli, i32, i32, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i32) -> (), sym_name = "omp_tile_composition"}> ({
  ^bb0(%arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32):
    %14 = "omp.new_cli"() : () -> !omp.cli
    %15 = "omp.new_cli"() : () -> !omp.cli
    %16 = "omp.new_cli"() : () -> !omp.cli
    %17 = "omp.new_cli"() : () -> !omp.cli
    %18 = "omp.new_cli"() : () -> !omp.cli
    %19 = "omp.new_cli"() : () -> !omp.cli
    %20 = "omp.new_cli"() : () -> !omp.cli
    "omp.canonical_loop"(%arg5, %14) ({
    ^bb0(%arg9: i32):
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    "omp.tile"(%15, %16, %14, %arg6) <{operandSegmentSizes = array<i32: 2, 1, 1>}> : (!omp.cli, !omp.cli, !omp.cli, i32) -> ()
    "omp.tile"(%18, %17, %15, %arg7) <{operandSegmentSizes = array<i32: 2, 1, 1>}> : (!omp.cli, !omp.cli, !omp.cli, i32) -> ()
    "omp.tile"(%19, %20, %16, %arg8) <{operandSegmentSizes = array<i32: 2, 1, 1>}> : (!omp.cli, !omp.cli, !omp.cli, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32) -> (), sym_name = "omp_tile_2d_composition"}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i32):
    %0 = "omp.new_cli"() : () -> !omp.cli
    %1 = "omp.new_cli"() : () -> !omp.cli
    %2 = "omp.new_cli"() : () -> !omp.cli
    %3 = "omp.new_cli"() : () -> !omp.cli
    %4 = "omp.new_cli"() : () -> !omp.cli
    %5 = "omp.new_cli"() : () -> !omp.cli
    %6 = "omp.new_cli"() : () -> !omp.cli
    %7 = "omp.new_cli"() : () -> !omp.cli
    %8 = "omp.new_cli"() : () -> !omp.cli
    %9 = "omp.new_cli"() : () -> !omp.cli
    %10 = "omp.new_cli"() : () -> !omp.cli
    %11 = "omp.new_cli"() : () -> !omp.cli
    %12 = "omp.new_cli"() : () -> !omp.cli
    %13 = "omp.new_cli"() : () -> !omp.cli
    "omp.canonical_loop"(%arg0, %0) ({
    ^bb0(%arg3: i32):
      "omp.canonical_loop"(%arg1, %1) ({
      ^bb0(%arg4: i32):
        "omp.terminator"() : () -> ()
      }) : (i32, !omp.cli) -> ()
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    "omp.tile"(%2, %3, %4, %5, %0, %1, %arg2, %arg2) <{operandSegmentSizes = array<i32: 4, 2, 2>}> : (!omp.cli, !omp.cli, !omp.cli, !omp.cli, !omp.cli, !omp.cli, i32, i32) -> ()
    "omp.tile"(%6, %7, %8, %9, %2, %3, %arg2, %arg2) <{operandSegmentSizes = array<i32: 4, 2, 2>}> : (!omp.cli, !omp.cli, !omp.cli, !omp.cli, !omp.cli, !omp.cli, i32, i32) -> ()
    "omp.tile"(%10, %11, %12, %13, %5, %4, %arg2, %arg2) <{operandSegmentSizes = array<i32: 4, 2, 2>}> : (!omp.cli, !omp.cli, !omp.cli, !omp.cli, !omp.cli, !omp.cli, i32, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

