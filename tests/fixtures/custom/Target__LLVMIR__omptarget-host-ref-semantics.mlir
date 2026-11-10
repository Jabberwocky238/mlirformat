module attributes {omp.is_gpu = false, omp.is_target_device = false, omp.requires = #omp<clause_requires none>, omp.target_triples = ["amdgcn-amd-amdhsa"], omp.version = #omp.version<version = 61>} {
  llvm.func @attach_always_(%arg0: !llvm.ptr, %arg1: !llvm.ptr) {
    %0 = omp.map.info var_ptr(%arg0 : !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>) map_clauses(tofrom) capture(ByRef) var_ptr_ptr(%arg1 : !llvm.ptr, i32) -> !llvm.ptr {name = ""}
    %1 = omp.map.info var_ptr(%arg0 : !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>) map_clauses(always, to) capture(ByRef) members(%0 : [0] : !llvm.ptr) -> !llvm.ptr {name = "x"}
    %2 = omp.map.info var_ptr(%arg0 : !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>) map_clauses(always, attach, ref_ptr, ref_ptee) capture(ByRef) var_ptr_ptr(%arg1 : !llvm.ptr, i32) -> !llvm.ptr {name = "x"}
    omp.target kernel_type(generic) map_entries(%1 -> %arg2, %2 -> %arg3, %0 -> %arg4 : !llvm.ptr, !llvm.ptr, !llvm.ptr) {
      omp.terminator
    }
    llvm.return
  }
  llvm.func @attach_never_(%arg0: !llvm.ptr, %arg1: !llvm.ptr) {
    %0 = omp.map.info var_ptr(%arg0 : !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>) map_clauses(tofrom) capture(ByRef) var_ptr_ptr(%arg1 : !llvm.ptr, i32) -> !llvm.ptr {name = ""}
    %1 = omp.map.info var_ptr(%arg0 : !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>) map_clauses(always, to) capture(ByRef) members(%0 : [0] : !llvm.ptr) -> !llvm.ptr {name = "x"}
    omp.target kernel_type(generic) map_entries(%1 -> %arg2, %0 -> %arg3 : !llvm.ptr, !llvm.ptr) {
      omp.terminator
    }
    llvm.return
  }
  llvm.func @attach_auto_(%arg0: !llvm.ptr, %arg1: !llvm.ptr) {
    %0 = omp.map.info var_ptr(%arg0 : !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>) map_clauses(tofrom) capture(ByRef) var_ptr_ptr(%arg1 : !llvm.ptr, i32) -> !llvm.ptr {name = ""}
    %1 = omp.map.info var_ptr(%arg0 : !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>) map_clauses(always, to) capture(ByRef) members(%0 : [0] : !llvm.ptr) -> !llvm.ptr {name = "x"}
    %2 = omp.map.info var_ptr(%arg0 : !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>) map_clauses(attach, ref_ptr, ref_ptee) capture(ByRef) var_ptr_ptr(%arg1 : !llvm.ptr, i32) -> !llvm.ptr {name = "x"}
    omp.target kernel_type(generic) map_entries(%1 -> %arg2, %2 -> %arg3, %0 -> %arg4 : !llvm.ptr, !llvm.ptr, !llvm.ptr) {
      omp.terminator
    }
    llvm.return
  }
  llvm.func @ref_ptr_ptee_(%arg0: !llvm.ptr, %arg1: !llvm.ptr) {
    %0 = omp.map.info var_ptr(%arg0 : !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>) map_clauses(to, ref_ptr, ref_ptee) capture(ByRef) var_ptr_ptr(%arg1 : !llvm.ptr, i32) -> !llvm.ptr {name = ""}
    %1 = omp.map.info var_ptr(%arg0 : !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>) map_clauses(to, ref_ptr, ref_ptee) capture(ByRef) members(%0 : [0] : !llvm.ptr) -> !llvm.ptr {name = "x"}
    %2 = omp.map.info var_ptr(%arg0 : !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>) map_clauses(attach, ref_ptr, ref_ptee) capture(ByRef) var_ptr_ptr(%arg1 : !llvm.ptr, i32) -> !llvm.ptr {name = "x"}
    omp.target kernel_type(generic) map_entries(%1 -> %arg2, %2 -> %arg3, %0 -> %arg4 : !llvm.ptr, !llvm.ptr, !llvm.ptr) {
      omp.terminator
    }
    llvm.return
  }
  llvm.func @ref_ptr_(%arg0: !llvm.ptr, %arg1: !llvm.ptr) {
    %0 = omp.map.info var_ptr(%arg0 : !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>) map_clauses(to, ref_ptr) capture(ByRef) -> !llvm.ptr {name = ""}
    %1 = omp.map.info var_ptr(%arg0 : !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>) map_clauses(attach, ref_ptr) capture(ByRef) var_ptr_ptr(%arg1 : !llvm.ptr, i32) -> !llvm.ptr {name = "x"}
    omp.target kernel_type(generic) map_entries(%1 -> %arg2, %0 -> %arg3 : !llvm.ptr, !llvm.ptr) {
      omp.terminator
    }
    llvm.return
  }
  llvm.func @ref_ptee_(%arg0: !llvm.ptr, %arg1: !llvm.ptr) {
    %0 = omp.map.info var_ptr(%arg0 : !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>) map_clauses(to, ref_ptee) capture(ByRef) var_ptr_ptr(%arg1 : !llvm.ptr, i32) -> !llvm.ptr {name = ""}
    %1 = omp.map.info var_ptr(%arg0 : !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>) map_clauses(attach, ref_ptee) capture(ByRef) var_ptr_ptr(%arg1 : !llvm.ptr, i32) -> !llvm.ptr {name = "x"}
    omp.target kernel_type(generic) map_entries(%1 -> %arg2, %0 -> %arg3 : !llvm.ptr, !llvm.ptr) {
      omp.terminator
    }
    llvm.return
  }
  llvm.func @ref_ptr_ptee_attach_never_(%arg0: !llvm.ptr, %arg1: !llvm.ptr) {
    %0 = omp.map.info var_ptr(%arg0 : !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>) map_clauses(to, ref_ptr, ref_ptee) capture(ByRef) var_ptr_ptr(%arg1 : !llvm.ptr, i32) -> !llvm.ptr {name = ""}
    %1 = omp.map.info var_ptr(%arg0 : !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>) map_clauses(to, ref_ptr, ref_ptee) capture(ByRef) members(%0 : [0] : !llvm.ptr) -> !llvm.ptr {name = "x"}
    omp.target kernel_type(generic) map_entries(%1 -> %arg2, %0 -> %arg3 : !llvm.ptr, !llvm.ptr) {
      omp.terminator
    }
    llvm.return
  }
}

