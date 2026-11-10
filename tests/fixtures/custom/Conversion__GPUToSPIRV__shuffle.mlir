module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.4, [Shader, GroupNonUniformShuffle], []>, #spirv.resource_limits<subgroup_size = 16>>} {
  gpu.module @kernels {
    gpu.func @shuffle_xor() kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [16, 1, 1]>} {
      %c8_i32 = arith.constant 8 : i32
      %c16_i32 = arith.constant 16 : i32
      %cst = arith.constant 4.200000e+01 : f32
      %shuffleResult, %valid = gpu.shuffle xor %cst, %c8_i32, %c16_i32 : f32
      gpu.return
    }
  }
}

// -----
module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.4, [Shader, GroupNonUniformShuffle], []>, #spirv.resource_limits<subgroup_size = 16>>} {
  gpu.module @kernels {
    gpu.func @shuffle_idx() kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [16, 1, 1]>} {
      %c8_i32 = arith.constant 8 : i32
      %c16_i32 = arith.constant 16 : i32
      %cst = arith.constant 4.200000e+01 : f32
      %shuffleResult, %valid = gpu.shuffle idx %cst, %c8_i32, %c16_i32 : f32
      gpu.return
    }
  }
}

// -----
module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.4, [Shader, GroupNonUniformShuffle, GroupNonUniformShuffleRelative], []>, #spirv.resource_limits<subgroup_size = 16>>} {
  gpu.module @kernels {
    gpu.func @shuffle_down() kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [16, 1, 1]>} {
      %c4_i32 = arith.constant 4 : i32
      %c16_i32 = arith.constant 16 : i32
      %cst = arith.constant 4.200000e+01 : f32
      %shuffleResult, %valid = gpu.shuffle down %cst, %c4_i32, %c16_i32 : f32
      gpu.return
    }
  }
}

// -----
module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.4, [Shader, GroupNonUniformShuffle, GroupNonUniformShuffleRelative], []>, #spirv.resource_limits<subgroup_size = 16>>} {
  gpu.module @kernels {
    gpu.func @shuffle_up() kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [16, 1, 1]>} {
      %c4_i32 = arith.constant 4 : i32
      %c16_i32 = arith.constant 16 : i32
      %cst = arith.constant 4.200000e+01 : f32
      %shuffleResult, %valid = gpu.shuffle up %cst, %c4_i32, %c16_i32 : f32
      gpu.return
    }
  }
}

