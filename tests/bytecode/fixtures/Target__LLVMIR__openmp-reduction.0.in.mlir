"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_f32", type = f32}> ({
  }, {
  ^bb0(%arg9: f32 loc("<stdin>":4:8)):
    %8 = "llvm.mlir.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":5:10)
    "omp.yield"(%8) : (f32) -> () loc("<stdin>":6:5)
  }, {
  ^bb0(%arg7: f32 loc("<stdin>":8:8), %arg8: f32 loc("<stdin>":8:20)):
    %7 = "llvm.fadd"(%arg7, %arg8) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":9:10)
    "omp.yield"(%7) : (f32) -> () loc("<stdin>":10:5)
  }, {
  ^bb0(%arg5: !llvm.ptr loc("<stdin>":12:8), %arg6: !llvm.ptr loc("<stdin>":12:26)):
    %5 = "llvm.load"(%arg6) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32 loc("<stdin>":13:10)
    %6 = "llvm.atomicrmw"(%arg5, %5) <{bin_op = 11 : i64, ordering = 2 : i64}> : (!llvm.ptr, f32) -> f32 loc("<stdin>":14:10)
    "omp.yield"() : () -> () loc("<stdin>":15:5)
  }, {
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "simple_reduction", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64 loc("<stdin>":20:8), %arg1: i64 loc("<stdin>":20:20), %arg2: i64 loc("<stdin>":20:32)):
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":21:10)
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> : (i32) -> !llvm.ptr loc("<stdin>":22:10)
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.wsloop"(%1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0>, reduction_byref = array<i1: false>, reduction_syms = [@add_f32]}> ({
      ^bb0(%arg3: !llvm.ptr loc("<stdin>":25:12)):
        "omp.loop_nest"(%arg0, %arg1, %arg2) ({
        ^bb0(%arg4: i64 loc("<stdin>":27:14)):
          %2 = "llvm.mlir.constant"() <{value = 2.000000e+00 : f32}> : () -> f32 loc("<stdin>":28:16)
          %3 = "llvm.load"(%arg3) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32 loc("<stdin>":29:16)
          %4 = "llvm.fadd"(%2, %3) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":30:16)
          "llvm.store"(%4, %arg3) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> () loc("<stdin>":31:11)
          "omp.yield"() : () -> () loc("<stdin>":32:11)
        }) : (i64, i64, i64) -> () loc("<stdin>":26:9)
      }) : (!llvm.ptr) -> () loc("<stdin>":24:7)
      "omp.terminator"() : () -> () loc("<stdin>":35:7)
    }) : () -> () loc("<stdin>":23:5)
    "llvm.return"() : () -> () loc("<stdin>":37:5)
  }) : () -> () loc("<stdin>":19:3)
}) : () -> () loc("<stdin>":1:1)
