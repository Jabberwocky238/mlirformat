module {
  llvm.func @nnegflag_func(%arg0: i32) {
    %0 = llvm.zext nneg %arg0 : i32 to i64
    %1 = llvm.uitofp nneg %arg0 : i32 to f32
    llvm.return
  }
}

