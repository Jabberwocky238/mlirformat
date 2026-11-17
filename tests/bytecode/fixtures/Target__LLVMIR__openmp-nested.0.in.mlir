"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (ptr, ...)>, linkage = #llvm.linkage<external>, sym_name = "printf", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":2:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = !llvm.array<29 x i8>, linkage = #llvm.linkage<internal>, sym_name = "str0", unnamed_addr = 0 : i64, value = "WG size of kernel = %d X %d\0A\00", visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":4:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i32, ptr)>, linkage = #llvm.linkage<external>, sym_name = "main", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32 loc("<stdin>":7:8), %arg1: !llvm.ptr loc("<stdin>":7:20)):
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      %1 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64 loc("<stdin>":9:12)
      %2 = "llvm.mlir.constant"() <{value = 10 : index}> : () -> i64 loc("<stdin>":10:12)
      %3 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64 loc("<stdin>":11:12)
      %4 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":12:12)
      %5 = "llvm.alloca"(%1) <{elem_type = i64}> : (i64) -> !llvm.ptr loc("<stdin>":13:12)
      "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
        "omp.loop_nest"(%3, %2, %1) ({
        ^bb0(%arg2: i64 loc("<stdin>":16:14)):
          "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
            "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
              "omp.loop_nest"(%3, %1, %1) ({
              ^bb0(%arg3: i64 loc("<stdin>":20:20)):
                "llvm.store"(%3, %5) <{ordering = 0 : i64}> : (i64, !llvm.ptr) -> () loc("<stdin>":21:17)
                "omp.yield"() : () -> () loc("<stdin>":22:17)
              }) : (i64, i64, i64) -> () loc("<stdin>":19:15)
            }) : () -> () loc("<stdin>":18:13)
            "omp.terminator"() : () -> () loc("<stdin>":25:13)
          }) : () -> () loc("<stdin>":17:11)
          %6 = "llvm.load"(%5) <{ordering = 0 : i64}> : (!llvm.ptr) -> i64 loc("<stdin>":27:16)
          %7 = "llvm.trunc"(%6) <{overflowFlags = 0 : i32}> : (i64) -> i32 loc("<stdin>":28:16)
          %8 = "llvm.mlir.addressof"() <{global_name = @str0}> : () -> !llvm.ptr loc("<stdin>":29:16)
          %9 = "llvm.getelementptr"(%8, %4, %4) <{elem_type = !llvm.array<29 x i8>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648, -2147483648>}> : (!llvm.ptr, i32, i32) -> !llvm.ptr loc("<stdin>":30:16)
          %10 = "llvm.call"(%9, %7, %7) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @printf, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 3, 0>, var_callee_type = !llvm.func<i32 (ptr, ...)>}> : (!llvm.ptr, i32, i32) -> i32 loc("<stdin>":31:17)
          "omp.yield"() : () -> () loc("<stdin>":32:11)
        }) : (i64, i64, i64) -> () loc("<stdin>":15:9)
      }) : () -> () loc("<stdin>":14:7)
      "omp.terminator"() : () -> () loc("<stdin>":35:7)
    }) : () -> () loc("<stdin>":8:5)
    %0 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":37:10)
    "llvm.return"(%0) : (i32) -> () loc("<stdin>":38:5)
  }) : () -> () loc("<stdin>":6:3)
}) : () -> () loc("<stdin>":1:1)
