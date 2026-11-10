module attributes {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.data_layout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9", llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_gpu = true, omp.is_target_device = true} {
  llvm.func @_QQmain_omp_outline_1(%arg0: !llvm.ptr) attributes {omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (to)>} {
    %0 = omp.map.info var_ptr(%arg0 : !llvm.ptr, i32) map_clauses(from) capture(ByRef) -> !llvm.ptr {name = "d"}
    omp.target kernel_type(generic) map_entries(%0 -> %arg1 : !llvm.ptr) {
      omp.parallel {
        %1 = llvm.mlir.constant(1 : i32) : i32
        llvm.store %1, %arg1 : i32, !llvm.ptr
        omp.terminator
      }
      omp.terminator
    }
    llvm.return
  }
  llvm.func @_test_num_threads(%arg0: !llvm.ptr) attributes {omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (to)>} {
    %0 = omp.map.info var_ptr(%arg0 : !llvm.ptr, i32) map_clauses(from) capture(ByRef) -> !llvm.ptr {name = "d"}
    omp.target kernel_type(generic) map_entries(%0 -> %arg1 : !llvm.ptr) {
      %1 = llvm.mlir.constant(156 : i32) : i32
      omp.parallel num_threads(%1 : i32) {
        %2 = llvm.mlir.constant(1 : i32) : i32
        llvm.store %2, %arg1 : i32, !llvm.ptr
        omp.terminator
      }
      omp.terminator
    }
    llvm.return
  }
  llvm.func @parallel_if(%arg0: !llvm.ptr {fir.bindc_name = "ifcond"}) {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 {bindc_name = "d"} : (i64) -> !llvm.ptr<5>
    %2 = llvm.addrspacecast %1 : !llvm.ptr<5> to !llvm.ptr
    %3 = omp.map.info var_ptr(%2 : !llvm.ptr, i32) map_clauses(from) capture(ByRef) -> !llvm.ptr {name = "d"}
    %4 = omp.map.info var_ptr(%arg0 : !llvm.ptr, i32) map_clauses(implicit) capture(ByCopy) -> !llvm.ptr {name = "ifcond"}
    omp.target kernel_type(generic) map_entries(%3 -> %arg1, %4 -> %arg2 : !llvm.ptr, !llvm.ptr) {
      %5 = llvm.mlir.constant(10 : i32) : i32
      %6 = llvm.load %arg2 : !llvm.ptr -> i32
      %7 = llvm.mlir.constant(0 : i64) : i32
      %8 = llvm.icmp "ne" %6, %7 : i32
      omp.parallel if(%8) {
        llvm.store %5, %arg1 : i32, !llvm.ptr
        omp.terminator
      }
      omp.terminator
    }
    llvm.return
  }
}

