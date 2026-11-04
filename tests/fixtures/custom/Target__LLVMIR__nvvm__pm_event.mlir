module {
  llvm.func @nvvm_pmevent_mask() {
    nvvm.pmevent mask = 15000
    nvvm.pmevent mask = 4
    llvm.return
  }
  llvm.func @nvvm_pmevent_id() {
    nvvm.pmevent id = 10
    nvvm.pmevent id = 4
    llvm.return
  }
}

