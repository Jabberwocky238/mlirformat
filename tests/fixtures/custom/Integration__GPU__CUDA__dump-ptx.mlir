module {
  gpu.module @bar {
    llvm.func @kernel_a() attributes {gpu.kernel} {
      llvm.return
    }
  }
  gpu.module @foo {
    llvm.func @fma(%arg0: f32, %arg1: f32) -> f32 attributes {gpu.kernel} {
      %0 = llvm.intr.fma(%arg0, %arg1, %arg1) : (f32, f32, f32) -> f32
      llvm.return %0 : f32
    }
  }
}

