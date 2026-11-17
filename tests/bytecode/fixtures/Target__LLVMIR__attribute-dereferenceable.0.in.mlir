"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64, ptr)>, linkage = #llvm.linkage<external>, sym_name = "deref", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: i64 loc("<stdin>":3:8), %arg3: !llvm.ptr loc("<stdin>":3:20)):
    %3 = "llvm.inttoptr"(%arg2) <{dereferenceable = #llvm.dereferenceable<bytes = 4>}> : (i64) -> !llvm.ptr loc("<stdin>":4:10)
    %4 = "llvm.load"(%3) <{alignment = 4 : i64, ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":5:10)
    %5 = "llvm.load"(%arg3) <{alignment = 8 : i64, dereferenceable = #llvm.dereferenceable<bytes = 8>, ordering = 0 : i64}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":6:10)
    "llvm.store"(%4, %5) <{alignment = 4 : i64, ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":7:5)
    "llvm.return"() : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64, ptr)>, linkage = #llvm.linkage<external>, sym_name = "deref_or_null", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64 loc("<stdin>":11:8), %arg1: !llvm.ptr loc("<stdin>":11:20)):
    %0 = "llvm.inttoptr"(%arg0) <{dereferenceable = #llvm.dereferenceable<bytes = 4, mayBeNull = true>}> : (i64) -> !llvm.ptr loc("<stdin>":12:10)
    %1 = "llvm.load"(%0) <{alignment = 4 : i64, ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":13:10)
    %2 = "llvm.load"(%arg1) <{alignment = 8 : i64, dereferenceable = #llvm.dereferenceable<bytes = 8, mayBeNull = true>, ordering = 0 : i64}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":14:10)
    "llvm.store"(%1, %2) <{alignment = 4 : i64, ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":15:5)
    "llvm.return"() : () -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":10:3)
}) : () -> () loc("<stdin>":1:1)
