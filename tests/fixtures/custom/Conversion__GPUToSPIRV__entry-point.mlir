module {
  gpu.module @kernels {
    gpu.func @foo() kernel {
      gpu.return
    }
  }
}

