module attributes {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.data_layout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9", llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_gpu = true, omp.is_target_device = true} {
  llvm.func @device_shared_mem(%arg0: i32, %arg1: i64) attributes {omp.declare_target = #omp.declaretarget<device_type = (nohost), capture_clause = (to)>} {
    %0 = omp.alloc_shared_mem %arg0 x i64 : (i32) -> !llvm.ptr
    %1 = omp.alloc_shared_mem %arg1 x i64 : (i64) -> !llvm.ptr
    %2 = omp.alloc_shared_mem %arg1 x vector<16xf32> : (i64) -> !llvm.ptr
    %3 = omp.alloc_shared_mem %arg1 x vector<16xf32> : (i64) align(128) -> !llvm.ptr
    omp.free_shared_mem [%arg0 x i64 : (i32)] %0 : !llvm.ptr
    omp.free_shared_mem [%arg1 x i64 : (i64)] %1 : !llvm.ptr
    omp.free_shared_mem [%arg1 x vector<16xf32> : (i64)] %2 : !llvm.ptr
    omp.free_shared_mem [%arg1 x vector<16xf32> : (i64) align(128)] %3 : !llvm.ptr
    llvm.return
  }
}

