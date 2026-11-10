module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.4, [Shader, GroupNonUniformRotateKHR], []>, #spirv.resource_limits<subgroup_size = 16>>} {
  gpu.module @kernels {
    gpu.func @rotate() kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [16, 1, 1]>} {
      %cst = arith.constant 4.200000e+01 : f32
      %rotateResult, %valid = gpu.rotate %cst, 4, 16 : f32
      gpu.return
    }
  }
}

// -----
module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.4, [Shader, GroupNonUniformRotateKHR], []>, #spirv.resource_limits<subgroup_size = 16>>} {
  gpu.module @kernels {
    gpu.func @rotate_width_less_than_subgroup_size() kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [16, 1, 1]>} {
      %cst = arith.constant 4.200000e+01 : f32
      %rotateResult, %valid = gpu.rotate %cst, 4, 8 : f32
      gpu.return
    }
  }
}

