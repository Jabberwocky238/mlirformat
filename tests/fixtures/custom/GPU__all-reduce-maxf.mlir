module {
  gpu.module @kernels {
    gpu.func @kernel(%arg0: f32) kernel {
      %0 = gpu.all_reduce  maxnumf %arg0 uniform {
      } : (f32) -> f32
      gpu.return
    }
  }
}

