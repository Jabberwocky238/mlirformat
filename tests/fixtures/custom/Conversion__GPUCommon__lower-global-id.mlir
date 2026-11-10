module {
  gpu.module @kernel {
    gpu.func @gpu_global_id() -> index {
      %global_id_x = gpu.global_id x
      gpu.return %global_id_x : index
    }
  }
}

