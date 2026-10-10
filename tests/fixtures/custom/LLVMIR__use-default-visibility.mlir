module {
  llvm.comdat @llvm_comdat {
    llvm.comdat_selector @any any
  }
  llvm.func @func() {
    llvm.return
  }
  llvm.func @ifunc_resolver() -> !llvm.ptr {
    %0 = llvm.mlir.addressof @func : !llvm.ptr
    llvm.return %0 : !llvm.ptr
  }
  llvm.func @func1() {
    llvm.return
  }
  llvm.mlir.global internal constant @global1(0 : i32) {addr_space = 0 : i32} : i32
  llvm.mlir.alias external @func1_alias {addr_space = 0 : i32} : !llvm.ptr {
    %0 = llvm.mlir.addressof @func1 : !llvm.ptr
    llvm.return %0 : !llvm.ptr
  }
  llvm.func @decl1()
  llvm.mlir.global internal constant @comdat1(1 : i64) comdat(@llvm_comdat::@any) {addr_space = 0 : i32} : i64
  llvm.mlir.ifunc external @ifunc1 : !llvm.func<void ()>, !llvm.ptr @ifunc_resolver
  llvm.func hidden @func2() {
    llvm.return
  }
  llvm.mlir.global internal hidden constant @global2(1 : i32) {addr_space = 0 : i32} : i32
  llvm.mlir.alias external hidden @func2_alias {addr_space = 0 : i32} : !llvm.ptr {
    %0 = llvm.mlir.addressof @func2 : !llvm.ptr
    llvm.return %0 : !llvm.ptr
  }
  llvm.func hidden @decl2()
  llvm.mlir.global internal hidden constant @comdat2(1 : i64) comdat(@llvm_comdat::@any) {addr_space = 0 : i32} : i64
  llvm.mlir.ifunc external hidden @ifunc2 : !llvm.func<void ()>, !llvm.ptr @ifunc_resolver
  llvm.func protected @func3() {
    llvm.return
  }
  llvm.mlir.global internal protected constant @global3(2 : i32) {addr_space = 0 : i32} : i32
  llvm.mlir.alias external protected @func3_alias {addr_space = 0 : i32} : !llvm.ptr {
    %0 = llvm.mlir.addressof @func3 : !llvm.ptr
    llvm.return %0 : !llvm.ptr
  }
  llvm.func protected @decl3()
  llvm.mlir.global internal protected constant @comdat3(1 : i64) comdat(@llvm_comdat::@any) {addr_space = 0 : i32} : i64
  llvm.mlir.ifunc external protected @ifunc3 : !llvm.func<void ()>, !llvm.ptr @ifunc_resolver
}

