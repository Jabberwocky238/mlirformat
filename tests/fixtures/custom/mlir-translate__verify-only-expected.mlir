module {
  llvm.func @trivial() {
    "simple.terminator1"() : () -> ()
  }
}

// -----
module {
  llvm.func @trivial() {
    "simple.terminator3"() : () -> ()
  }
}

