"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i16, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "_QPopenmp_target", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i16 loc("<stdin>":3:8), %arg1: i32 loc("<stdin>":3:20), %arg2: i64 loc("<stdin>":3:32)):
    %0 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":4:10)
    %1 = "llvm.mlir.constant"() <{value = 1 : i16}> : () -> i16 loc("<stdin>":5:10)
    "omp.target"(%1, %0, %0, %0) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0>}> ({
    ^bb0(%arg18: i32 loc("<stdin>":7:10), %arg19: i32 loc("<stdin>":7:23), %arg20: i32 loc("<stdin>":7:36)):
      "omp.terminator"() : () -> () loc("<stdin>":8:7)
    }) : (i16, i32, i32, i32) -> () loc("<stdin>":6:5)
    %2 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32 loc("<stdin>":10:10)
    "omp.target"(%2, %0, %0, %0) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0>}> ({
    ^bb0(%arg15: i32 loc("<stdin>":12:10), %arg16: i32 loc("<stdin>":12:23), %arg17: i32 loc("<stdin>":12:36)):
      "omp.terminator"() : () -> () loc("<stdin>":13:7)
    }) : (i32, i32, i32, i32) -> () loc("<stdin>":11:5)
    %3 = "llvm.mlir.constant"() <{value = 3 : i64}> : () -> i64 loc("<stdin>":15:10)
    "omp.target"(%3, %0, %0, %0) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0>}> ({
    ^bb0(%arg12: i32 loc("<stdin>":17:10), %arg13: i32 loc("<stdin>":17:23), %arg14: i32 loc("<stdin>":17:36)):
      "omp.terminator"() : () -> () loc("<stdin>":18:7)
    }) : (i64, i32, i32, i32) -> () loc("<stdin>":16:5)
    "omp.target"(%arg0, %0, %0, %0) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0>}> ({
    ^bb0(%arg9: i32 loc("<stdin>":21:10), %arg10: i32 loc("<stdin>":21:22), %arg11: i32 loc("<stdin>":21:35)):
      "omp.terminator"() : () -> () loc("<stdin>":22:7)
    }) : (i16, i32, i32, i32) -> () loc("<stdin>":20:5)
    "omp.target"(%arg1, %0, %0, %0) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0>}> ({
    ^bb0(%arg6: i32 loc("<stdin>":25:10), %arg7: i32 loc("<stdin>":25:22), %arg8: i32 loc("<stdin>":25:34)):
      "omp.terminator"() : () -> () loc("<stdin>":26:7)
    }) : (i32, i32, i32, i32) -> () loc("<stdin>":24:5)
    "omp.target"(%arg2, %0, %0, %0) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0>}> ({
    ^bb0(%arg3: i32 loc("<stdin>":29:10), %arg4: i32 loc("<stdin>":29:22), %arg5: i32 loc("<stdin>":29:34)):
      "omp.terminator"() : () -> () loc("<stdin>":30:7)
    }) : (i64, i32, i32, i32) -> () loc("<stdin>":28:5)
    "llvm.return"() : () -> () loc("<stdin>":32:5)
  }) : () -> () loc("<stdin>":2:3)
}) {omp.is_target_device = false, omp.target_triples = ["nvptx64-nvidia-cuda"]} : () -> () loc("<stdin>":1:1)
