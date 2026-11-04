module {
  llvm.func @llvm_nvvm_barrier(%arg0: i32, %arg1: i32, %arg2: i32) {
    nvvm.barrier
    nvvm.barrier id = %arg0
    nvvm.barrier id = %arg0 number_of_threads = %arg1
    %0 = nvvm.barrier #nvvm.reduction<and> %arg2 -> i32
    %1 = nvvm.barrier #nvvm.reduction<or> %arg2 -> i32
    %2 = nvvm.barrier #nvvm.reduction<popc> %arg2 -> i32
    llvm.return
  }
}

