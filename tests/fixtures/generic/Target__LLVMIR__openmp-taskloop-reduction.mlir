"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_i32", type = i32}> ({
  }, {
  ^bb0(%arg8: i32):
    %3 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    "omp.yield"(%3) : (i32) -> ()
  }, {
  ^bb0(%arg6: i32, %arg7: i32):
    %2 = "llvm.add"(%arg6, %arg7) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    "omp.yield"(%2) : (i32) -> ()
  }, {
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "taskloop_reduction_single", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: i32, %arg2: i32, %arg3: i32):
    "omp.taskloop.context"(%arg0) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 1>, reduction_byref = array<i1: false>, reduction_syms = [@add_i32]}> ({
    ^bb0(%arg4: !llvm.ptr):
      "omp.taskloop.wrapper"() ({
        "omp.loop_nest"(%arg1, %arg2, %arg3) ({
        ^bb0(%arg5: i32):
          %0 = "llvm.load"(%arg4) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
          %1 = "llvm.add"(%0, %arg5) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
          "llvm.store"(%1, %arg4) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
          "omp.yield"() : () -> ()
        }) : (i32, i32, i32) -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_i32", type = i32}> ({
  }, {
  ^bb0(%arg13: i32):
    %8 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    "omp.yield"(%8) : (i32) -> ()
  }, {
  ^bb0(%arg11: i32, %arg12: i32):
    %7 = "llvm.add"(%arg11, %arg12) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    "omp.yield"(%7) : (i32) -> ()
  }, {
  }, {
  }, {
  }) : () -> ()
  "omp.declare_reduction"() <{sym_name = "mul_i64", type = i64}> ({
  }, {
  ^bb0(%arg10: i64):
    %6 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    "omp.yield"(%6) : (i64) -> ()
  }, {
  ^bb0(%arg8: i64, %arg9: i64):
    %5 = "llvm.mul"(%arg8, %arg9) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    "omp.yield"(%5) : (i64) -> ()
  }, {
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr, i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "taskloop_reduction_multi", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: i32, %arg3: i32, %arg4: i32):
    "omp.taskloop.context"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 2>, reduction_byref = array<i1: false, false>, reduction_syms = [@add_i32, @mul_i64]}> ({
    ^bb0(%arg5: !llvm.ptr, %arg6: !llvm.ptr):
      "omp.taskloop.wrapper"() ({
        "omp.loop_nest"(%arg2, %arg3, %arg4) ({
        ^bb0(%arg7: i32):
          %0 = "llvm.load"(%arg5) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
          %1 = "llvm.add"(%0, %arg7) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
          "llvm.store"(%1, %arg5) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
          %2 = "llvm.load"(%arg6) <{ordering = 0 : i64}> : (!llvm.ptr) -> i64
          %3 = "llvm.sext"(%arg7) : (i32) -> i64
          %4 = "llvm.mul"(%2, %3) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
          "llvm.store"(%4, %arg6) <{ordering = 0 : i64}> : (i64, !llvm.ptr) -> ()
          "omp.yield"() : () -> ()
        }) : (i32, i32, i32) -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_i32", type = i32}> ({
  }, {
  ^bb0(%arg9: i32):
    %3 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    "omp.yield"(%3) : (i32) -> ()
  }, {
  ^bb0(%arg7: i32, %arg8: i32):
    %2 = "llvm.add"(%arg7, %arg8) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    "omp.yield"(%2) : (i32) -> ()
  }, {
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "taskloop_inreduction", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: i32, %arg2: i32, %arg3: i32):
    "omp.taskgroup"(%arg0) <{operandSegmentSizes = array<i32: 0, 0, 1>, task_reduction_byref = array<i1: false>, task_reduction_syms = [@add_i32]}> ({
    ^bb0(%arg4: !llvm.ptr):
      "omp.taskloop.context"(%arg0) <{in_reduction_byref = array<i1: false>, in_reduction_syms = [@add_i32], operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 0, 0>}> ({
      ^bb0(%arg5: !llvm.ptr):
        "omp.taskloop.wrapper"() ({
          "omp.loop_nest"(%arg1, %arg2, %arg3) ({
          ^bb0(%arg6: i32):
            %0 = "llvm.load"(%arg5) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
            %1 = "llvm.add"(%0, %arg6) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
            "llvm.store"(%1, %arg5) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
            "omp.yield"() : () -> ()
          }) : (i32, i32, i32) -> ()
        }) : () -> ()
        "omp.terminator"() : () -> ()
      }) {omp.combined} : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_i32", type = i32}> ({
  }, {
  ^bb0(%arg8: i32):
    %3 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    "omp.yield"(%3) : (i32) -> ()
  }, {
  ^bb0(%arg6: i32, %arg7: i32):
    %2 = "llvm.add"(%arg6, %arg7) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    "omp.yield"(%2) : (i32) -> ()
  }, {
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "taskloop_nogroup_inreduction", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: i32, %arg2: i32, %arg3: i32):
    "omp.taskloop.context"(%arg0) <{in_reduction_byref = array<i1: false>, in_reduction_syms = [@add_i32], nogroup, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg4: !llvm.ptr):
      "omp.taskloop.wrapper"() ({
        "omp.loop_nest"(%arg1, %arg2, %arg3) ({
        ^bb0(%arg5: i32):
          %0 = "llvm.load"(%arg4) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
          %1 = "llvm.add"(%0, %arg5) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
          "llvm.store"(%1, %arg4) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
          "omp.yield"() : () -> ()
        }) : (i32, i32, i32) -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_i32_as1", type = i32}> ({
  }, {
  ^bb0(%arg8: i32):
    %3 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    "omp.yield"(%3) : (i32) -> ()
  }, {
  ^bb0(%arg6: i32, %arg7: i32):
    %2 = "llvm.add"(%arg6, %arg7) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    "omp.yield"(%2) : (i32) -> ()
  }, {
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>, i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "taskloop_reduction_as1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr<1>, %arg1: i32, %arg2: i32, %arg3: i32):
    "omp.taskloop.context"(%arg0) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 1>, reduction_byref = array<i1: false>, reduction_syms = [@add_i32_as1]}> ({
    ^bb0(%arg4: !llvm.ptr<1>):
      "omp.taskloop.wrapper"() ({
        "omp.loop_nest"(%arg1, %arg2, %arg3) ({
        ^bb0(%arg5: i32):
          %0 = "llvm.load"(%arg4) <{ordering = 0 : i64}> : (!llvm.ptr<1>) -> i32
          %1 = "llvm.add"(%0, %arg5) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
          "llvm.store"(%1, %arg4) <{ordering = 0 : i64}> : (i32, !llvm.ptr<1>) -> ()
          "omp.yield"() : () -> ()
        }) : (i32, i32, i32) -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : (!llvm.ptr<1>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_i32_as1", type = i32}> ({
  }, {
  ^bb0(%arg9: i32):
    %3 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    "omp.yield"(%3) : (i32) -> ()
  }, {
  ^bb0(%arg7: i32, %arg8: i32):
    %2 = "llvm.add"(%arg7, %arg8) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    "omp.yield"(%2) : (i32) -> ()
  }, {
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>, i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "taskloop_inreduction_as1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr<1>, %arg1: i32, %arg2: i32, %arg3: i32):
    "omp.taskgroup"(%arg0) <{operandSegmentSizes = array<i32: 0, 0, 1>, task_reduction_byref = array<i1: false>, task_reduction_syms = [@add_i32_as1]}> ({
    ^bb0(%arg4: !llvm.ptr<1>):
      "omp.taskloop.context"(%arg0) <{in_reduction_byref = array<i1: false>, in_reduction_syms = [@add_i32_as1], operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 0, 0>}> ({
      ^bb0(%arg5: !llvm.ptr<1>):
        "omp.taskloop.wrapper"() ({
          "omp.loop_nest"(%arg1, %arg2, %arg3) ({
          ^bb0(%arg6: i32):
            %0 = "llvm.load"(%arg5) <{ordering = 0 : i64}> : (!llvm.ptr<1>) -> i32
            %1 = "llvm.add"(%0, %arg6) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
            "llvm.store"(%1, %arg5) <{ordering = 0 : i64}> : (i32, !llvm.ptr<1>) -> ()
            "omp.yield"() : () -> ()
          }) : (i32, i32, i32) -> ()
        }) : () -> ()
        "omp.terminator"() : () -> ()
      }) {omp.combined} : (!llvm.ptr<1>) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr<1>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

