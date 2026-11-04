module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader, Int64], []>, #spirv.resource_limits<>>} {
  func.func @builtin() {
    %c1 = arith.constant 1 : index
    gpu.launch_func  @kernels::@builtin_workgroup_id_x blocks in (%c1, %c1, %c1) threads in (%c1, %c1, %c1)  
    return
  }
  gpu.module @kernels {
    gpu.func @builtin_workgroup_id_x() kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [16, 1, 1]>} {
      %block_id_x = gpu.block_id  x
      gpu.return
    }
  }
}

// -----
module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader, Int64], []>, #spirv.resource_limits<>>} {
  func.func @builtin() {
    %c1 = arith.constant 1 : index
    %c256_i32 = arith.constant 256 : i32
    gpu.launch_func  @kernels::@builtin_workgroup_id_y blocks in (%c1, %c1, %c1) threads in (%c1, %c1, %c1)  dynamic_shared_memory_size %c256_i32 
    return
  }
  gpu.module @kernels {
    gpu.func @builtin_workgroup_id_y() kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [16, 1, 1]>} {
      %block_id_y = gpu.block_id  y
      gpu.return
    }
  }
}

// -----
module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader, Int64], []>, #spirv.resource_limits<>>} {
  func.func @builtin() {
    %c1 = arith.constant 1 : index
    gpu.launch_func  @kernels::@builtin_workgroup_id_z blocks in (%c1, %c1, %c1) threads in (%c1, %c1, %c1)  
    return
  }
  gpu.module @kernels {
    gpu.func @builtin_workgroup_id_z() kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [16, 1, 1]>} {
      %block_id_z = gpu.block_id  z
      gpu.return
    }
  }
}

// -----
module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader, Int64], []>, #spirv.resource_limits<>>} {
  func.func @builtin() {
    %c1 = arith.constant 1 : index
    gpu.launch_func  @kernels::@builtin_workgroup_size_x blocks in (%c1, %c1, %c1) threads in (%c1, %c1, %c1)  
    return
  }
  gpu.module @kernels {
    gpu.func @builtin_workgroup_size_x() kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [32, 1, 1]>} {
      %block_dim_x = gpu.block_dim  x
      gpu.return
    }
  }
}

// -----
module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader, Int64], []>, #spirv.resource_limits<>>} {
  func.func @builtin() {
    %c1 = arith.constant 1 : index
    gpu.launch_func  @kernels::@builtin_workgroup_size_y blocks in (%c1, %c1, %c1) threads in (%c1, %c1, %c1)  
    return
  }
  gpu.module @kernels {
    gpu.func @builtin_workgroup_size_y() kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [32, 4, 1]>} {
      %block_dim_y = gpu.block_dim  y
      gpu.return
    }
  }
}

// -----
module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader, Int64], []>, #spirv.resource_limits<>>} {
  func.func @builtin() {
    %c1 = arith.constant 1 : index
    gpu.launch_func  @kernels::@builtin_workgroup_size_z blocks in (%c1, %c1, %c1) threads in (%c1, %c1, %c1)  
    return
  }
  gpu.module @kernels {
    gpu.func @builtin_workgroup_size_z() kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [32, 4, 1]>} {
      %block_dim_z = gpu.block_dim  z
      gpu.return
    }
  }
}

// -----
module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader, Int64], []>, #spirv.resource_limits<>>} {
  func.func @builtin() {
    %c1 = arith.constant 1 : index
    gpu.launch_func  @kernels::@builtin_local_id_x blocks in (%c1, %c1, %c1) threads in (%c1, %c1, %c1)  
    return
  }
  gpu.module @kernels {
    gpu.func @builtin_local_id_x() kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [16, 1, 1]>} {
      %thread_id_x = gpu.thread_id  x
      gpu.return
    }
  }
}

// -----
module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader, Int64], []>, #spirv.resource_limits<>>} {
  func.func @builtin() {
    %c1 = arith.constant 1 : index
    gpu.launch_func  @kernels::@builtin_num_workgroups_x blocks in (%c1, %c1, %c1) threads in (%c1, %c1, %c1)  
    return
  }
  gpu.module @kernels {
    gpu.func @builtin_num_workgroups_x() kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [16, 1, 1]>} {
      %grid_dim_x = gpu.grid_dim  x
      gpu.return
    }
  }
}

