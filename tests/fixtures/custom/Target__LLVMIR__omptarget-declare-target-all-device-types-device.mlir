module attributes {llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_gpu = true, omp.is_target_device = true} {
  llvm.mlir.global internal @ial() {addr_space = 0 : i32, omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (link)>} : f32 {
    %0 = llvm.mlir.zero : f32
    llvm.return %0 : f32
  }
  llvm.mlir.global external @eal() {addr_space = 0 : i32, dso_local, omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (link)>} : f32 {
    %0 = llvm.mlir.zero : f32
    llvm.return %0 : f32
  }
  llvm.mlir.global internal @ihl() {addr_space = 0 : i32, omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (link)>} : f32 {
    %0 = llvm.mlir.zero : f32
    llvm.return %0 : f32
  }
  llvm.mlir.global external @ehl() {addr_space = 0 : i32, dso_local, omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (link)>} : f32 {
    %0 = llvm.mlir.zero : f32
    llvm.return %0 : f32
  }
  llvm.mlir.global internal @inl() {addr_space = 0 : i32, omp.declare_target = #omp.declaretarget<device_type = (nohost), capture_clause = (link)>} : f32 {
    %0 = llvm.mlir.zero : f32
    llvm.return %0 : f32
  }
  llvm.mlir.global external @enl() {addr_space = 0 : i32, dso_local, omp.declare_target = #omp.declaretarget<device_type = (nohost), capture_clause = (link)>} : f32 {
    %0 = llvm.mlir.zero : f32
    llvm.return %0 : f32
  }
  llvm.mlir.global internal @iae() {addr_space = 0 : i32, omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (enter)>} : f32 {
    %0 = llvm.mlir.zero : f32
    llvm.return %0 : f32
  }
  llvm.mlir.global external @eae() {addr_space = 0 : i32, dso_local, omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (enter)>} : f32 {
    %0 = llvm.mlir.zero : f32
    llvm.return %0 : f32
  }
  llvm.mlir.global internal @ihe() {addr_space = 0 : i32, omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (enter)>} : f32 {
    %0 = llvm.mlir.zero : f32
    llvm.return %0 : f32
  }
  llvm.mlir.global external @ehe() {addr_space = 0 : i32, dso_local, omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (enter)>} : f32 {
    %0 = llvm.mlir.zero : f32
    llvm.return %0 : f32
  }
  llvm.mlir.global internal @ine() {addr_space = 0 : i32, omp.declare_target = #omp.declaretarget<device_type = (nohost), capture_clause = (enter)>} : f32 {
    %0 = llvm.mlir.zero : f32
    llvm.return %0 : f32
  }
  llvm.mlir.global external @ene() {addr_space = 0 : i32, dso_local, omp.declare_target = #omp.declaretarget<device_type = (nohost), capture_clause = (enter)>} : f32 {
    %0 = llvm.mlir.zero : f32
    llvm.return %0 : f32
  }
  llvm.func @_QQmain() {
    %0 = llvm.mlir.addressof @ial : !llvm.ptr
    %1 = llvm.addrspacecast %0 : !llvm.ptr to !llvm.ptr
    %2 = llvm.mlir.addressof @ihl : !llvm.ptr
    %3 = llvm.addrspacecast %2 : !llvm.ptr to !llvm.ptr
    %4 = llvm.mlir.addressof @inl : !llvm.ptr
    %5 = llvm.addrspacecast %4 : !llvm.ptr to !llvm.ptr
    %6 = llvm.mlir.addressof @iae : !llvm.ptr
    %7 = llvm.addrspacecast %6 : !llvm.ptr to !llvm.ptr
    %8 = llvm.mlir.addressof @ihe : !llvm.ptr
    %9 = llvm.addrspacecast %8 : !llvm.ptr to !llvm.ptr
    %10 = llvm.mlir.addressof @ine : !llvm.ptr
    %11 = llvm.addrspacecast %10 : !llvm.ptr to !llvm.ptr
    %12 = llvm.mlir.addressof @eal : !llvm.ptr
    %13 = llvm.addrspacecast %12 : !llvm.ptr to !llvm.ptr
    %14 = llvm.mlir.addressof @ehl : !llvm.ptr
    %15 = llvm.addrspacecast %14 : !llvm.ptr to !llvm.ptr
    %16 = llvm.mlir.addressof @enl : !llvm.ptr
    %17 = llvm.addrspacecast %16 : !llvm.ptr to !llvm.ptr
    %18 = llvm.mlir.addressof @eae : !llvm.ptr
    %19 = llvm.addrspacecast %18 : !llvm.ptr to !llvm.ptr
    %20 = llvm.mlir.addressof @ehe : !llvm.ptr
    %21 = llvm.addrspacecast %20 : !llvm.ptr to !llvm.ptr
    %22 = llvm.mlir.addressof @ene : !llvm.ptr
    %23 = llvm.addrspacecast %22 : !llvm.ptr to !llvm.ptr
    %24 = omp.map.info var_ptr(%1 : !llvm.ptr, f32) map_clauses(always, from) capture(ByRef) -> !llvm.ptr {name = "ial"}
    omp.target kernel_type(generic) map_entries(%24 -> %arg0 : !llvm.ptr) {
      %36 = llvm.mlir.constant(1.100000e+00 : f32) : f32
      llvm.store %36, %arg0 : f32, !llvm.ptr
      omp.terminator
    }
    %25 = omp.map.info var_ptr(%13 : !llvm.ptr, f32) map_clauses(always, from) capture(ByRef) -> !llvm.ptr {name = "eal"}
    omp.target kernel_type(generic) map_entries(%25 -> %arg0 : !llvm.ptr) {
      %36 = llvm.mlir.constant(1.200000e+00 : f32) : f32
      llvm.store %36, %arg0 : f32, !llvm.ptr
      omp.terminator
    }
    %26 = omp.map.info var_ptr(%3 : !llvm.ptr, f32) map_clauses(always, from) capture(ByRef) -> !llvm.ptr {name = "ihl"}
    omp.target kernel_type(generic) map_entries(%26 -> %arg0 : !llvm.ptr) {
      %36 = llvm.mlir.constant(2.100000e+00 : f32) : f32
      llvm.store %36, %arg0 : f32, !llvm.ptr
      omp.terminator
    }
    %27 = omp.map.info var_ptr(%15 : !llvm.ptr, f32) map_clauses(always, from) capture(ByRef) -> !llvm.ptr {name = "ehl"}
    omp.target kernel_type(generic) map_entries(%27 -> %arg0 : !llvm.ptr) {
      %36 = llvm.mlir.constant(2.200000e+00 : f32) : f32
      llvm.store %36, %arg0 : f32, !llvm.ptr
      omp.terminator
    }
    %28 = omp.map.info var_ptr(%5 : !llvm.ptr, f32) map_clauses(always, from) capture(ByRef) -> !llvm.ptr {name = "inl"}
    omp.target kernel_type(generic) map_entries(%28 -> %arg0 : !llvm.ptr) {
      %36 = llvm.mlir.constant(3.100000e+00 : f32) : f32
      llvm.store %36, %arg0 : f32, !llvm.ptr
      omp.terminator
    }
    %29 = omp.map.info var_ptr(%17 : !llvm.ptr, f32) map_clauses(always, from) capture(ByRef) -> !llvm.ptr {name = "enl"}
    omp.target kernel_type(generic) map_entries(%29 -> %arg0 : !llvm.ptr) {
      %36 = llvm.mlir.constant(3.200000e+00 : f32) : f32
      llvm.store %36, %arg0 : f32, !llvm.ptr
      omp.terminator
    }
    %30 = omp.map.info var_ptr(%7 : !llvm.ptr, f32) map_clauses(always, from) capture(ByRef) -> !llvm.ptr {name = "iae"}
    omp.target kernel_type(generic) map_entries(%30 -> %arg0 : !llvm.ptr) {
      %36 = llvm.mlir.constant(4.100000e+00 : f32) : f32
      llvm.store %36, %arg0 : f32, !llvm.ptr
      omp.terminator
    }
    %31 = omp.map.info var_ptr(%19 : !llvm.ptr, f32) map_clauses(always, from) capture(ByRef) -> !llvm.ptr {name = "eae"}
    omp.target kernel_type(generic) map_entries(%31 -> %arg0 : !llvm.ptr) {
      %36 = llvm.mlir.constant(4.200000e+00 : f32) : f32
      llvm.store %36, %arg0 : f32, !llvm.ptr
      omp.terminator
    }
    %32 = omp.map.info var_ptr(%9 : !llvm.ptr, f32) map_clauses(always, from) capture(ByRef) -> !llvm.ptr {name = "ihe"}
    omp.target kernel_type(generic) map_entries(%32 -> %arg0 : !llvm.ptr) {
      %36 = llvm.mlir.constant(5.100000e+00 : f32) : f32
      llvm.store %36, %arg0 : f32, !llvm.ptr
      omp.terminator
    }
    %33 = omp.map.info var_ptr(%21 : !llvm.ptr, f32) map_clauses(always, from) capture(ByRef) -> !llvm.ptr {name = "ehe"}
    omp.target kernel_type(generic) map_entries(%33 -> %arg0 : !llvm.ptr) {
      %36 = llvm.mlir.constant(5.200000e+00 : f32) : f32
      llvm.store %36, %arg0 : f32, !llvm.ptr
      omp.terminator
    }
    %34 = omp.map.info var_ptr(%11 : !llvm.ptr, f32) map_clauses(always, from) capture(ByRef) -> !llvm.ptr {name = "ine"}
    omp.target kernel_type(generic) map_entries(%34 -> %arg0 : !llvm.ptr) {
      %36 = llvm.mlir.constant(6.100000e+00 : f32) : f32
      llvm.store %36, %arg0 : f32, !llvm.ptr
      omp.terminator
    }
    %35 = omp.map.info var_ptr(%23 : !llvm.ptr, f32) map_clauses(always, from) capture(ByRef) -> !llvm.ptr {name = "ene"}
    omp.target kernel_type(generic) map_entries(%35 -> %arg0 : !llvm.ptr) {
      %36 = llvm.mlir.constant(6.210000e+00 : f32) : f32
      llvm.store %36, %arg0 : f32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
}

