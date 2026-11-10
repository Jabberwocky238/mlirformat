module {
  llvm.module_flags [#rocdl.buffer_oob_mode_flag<any>, #rocdl.tbuffer_oob_mode_flag<relaxed>]
  llvm.func @oob_any_relaxed() {
    llvm.return
  }
}

// -----
module {
  llvm.module_flags [#rocdl.buffer_oob_mode_flag<strict>]
  llvm.func @oob_strict() {
    llvm.return
  }
}

// -----
module {
  llvm.module_flags [#llvm.mlir.module_flag<max, "amdgpu.buffer.oob.mode", #rocdl.buffer_oob_mode<relaxed>>]
  llvm.func @generic_oob_relaxed() {
    llvm.return
  }
}

