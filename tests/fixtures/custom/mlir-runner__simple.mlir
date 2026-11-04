module {
  llvm.func @logbf(f32) -> f32
  llvm.func @malloc(i64) -> !llvm.ptr
  llvm.func @free(!llvm.ptr)
  llvm.func @main() -> f32 {
    %0 = llvm.mlir.constant(-4.200000e+02 : f32) : f32
    %1 = llvm.call @logbf(%0) : (f32) -> f32
    llvm.return %1 : f32
  }
  llvm.func @allocation() -> !llvm.ptr {
    %0 = llvm.mlir.constant(4 : index) : i64
    %1 = llvm.call @malloc(%0) : (i64) -> !llvm.ptr
    llvm.return %1 : !llvm.ptr
  }
  llvm.func @deallocation(%arg0: !llvm.ptr) {
    llvm.call @free(%arg0) : (!llvm.ptr) -> ()
    llvm.return
  }
  llvm.func @foo() -> f32 {
    %0 = llvm.call @allocation() : () -> !llvm.ptr
    %1 = llvm.mlir.constant(0 : index) : i64
    %2 = llvm.mlir.constant(1.234000e+03 : f32) : f32
    %3 = llvm.getelementptr %0[%1] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %2, %3 : f32, !llvm.ptr
    %4 = llvm.getelementptr %0[%1] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %5 = llvm.load %4 : !llvm.ptr -> f32
    llvm.call @deallocation(%0) : (!llvm.ptr) -> ()
    llvm.return %5 : f32
  }
  llvm.func @int32_main() -> i32 {
    %0 = llvm.mlir.constant(42 : i32) : i32
    llvm.return %0 : i32
  }
  llvm.func @int64_main() -> i64 {
    %0 = llvm.mlir.constant(42 : i64) : i64
    llvm.return %0 : i64
  }
}

