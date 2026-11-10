module attributes {llvm.target_triple = "x86_64-unknown-linux-gnu", omp.is_gpu = false, omp.is_target_device = false, omp.target_triples = ["amdgcn-amd-amdhsa"]} {
  llvm.mlir.global external @_QMtest_0Ezii() {addr_space = 0 : i32, omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (to)>} : !llvm.array<11 x f32> {
    %0 = llvm.mlir.zero : !llvm.array<11 x f32>
    llvm.return %0 : !llvm.array<11 x f32>
  }
  llvm.func @_QQmain() {
    %0 = llvm.mlir.constant(1 : index) : i64
    %1 = llvm.mlir.constant(0 : index) : i64
    %2 = llvm.mlir.constant(11 : index) : i64
    %3 = llvm.mlir.addressof @_QMtest_0Ezii : !llvm.ptr
    %4 = omp.map.bounds lower_bound(%1 : i64) upper_bound(%2 : i64) extent(%2 : i64) stride(%0 : i64) start_idx(%1 : i64) {stride_in_bytes = true}
    %5 = omp.map.info var_ptr(%3 : !llvm.ptr, !llvm.array<11 x f32>) map_clauses(tofrom) capture(ByRef) bounds(%4) -> !llvm.ptr
    omp.target kernel_type(generic) map_entries(%5 -> %arg0 : !llvm.ptr) {
      %6 = llvm.mlir.constant(1.000000e+00 : f32) : f32
      %7 = llvm.mlir.constant(0 : i64) : i64
      %8 = llvm.getelementptr %arg0[%7] : (!llvm.ptr, i64) -> !llvm.ptr, f32
      llvm.store %6, %8 : f32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
}

