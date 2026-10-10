module {
  llvm.func @foo() -> !llvm.ptr
  llvm.func @with_byval_arg(%arg0: !llvm.ptr {llvm.byval = f64}) {
    llvm.return
  }
  llvm.func @test_byval() {
    %0 = llvm.call @foo() : () -> !llvm.ptr
    llvm.call @with_byval_arg(%0) : (!llvm.ptr) -> ()
    llvm.return
  }
}

