module attributes {gpu.container_module} {
  gpu.module @kernels {
    gpu.func @basic_module_structure(%arg0: f32, %arg1: memref<12xf32, #spirv.storage_class<StorageBuffer>>) kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [32, 4, 1]>} {
      gpu.return
    }
  }
  func.func @main() {
    %0 = "op"() : () -> f32
    %1 = "op"() : () -> memref<12xf32, #spirv.storage_class<StorageBuffer>>
    %c1 = arith.constant 1 : index
    gpu.launch_func  @kernels::@basic_module_structure blocks in (%c1, %c1, %c1) threads in (%c1, %c1, %c1)  args(%0 : f32, %1 : memref<12xf32, #spirv.storage_class<StorageBuffer>>)
    return
  }
}

// -----
module attributes {gpu.container_module} {
  gpu.module @kernels {
    gpu.func @basic_module_structure_preset_ABI(%arg0: f32 {spirv.interface_var_abi = #spirv.interface_var_abi<(1, 2), StorageBuffer>}, %arg1: memref<12xf32, #spirv.storage_class<StorageBuffer>> {spirv.interface_var_abi = #spirv.interface_var_abi<(3, 0)>}) kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [32, 4, 1]>} {
      gpu.return
    }
  }
}

// -----
module attributes {gpu.container_module} {
  gpu.module @kernels {
    gpu.func @barrier(%arg0: f32, %arg1: memref<12xf32, #spirv.storage_class<StorageBuffer>>) kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [32, 4, 1]>} {
      gpu.barrier
      gpu.return
    }
  }
  func.func @main() {
    %0 = "op"() : () -> f32
    %1 = "op"() : () -> memref<12xf32, #spirv.storage_class<StorageBuffer>>
    %c1 = arith.constant 1 : index
    gpu.launch_func  @kernels::@barrier blocks in (%c1, %c1, %c1) threads in (%c1, %c1, %c1)  args(%0 : f32, %1 : memref<12xf32, #spirv.storage_class<StorageBuffer>>)
    return
  }
}

// -----
module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.1, [Kernel, Addresses, NamedBarrier], []>, #spirv.resource_limits<>>} {
  gpu.module @kernels {
    gpu.func @barrier_subgroup_scope() kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [32, 1, 1]>} {
      gpu.barrier scope <subgroup>
      gpu.return
    }
  }
}

// -----
module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.1, [Kernel, Addresses, NamedBarrier], []>, #spirv.resource_limits<>>} {
  gpu.module @kernels {
    gpu.func @named_barrier(%arg0: i32) kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [32, 1, 1]>} {
      %0 = gpu.initialize_named_barrier %arg0 : i32 -> !gpu.named_barrier
      gpu.barrier named(%0 : !gpu.named_barrier)
      gpu.return
    }
  }
}

