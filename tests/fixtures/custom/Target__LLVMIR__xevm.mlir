module {
  llvm.func spir_funccc @_Z8prefetchPU3AS1Kcm(!llvm.ptr<1>, i64)
  llvm.func @prefetch(%arg0: !llvm.ptr<1>) {
    %0 = llvm.mlir.constant(1 : i64) : i64
    llvm.call spir_funccc @_Z8prefetchPU3AS1Kcm(%arg0, %0) {function_type = !llvm.func<void (ptr<1>, i64)>, linkage = #llvm.linkage<external>, no_unwind, sym_name = "_Z8prefetchPU3AS1Kcm", visibility_ = 0 : i64} : (!llvm.ptr<1>, i64) -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @load(%arg0: !llvm.ptr<1>) -> i32 {
    %0 = llvm.load %arg0 : !llvm.ptr<1> -> i32
    llvm.return %0 : i32
  }
}

