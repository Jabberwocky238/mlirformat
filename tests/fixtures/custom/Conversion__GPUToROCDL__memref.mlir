module {
  gpu.module @memref_conversions {
    gpu.func @kern(%arg0: memref<8xf32>) kernel {
      gpu.return
    }
  }
}

