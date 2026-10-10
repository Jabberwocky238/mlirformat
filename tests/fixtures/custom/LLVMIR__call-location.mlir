module {
  llvm.func @external_func()
  llvm.func @call_debug_locs() {
    llvm.call @external_func() : () -> ()
    llvm.return
  }
}

