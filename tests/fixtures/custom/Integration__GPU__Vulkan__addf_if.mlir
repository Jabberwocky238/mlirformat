module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} {
  gpu.module @kernels {
    gpu.func @kernel_add(%arg0: memref<8xf32>, %arg1: memref<8xf32>, %arg2: memref<8xf32>) kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [1, 1, 1]>} {
      %block_id_x = gpu.block_id x
      %c4 = arith.constant 4 : index
      %0 = arith.cmpi slt, %block_id_x, %c4 : index
      scf.if %0 {
        %1 = memref.load %arg0[%block_id_x] : memref<8xf32>
        %2 = memref.load %arg1[%block_id_x] : memref<8xf32>
        %3 = arith.addf %1, %2 : f32
        memref.store %3, %arg2[%block_id_x] : memref<8xf32>
      }
      gpu.return
    }
  }
  func.func @main() {
    %alloc = memref.alloc() : memref<8xf32>
    %alloc_0 = memref.alloc() : memref<8xf32>
    %alloc_1 = memref.alloc() : memref<8xf32>
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    %c2_i32 = arith.constant 2 : i32
    %cst = arith.constant 0.000000e+00 : f32
    %cst_2 = arith.constant 1.100000e+00 : f32
    %cst_3 = arith.constant 2.200000e+00 : f32
    %cast = memref.cast %alloc : memref<8xf32> to memref<?xf32>
    %cast_4 = memref.cast %alloc_0 : memref<8xf32> to memref<?xf32>
    %cast_5 = memref.cast %alloc_1 : memref<8xf32> to memref<?xf32>
    call @fillResource1DFloat(%cast, %cst_2) : (memref<?xf32>, f32) -> ()
    call @fillResource1DFloat(%cast_4, %cst_3) : (memref<?xf32>, f32) -> ()
    call @fillResource1DFloat(%cast_5, %cst) : (memref<?xf32>, f32) -> ()
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    gpu.launch_func  @kernels::@kernel_add blocks in (%c8, %c1, %c1) threads in (%c1, %c1, %c1)  args(%alloc : memref<8xf32>, %alloc_0 : memref<8xf32>, %alloc_1 : memref<8xf32>)
    %cast_6 = memref.cast %cast_5 : memref<?xf32> to memref<*xf32>
    call @printMemrefF32(%cast_6) : (memref<*xf32>) -> ()
    return
  }
  func.func private @fillResource1DFloat(memref<?xf32>, f32)
  func.func private @printMemrefF32(memref<*xf32>)
}

