module {
  llvm.func internal @callee() -> !llvm.ptr attributes {dso_local} {
    %0 = llvm.mlir.zero : !llvm.ptr
    llvm.return %0 : !llvm.ptr
  }
  llvm.mlir.alias external @foo_alias : !llvm.ptr {
    %0 = llvm.mlir.addressof @callee : !llvm.ptr
    llvm.return %0 : !llvm.ptr
  }
  llvm.mlir.alias external @_ZTV1D : !llvm.struct<(array<3 x ptr>)> {
    %0 = llvm.mlir.addressof @callee : !llvm.ptr
    llvm.return %0 : !llvm.ptr
  }
}

// -----
module {
  llvm.mlir.global weak_odr @zed(42 : i32) {addr_space = 0 : i32} : i32
  llvm.mlir.alias weak_odr @foo : i32 {
    %0 = llvm.mlir.addressof @zed : !llvm.ptr
    llvm.return %0 : !llvm.ptr
  }
  llvm.mlir.alias weak_odr @foo2 : i16 {
    %0 = llvm.mlir.addressof @zed : !llvm.ptr
    llvm.return %0 : !llvm.ptr
  }
}

// -----
module {
  llvm.mlir.global private constant @glob.private(dense<0> : tensor<32xi32>) {addr_space = 0 : i32} : !llvm.array<32 x i32>
  llvm.mlir.alias linkonce_odr hidden @glob {dso_local} : !llvm.array<32 x i32> {
    %0 = llvm.mlir.constant(1234 : i64) : i64
    %1 = llvm.mlir.addressof @glob.private : !llvm.ptr
    %2 = llvm.ptrtoint %1 : !llvm.ptr to i64
    %3 = llvm.add %2, %0 : i64
    %4 = llvm.inttoptr %3 : i64 to !llvm.ptr
    llvm.return %4 : !llvm.ptr
  }
}

// -----
module {
  llvm.mlir.global external @v1(0 : i32) {addr_space = 0 : i32} : i32
  llvm.mlir.alias external @a3 : i32 {
    %0 = llvm.mlir.addressof @v1 : !llvm.ptr
    %1 = llvm.addrspacecast %0 : !llvm.ptr to !llvm.ptr<2>
    llvm.return %1 : !llvm.ptr<2>
  }
}

// -----
module {
  llvm.mlir.global private @g1(0 : i32) {addr_space = 0 : i32, dso_local} : i32
  llvm.mlir.alias private @a1 {dso_local} : i32 {
    %0 = llvm.mlir.addressof @g1 : !llvm.ptr
    llvm.return %0 : !llvm.ptr
  }
  llvm.mlir.global internal constant @g2() {addr_space = 0 : i32} : !llvm.ptr {
    %0 = llvm.mlir.addressof @a1 : !llvm.ptr
    llvm.return %0 : !llvm.ptr
  }
  llvm.mlir.alias private @a2 {dso_local} : !llvm.ptr {
    %0 = llvm.mlir.addressof @a1 : !llvm.ptr
    llvm.return %0 : !llvm.ptr
  }
  llvm.mlir.global internal constant @g3() {addr_space = 0 : i32} : !llvm.ptr {
    %0 = llvm.mlir.addressof @a2 : !llvm.ptr
    llvm.return %0 : !llvm.ptr
  }
}

// -----
module {
  llvm.mlir.global private @g30(0 : i32) {addr_space = 0 : i32, dso_local} : i32
  llvm.mlir.alias private thread_local unnamed_addr @a30 {dso_local} : i32 {
    %0 = llvm.mlir.addressof @g30 : !llvm.ptr
    llvm.return %0 : !llvm.ptr
  }
}