// -----
module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader, Int64], []>, #spirv.resource_limits<>>} {
  gpu.module @kernels {
    gpu.func @builtin_subgroup_id() kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [16, 1, 1]>} {
      %0 = gpu.subgroup_id : index
      gpu.return
    }
  }
}

// -----
module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader, Int64], []>, #spirv.resource_limits<>>} {
  gpu.module @kernels {
    gpu.func @builtin_num_subgroups() kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [16, 1, 1]>} {
      %0 = gpu.num_subgroups : index
      gpu.return
    }
  }
}

// -----
module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader, Int64], []>, #spirv.resource_limits<>>} {
  func.func @builtin() {
    %c1 = arith.constant 1 : index
    gpu.launch_func  @kernels::@builtin_workgroup_size_x blocks in (%c1, %c1, %c1) threads in (%c1, %c1, %c1)  
    return
  }
  gpu.module @kernels {
    gpu.func @builtin_workgroup_size_x() kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<>} {
      %block_dim_x = gpu.block_dim  x
      gpu.return
    }
  }
}

// -----
module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader, Int64], []>, #spirv.resource_limits<>>} {
  func.func @builtin() {
    %c1 = arith.constant 1 : index
    gpu.launch_func  @kernels::@builtin_workgroup_size_y blocks in (%c1, %c1, %c1) threads in (%c1, %c1, %c1)  
    return
  }
  gpu.module @kernels {
    gpu.func @builtin_workgroup_size_y() kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<>} {
      %block_dim_y = gpu.block_dim  y
      gpu.return
    }
  }
}

// -----
module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader, Int64], []>, #spirv.resource_limits<>>} {
  func.func @builtin() {
    %c1 = arith.constant 1 : index
    gpu.launch_func  @kernels::@builtin_workgroup_size_z blocks in (%c1, %c1, %c1) threads in (%c1, %c1, %c1)  
    return
  }
  gpu.module @kernels {
    gpu.func @builtin_workgroup_size_z() kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<>} {
      %block_dim_z = gpu.block_dim  z
      gpu.return
    }
  }
}

// -----
module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader, Int64], []>, #spirv.resource_limits<>>} {
  func.func @builtin() {
    %c1 = arith.constant 1 : index
    gpu.launch_func  @kernels::@builtin_global_id_x blocks in (%c1, %c1, %c1) threads in (%c1, %c1, %c1)  
    return
  }
  gpu.module @kernels {
    gpu.func @builtin_global_id_x() kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [16, 1, 1]>} {
      %global_id_x = gpu.global_id  x
      gpu.return
    }
  }
}

// -----
module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader, Int64], []>, #spirv.resource_limits<>>} {
  func.func @builtin() {
    %c1 = arith.constant 1 : index
    gpu.launch_func  @kernels::@builtin_global_id_y blocks in (%c1, %c1, %c1) threads in (%c1, %c1, %c1)  
    return
  }
  gpu.module @kernels {
    gpu.func @builtin_global_id_y() kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [16, 1, 1]>} {
      %global_id_y = gpu.global_id  y
      gpu.return
    }
  }
}

// -----
module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader, Int64], []>, #spirv.resource_limits<>>} {
  func.func @builtin() {
    %c1 = arith.constant 1 : index
    gpu.launch_func  @kernels::@builtin_global_id_z blocks in (%c1, %c1, %c1) threads in (%c1, %c1, %c1)  
    return
  }
  gpu.module @kernels {
    gpu.func @builtin_global_id_z() kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [16, 1, 1]>} {
      %global_id_z = gpu.global_id  z
      gpu.return
    }
  }
}

// -----
module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader, Int64], []>, #spirv.resource_limits<>>} {
  gpu.module @kernels {
    gpu.func @builtin_subgroup_size() kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [16, 1, 1]>} {
      %0 = gpu.subgroup_size : index
      gpu.return
    }
  }
}

