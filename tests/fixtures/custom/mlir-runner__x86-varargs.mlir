module {
  llvm.func @caller() -> i32 {
    %0 = llvm.mlir.constant(3 : i32) : i32
    %1 = llvm.mlir.constant(2 : i32) : i32
    %2 = llvm.mlir.constant(1 : i32) : i32
    %3 = llvm.call @foo(%2, %1, %0) vararg(!llvm.func<i32 (i32, ...)>) : (i32, i32, i32) -> i32
    llvm.return %3 : i32
  }
  llvm.func @foo(%arg0: i32, ...) -> i32 {
    %0 = llvm.mlir.constant(8 : i64) : i64
    %1 = llvm.mlir.constant(2 : i32) : i32
    %2 = llvm.mlir.constant(0 : i64) : i64
    %3 = llvm.mlir.constant(0 : i64) : i64
    %4 = llvm.mlir.constant(8 : i32) : i32
    %5 = llvm.mlir.constant(3 : i32) : i32
    %6 = llvm.mlir.constant(0 : i64) : i64
    %7 = llvm.mlir.constant(0 : i64) : i64
    %8 = llvm.mlir.constant(41 : i32) : i32
    %9 = llvm.mlir.constant(0 : i32) : i32
    %10 = llvm.mlir.constant(0 : i64) : i64
    %11 = llvm.mlir.constant(0 : i64) : i64
    %12 = llvm.mlir.constant(1 : i32) : i32
    %13 = llvm.alloca %12 x !llvm.array<1 x struct<"struct.va_list", (i32, i32, ptr, ptr)>> {alignment = 8 : i64} : (i32) -> !llvm.ptr
    llvm.intr.vastart %13 : !llvm.ptr
    %14 = llvm.getelementptr %13[%11, %10, 0] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1 x struct<"struct.va_list", (i32, i32, ptr, ptr)>>
    %15 = llvm.load %14 : !llvm.ptr -> i32
    %16 = llvm.icmp "ult" %15, %8 : i32
    llvm.cond_br %16, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    %17 = llvm.getelementptr %13[%7, %6, 3] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1 x struct<"struct.va_list", (i32, i32, ptr, ptr)>>
    %18 = llvm.load %17 : !llvm.ptr -> !llvm.ptr
    %19 = llvm.zext %15 : i32 to i64
    %20 = llvm.getelementptr %18[%19] : (!llvm.ptr, i64) -> !llvm.ptr, i8
    %21 = llvm.add %15, %4 : i32
    llvm.store %21, %14 : i32, !llvm.ptr
    llvm.br ^bb3(%20 : !llvm.ptr)
  ^bb2:  // pred: ^bb0
    %22 = llvm.getelementptr %13[%3, %2, 2] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<1 x struct<"struct.va_list", (i32, i32, ptr, ptr)>>
    %23 = llvm.load %22 : !llvm.ptr -> !llvm.ptr
    %24 = llvm.getelementptr %23[%0] : (!llvm.ptr, i64) -> !llvm.ptr, i8
    llvm.store %24, %22 : !llvm.ptr, !llvm.ptr
    llvm.br ^bb3(%23 : !llvm.ptr)
  ^bb3(%25: !llvm.ptr):  // 2 preds: ^bb1, ^bb2
    %26 = llvm.load %25 : !llvm.ptr -> i32
    llvm.intr.vaend %13 : !llvm.ptr
    llvm.return %26 : i32
  }
}

