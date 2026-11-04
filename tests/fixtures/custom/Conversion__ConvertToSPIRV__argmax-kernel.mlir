module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.3, [Shader, Groups, GroupNonUniformArithmetic, GroupNonUniformBallot], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} {
  gpu.module @kernels {
    gpu.func @argmax(%arg0: memref<4xf32>, %arg1: memref<i32>) kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [32, 1, 1]>} {
      %c0 = arith.constant 0 : index
      %c1_i32 = arith.constant 1 : i32
      %c1 = arith.constant 1 : index
      %c32_i32 = arith.constant 32 : i32
      %0 = arith.divui %c1_i32, %c32_i32 : i32
      %thread_id_x = gpu.thread_id  x
      %1 = index.castu %thread_id_x : index to i32
      %2 = index.castu %0 : i32 to index
      %c0_i32 = arith.constant 0 : i32
      %3 = memref.load %arg0[%thread_id_x] : memref<4xf32>
      %4:2 = scf.for %arg2 = %c1 to %2 step %c1 iter_args(%arg3 = %c0_i32, %arg4 = %3) -> (i32, f32) {
        %10 = index.castu %arg2 : index to i32
        %11 = arith.muli %c32_i32, %10 : i32
        %12 = arith.addi %11, %1 : i32
        %13 = index.castu %12 : i32 to index
        %14 = memref.load %arg0[%13] : memref<4xf32>
        %15 = arith.cmpf ogt, %14, %arg4 : f32
        %16 = arith.select %15, %12, %arg3 : i32
        %17 = arith.select %15, %14, %arg4 : f32
        scf.yield %16, %17 : i32, f32
      }
      %5 = gpu.subgroup_reduce  maximumf %4#1 : (f32) -> f32
      %6 = arith.cmpf oeq, %4#1, %5 : f32
      %7 = spirv.GroupNonUniformBallot <Subgroup> %6 : vector<4xi32>
      %8 = spirv.GroupNonUniformBallotFindLSB <Subgroup> %7 : vector<4xi32>, i32
      %9 = arith.cmpi eq, %c1_i32, %1 : i32
      scf.if %9 {
        memref.store %4#0, %arg1[] : memref<i32>
      }
      gpu.return
    }
  }
}

