"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (ptr, ...)>, linkage = #llvm.linkage<external>, sym_name = "printf", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = !llvm.array<29 x i8>, linkage = #llvm.linkage<internal>, sym_name = "str0", unnamed_addr = 0 : i64, value = "WG size of kernel = %d X %d\0A\00", visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i32, ptr)>, linkage = #llvm.linkage<external>, sym_name = "main", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: !llvm.ptr):
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      %1 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
      %2 = "llvm.mlir.constant"() <{value = 10 : index}> : () -> i64
      %3 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
      %4 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
      %5 = "llvm.alloca"(%1) <{elem_type = i64}> : (i64) -> !llvm.ptr
      "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
        "omp.loop_nest"(%3, %2, %1) ({
        ^bb0(%arg2: i64):
          "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
            "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
              "omp.loop_nest"(%3, %1, %1) ({
              ^bb0(%arg3: i64):
                "llvm.store"(%3, %5) <{ordering = 0 : i64}> : (i64, !llvm.ptr) -> ()
                "omp.yield"() : () -> ()
              }) : (i64, i64, i64) -> ()
            }) : () -> ()
            "omp.terminator"() : () -> ()
          }) : () -> ()
          %6 = "llvm.load"(%5) <{ordering = 0 : i64}> : (!llvm.ptr) -> i64
          %7 = "llvm.trunc"(%6) <{overflowFlags = 0 : i32}> : (i64) -> i32
          %8 = "llvm.mlir.addressof"() <{global_name = @str0}> : () -> !llvm.ptr
          %9 = "llvm.getelementptr"(%8, %4, %4) <{elem_type = !llvm.array<29 x i8>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648, -2147483648>}> : (!llvm.ptr, i32, i32) -> !llvm.ptr
          %10 = "llvm.call"(%9, %7, %7) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @printf, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 3, 0>, var_callee_type = !llvm.func<i32 (ptr, ...)>}> : (!llvm.ptr, i32, i32) -> i32
          "omp.yield"() : () -> ()
        }) : (i64, i64, i64) -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    %0 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    "llvm.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

