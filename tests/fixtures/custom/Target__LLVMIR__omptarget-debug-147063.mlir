module attributes {llvm.target_triple = "x86_64-unknown-linux-gnu", omp.is_gpu = false, omp.is_target_device = false, omp.target_triples = ["amdgcn-amd-amdhsa"]} {
  omp.private {type = private} @_QFFfnEv_private_i32 : i32
  llvm.func internal @_QFPfn() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 {bindc_name = "v"} : (i64) -> !llvm.ptr
    %2 = llvm.mlir.constant(1 : i32) : i32
    omp.parallel private(@_QFFfnEv_private_i32 %1 -> %arg0 : !llvm.ptr) {
      llvm.store %2, %arg0 : i32, !llvm.ptr
      %3 = omp.map.info var_ptr(%arg0 : !llvm.ptr, i32) map_clauses(implicit) capture(ByCopy) -> !llvm.ptr {name = "v"}
      omp.target map_entries(%3 -> %arg1 : !llvm.ptr) {
        %4 = llvm.mlir.constant(1 : i32) : i32
        %5 = llvm.load %arg1 : !llvm.ptr -> i32
        %6 = llvm.add %5, %4 : i32
        llvm.store %6, %arg1 : i32, !llvm.ptr
        omp.terminator
      }
      omp.terminator
    }
    llvm.return
  }
}

