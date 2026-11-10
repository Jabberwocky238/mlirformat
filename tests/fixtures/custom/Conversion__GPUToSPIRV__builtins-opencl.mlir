module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Addresses, Kernel, Int64], []>, #spirv.resource_limits<>>} {
  func.func @builtin() {
    %c1 = arith.constant 1 : index
    gpu.launch_func  @kernels::@builtin_workgroup_id_x blocks in (%c1, %c1, %c1) threads in (%c1, %c1, %c1)  
    return
  }
  gpu.module @kernels {
    gpu.func @builtin_workgroup_id_x() kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [16, 1, 1]>} {
      %block_id_x = gpu.block_id x
      gpu.return
    }
  }
}

// -----
module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Addresses, Kernel, Int64], []>, #spirv.resource_limits<>>} {
  gpu.module @kernels {
    gpu.func @builtin_subgroup_size() kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [16, 1, 1]>} {
      %0 = gpu.subgroup_size : index
      gpu.return
    }
  }
}

// -----
module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Addresses, Kernel, Int64], []>, #spirv.resource_limits<>>} {
  gpu.module @kernels {
    gpu.func @builtin_laneid() kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [16, 1, 1]>} {
      %0 = gpu.lane_id
      gpu.return
    }
  }
}

