"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (i32, i32, i32, i8, i1, i8)>, linkage = #llvm.linkage<external>, sym_name = "tcgen05_mma_smem_desc_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i8, %arg4: i1, %arg5: i8):
    %0 = "nvvm.tcgen05.mma_smem_desc"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5) : (i32, i32, i32, i8, i1, i8) -> i64
    "llvm.return"(%0) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

