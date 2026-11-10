"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernels"}> ({
    "gpu.func"() <{function_type = (f32) -> (), kernel}> ({
    ^bb0(%arg0: f32):
      %0 = "gpu.all_reduce"(%arg0) <{op = #gpu<all_reduce_op add>}> ({
      }) : (f32) -> f32
      "gpu.return"() : () -> ()
    }) {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [16, 1, 1]>, sym_name = "all_reduce"} : () -> ()
  }) : () -> ()
}) {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.3, [Kernel, Addresses, Groups, GroupNonUniformArithmetic, GroupUniformArithmeticKHR], []>, #spirv.resource_limits<>>} : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernels"}> ({
    "gpu.func"() <{function_type = (f32, memref<f32>) -> (), kernel}> ({
    ^bb0(%arg0: f32, %arg1: memref<f32>):
      %0 = "gpu.subgroup_reduce"(%arg0) <{cluster_stride = 1 : i32, op = #gpu<all_reduce_op add>}> : (f32) -> f32
      "memref.store"(%0, %arg1) : (f32, memref<f32>) -> ()
      "gpu.return"() : () -> ()
    }) {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [16, 1, 1]>, sym_name = "subgroup_reduce"} : () -> ()
  }) : () -> ()
}) {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.3, [Kernel, Addresses, Groups, GroupNonUniformArithmetic, GroupUniformArithmeticKHR], []>, #spirv.resource_limits<>>} : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernels"}> ({
    "gpu.func"() <{function_type = (memref<12x4xf32, #spirv.storage_class<StorageBuffer>>, memref<12x4xf32, #spirv.storage_class<StorageBuffer>>, memref<12x4xf32, #spirv.storage_class<StorageBuffer>>, index, index, index, index) -> (), kernel}> ({
    ^bb0(%arg0: memref<12x4xf32, #spirv.storage_class<StorageBuffer>>, %arg1: memref<12x4xf32, #spirv.storage_class<StorageBuffer>>, %arg2: memref<12x4xf32, #spirv.storage_class<StorageBuffer>>, %arg3: index, %arg4: index, %arg5: index, %arg6: index):
      %0 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index
      %1 = "gpu.block_id"() <{dimension = #gpu<dim y>}> : () -> index
      %2 = "gpu.block_id"() <{dimension = #gpu<dim z>}> : () -> index
      %3 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index
      %4 = "gpu.thread_id"() <{dimension = #gpu<dim y>}> : () -> index
      %5 = "gpu.thread_id"() <{dimension = #gpu<dim z>}> : () -> index
      %6 = "gpu.grid_dim"() <{dimension = #gpu<dim x>}> : () -> index
      %7 = "gpu.grid_dim"() <{dimension = #gpu<dim y>}> : () -> index
      %8 = "gpu.grid_dim"() <{dimension = #gpu<dim z>}> : () -> index
      %9 = "gpu.block_dim"() <{dimension = #gpu<dim x>}> : () -> index
      %10 = "gpu.block_dim"() <{dimension = #gpu<dim y>}> : () -> index
      %11 = "gpu.block_dim"() <{dimension = #gpu<dim z>}> : () -> index
      %12 = "arith.addi"(%arg3, %0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %13 = "arith.addi"(%arg4, %3) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %14 = "memref.load"(%arg0, %12, %13) : (memref<12x4xf32, #spirv.storage_class<StorageBuffer>>, index, index) -> f32
      %15 = "memref.load"(%arg1, %12, %13) : (memref<12x4xf32, #spirv.storage_class<StorageBuffer>>, index, index) -> f32
      %16 = "arith.addf"(%14, %15) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "memref.store"(%16, %arg2, %12, %13) : (f32, memref<12x4xf32, #spirv.storage_class<StorageBuffer>>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [16, 1, 1]>, sym_name = "load_store"} : () -> ()
  }) : () -> ()
}) {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} : () -> ()

