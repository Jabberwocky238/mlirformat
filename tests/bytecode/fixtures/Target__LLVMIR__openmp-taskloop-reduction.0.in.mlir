"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_i32", type = i32}> ({
  }, {
  ^bb0(%arg8: i32 loc("<stdin>":4:8)):
    %3 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":5:10)
    "omp.yield"(%3) : (i32) -> () loc("<stdin>":6:5)
  }, {
  ^bb0(%arg6: i32 loc("<stdin>":8:8), %arg7: i32 loc("<stdin>":8:20)):
    %2 = "llvm.add"(%arg6, %arg7) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32 loc("<stdin>":9:10)
    "omp.yield"(%2) : (i32) -> () loc("<stdin>":10:5)
  }, {
  }, {
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "taskloop_reduction_single", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":16:8), %arg1: i32 loc("<stdin>":16:26), %arg2: i32 loc("<stdin>":16:38), %arg3: i32 loc("<stdin>":16:50)):
    "omp.taskloop.context"(%arg0) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 1>, reduction_byref = array<i1: false>, reduction_syms = [@add_i32]}> ({
    ^bb0(%arg4: !llvm.ptr loc("<stdin>":18:10)):
      "omp.taskloop.wrapper"() ({
        "omp.loop_nest"(%arg1, %arg2, %arg3) ({
        ^bb0(%arg5: i32 loc("<stdin>":21:14)):
          %0 = "llvm.load"(%arg4) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":22:16)
          %1 = "llvm.add"(%0, %arg5) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32 loc("<stdin>":23:16)
          "llvm.store"(%1, %arg4) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":24:11)
          "omp.yield"() : () -> () loc("<stdin>":25:11)
        }) : (i32, i32, i32) -> () loc("<stdin>":20:9)
      }) : () -> () loc("<stdin>":19:7)
      "omp.terminator"() : () -> () loc("<stdin>":28:7)
    }) {omp.combined} : (!llvm.ptr) -> () loc("<stdin>":17:5)
    "llvm.return"() : () -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":15:3)
}) : () -> () loc("<stdin>":1:1)
