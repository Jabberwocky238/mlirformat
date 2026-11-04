module {
  llvm.comdat @__llvm_comdat {
    llvm.comdat_selector @any any
    llvm.comdat_selector @exactmatch exactmatch
    llvm.comdat_selector @largest largest
    llvm.comdat_selector @nodeduplicate nodeduplicate
    llvm.comdat_selector @samesize samesize
  }
  llvm.mlir.global internal constant @any(1 : i64) comdat(@__llvm_comdat::@any) {addr_space = 0 : i32} : i64
  llvm.mlir.global internal constant @any_global(1 : i64) comdat(@__llvm_comdat::@any) {addr_space = 0 : i32} : i64
  llvm.mlir.global internal constant @exact_global(1 : i64) comdat(@__llvm_comdat::@exactmatch) {addr_space = 0 : i32} : i64
  llvm.mlir.global internal constant @largest_global(1 : i64) comdat(@__llvm_comdat::@largest) {addr_space = 0 : i32} : i64
  llvm.func @nodeduplicate() comdat(@__llvm_comdat::@nodeduplicate) {
    llvm.return
  }
  llvm.func @nodeduplicate_func() comdat(@__llvm_comdat::@nodeduplicate) {
    llvm.return
  }
  llvm.func @samesize_func() comdat(@__llvm_comdat::@samesize) {
    llvm.return
  }
}

