"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "test_simd_linear_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_simd_linear", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %2 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32
    %3 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32
    %4 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "j"} : (i64) -> !llvm.ptr
    %5 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.wsloop"(%5) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0, 0>, private_syms = [@test_simd_linear_private_i32]}> ({
      ^bb0(%arg0: !llvm.ptr):
        "omp.loop_nest"(%1, %3, %1) <{loop_inclusive}> ({
        ^bb0(%arg1: i32):
          "llvm.store"(%arg1, %arg0) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
          "llvm.store"(%2, %4) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
          "omp.simd"(%4, %1) <{linear_modifiers = [unit], linear_var_types = [i32], operandSegmentSizes = array<i32: 0, 0, 1, 1, 0, 0, 0>}> ({
            "omp.loop_nest"(%1, %3, %1) <{loop_inclusive}> ({
            ^bb0(%arg2: i32):
              "llvm.store"(%arg2, %4) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
              "omp.yield"() : () -> ()
            }) : (i32, i32, i32) -> ()
          }) : (!llvm.ptr, i32) -> ()
          "omp.yield"() : () -> ()
        }) : (i32, i32, i32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "test_simd_linear2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
    %1 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %2 = "llvm.mlir.constant"() <{value = 100 : index}> : () -> i64
    %3 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %4 = "llvm.mlir.constant"() <{value = 100 : i32}> : () -> i32
    %5 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr
    "llvm.br"(%3, %2)[^bb1] : (i32, i64) -> ()
  ^bb1(%6: i32, %7: i64):  // 2 preds: ^bb0, ^bb2
    %8 = "llvm.icmp"(%7, %0) <{predicate = 4 : i64}> : (i64, i64) -> i1
    "llvm.cond_br"(%8)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb2:  // pred: ^bb1
    "llvm.store"(%6, %5) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    %9 = "llvm.load"(%5) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    %10 = "llvm.add"(%9, %3) <{overflowFlags = 1 : i32}> : (i32, i32) -> i32
    %11 = "llvm.sub"(%7, %1) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    "llvm.br"(%10, %11)[^bb1] : (i32, i64) -> ()
  ^bb3:  // pred: ^bb1
    "llvm.store"(%6, %5) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    "omp.simd"(%5, %3) <{linear_modifiers = [unit], linear_var_types = [i32], operandSegmentSizes = array<i32: 0, 0, 1, 1, 0, 0, 0>}> ({
      "omp.loop_nest"(%3, %4, %3) <{loop_inclusive}> ({
      ^bb0(%arg1: i32):
        "llvm.store"(%arg1, %5) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
        %12 = "llvm.load"(%5) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
        %13 = "llvm.sext"(%12) : (i32) -> i64
        %14 = "llvm.sub"(%13, %1) <{overflowFlags = 3 : i32}> : (i64, i64) -> i64
        %15 = "llvm.mul"(%14, %1) <{overflowFlags = 3 : i32}> : (i64, i64) -> i64
        %16 = "llvm.mul"(%15, %1) <{overflowFlags = 3 : i32}> : (i64, i64) -> i64
        %17 = "llvm.add"(%16, %0) <{overflowFlags = 3 : i32}> : (i64, i64) -> i64
        %18 = "llvm.getelementptr"(%arg0, %17) <{elem_type = i32, noWrapFlags = 6 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
        "llvm.store"(%12, %18) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : (!llvm.ptr, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

