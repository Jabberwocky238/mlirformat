module attributes {gpu.container_module} {
  gpu.module @kernels {
    gpu.func @kernel_1() kernel {
      %alloc = memref.alloc() : memref<8x16xf32>
      memref.dealloc %alloc : memref<8x16xf32>
      gpu.return
    }
  }
  func.func @main() {
    %alloc = memref.alloc() : memref<8x16xf32>
    memref.dealloc %alloc : memref<8x16xf32>
    return
  }
}

