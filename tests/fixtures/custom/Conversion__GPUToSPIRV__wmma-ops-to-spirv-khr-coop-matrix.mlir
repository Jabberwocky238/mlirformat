module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.6, [Shader, CooperativeMatrixKHR, Float16, Int8], [SPV_KHR_storage_buffer_storage_class, SPV_KHR_cooperative_matrix]>, #spirv.resource_limits<>>} {
  gpu.module @kernels {
    gpu.func @gpu_wmma_load_op(%arg0: memref<32x32xf16, #spirv.storage_class<StorageBuffer>>) kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [32, 4, 1]>} {
      %c16 = arith.constant 16 : index
      %c16_0 = arith.constant 16 : index
      %0 = gpu.subgroup_mma_load_matrix %arg0[%c16, %c16_0] {leadDimension = 32 : index} : memref<32x32xf16, #spirv.storage_class<StorageBuffer>> -> !gpu.mma_matrix<16x16xf16, "COp">
      %1 = gpu.subgroup_mma_load_matrix %arg0[%c16, %c16_0] {leadDimension = 32 : index, transpose} : memref<32x32xf16, #spirv.storage_class<StorageBuffer>> -> !gpu.mma_matrix<16x16xf16, "COp">
      gpu.return
    }
    gpu.func @gpu_wmma_store_op(%arg0: memref<32x32xf16, #spirv.storage_class<StorageBuffer>>, %arg1: !gpu.mma_matrix<16x16xf16, "COp">) kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [32, 4, 1]>} {
      %c16 = arith.constant 16 : index
      %c16_0 = arith.constant 16 : index
      gpu.subgroup_mma_store_matrix %arg1, %arg0[%c16, %c16_0] {leadDimension = 32 : index} : !gpu.mma_matrix<16x16xf16, "COp">, memref<32x32xf16, #spirv.storage_class<StorageBuffer>>
      gpu.subgroup_mma_store_matrix %arg1, %arg0[%c16, %c16_0] {leadDimension = 32 : index, transpose} : !gpu.mma_matrix<16x16xf16, "COp">, memref<32x32xf16, #spirv.storage_class<StorageBuffer>>
      gpu.return
    }
    gpu.func @gpu_wmma_mma_op(%arg0: !gpu.mma_matrix<16x16xf16, "AOp">, %arg1: !gpu.mma_matrix<16x16xf16, "BOp">, %arg2: !gpu.mma_matrix<16x16xf16, "COp">, %arg3: memref<16x16xf16, #spirv.storage_class<StorageBuffer>>) kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [32, 4, 1]>} {
      %0 = gpu.subgroup_mma_compute %arg0, %arg1, %arg2 : !gpu.mma_matrix<16x16xf16, "AOp">, !gpu.mma_matrix<16x16xf16, "BOp"> -> !gpu.mma_matrix<16x16xf16, "COp">
      %c0 = arith.constant 0 : index
      gpu.subgroup_mma_store_matrix %0, %arg3[%c0, %c0] {leadDimension = 32 : index} : !gpu.mma_matrix<16x16xf16, "COp">, memref<16x16xf16, #spirv.storage_class<StorageBuffer>>
      gpu.return
    }
    gpu.func @gpu_wmma_signed_i8_mma_op(%arg0: !gpu.mma_matrix<16x16xsi8, "AOp">, %arg1: !gpu.mma_matrix<16x16xsi8, "BOp">, %arg2: !gpu.mma_matrix<16x16xi32, "COp">, %arg3: memref<16x16xi32, #spirv.storage_class<StorageBuffer>>) kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [32, 4, 1]>} {
      %0 = gpu.subgroup_mma_compute %arg0, %arg1, %arg2 : !gpu.mma_matrix<16x16xsi8, "AOp">, !gpu.mma_matrix<16x16xsi8, "BOp"> -> !gpu.mma_matrix<16x16xi32, "COp">
      %c0 = arith.constant 0 : index
      gpu.subgroup_mma_store_matrix %0, %arg3[%c0, %c0] {leadDimension = 32 : index} : !gpu.mma_matrix<16x16xi32, "COp">, memref<16x16xi32, #spirv.storage_class<StorageBuffer>>
      gpu.return
    }
    gpu.func @gpu_wmma_constant_op(%arg0: memref<16x16xf16, #spirv.storage_class<StorageBuffer>>) kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [32, 4, 1]>} {
      %cst = arith.constant 1.000000e+00 : f16
      %0 = gpu.subgroup_mma_constant_matrix %cst : !gpu.mma_matrix<16x16xf16, "COp">
      %c0 = arith.constant 0 : index
      gpu.subgroup_mma_store_matrix %0, %arg0[%c0, %c0] {leadDimension = 32 : index} : !gpu.mma_matrix<16x16xf16, "COp">, memref<16x16xf16, #spirv.storage_class<StorageBuffer>>
      gpu.return
    }
    gpu.func @gpu_wmma_extract_thread_local_op(%arg0: !gpu.mma_matrix<16x16xf32, "AOp">, %arg1: memref<16x16xf32, #spirv.storage_class<StorageBuffer>>) kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [32, 4, 1]>} {
      %c0 = arith.constant 0 : index
      %0 = gpu.subgroup_mma_extract_thread_local %arg0[%c0] : !gpu.mma_matrix<16x16xf32, "AOp"> -> f32
      memref.store %0, %arg1[%c0, %c0] : memref<16x16xf32, #spirv.storage_class<StorageBuffer>>
      gpu.return
    }
    gpu.func @gpu_wmma_insert_thread_local_op(%arg0: f16, %arg1: !gpu.mma_matrix<16x16xf16, "COp">, %arg2: memref<16x16xf16, #spirv.storage_class<StorageBuffer>>) kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [32, 4, 1]>} {
      %c0 = arith.constant 0 : index
      %0 = gpu.subgroup_mma_insert_thread_local %arg0, %arg1[%c0] : f16, !gpu.mma_matrix<16x16xf16, "COp"> -> !gpu.mma_matrix<16x16xf16, "COp">
      gpu.subgroup_mma_store_matrix %0, %arg2[%c0, %c0] {leadDimension = 16 : index} : !gpu.mma_matrix<16x16xf16, "COp">, memref<16x16xf16, #spirv.storage_class<StorageBuffer>>
      gpu.return
    }
    gpu.func @gpu_wmma_elementwise_op_default(%arg0: !gpu.mma_matrix<16x16xf16, "COp">, %arg1: !gpu.mma_matrix<16x16xf16, "COp">, %arg2: memref<16x16xf16, #spirv.storage_class<StorageBuffer>>) kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [32, 4, 1]>} {
      %0 = gpu.subgroup_mma_elementwise addf %arg0, %arg1 : (!gpu.mma_matrix<16x16xf16, "COp">, !gpu.mma_matrix<16x16xf16, "COp">) -> !gpu.mma_matrix<16x16xf16, "COp">
      %1 = gpu.subgroup_mma_elementwise negatef %0 : (!gpu.mma_matrix<16x16xf16, "COp">) -> !gpu.mma_matrix<16x16xf16, "COp">
      %2 = gpu.subgroup_mma_elementwise divf %1, %arg0 : (!gpu.mma_matrix<16x16xf16, "COp">, !gpu.mma_matrix<16x16xf16, "COp">) -> !gpu.mma_matrix<16x16xf16, "COp">
      %3 = gpu.subgroup_mma_elementwise mulf %2, %arg0 : (!gpu.mma_matrix<16x16xf16, "COp">, !gpu.mma_matrix<16x16xf16, "COp">) -> !gpu.mma_matrix<16x16xf16, "COp">
      %4 = gpu.subgroup_mma_elementwise extf %3 : (!gpu.mma_matrix<16x16xf16, "COp">) -> !gpu.mma_matrix<16x16xf32, "COp">
      %5 = gpu.subgroup_mma_elementwise truncf %4 : (!gpu.mma_matrix<16x16xf32, "COp">) -> !gpu.mma_matrix<16x16xf16, "COp">
      %c0 = arith.constant 0 : index
      gpu.subgroup_mma_store_matrix %5, %arg2[%c0, %c0] {leadDimension = 32 : index} : !gpu.mma_matrix<16x16xf16, "COp">, memref<16x16xf16, #spirv.storage_class<StorageBuffer>>
      gpu.return
    }
    gpu.func @gpu_wmma_elementwise_op_matrix_times_scalar(%arg0: !gpu.mma_matrix<16x16xf16, "COp">, %arg1: f16, %arg2: memref<16x16xf16, #spirv.storage_class<StorageBuffer>>) kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [32, 4, 1]>} {
      %c0 = arith.constant 0 : index
      %0 = gpu.subgroup_mma_constant_matrix %arg1 : !gpu.mma_matrix<16x16xf16, "COp">
      %1 = gpu.subgroup_mma_elementwise mulf %arg0, %0 : (!gpu.mma_matrix<16x16xf16, "COp">, !gpu.mma_matrix<16x16xf16, "COp">) -> !gpu.mma_matrix<16x16xf16, "COp">
      gpu.subgroup_mma_store_matrix %1, %arg2[%c0, %c0] {leadDimension = 32 : index} : !gpu.mma_matrix<16x16xf16, "COp">, memref<16x16xf16, #spirv.storage_class<StorageBuffer>>
      %2 = gpu.subgroup_mma_elementwise mulf %0, %1 : (!gpu.mma_matrix<16x16xf16, "COp">, !gpu.mma_matrix<16x16xf16, "COp">) -> !gpu.mma_matrix<16x16xf16, "COp">
      gpu.subgroup_mma_store_matrix %2, %arg2[%c0, %c0] {leadDimension = 32 : index} : !gpu.mma_matrix<16x16xf16, "COp">, memref<16x16xf16, #spirv.storage_class<StorageBuffer>>
      gpu.return
    }
    gpu.func @gpu_wmma_elementwise_op_matrix_plus_scalar(%arg0: !gpu.mma_matrix<16x16xf16, "COp">, %arg1: f16, %arg2: memref<16x16xf16, #spirv.storage_class<StorageBuffer>>) kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [32, 4, 1]>} {
      %c0 = arith.constant 0 : index
      %0 = gpu.subgroup_mma_constant_matrix %arg1 : !gpu.mma_matrix<16x16xf16, "COp">
      %1 = gpu.subgroup_mma_elementwise addf %arg0, %0 : (!gpu.mma_matrix<16x16xf16, "COp">, !gpu.mma_matrix<16x16xf16, "COp">) -> !gpu.mma_matrix<16x16xf16, "COp">
      gpu.subgroup_mma_store_matrix %1, %arg2[%c0, %c0] {leadDimension = 32 : index} : !gpu.mma_matrix<16x16xf16, "COp">, memref<16x16xf16, #spirv.storage_class<StorageBuffer>>
      gpu.return
    }
  }
}

