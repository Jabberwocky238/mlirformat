"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 ()>, linkage = #llvm.linkage<external>, sym_name = "memset", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":3:10)
    %1 = "llvm.alloca"(%0) <{alignment = 8 : i64, elem_type = !llvm.array<10 x i32>}> : (i32) -> !llvm.ptr loc("<stdin>":4:10)
    %2 = "llvm.mlir.constant"() <{value = 42 : i8}> : () -> i8 loc("<stdin>":5:10)
    %3 = "llvm.mlir.constant"() <{value = 16 : i32}> : () -> i32 loc("<stdin>":6:10)
    "llvm.intr.memset"(%1, %2, %3) <{isVolatile = false}> : (!llvm.ptr, i8, i32) -> () loc("<stdin>":7:5)
    %4 = "llvm.getelementptr"(%1) <{elem_type = !llvm.array<10 x i32>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 1>}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":8:10)
    %5 = "llvm.load"(%4) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":9:10)
    "llvm.return"(%5) : (i32) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
