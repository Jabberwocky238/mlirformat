module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} {
  gpu.module @kernels {
    gpu.func @kernel_addi(%arg0: memref<8xi32>, %arg1: memref<8x8xi32>, %arg2: memref<8x8x8xi32>) kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [1, 1, 1]>} {
      %block_id_x = gpu.block_id  x
      %block_id_y = gpu.block_id  y
      %block_id_z = gpu.block_id  z
      %0 = memref.load %arg0[%block_id_x] : memref<8xi32>
      %1 = memref.load %arg1[%block_id_y, %block_id_x] : memref<8x8xi32>
      %2 = arith.addi %0, %1 : i32
      memref.store %2, %arg2[%block_id_z, %block_id_y, %block_id_x] : memref<8x8x8xi32>
      gpu.return
    }
  }
  func.func @main() {
    %alloc = memref.alloc() : memref<8xi32>
    %alloc_0 = memref.alloc() : memref<8x8xi32>
    %alloc_1 = memref.alloc() : memref<8x8x8xi32>
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    %c2_i32 = arith.constant 2 : i32
    %cast = memref.cast %alloc : memref<8xi32> to memref<?xi32>
    %cast_2 = memref.cast %alloc_0 : memref<8x8xi32> to memref<?x?xi32>
    %cast_3 = memref.cast %alloc_1 : memref<8x8x8xi32> to memref<?x?x?xi32>
    call @fillResource1DInt(%cast, %c1_i32) : (memref<?xi32>, i32) -> ()
    call @fillResource2DInt(%cast_2, %c2_i32) : (memref<?x?xi32>, i32) -> ()
    call @fillResource3DInt(%cast_3, %c0_i32) : (memref<?x?x?xi32>, i32) -> ()
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    gpu.launch_func  @kernels::@kernel_addi blocks in (%c8, %c8, %c8) threads in (%c1, %c1, %c1)  args(%alloc : memref<8xi32>, %alloc_0 : memref<8x8xi32>, %alloc_1 : memref<8x8x8xi32>)
    %cast_4 = memref.cast %cast_3 : memref<?x?x?xi32> to memref<*xi32>
    call @printMemrefI32(%cast_4) : (memref<*xi32>) -> ()
    return
  }
  func.func private @fillResource1DInt(memref<?xi32>, i32)
  func.func private @fillResource2DInt(memref<?x?xi32>, i32)
  func.func private @fillResource3DInt(memref<?x?x?xi32>, i32)
  func.func private @printMemrefI32(memref<*xi32>)
}

