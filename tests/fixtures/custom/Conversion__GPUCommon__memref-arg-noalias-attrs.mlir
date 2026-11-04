module {
  gpu.module @kernel {
    gpu.func @func_with_noalias_attr(%arg0: memref<f32> {llvm.noalias}) {
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @kernel {
    gpu.func @func_without_any_attr(%arg0: memref<f32>) {
      gpu.return
    }
  }
}

