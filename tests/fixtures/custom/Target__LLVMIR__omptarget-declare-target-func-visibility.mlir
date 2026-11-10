module attributes {llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_target_device = true} {
  llvm.func @device_any() attributes {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (to)>} {
    llvm.return
  }
  llvm.func @device_nohost() attributes {omp.declare_target = #omp.declaretarget<device_type = (nohost), capture_clause = (to)>} {
    llvm.return
  }
  llvm.func protected @device_protected() attributes {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (to)>} {
    llvm.return
  }
  llvm.func @not_declare_target() {
    llvm.return
  }
  llvm.func @device_decl() attributes {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (to)>}
}

