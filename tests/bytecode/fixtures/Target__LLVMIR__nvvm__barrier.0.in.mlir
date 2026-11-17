"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "llvm_nvvm_barrier", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: i32 loc("<stdin>":3:8), %arg3: i32 loc("<stdin>":3:20), %arg4: i32 loc("<stdin>":3:32)):
    "nvvm.barrier"() <{aligned = true, operandSegmentSizes = array<i32: 0, 0>}> : () -> () loc("<stdin>":4:5)
    "nvvm.barrier"(%arg2) <{aligned = true, operandSegmentSizes = array<i32: 1, 0>}> : (i32) -> () loc("<stdin>":5:5)
    "nvvm.barrier"(%arg2, %arg3) <{aligned = true, operandSegmentSizes = array<i32: 1, 1>}> : (i32, i32) -> () loc("<stdin>":6:5)
    "nvvm.barrier"(%arg3) <{aligned = true, operandSegmentSizes = array<i32: 0, 1>}> : (i32) -> () loc("<stdin>":7:5)
    %0 = "nvvm.barrier.reduction"(%arg4) <{aligned = true, reductionOp = #nvvm.reduction<and>}> : (i32) -> i32 loc("<stdin>":8:10)
    %1 = "nvvm.barrier.reduction"(%arg4) <{aligned = true, reductionOp = #nvvm.reduction<or>}> : (i32) -> i32 loc("<stdin>":9:10)
    %2 = "nvvm.barrier.reduction"(%arg4) <{aligned = true, reductionOp = #nvvm.reduction<popc>}> : (i32) -> i32 loc("<stdin>":10:10)
    %3 = "nvvm.barrier.reduction"(%arg2, %arg4) <{aligned = true, reductionOp = #nvvm.reduction<and>}> : (i32, i32) -> i32 loc("<stdin>":11:10)
    "nvvm.barrier"() <{aligned = false, operandSegmentSizes = array<i32: 0, 0>}> : () -> () loc("<stdin>":12:5)
    "nvvm.barrier"(%arg2, %arg3) <{aligned = false, operandSegmentSizes = array<i32: 1, 1>}> : (i32, i32) -> () loc("<stdin>":13:5)
    %4 = "nvvm.barrier.reduction"(%arg4) <{aligned = false, reductionOp = #nvvm.reduction<and>}> : (i32) -> i32 loc("<stdin>":14:10)
    %5 = "nvvm.barrier.reduction"(%arg4) <{aligned = false, reductionOp = #nvvm.reduction<or>}> : (i32) -> i32 loc("<stdin>":15:10)
    %6 = "nvvm.barrier.reduction"(%arg4) <{aligned = false, reductionOp = #nvvm.reduction<popc>}> : (i32) -> i32 loc("<stdin>":16:10)
    "llvm.return"() : () -> () loc("<stdin>":17:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "llvm_nvvm_barrier_arrive", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32 loc("<stdin>":20:8), %arg1: i32 loc("<stdin>":20:20)):
    "nvvm.barrier.arrive"(%arg1) <{aligned = true}> : (i32) -> () loc("<stdin>":21:5)
    "nvvm.barrier.arrive"(%arg0, %arg1) <{aligned = true}> : (i32, i32) -> () loc("<stdin>":22:5)
    "nvvm.barrier.arrive"(%arg1) <{aligned = false}> : (i32) -> () loc("<stdin>":23:5)
    "nvvm.barrier.arrive"(%arg0, %arg1) <{aligned = false}> : (i32, i32) -> () loc("<stdin>":24:5)
    "llvm.return"() : () -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":19:3)
}) : () -> () loc("<stdin>":1:1)
