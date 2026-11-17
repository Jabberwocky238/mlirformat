"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "test_phi_locations", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":3:8)):
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":4:10)
    %1 = "llvm.mlir.constant"() <{value = 100 : i32}> : () -> i32 loc("<stdin>":5:10)
    "llvm.br"(%1, %0)[^bb1] : (i32, i64) -> () loc("<stdin>":6:5)
  ^bb1(%2: i32 loc("<stdin>":7:8), %3: i64 loc("<stdin>":7:17)):  // 2 preds: ^bb0, ^bb1
    %4 = "llvm.icmp"(%3, %0) <{predicate = 4 : i64}> : (i64, i64) -> i1 loc("<stdin>":8:10)
    "llvm.cond_br"(%4, %2, %3)[^bb2, ^bb1] <{operandSegmentSizes = array<i32: 1, 0, 2>}> : (i1, i32, i64) -> () loc("<stdin>":9:5)
  ^bb2:  // pred: ^bb1
    "llvm.return"() : () -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
