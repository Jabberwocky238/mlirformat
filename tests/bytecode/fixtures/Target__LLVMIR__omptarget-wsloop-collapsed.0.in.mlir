"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "target_collapsed_wsloop", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":3:8)):
    %0 = "llvm.mlir.constant"() <{value = 99 : i32}> : () -> i32 loc("<stdin>":4:10)
    %1 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":5:10)
    %2 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i32 loc("<stdin>":6:10)
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%1, %1, %0, %0, %2, %2) <{collapse_num_loops = 2 : i64, loop_inclusive}> ({
      ^bb0(%arg1: i32 loc("<stdin>":9:12), %arg2: i32 loc("<stdin>":9:24)):
        %3 = "llvm.add"(%arg1, %arg2) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32 loc("<stdin>":10:14)
        %4 = "llvm.mul"(%arg2, %0) <{overflowFlags = 1 : i32}> : (i32, i32) -> i32 loc("<stdin>":11:14)
        %5 = "llvm.add"(%arg1, %4) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32 loc("<stdin>":12:14)
        %6 = "llvm.getelementptr"(%arg0, %5) <{elem_type = i32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i32) -> !llvm.ptr loc("<stdin>":13:14)
        "llvm.store"(%3, %6) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":14:9)
        "omp.yield"() : () -> () loc("<stdin>":15:9)
      }) : (i32, i32, i32, i32, i32, i32) -> () loc("<stdin>":8:7)
    }) : () -> () loc("<stdin>":7:5)
    "llvm.return"() : () -> () loc("<stdin>":18:5)
  }) {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (to)>} : () -> () loc("<stdin>":2:3)
}) {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.data_layout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8", llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_gpu = true, omp.is_target_device = true} : () -> () loc("<stdin>":1:1)
