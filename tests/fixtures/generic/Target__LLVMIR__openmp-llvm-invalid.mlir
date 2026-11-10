"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32)>, linkage = #llvm.linkage<external>, sym_name = "omp_atomic_update_multiple_step_update", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: i32):
    "omp.atomic.update"(%arg0) ({
    ^bb0(%arg2: i32):
      %0 = "llvm.mul"(%arg2, %arg1) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      %1 = "llvm.sdiv"(%0, %arg1) : (i32, i32) -> i32
      %2 = "llvm.add"(%arg2, %1) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      "omp.yield"(%2) : (i32) -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr, i32)>, linkage = #llvm.linkage<external>, sym_name = "omp_atomic_update_multiple_step_update", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: i32):
    "omp.atomic.capture"() <{memory_order = #omp<memoryorderkind seq_cst>}> ({
      "omp.atomic.read"(%arg0, %arg1) <{element_type = i32}> : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.atomic.update"(%arg0) ({
      ^bb0(%arg3: i32):
        %0 = "llvm.mul"(%arg3, %arg2) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        %1 = "llvm.sdiv"(%0, %arg2) : (i32, i32) -> i32
        %2 = "llvm.add"(%arg3, %1) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        "omp.yield"(%2) : (i32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

