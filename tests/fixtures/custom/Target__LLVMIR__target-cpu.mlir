module {
  llvm.func @target_cpu() attributes {target_cpu = "gfx90a"} {
    llvm.return
  }
}

