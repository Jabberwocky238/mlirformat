"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_f32", type = f32}> ({
  }, {
  ^bb0(%arg9: f32):
    %8 = "llvm.mlir.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "omp.yield"(%8) : (f32) -> ()
  }, {
  ^bb0(%arg7: f32, %arg8: f32):
    %7 = "llvm.fadd"(%arg7, %arg8) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
    "omp.yield"(%7) : (f32) -> ()
  }, {
  ^bb0(%arg5: !llvm.ptr, %arg6: !llvm.ptr):
    %5 = "llvm.load"(%arg6) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
    %6 = "llvm.atomicrmw"(%arg5, %5) <{bin_op = 11 : i64, ordering = 2 : i64}> : (!llvm.ptr, f32) -> f32
    "omp.yield"() : () -> ()
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "simple_reduction", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> : (i32) -> !llvm.ptr
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.wsloop"(%1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0>, reduction_byref = array<i1: false>, reduction_syms = [@add_f32]}> ({
      ^bb0(%arg3: !llvm.ptr):
        "omp.loop_nest"(%arg0, %arg1, %arg2) ({
        ^bb0(%arg4: i64):
          %2 = "llvm.mlir.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
          %3 = "llvm.load"(%arg3) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
          %4 = "llvm.fadd"(%2, %3) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
          "llvm.store"(%4, %arg3) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
          "omp.yield"() : () -> ()
        }) : (i64, i64, i64) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_f32", type = f32}> ({
  }, {
  ^bb0(%arg10: f32):
    %11 = "llvm.mlir.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "omp.yield"(%11) : (f32) -> ()
  }, {
  ^bb0(%arg8: f32, %arg9: f32):
    %10 = "llvm.fadd"(%arg8, %arg9) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
    "omp.yield"(%10) : (f32) -> ()
  }, {
  ^bb0(%arg6: !llvm.ptr, %arg7: !llvm.ptr):
    %8 = "llvm.load"(%arg7) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
    %9 = "llvm.atomicrmw"(%arg6, %8) <{bin_op = 11 : i64, ordering = 2 : i64}> : (!llvm.ptr, f32) -> f32
    "omp.yield"() : () -> ()
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "reuse_declaration", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> : (i32) -> !llvm.ptr
    %2 = "llvm.alloca"(%0) <{elem_type = i32}> : (i32) -> !llvm.ptr
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.wsloop"(%1, %2) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 2, 0>, reduction_byref = array<i1: false, false>, reduction_syms = [@add_f32, @add_f32]}> ({
      ^bb0(%arg3: !llvm.ptr, %arg4: !llvm.ptr):
        "omp.loop_nest"(%arg0, %arg1, %arg2) ({
        ^bb0(%arg5: i64):
          %3 = "llvm.mlir.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
          %4 = "llvm.load"(%arg3) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
          %5 = "llvm.fadd"(%4, %3) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
          "llvm.store"(%5, %arg3) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
          %6 = "llvm.load"(%arg4) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
          %7 = "llvm.fadd"(%6, %3) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
          "llvm.store"(%7, %arg4) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
          "omp.yield"() : () -> ()
        }) : (i64, i64, i64) -> ()
      }) : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_f32", type = f32}> ({
  }, {
  ^bb0(%arg10: f32):
    %9 = "llvm.mlir.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "omp.yield"(%9) : (f32) -> ()
  }, {
  ^bb0(%arg8: f32, %arg9: f32):
    %8 = "llvm.fadd"(%arg8, %arg9) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
    "omp.yield"(%8) : (f32) -> ()
  }, {
  ^bb0(%arg6: !llvm.ptr, %arg7: !llvm.ptr):
    %6 = "llvm.load"(%arg7) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
    %7 = "llvm.atomicrmw"(%arg6, %6) <{bin_op = 11 : i64, ordering = 2 : i64}> : (!llvm.ptr, f32) -> f32
    "omp.yield"() : () -> ()
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "missing_omp_reduction", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> : (i32) -> !llvm.ptr
    %2 = "llvm.alloca"(%0) <{elem_type = i32}> : (i32) -> !llvm.ptr
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.wsloop"(%1, %2) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 2, 0>, reduction_byref = array<i1: false, false>, reduction_syms = [@add_f32, @add_f32]}> ({
      ^bb0(%arg3: !llvm.ptr, %arg4: !llvm.ptr):
        "omp.loop_nest"(%arg0, %arg1, %arg2) ({
        ^bb0(%arg5: i64):
          %3 = "llvm.mlir.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
          %4 = "llvm.load"(%arg3) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
          %5 = "llvm.fadd"(%4, %3) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
          "llvm.store"(%5, %arg3) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
          "omp.yield"() : () -> ()
        }) : (i64, i64, i64) -> ()
      }) : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_f32", type = f32}> ({
  }, {
  ^bb0(%arg9: f32):
    %10 = "llvm.mlir.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "omp.yield"(%10) : (f32) -> ()
  }, {
  ^bb0(%arg7: f32, %arg8: f32):
    %9 = "llvm.fadd"(%arg7, %arg8) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
    "omp.yield"(%9) : (f32) -> ()
  }, {
  ^bb0(%arg5: !llvm.ptr, %arg6: !llvm.ptr):
    %7 = "llvm.load"(%arg6) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
    %8 = "llvm.atomicrmw"(%arg5, %7) <{bin_op = 11 : i64, ordering = 2 : i64}> : (!llvm.ptr, f32) -> f32
    "omp.yield"() : () -> ()
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "double_reference", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> : (i32) -> !llvm.ptr
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.wsloop"(%1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0>, reduction_byref = array<i1: false>, reduction_syms = [@add_f32]}> ({
      ^bb0(%arg3: !llvm.ptr):
        "omp.loop_nest"(%arg0, %arg1, %arg2) ({
        ^bb0(%arg4: i64):
          %2 = "llvm.mlir.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
          %3 = "llvm.load"(%arg3) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
          %4 = "llvm.fadd"(%3, %2) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
          "llvm.store"(%4, %arg3) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
          %5 = "llvm.load"(%arg3) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
          %6 = "llvm.fadd"(%5, %2) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
          "llvm.store"(%6, %arg3) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
          "omp.yield"() : () -> ()
        }) : (i64, i64, i64) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_f32", type = f32}> ({
  }, {
  ^bb0(%arg13: f32):
    %13 = "llvm.mlir.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "omp.yield"(%13) : (f32) -> ()
  }, {
  ^bb0(%arg11: f32, %arg12: f32):
    %12 = "llvm.fadd"(%arg11, %arg12) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
    "omp.yield"(%12) : (f32) -> ()
  }, {
  ^bb0(%arg9: !llvm.ptr, %arg10: !llvm.ptr):
    %10 = "llvm.load"(%arg10) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
    %11 = "llvm.atomicrmw"(%arg9, %10) <{bin_op = 11 : i64, ordering = 2 : i64}> : (!llvm.ptr, f32) -> f32
    "omp.yield"() : () -> ()
  }, {
  }, {
  }) : () -> ()
  "omp.declare_reduction"() <{sym_name = "mul_f32", type = f32}> ({
  }, {
  ^bb0(%arg8: f32):
    %9 = "llvm.mlir.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "omp.yield"(%9) : (f32) -> ()
  }, {
  ^bb0(%arg6: f32, %arg7: f32):
    %8 = "llvm.fmul"(%arg6, %arg7) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
    "omp.yield"(%8) : (f32) -> ()
  }, {
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "no_atomic", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> : (i32) -> !llvm.ptr
    %2 = "llvm.alloca"(%0) <{elem_type = i32}> : (i32) -> !llvm.ptr
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.wsloop"(%1, %2) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 2, 0>, reduction_byref = array<i1: false, false>, reduction_syms = [@add_f32, @mul_f32]}> ({
      ^bb0(%arg3: !llvm.ptr, %arg4: !llvm.ptr):
        "omp.loop_nest"(%arg0, %arg1, %arg2) ({
        ^bb0(%arg5: i64):
          %3 = "llvm.mlir.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
          %4 = "llvm.load"(%arg3) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
          %5 = "llvm.fadd"(%4, %3) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
          "llvm.store"(%5, %arg3) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
          %6 = "llvm.load"(%arg4) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
          %7 = "llvm.fmul"(%6, %3) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
          "llvm.store"(%7, %arg4) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
          "omp.yield"() : () -> ()
        }) : (i64, i64, i64) -> ()
      }) : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_f32", type = f32}> ({
  }, {
  ^bb0(%arg5: f32):
    %8 = "llvm.mlir.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "omp.yield"(%8) : (f32) -> ()
  }, {
  ^bb0(%arg3: f32, %arg4: f32):
    %7 = "llvm.fadd"(%arg3, %arg4) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
    "omp.yield"(%7) : (f32) -> ()
  }, {
  ^bb0(%arg1: !llvm.ptr, %arg2: !llvm.ptr):
    %5 = "llvm.load"(%arg2) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
    %6 = "llvm.atomicrmw"(%arg1, %5) <{bin_op = 11 : i64, ordering = 2 : i64}> : (!llvm.ptr, f32) -> f32
    "omp.yield"() : () -> ()
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "simple_reduction_parallel", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> : (i32) -> !llvm.ptr
    "omp.parallel"(%1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1>, reduction_byref = array<i1: false>, reduction_syms = [@add_f32]}> ({
    ^bb0(%arg0: !llvm.ptr):
      %2 = "llvm.mlir.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
      %3 = "llvm.load"(%arg0) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
      %4 = "llvm.fadd"(%3, %2) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
      "llvm.store"(%4, %arg0) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_i32", type = i32}> ({
  }, {
  ^bb0(%arg7: i32):
    %10 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    "omp.yield"(%10) : (i32) -> ()
  }, {
  ^bb0(%arg5: i32, %arg6: i32):
    %9 = "llvm.add"(%arg5, %arg6) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    "omp.yield"(%9) : (i32) -> ()
  }, {
  ^bb0(%arg3: !llvm.ptr, %arg4: !llvm.ptr):
    %7 = "llvm.load"(%arg4) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    %8 = "llvm.atomicrmw"(%arg3, %7) <{bin_op = 1 : i64, ordering = 2 : i64}> : (!llvm.ptr, i32) -> i32
    "omp.yield"() : () -> ()
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64)>, linkage = #llvm.linkage<external>, sym_name = "parallel_nested_workshare_reduction", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64):
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> : (i32) -> !llvm.ptr
    %2 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %3 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.wsloop"(%1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0>, reduction_byref = array<i1: false>, reduction_syms = [@add_i32]}> ({
      ^bb0(%arg1: !llvm.ptr):
        "omp.loop_nest"(%2, %arg0, %3) ({
        ^bb0(%arg2: i64):
          %4 = "llvm.trunc"(%arg2) <{overflowFlags = 0 : i32}> : (i64) -> i32
          %5 = "llvm.load"(%arg1) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
          %6 = "llvm.add"(%5, %4) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
          "llvm.store"(%6, %arg1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
          "omp.yield"() : () -> ()
        }) : (i64, i64, i64) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_f32", type = f32}> ({
  }, {
  ^bb0(%arg10: f32):
    %8 = "llvm.mlir.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "omp.yield"(%8) : (f32) -> ()
  }, {
  ^bb0(%arg8: f32, %arg9: f32):
    %7 = "llvm.fadd"(%arg8, %arg9) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
    "omp.yield"(%7) : (f32) -> ()
  }, {
  ^bb0(%arg6: !llvm.ptr, %arg7: !llvm.ptr):
    %5 = "llvm.load"(%arg7) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
    %6 = "llvm.atomicrmw"(%arg6, %5) <{bin_op = 11 : i64, ordering = 2 : i64}> : (!llvm.ptr, f32) -> f32
    "omp.yield"() : () -> ()
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "wsloop_simd_reduction", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> : (i32) -> !llvm.ptr
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.wsloop"(%1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0>, reduction_byref = array<i1: false>, reduction_syms = [@add_f32]}> ({
      ^bb0(%arg3: !llvm.ptr):
        "omp.simd"(%arg3) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 1>, reduction_byref = array<i1: false>, reduction_syms = [@add_f32]}> ({
        ^bb0(%arg4: !llvm.ptr):
          "omp.loop_nest"(%arg0, %arg1, %arg2) ({
          ^bb0(%arg5: i64):
            %2 = "llvm.mlir.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
            %3 = "llvm.load"(%arg4) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
            %4 = "llvm.fadd"(%2, %3) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
            "llvm.store"(%4, %arg4) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
            "omp.yield"() : () -> ()
          }) : (i64, i64, i64) -> ()
        }) {omp.composite} : (!llvm.ptr) -> ()
      }) {omp.composite} : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

