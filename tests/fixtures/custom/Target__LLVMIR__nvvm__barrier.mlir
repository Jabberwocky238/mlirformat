module {
  llvm.func @llvm_nvvm_barrier(%arg0: i32, %arg1: i32, %arg2: i32) {
    nvvm.barrier
    nvvm.barrier id = %arg0
    nvvm.barrier id = %arg0 number_of_threads = %arg1
    nvvm.barrier number_of_threads = %arg1
    %0 = nvvm.barrier.reduction #nvvm.reduction<and> %arg2 -> i32
    %1 = nvvm.barrier.reduction #nvvm.reduction<or> %arg2 -> i32
    %2 = nvvm.barrier.reduction #nvvm.reduction<popc> %arg2 -> i32
    %3 = nvvm.barrier.reduction #nvvm.reduction<and> %arg2 id = %arg0 -> i32
    nvvm.barrier {aligned = false}
    nvvm.barrier id = %arg0 number_of_threads = %arg1 {aligned = false}
    %4 = nvvm.barrier.reduction #nvvm.reduction<and> %arg2 -> i32 {aligned = false}
    %5 = nvvm.barrier.reduction #nvvm.reduction<or> %arg2 -> i32 {aligned = false}
    %6 = nvvm.barrier.reduction #nvvm.reduction<popc> %arg2 -> i32 {aligned = false}
    llvm.return
  }
  llvm.func @llvm_nvvm_barrier_arrive(%arg0: i32, %arg1: i32) {
    nvvm.barrier.arrive number_of_threads = %arg1
    nvvm.barrier.arrive id = %arg0 number_of_threads = %arg1
    nvvm.barrier.arrive number_of_threads = %arg1 {aligned = false}
    nvvm.barrier.arrive id = %arg0 number_of_threads = %arg1 {aligned = false}
    llvm.return
  }
}

