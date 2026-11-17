"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_reduction_byref_box_Uxf32", type = !llvm.ptr}> ({
    %20 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":3:11)
    %21 = "llvm.alloca"(%20) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (i64) -> !llvm.ptr loc("<stdin>":4:11)
    "omp.yield"(%21) : (!llvm.ptr) -> () loc("<stdin>":5:5)
  }, {
  ^bb0(%arg7: !llvm.ptr loc("<stdin>":7:8), %arg8: !llvm.ptr loc("<stdin>":7:26)):
    %19 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":8:11)
    "llvm.store"(%19, %arg8) <{ordering = 0 : i64}> : (i64, !llvm.ptr) -> () loc("<stdin>":9:5)
    "omp.yield"(%arg8) : (!llvm.ptr) -> () loc("<stdin>":10:5)
  }, {
  ^bb0(%arg5: !llvm.ptr loc("<stdin>":12:8), %arg6: !llvm.ptr loc("<stdin>":12:26)):
    %13 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i64 loc("<stdin>":13:11)
    %14 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64 loc("<stdin>":14:11)
    %15 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64 loc("<stdin>":15:11)
    "llvm.br"(%13)[^bb1] : (i64) -> () loc("<stdin>":16:5)
  ^bb1(%16: i64 loc("<stdin>":17:8)):  // 2 preds: ^bb0, ^bb2
    %17 = "llvm.icmp"(%16, %14) <{predicate = 4 : i64}> : (i64, i64) -> i1 loc("<stdin>":18:11)
    "llvm.cond_br"(%17)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":19:5)
  ^bb2:  // pred: ^bb1
    %18 = "llvm.sub"(%16, %15) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64 loc("<stdin>":21:11)
    "llvm.br"(%18)[^bb1] : (i64) -> () loc("<stdin>":22:5)
  ^bb3:  // pred: ^bb1
    "omp.yield"(%arg5) : (!llvm.ptr) -> () loc("<stdin>":24:5)
  }, {
  }, {
  ^bb0(%arg4: !llvm.ptr loc("<stdin>":27:8)):
    %10 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i64 loc("<stdin>":28:11)
    %11 = "llvm.ptrtoint"(%arg4) : (!llvm.ptr) -> i64 loc("<stdin>":29:11)
    %12 = "llvm.icmp"(%11, %10) <{predicate = 1 : i64}> : (i64, i64) -> i1 loc("<stdin>":30:11)
    "llvm.cond_br"(%12)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":31:5)
  ^bb1:  // pred: ^bb0
    "llvm.br"()[^bb2] : () -> () loc("<stdin>":33:5)
  ^bb2:  // 2 preds: ^bb0, ^bb1
    "omp.yield"() : () -> () loc("<stdin>":35:5)
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "x"}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "sectionsreduction_", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":39:8)):
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":40:10)
    %1 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64 loc("<stdin>":41:10)
    %2 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64 loc("<stdin>":42:10)
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      %3 = "llvm.alloca"(%0) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (i64) -> !llvm.ptr loc("<stdin>":44:12)
      "omp.sections"(%3) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>, reduction_byref = array<i1: true>, reduction_syms = [@add_reduction_byref_box_Uxf32]}> ({
      ^bb0(%arg1: !llvm.ptr loc("<stdin>":46:12)):
        "omp.section"() ({
        ^bb0(%arg3: !llvm.ptr loc("<stdin>":48:14)):
          "llvm.br"(%0)[^bb1] : (i64) -> () loc("<stdin>":49:11)
        ^bb1(%7: i64 loc("<stdin>":50:14)):  // 2 preds: ^bb0, ^bb2
          %8 = "llvm.icmp"(%7, %1) <{predicate = 4 : i64}> : (i64, i64) -> i1 loc("<stdin>":51:16)
          "llvm.cond_br"(%8)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":52:11)
        ^bb2:  // pred: ^bb1
          %9 = "llvm.sub"(%7, %2) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64 loc("<stdin>":54:16)
          "llvm.br"(%9)[^bb1] : (i64) -> () loc("<stdin>":55:11)
        ^bb3:  // pred: ^bb1
          "omp.terminator"() : () -> () loc("<stdin>":57:11)
        }) : () -> () loc("<stdin>":47:9)
        "omp.section"() ({
        ^bb0(%arg2: !llvm.ptr loc("<stdin>":60:14)):
          "llvm.br"(%0)[^bb1] : (i64) -> () loc("<stdin>":61:11)
        ^bb1(%4: i64 loc("<stdin>":62:14)):  // 2 preds: ^bb0, ^bb2
          %5 = "llvm.icmp"(%4, %1) <{predicate = 4 : i64}> : (i64, i64) -> i1 loc("<stdin>":63:16)
          "llvm.cond_br"(%5)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":64:11)
        ^bb2:  // pred: ^bb1
          %6 = "llvm.sub"(%4, %2) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64 loc("<stdin>":66:16)
          "llvm.br"(%6)[^bb1] : (i64) -> () loc("<stdin>":67:11)
        ^bb3:  // pred: ^bb1
          "omp.terminator"() : () -> () loc("<stdin>":69:11)
        }) : () -> () loc("<stdin>":59:9)
        "omp.terminator"() : () -> () loc("<stdin>":71:9)
      }) : (!llvm.ptr) -> () loc("<stdin>":45:7)
      "omp.terminator"() : () -> () loc("<stdin>":73:7)
    }) : () -> () loc("<stdin>":43:5)
    "llvm.return"() : () -> () loc("<stdin>":75:5)
  }) {fir.internal_name = "_QPsectionsreduction"} : () -> () loc("<stdin>":38:3)
}) : () -> () loc("<stdin>":1:1)
