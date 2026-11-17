"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (ptr, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "ib0", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":3:8), %arg1: i32 loc("<stdin>":3:26), %arg2: i32 loc("<stdin>":3:38)):
    "llvm.indirectbr"(%arg0, %arg1, %arg2, %arg1)[^bb1, ^bb2] <{indbr_operand_segments = array<i32: 1, 2>}> : (!llvm.ptr, i32, i32, i32) -> () loc("<stdin>":4:5)
  ^bb1(%0: i32 loc("<stdin>":5:8)):  // pred: ^bb0
    "llvm.return"(%0) : (i32) -> () loc("<stdin>":6:5)
  ^bb2(%1: i32 loc("<stdin>":7:8), %2: i32 loc("<stdin>":7:17)):  // pred: ^bb0
    %3 = "llvm.add"(%1, %2) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32 loc("<stdin>":8:10)
    "llvm.return"(%3) : (i32) -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
