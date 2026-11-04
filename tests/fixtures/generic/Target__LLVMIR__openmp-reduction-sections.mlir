"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_reduction_f32", type = f32}> ({
  }, {
  ^bb0(%arg6: f32):
    %7 = "llvm.mlir.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "omp.yield"(%7) : (f32) -> ()
  }, {
  ^bb0(%arg4: f32, %arg5: f32):
    %6 = "llvm.fadd"(%arg4, %arg5) <{fastmathFlags = #llvm.fastmath<contract>}> : (f32, f32) -> f32
    "omp.yield"(%6) : (f32) -> ()
  }, {
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "x"}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "sections_", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %1 = "llvm.mlir.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.sections"(%arg0) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>, reduction_byref = array<i1: false>, reduction_syms = [@add_reduction_f32]}> ({
      ^bb0(%arg1: !llvm.ptr):
        "omp.section"() ({
        ^bb0(%arg3: !llvm.ptr):
          %4 = "llvm.load"(%arg3) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
          %5 = "llvm.fadd"(%4, %1) <{fastmathFlags = #llvm.fastmath<contract>}> : (f32, f32) -> f32
          "llvm.store"(%5, %arg3) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
          "omp.terminator"() : () -> ()
        }) : () -> ()
        "omp.section"() ({
        ^bb0(%arg2: !llvm.ptr):
          %2 = "llvm.load"(%arg2) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
          %3 = "llvm.fadd"(%2, %0) <{fastmathFlags = #llvm.fastmath<contract>}> : (f32, f32) -> f32
          "llvm.store"(%3, %arg2) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
          "omp.terminator"() : () -> ()
        }) : () -> ()
        "omp.terminator"() : () -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) {fir.internal_name = "_QPsections"} : () -> ()
}) : () -> ()

