module attributes {gpu.container_module} {
  gpu.module @kernels {
    gpu.func @hello() kernel {
      %thread_id_x = gpu.thread_id x
      %c2_i8 = arith.constant 2 : i8
      %cst = arith.constant 3.000000e+00 : f32
      gpu.printf "Hello from %lld, %d, %f\0A", %thread_id_x, %c2_i8, %cst : index, i8, f32
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

