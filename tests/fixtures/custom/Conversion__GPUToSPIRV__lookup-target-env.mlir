module attributes {gpu.container_module} {
  gpu.module @kernels [#spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>] {
    gpu.func @load_kernel(%arg0: memref<12x4xf32>) kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [16, 1, 1]>} {
      %c0 = arith.constant 0 : index
      %0 = memref.load %arg0[%c0, %c0] : memref<12x4xf32>
      gpu.return
    }
  }
}

// -----
module attributes {gpu.container_module} {
  gpu.module @kernels [#spirv.target_env<#spirv.vce<v1.4, [Shader], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>, #spirv.target_env<#spirv.vce<v1.0, [Kernel], []>, #spirv.resource_limits<>>, #spirv.target_env<#spirv.vce<v1.0, [Shader], []>, #spirv.resource_limits<>>] {
    gpu.func @load_kernel(%arg0: memref<12x4xf32>) kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [16, 1, 1]>} {
      %c0 = arith.constant 0 : index
      %0 = memref.load %arg0[%c0, %c0] : memref<12x4xf32>
      gpu.return
    }
  }
}

