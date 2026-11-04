"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (), sym_name = "omp_canonloop_raw"}> ({
  ^bb0(%arg40: i32):
    "omp.canonical_loop"(%arg40) ({
    ^bb0(%arg41: i32):
      %29 = "llvm.add"(%arg41, %arg41) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      "omp.terminator"() : () -> ()
    }) : (i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "omp_canonloop_sequential_raw"}> ({
  ^bb0(%arg37: i32):
    %26 = "omp.new_cli"() : () -> !omp.cli
    "omp.canonical_loop"(%arg37, %26) ({
    ^bb0(%arg39: i32):
      %28 = "llvm.add"(%arg39, %arg39) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    %27 = "omp.new_cli"() : () -> !omp.cli
    "omp.canonical_loop"(%arg37, %27) ({
    ^bb0(%arg38: i32):
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "omp_nested_canonloop_raw"}> ({
  ^bb0(%arg33: i32, %arg34: i32):
    %23 = "omp.new_cli"() : () -> !omp.cli
    %24 = "omp.new_cli"() : () -> !omp.cli
    "omp.canonical_loop"(%arg33, %23) ({
    ^bb0(%arg35: i32):
      "omp.canonical_loop"(%arg34, %24) ({
      ^bb0(%arg36: i32):
        %25 = "llvm.add"(%arg35, %arg36) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        "omp.terminator"() : () -> ()
      }) : (i32, !omp.cli) -> ()
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "omp_canonloop_pretty"}> ({
  ^bb0(%arg31: i32):
    "omp.canonical_loop"(%arg31) ({
    ^bb0(%arg32: i32):
      %22 = "llvm.add"(%arg32, %arg32) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      "omp.terminator"() : () -> ()
    }) : (i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "omp_canonloop_constant_pretty"}> ({
    %20 = "llvm.mlir.constant"() <{value = 4 : i32}> : () -> i32
    "omp.canonical_loop"(%20) ({
    ^bb0(%arg30: i32):
      %21 = "llvm.add"(%arg30, %arg30) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      "omp.terminator"() : () -> ()
    }) : (i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "omp_canonloop_sequential_pretty"}> ({
  ^bb0(%arg26: i32):
    %17 = "omp.new_cli"() : () -> !omp.cli
    "omp.canonical_loop"(%arg26, %17) ({
    ^bb0(%arg29: i32):
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    %18 = "omp.new_cli"() : () -> !omp.cli
    "omp.canonical_loop"(%arg26, %18) ({
    ^bb0(%arg28: i32):
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    %19 = "omp.new_cli"() : () -> !omp.cli
    "omp.canonical_loop"(%arg26, %19) ({
    ^bb0(%arg27: i32):
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "omp_canonloop_2d_nested_pretty"}> ({
  ^bb0(%arg23: i32):
    %15 = "omp.new_cli"() : () -> !omp.cli
    %16 = "omp.new_cli"() : () -> !omp.cli
    "omp.canonical_loop"(%arg23, %15) ({
    ^bb0(%arg24: i32):
      "omp.canonical_loop"(%arg23, %16) ({
      ^bb0(%arg25: i32):
        "omp.terminator"() : () -> ()
      }) : (i32, !omp.cli) -> ()
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "omp_canonloop_3d_nested_pretty"}> ({
  ^bb0(%arg19: i32):
    %12 = "omp.new_cli"() : () -> !omp.cli
    %13 = "omp.new_cli"() : () -> !omp.cli
    %14 = "omp.new_cli"() : () -> !omp.cli
    "omp.canonical_loop"(%arg19, %12) ({
    ^bb0(%arg20: i32):
      "omp.canonical_loop"(%arg19, %13) ({
      ^bb0(%arg21: i32):
        "omp.canonical_loop"(%arg19, %14) ({
        ^bb0(%arg22: i32):
          "omp.terminator"() : () -> ()
        }) : (i32, !omp.cli) -> ()
        "omp.terminator"() : () -> ()
      }) : (i32, !omp.cli) -> ()
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "omp_canonloop_sequential_nested_pretty"}> ({
  ^bb0(%arg14: i32):
    %8 = "omp.new_cli"() : () -> !omp.cli
    %9 = "omp.new_cli"() : () -> !omp.cli
    "omp.canonical_loop"(%arg14, %8) ({
    ^bb0(%arg17: i32):
      "omp.canonical_loop"(%arg14, %9) ({
      ^bb0(%arg18: i32):
        "omp.terminator"() : () -> ()
      }) : (i32, !omp.cli) -> ()
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    %10 = "omp.new_cli"() : () -> !omp.cli
    %11 = "omp.new_cli"() : () -> !omp.cli
    "omp.canonical_loop"(%arg14, %10) ({
    ^bb0(%arg15: i32):
      "omp.canonical_loop"(%arg14, %11) ({
      ^bb0(%arg16: i32):
        "omp.terminator"() : () -> ()
      }) : (i32, !omp.cli) -> ()
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "omp_newcli_unused"}> ({
    %7 = "omp.new_cli"() : () -> !omp.cli
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "omp_canonloop_multiregion_isolatedfromabove"}> ({
    "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "x.privatizer", type = !llvm.ptr}> ({
    ^bb0(%arg11: !llvm.ptr, %arg12: !llvm.ptr):
      %6 = "arith.constant"() <{value = 42 : i32}> : () -> i32
      "omp.canonical_loop"(%6) ({
      ^bb0(%arg13: i32):
        "omp.terminator"() : () -> ()
      }) : (i32) -> ()
      "omp.yield"(%arg11) : (!llvm.ptr) -> ()
    }, {
    ^bb0(%arg7: !llvm.ptr, %arg8: !llvm.ptr):
      %5 = "arith.constant"() <{value = 42 : i32}> : () -> i32
      "omp.canonical_loop"(%5) ({
      ^bb0(%arg9: i32):
        "omp.canonical_loop"(%5) ({
        ^bb0(%arg10: i32):
          "omp.terminator"() : () -> ()
        }) : (i32) -> ()
        "omp.terminator"() : () -> ()
      }) : (i32) -> ()
      "omp.yield"(%arg7) : (!llvm.ptr) -> ()
    }, {
    ^bb0(%arg4: !llvm.ptr):
      %4 = "arith.constant"() <{value = 42 : i32}> : () -> i32
      "omp.canonical_loop"(%4) ({
      ^bb0(%arg6: i32):
        "omp.terminator"() : () -> ()
      }) : (i32) -> ()
      "omp.canonical_loop"(%4) ({
      ^bb0(%arg5: i32):
        "omp.terminator"() : () -> ()
      }) : (i32) -> ()
      "omp.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> (), sym_name = "omp_canonloop_multiregion"}> ({
  ^bb0(%arg0: i1):
    %0 = "arith.constant"() <{value = 42 : i32}> : () -> i32
    %1 = "omp.new_cli"() : () -> !omp.cli
    %2 = "omp.new_cli"() : () -> !omp.cli
    %3 = "omp.new_cli"() : () -> !omp.cli
    "scf.if"(%arg0) ({
      "omp.canonical_loop"(%0, %1) ({
      ^bb0(%arg3: i32):
        "omp.terminator"() : () -> ()
      }) : (i32, !omp.cli) -> ()
      "scf.yield"() : () -> ()
    }, {
      "omp.canonical_loop"(%0, %2) ({
      ^bb0(%arg2: i32):
        "omp.terminator"() : () -> ()
      }) : (i32, !omp.cli) -> ()
      "omp.canonical_loop"(%0, %3) ({
      ^bb0(%arg1: i32):
        "omp.terminator"() : () -> ()
      }) : (i32, !omp.cli) -> ()
      "scf.yield"() : () -> ()
    }) : (i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

