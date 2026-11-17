"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i8)>, linkage = #llvm.linkage<external>, sym_name = "basic_memset", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i8 loc("<stdin>":3:8)):
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":4:10)
    %1 = "llvm.alloca"(%0) <{alignment = 4 : i64, elem_type = i32}> : (i32) -> !llvm.ptr loc("<stdin>":5:10)
    %2 = "llvm.mlir.constant"() <{value = 4 : i32}> : () -> i32 loc("<stdin>":6:10)
    "llvm.intr.memset"(%1, %arg0, %2) <{isVolatile = false}> : (!llvm.ptr, i8, i32) -> () loc("<stdin>":7:5)
    %3 = "llvm.load"(%1) <{alignment = 4 : i64, ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":8:10)
    "llvm.return"(%3) : (i32) -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
