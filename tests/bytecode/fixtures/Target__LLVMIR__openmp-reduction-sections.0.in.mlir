"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_reduction_f32", type = f32}> ({
  }, {
  ^bb0(%arg6: f32 loc("<stdin>":4:8)):
    %7 = "llvm.mlir.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":5:10)
    "omp.yield"(%7) : (f32) -> () loc("<stdin>":6:5)
  }, {
  ^bb0(%arg4: f32 loc("<stdin>":8:8), %arg5: f32 loc("<stdin>":8:20)):
    %6 = "llvm.fadd"(%arg4, %arg5) <{fastmathFlags = #llvm.fastmath<contract>}> : (f32, f32) -> f32 loc("<stdin>":9:10)
    "omp.yield"(%6) : (f32) -> () loc("<stdin>":10:5)
  }, {
  }, {
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "x"}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "sections_", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":16:8)):
    %0 = "llvm.mlir.constant"() <{value = 2.000000e+00 : f32}> : () -> f32 loc("<stdin>":17:10)
    %1 = "llvm.mlir.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":18:10)
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.sections"(%arg0) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>, reduction_byref = array<i1: false>, reduction_syms = [@add_reduction_f32]}> ({
      ^bb0(%arg1: !llvm.ptr loc("<stdin>":21:12)):
        "omp.section"() ({
        ^bb0(%arg3: !llvm.ptr loc("<stdin>":23:14)):
          %4 = "llvm.load"(%arg3) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32 loc("<stdin>":24:16)
          %5 = "llvm.fadd"(%4, %1) <{fastmathFlags = #llvm.fastmath<contract>}> : (f32, f32) -> f32 loc("<stdin>":25:16)
          "llvm.store"(%5, %arg3) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> () loc("<stdin>":26:11)
          "omp.terminator"() : () -> () loc("<stdin>":27:11)
        }) : () -> () loc("<stdin>":22:9)
        "omp.section"() ({
        ^bb0(%arg2: !llvm.ptr loc("<stdin>":30:14)):
          %2 = "llvm.load"(%arg2) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32 loc("<stdin>":31:16)
          %3 = "llvm.fadd"(%2, %0) <{fastmathFlags = #llvm.fastmath<contract>}> : (f32, f32) -> f32 loc("<stdin>":32:16)
          "llvm.store"(%3, %arg2) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> () loc("<stdin>":33:11)
          "omp.terminator"() : () -> () loc("<stdin>":34:11)
        }) : () -> () loc("<stdin>":29:9)
        "omp.terminator"() : () -> () loc("<stdin>":36:9)
      }) : (!llvm.ptr) -> () loc("<stdin>":20:7)
      "omp.terminator"() : () -> () loc("<stdin>":38:7)
    }) : () -> () loc("<stdin>":19:5)
    "llvm.return"() : () -> () loc("<stdin>":40:5)
  }) {fir.internal_name = "_QPsections"} : () -> () loc("<stdin>":15:3)
}) : () -> () loc("<stdin>":1:1)
