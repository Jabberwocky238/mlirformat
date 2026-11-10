"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "llvm_nvvm_barrier", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: i32, %arg3: i32, %arg4: i32):
    "nvvm.barrier"() <{aligned = true, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "nvvm.barrier"(%arg2) <{aligned = true, operandSegmentSizes = array<i32: 1, 0>}> : (i32) -> ()
    "nvvm.barrier"(%arg2, %arg3) <{aligned = true, operandSegmentSizes = array<i32: 1, 1>}> : (i32, i32) -> ()
    "nvvm.barrier"(%arg3) <{aligned = true, operandSegmentSizes = array<i32: 0, 1>}> : (i32) -> ()
    %0 = "nvvm.barrier.reduction"(%arg4) <{aligned = true, reductionOp = #nvvm.reduction<and>}> : (i32) -> i32
    %1 = "nvvm.barrier.reduction"(%arg4) <{aligned = true, reductionOp = #nvvm.reduction<or>}> : (i32) -> i32
    %2 = "nvvm.barrier.reduction"(%arg4) <{aligned = true, reductionOp = #nvvm.reduction<popc>}> : (i32) -> i32
    %3 = "nvvm.barrier.reduction"(%arg2, %arg4) <{aligned = true, reductionOp = #nvvm.reduction<and>}> : (i32, i32) -> i32
    "nvvm.barrier"() <{aligned = false, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "nvvm.barrier"(%arg2, %arg3) <{aligned = false, operandSegmentSizes = array<i32: 1, 1>}> : (i32, i32) -> ()
    %4 = "nvvm.barrier.reduction"(%arg4) <{aligned = false, reductionOp = #nvvm.reduction<and>}> : (i32) -> i32
    %5 = "nvvm.barrier.reduction"(%arg4) <{aligned = false, reductionOp = #nvvm.reduction<or>}> : (i32) -> i32
    %6 = "nvvm.barrier.reduction"(%arg4) <{aligned = false, reductionOp = #nvvm.reduction<popc>}> : (i32) -> i32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "llvm_nvvm_barrier_arrive", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    "nvvm.barrier.arrive"(%arg1) <{aligned = true}> : (i32) -> ()
    "nvvm.barrier.arrive"(%arg0, %arg1) <{aligned = true}> : (i32, i32) -> ()
    "nvvm.barrier.arrive"(%arg1) <{aligned = false}> : (i32) -> ()
    "nvvm.barrier.arrive"(%arg0, %arg1) <{aligned = false}> : (i32, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

