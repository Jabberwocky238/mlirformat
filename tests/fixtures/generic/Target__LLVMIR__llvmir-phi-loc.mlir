"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "test_phi_locations", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.mlir.constant"() <{value = 100 : i32}> : () -> i32
    "llvm.br"(%1, %0)[^bb1] : (i32, i64) -> ()
  ^bb1(%2: i32, %3: i64):  // 2 preds: ^bb0, ^bb1
    %4 = "llvm.icmp"(%3, %0) <{predicate = 4 : i64}> : (i64, i64) -> i1
    "llvm.cond_br"(%4, %2, %3)[^bb2, ^bb1] <{operandSegmentSizes = array<i32: 1, 0, 2>}> : (i1, i32, i64) -> ()
  ^bb2:  // pred: ^bb1
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

