module {
  llvm.func @test_with_parent_module() -> !llvm.ptr<3> {
    %0 = llvm.mlir.constant(10 : i32) : i32
    %1 = llvm.alloca %0 x i32 {alignment = 8 : i64} : (i32) -> !llvm.ptr<3>
    %2 = llvm.alloca %0 x i32 {alignment = 8 : i64} : (i32) -> !llvm.ptr<3>
    %3 = llvm.alloca %0 x i32 {alignment = 8 : i64} : (i32) -> !llvm.ptr<3>
    %4 = llvm.load %2 : !llvm.ptr<3> -> i32
    %5 = llvm.load %3 : !llvm.ptr<3> -> i32
    %6 = llvm.add %4, %5 : i32
    llvm.store %6, %1 : i32, !llvm.ptr<3>
    llvm.return %1 : !llvm.ptr<3>
  }
}

// -----
module {
  gpu.module @test {
    llvm.func @test_with_parent_gpu_module() -> !llvm.ptr<3> {
      %0 = llvm.mlir.constant(10 : i32) : i32
      %1 = llvm.alloca %0 x i32 {alignment = 8 : i64} : (i32) -> !llvm.ptr<3>
      %2 = llvm.alloca %0 x i32 {alignment = 8 : i64} : (i32) -> !llvm.ptr<3>
      %3 = llvm.alloca %0 x i32 {alignment = 8 : i64} : (i32) -> !llvm.ptr<3>
      %4 = llvm.load %2 : !llvm.ptr<3> -> i32
      %5 = llvm.load %3 : !llvm.ptr<3> -> i32
      %6 = llvm.add %4, %5 : i32
      llvm.store %6, %1 : i32, !llvm.ptr<3>
      llvm.return %1 : !llvm.ptr<3>
    }
  }
}

// -----
module {
  llvm.func @test_with_default_addr_space() -> !llvm.ptr {
    %0 = llvm.mlir.constant(10 : i32) : i32
    %1 = llvm.alloca %0 x i32 {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.alloca %0 x i32 {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %3 = llvm.alloca %0 x i32 {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %4 = llvm.load %2 : !llvm.ptr -> i32
    %5 = llvm.load %3 : !llvm.ptr -> i32
    %6 = llvm.add %4, %5 : i32
    llvm.store %6, %1 : i32, !llvm.ptr
    llvm.return %1 : !llvm.ptr
  }
}

