module attributes {gpu.container_module} {
  gpu.module @kernels {
    gpu.func @hello() kernel {
      %thread_id_x = gpu.thread_id  x
      gpu.printf "Hello from %d\0A", %thread_id_x : index
      gpu.return
    }
  }
  func.func @main() {
    %c2 = arith.constant 2 : index
    %c1 = arith.constant 1 : index
    gpu.launch_func  @kernels::@hello blocks in (%c1, %c1, %c1) threads in (%c2, %c1, %c1)  
    return
  }
}

