module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.3, [Shader, GroupNonUniformBallot], []>, #spirv.resource_limits<>>} {
  gpu.module @kernels {
    gpu.func @ballot_i32() kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [32, 1, 1]>} {
      %c1 = arith.constant 1 : index
      %0 = gpu.lane_id
      %1 = arith.cmpi ult, %0, %c1 : index
      %2 = gpu.ballot %1 : i32
      gpu.return
    }
  }
}

// -----
module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.3, [Shader, GroupNonUniformBallot, Int64], []>, #spirv.resource_limits<>>} {
  gpu.module @kernels {
    gpu.func @ballot_i64() kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [32, 1, 1]>} {
      %c1 = arith.constant 1 : index
      %0 = gpu.lane_id
      %1 = arith.cmpi ult, %0, %c1 : index
      %2 = gpu.ballot %1 : i64
      gpu.return
    }
  }
}

