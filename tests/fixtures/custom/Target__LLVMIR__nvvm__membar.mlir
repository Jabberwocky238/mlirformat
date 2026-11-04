module {
  llvm.func @memorybarrier() {
    nvvm.memory.barrier <cta>
    nvvm.memory.barrier <cluster>
    nvvm.memory.barrier <gpu>
    nvvm.memory.barrier <sys>
    llvm.return
  }
}

