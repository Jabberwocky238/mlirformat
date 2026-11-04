"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_reduction_byref_box_Uxf32", type = !llvm.ptr}> ({
    %20 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %21 = "llvm.alloca"(%20) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (i64) -> !llvm.ptr
    "omp.yield"(%21) : (!llvm.ptr) -> ()
  }, {
  ^bb0(%arg7: !llvm.ptr, %arg8: !llvm.ptr):
    %19 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    "llvm.store"(%19, %arg8) <{ordering = 0 : i64}> : (i64, !llvm.ptr) -> ()
    "omp.yield"(%arg8) : (!llvm.ptr) -> ()
  }, {
  ^bb0(%arg5: !llvm.ptr, %arg6: !llvm.ptr):
    %13 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i64
    %14 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
    %15 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    "llvm.br"(%13)[^bb1] : (i64) -> ()
  ^bb1(%16: i64):  // 2 preds: ^bb0, ^bb2
    %17 = "llvm.icmp"(%16, %14) <{predicate = 4 : i64}> : (i64, i64) -> i1
    "llvm.cond_br"(%17)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb2:  // pred: ^bb1
    %18 = "llvm.sub"(%16, %15) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    "llvm.br"(%18)[^bb1] : (i64) -> ()
  ^bb3:  // pred: ^bb1
    "omp.yield"(%arg5) : (!llvm.ptr) -> ()
  }, {
  }, {
  ^bb0(%arg4: !llvm.ptr):
    %10 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i64
    %11 = "llvm.ptrtoint"(%arg4) : (!llvm.ptr) -> i64
    %12 = "llvm.icmp"(%11, %10) <{predicate = 1 : i64}> : (i64, i64) -> i1
    "llvm.cond_br"(%12)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    "llvm.br"()[^bb2] : () -> ()
  ^bb2:  // 2 preds: ^bb0, ^bb1
    "omp.yield"() : () -> ()
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "x"}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "sectionsreduction_", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
    %2 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      %3 = "llvm.alloca"(%0) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (i64) -> !llvm.ptr
      "omp.sections"(%3) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>, reduction_byref = array<i1: true>, reduction_syms = [@add_reduction_byref_box_Uxf32]}> ({
      ^bb0(%arg1: !llvm.ptr):
        "omp.section"() ({
        ^bb0(%arg3: !llvm.ptr):
          "llvm.br"(%0)[^bb1] : (i64) -> ()
        ^bb1(%7: i64):  // 2 preds: ^bb0, ^bb2
          %8 = "llvm.icmp"(%7, %1) <{predicate = 4 : i64}> : (i64, i64) -> i1
          "llvm.cond_br"(%8)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
        ^bb2:  // pred: ^bb1
          %9 = "llvm.sub"(%7, %2) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
          "llvm.br"(%9)[^bb1] : (i64) -> ()
        ^bb3:  // pred: ^bb1
          "omp.terminator"() : () -> ()
        }) : () -> ()
        "omp.section"() ({
        ^bb0(%arg2: !llvm.ptr):
          "llvm.br"(%0)[^bb1] : (i64) -> ()
        ^bb1(%4: i64):  // 2 preds: ^bb0, ^bb2
          %5 = "llvm.icmp"(%4, %1) <{predicate = 4 : i64}> : (i64, i64) -> i1
          "llvm.cond_br"(%5)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
        ^bb2:  // pred: ^bb1
          %6 = "llvm.sub"(%4, %2) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
          "llvm.br"(%6)[^bb1] : (i64) -> ()
        ^bb3:  // pred: ^bb1
          "omp.terminator"() : () -> ()
        }) : () -> ()
        "omp.terminator"() : () -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) {fir.internal_name = "_QPsectionsreduction"} : () -> ()
}) : () -> ()

