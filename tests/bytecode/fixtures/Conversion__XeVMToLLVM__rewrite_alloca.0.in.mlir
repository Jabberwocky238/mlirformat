"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr<3> ()>, linkage = #llvm.linkage<external>, sym_name = "test_with_parent_module", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32 loc("<stdin>":3:10)
    %1 = "llvm.alloca"(%0) <{alignment = 8 : i64, elem_type = i32}> : (i32) -> !llvm.ptr<3> loc("<stdin>":4:10)
    %2 = "llvm.alloca"(%0) <{alignment = 8 : i64, elem_type = i32}> : (i32) -> !llvm.ptr<3> loc("<stdin>":5:10)
    %3 = "llvm.alloca"(%0) <{alignment = 8 : i64, elem_type = i32}> : (i32) -> !llvm.ptr<3> loc("<stdin>":6:10)
    %4 = "llvm.load"(%2) <{ordering = 0 : i64}> : (!llvm.ptr<3>) -> i32 loc("<stdin>":7:10)
    %5 = "llvm.load"(%3) <{ordering = 0 : i64}> : (!llvm.ptr<3>) -> i32 loc("<stdin>":8:10)
    %6 = "llvm.add"(%4, %5) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32 loc("<stdin>":9:10)
    "llvm.store"(%6, %1) <{ordering = 0 : i64}> : (i32, !llvm.ptr<3>) -> () loc("<stdin>":10:5)
    "llvm.return"(%1) : (!llvm.ptr<3>) -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
