module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], []>, #spirv.resource_limits<>>} {
  func.func @main() {
    %c1 = arith.constant 1 : index
    gpu.launch_func  @kernels_1::@builtin_workgroup_id_x blocks in (%c1, %c1, %c1) threads in (%c1, %c1, %c1)  
    gpu.launch_func  @KERNELS_2::@builtin_workgroup_id_y blocks in (%c1, %c1, %c1) threads in (%c1, %c1, %c1)  
    return
  }
  gpu.module @kernels_1 {
    gpu.func @builtin_workgroup_id_x() kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [16, 1, 1]>} {
      %block_id_x = gpu.block_id x
      gpu.return
    }
  }
  gpu.module @KERNELS_2 {
    gpu.func @builtin_workgroup_id_y() kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [16, 1, 1]>} {
      %block_id_y = gpu.block_id y
      gpu.return
    }
  }
}

// -----
module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} {
  func.func @main(%arg0: memref<2xi32>, %arg1: memref<4xi32>) {
    %c1 = arith.constant 1 : index
    gpu.launch_func  @kernels::@kernel_foo blocks in (%c1, %c1, %c1) threads in (%c1, %c1, %c1)  args(%arg0 : memref<2xi32>, %arg1 : memref<4xi32>)
    return
  }
  gpu.module @kernels {
    gpu.func @kernel_foo(%arg0: memref<2xi32>, %arg1: memref<4xi32>) kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [1, 1, 1]>} {
      %c0 = arith.constant 0 : index
      %cst = arith.constant dense<0> : vector<2xi32>
      %0 = memref.load %arg0[%c0] : memref<2xi32>
      %1 = vector.insert %0, %cst [%c0] : i32 into vector<2xi32>
      %2 = vector.shuffle %1, %1 [3, 2, 1, 0] : vector<2xi32>, vector<2xi32>
      %3 = vector.extract %2[%c0] : i32 from vector<4xi32>
      memref.store %3, %arg1[%c0] : memref<4xi32>
      gpu.return
    }
  }
}

