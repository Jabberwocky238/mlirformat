module {
  llvm.func @somefunc(i32, !llvm.ptr)
  llvm.func @test_call_arg_attrs_direct(%arg0: i32, %arg1: !llvm.ptr) {
    llvm.call @somefunc(%arg0, %arg1) : (i32, !llvm.ptr {llvm.byval = i64}) -> ()
    llvm.return
  }
  llvm.func @test_call_arg_attrs_indirect(%arg0: i16, %arg1: !llvm.ptr) -> i16 {
    %0 = llvm.call tail %arg1(%arg0) : !llvm.ptr, (i16 {llvm.noundef, llvm.signext}) -> (i16 {llvm.signext})
    llvm.return %0 : i16
  }
}

