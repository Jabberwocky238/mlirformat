module {
  llvm.func @vscale_func() vscale_range(2, 8) {
    llvm.return
  }
}

