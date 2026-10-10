module {
  llvm.func @foo() -> i32
  llvm.func @test_none() -> i32 {
    %0 = llvm.call @foo() : () -> i32
    llvm.return %0 : i32
  }
  llvm.func @test_default() -> i32 {
    %0 = llvm.call @foo() : () -> i32
    llvm.return %0 : i32
  }
  llvm.func @test_musttail() -> i32 {
    %0 = llvm.call musttail @foo() : () -> i32
    llvm.return %0 : i32
  }
  llvm.func @test_tail() -> i32 {
    %0 = llvm.call tail @foo() : () -> i32
    llvm.return %0 : i32
  }
  llvm.func @test_notail() -> i32 {
    %0 = llvm.call notail @foo() : () -> i32
    llvm.return %0 : i32
  }
}

