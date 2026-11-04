module {
  llvm.func @llvm_nvvm_tcgen05_fence() {
    nvvm.tcgen05.fence <before>
    nvvm.tcgen05.fence <after>
    llvm.return
  }
  llvm.func @llvm_nvvm_tcgen05_wait() {
    nvvm.tcgen05.wait <load>
    nvvm.tcgen05.wait <store>
    llvm.return
  }
}

