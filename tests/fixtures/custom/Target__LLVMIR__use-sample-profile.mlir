module {
  llvm.func @use_sample_profile() attributes {use_sample_profile = true} {
    llvm.return
  }
}

