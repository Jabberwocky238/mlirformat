module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Addresses, Int8, Kernel], []>, #spirv.resource_limits<>>} {
  func.func @main() {
    %c1 = arith.constant 1 : index
    gpu.launch_func  @kernels::@printf blocks in (%c1, %c1, %c1) threads in (%c1, %c1, %c1)  
    return
  }
  gpu.module @kernels {
    gpu.func @printf() kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<>} {
      gpu.printf "\0AHello\0A"
      gpu.return
    }
  }
}

// -----
module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Addresses, Int8, Kernel], []>, #spirv.resource_limits<>>} {
  func.func @main() {
    %c1 = arith.constant 1 : index
    %c100_i32 = arith.constant 100 : i32
    %cst = arith.constant 3.144000e+02 : f32
    gpu.launch_func  @kernels1::@printf_args blocks in (%c1, %c1, %c1) threads in (%c1, %c1, %c1)  args(%c100_i32 : i32, %cst : f32)
    return
  }
  gpu.module @kernels1 {
    gpu.func @printf_args(%arg0: i32, %arg1: f32) kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<>} {
      %block_id_x = gpu.block_id  x
      %block_id_y = gpu.block_id  y
      %thread_id_x = gpu.thread_id  x
      gpu.printf "\0AHello, world : %d %f \0A Thread id: %d\0A", %arg0, %arg1, %thread_id_x : i32, f32, index
      gpu.return
    }
  }
}

