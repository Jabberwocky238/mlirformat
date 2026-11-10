module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class, SPV_KHR_8bit_storage]>, #spirv.resource_limits<>>} {
  gpu.module @kernels {
    gpu.func @kernel_addi(%arg0: memref<8xi8>, %arg1: memref<8x8xi8>, %arg2: memref<8x8x8xi32>) kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [1, 1, 1]>} {
      %block_id_x = gpu.block_id x
      %block_id_y = gpu.block_id y
      %block_id_z = gpu.block_id z
      %0 = memref.load %arg0[%block_id_x] : memref<8xi8>
      %1 = memref.load %arg1[%block_id_y, %block_id_x] : memref<8x8xi8>
      %2 = arith.addi %0, %1 : i8
      %3 = arith.extui %2 : i8 to i32
      memref.store %3, %arg2[%block_id_z, %block_id_y, %block_id_x] : memref<8x8x8xi32>
      gpu.return
    }
  }
  func.func @main() {
    %alloc = memref.alloc() : memref<8xi8>
    %alloc_0 = memref.alloc() : memref<8x8xi8>
    %alloc_1 = memref.alloc() : memref<8x8x8xi32>
    %c0_i32 = arith.constant 0 : i32
    %c1_i8 = arith.constant 1 : i8
    %c2_i8 = arith.constant 2 : i8
    %cast = memref.cast %alloc : memref<8xi8> to memref<?xi8>
    %cast_2 = memref.cast %alloc_0 : memref<8x8xi8> to memref<?x?xi8>
    %cast_3 = memref.cast %alloc_1 : memref<8x8x8xi32> to memref<?x?x?xi32>
    call @fillResource1DInt8(%cast, %c1_i8) : (memref<?xi8>, i8) -> ()
    call @fillResource2DInt8(%cast_2, %c2_i8) : (memref<?x?xi8>, i8) -> ()
    call @fillResource3DInt(%cast_3, %c0_i32) : (memref<?x?x?xi32>, i32) -> ()
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    gpu.launch_func  @kernels::@kernel_addi blocks in (%c8, %c8, %c8) threads in (%c1, %c1, %c1)  args(%alloc : memref<8xi8>, %alloc_0 : memref<8x8xi8>, %alloc_1 : memref<8x8x8xi32>)
    %cast_4 = memref.cast %cast_3 : memref<?x?x?xi32> to memref<*xi32>
    call @printMemrefI32(%cast_4) : (memref<*xi32>) -> ()
    return
  }
  func.func private @fillResource1DInt8(memref<?xi8>, i8)
  func.func private @fillResource2DInt8(memref<?x?xi8>, i8)
  func.func private @fillResource3DInt(memref<?x?x?xi32>, i32)
  func.func private @printMemrefI32(memref<*xi32>)
}

