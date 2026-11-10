module attributes {llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_gpu = true, omp.is_target_device = true} {
  llvm.mlir.global external @_QMtest_0Ezii() {addr_space = 0 : i32, omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (to)>} : !llvm.array<11 x f32> {
    %0 = llvm.mlir.zero : !llvm.array<11 x f32>
    llvm.return %0 : !llvm.array<11 x f32>
  }
  llvm.func @_QQmain() {
    %0 = llvm.mlir.addressof @_QMtest_0Ezii : !llvm.ptr
    %1 = omp.map.info var_ptr(%0 : !llvm.ptr, !llvm.array<11 x f32>) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr
    omp.target kernel_type(generic) map_entries(%1 -> %arg0 : !llvm.ptr) {
      %2 = llvm.mlir.constant(1.000000e+00 : f32) : f32
      %3 = llvm.mlir.constant(0 : i64) : i64
      %4 = llvm.getelementptr %arg0[%3] : (!llvm.ptr, i64) -> !llvm.ptr, f32
      llvm.store %2, %4 : f32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
}

