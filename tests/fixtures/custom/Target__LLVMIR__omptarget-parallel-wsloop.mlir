module attributes {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.data_layout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8", llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_gpu = true, omp.is_target_device = true} {
  llvm.func @target_parallel_wsloop(%arg0: !llvm.ptr) attributes {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (to)>, target_cpu = "gfx90a", target_features = #llvm.target_features<["+gfx9-insts", "+wavefrontsize64"]>} {
    omp.parallel {
      %0 = llvm.mlir.constant(9 : i32) : i32
      %1 = llvm.mlir.constant(0 : i32) : i32
      %2 = llvm.mlir.constant(1 : i32) : i32
      omp.wsloop {
        omp.loop_nest (%arg1) : i32 = (%1) to (%0) inclusive step (%2) {
          %3 = llvm.getelementptr %arg0[0, %arg1] : (!llvm.ptr, i32) -> !llvm.ptr, !llvm.array<10 x i32>
          llvm.store %arg1, %3 : i32, !llvm.ptr
          omp.yield
        }
      }
      omp.terminator
    }
    llvm.return
  }
}

