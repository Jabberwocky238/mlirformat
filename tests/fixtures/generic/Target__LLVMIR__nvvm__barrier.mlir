"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "llvm_nvvm_barrier", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i32):
    "nvvm.barrier"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> ()
    "nvvm.barrier"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i32) -> ()
    "nvvm.barrier"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0>}> : (i32, i32) -> ()
    %0 = "nvvm.barrier"(%arg2) <{operandSegmentSizes = array<i32: 0, 0, 1>, reductionOp = #nvvm.reduction<and>}> : (i32) -> i32
    %1 = "nvvm.barrier"(%arg2) <{operandSegmentSizes = array<i32: 0, 0, 1>, reductionOp = #nvvm.reduction<or>}> : (i32) -> i32
    %2 = "nvvm.barrier"(%arg2) <{operandSegmentSizes = array<i32: 0, 0, 1>, reductionOp = #nvvm.reduction<popc>}> : (i32) -> i32
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

