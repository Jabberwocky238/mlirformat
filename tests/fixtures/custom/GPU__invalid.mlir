module attributes {gpu.container_module} {
  gpu.module @kernels {
    gpu.func @kernel_1(%arg0: f32) kernel {
      gpu.return
    }
  }
  func.func @launch_func_kernel_operand_types(%arg0: index, %arg1: f32) {
    gpu.launch_func  @kernels::@kernel_1 blocks in (%arg0, %arg0, %arg0) threads in (%arg0, %arg0, %arg0)  args(%arg1 : f32)
    return
  }
}

