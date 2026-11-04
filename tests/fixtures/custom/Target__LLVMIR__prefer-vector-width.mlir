module {
  llvm.func @prefer_vector_width() attributes {prefer_vector_width = "128"} {
    llvm.return
  }
}

