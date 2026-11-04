module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.3, [Kernel, Addresses, Groups, GroupNonUniformArithmetic, GroupUniformArithmeticKHR], []>, #spirv.resource_limits<>>} {
  gpu.module @kernels {
    gpu.func @all_reduce(%arg0: f32) kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [16, 1, 1]>} {
      %0 = gpu.all_reduce  add %arg0 {
      } : (f32) -> f32
      gpu.return
    }
  }
}

// -----
module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.3, [Kernel, Addresses, Groups, GroupNonUniformArithmetic, GroupUniformArithmeticKHR], []>, #spirv.resource_limits<>>} {
  gpu.module @kernels {
    gpu.func @subgroup_reduce(%arg0: f32) kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [16, 1, 1]>} {
      %0 = gpu.subgroup_reduce  add %arg0 : (f32) -> f32
      gpu.return
    }
  }
}

// -----
module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} {
  gpu.module @kernels {
    gpu.func @load_store(%arg0: memref<12x4xf32, #spirv.storage_class<StorageBuffer>>, %arg1: memref<12x4xf32, #spirv.storage_class<StorageBuffer>>, %arg2: memref<12x4xf32, #spirv.storage_class<StorageBuffer>>, %arg3: index, %arg4: index, %arg5: index, %arg6: index) kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [16, 1, 1]>} {
      %block_id_x = gpu.block_id  x
      %block_id_y = gpu.block_id  y
      %block_id_z = gpu.block_id  z
      %thread_id_x = gpu.thread_id  x
      %thread_id_y = gpu.thread_id  y
      %thread_id_z = gpu.thread_id  z
      %grid_dim_x = gpu.grid_dim  x
      %grid_dim_y = gpu.grid_dim  y
      %grid_dim_z = gpu.grid_dim  z
      %block_dim_x = gpu.block_dim  x
      %block_dim_y = gpu.block_dim  y
      %block_dim_z = gpu.block_dim  z
      %0 = arith.addi %arg3, %block_id_x : index
      %1 = arith.addi %arg4, %thread_id_x : index
      %2 = memref.load %arg0[%0, %1] : memref<12x4xf32, #spirv.storage_class<StorageBuffer>>
      %3 = memref.load %arg1[%0, %1] : memref<12x4xf32, #spirv.storage_class<StorageBuffer>>
      %4 = arith.addf %2, %3 : f32
      memref.store %4, %arg2[%0, %1] : memref<12x4xf32, #spirv.storage_class<StorageBuffer>>
      gpu.return
    }
  }
}

