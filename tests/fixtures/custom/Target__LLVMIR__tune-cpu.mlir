module {
  llvm.func @tune_cpu_x86() attributes {tune_cpu = "pentium4"} {
    llvm.return
  }
  llvm.func @tune_cpu_arm() attributes {tune_cpu = "neoverse-n1"} {
    llvm.return
  }
}

