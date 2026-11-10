module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.4, [Shader], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} {
  gpu.module @kernels {
    gpu.func @kernel_add(%arg0: memref<8xi32>, %arg1: memref<8xi32>, %arg2: memref<8xi32>, %arg3: memref<8xi32>) kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [1, 1, 1]>} {
      %block_id_x = gpu.block_id x
      %0 = memref.load %arg0[%block_id_x] : memref<8xi32>
      %1 = memref.load %arg1[%block_id_x] : memref<8xi32>
      %low, %high = arith.mului_extended %0, %1 : i32
      memref.store %low, %arg2[%block_id_x] : memref<8xi32>
      memref.store %high, %arg3[%block_id_x] : memref<8xi32>
      gpu.return
    }
  }
  func.func @main() {
    %alloc = memref.alloc() : memref<8xi32>
    %alloc_0 = memref.alloc() : memref<8xi32>
    %alloc_1 = memref.alloc() : memref<8xi32>
    %alloc_2 = memref.alloc() : memref<8xi32>
    %c0_i32 = arith.constant 0 : i32
    %cast = memref.cast %alloc_1 : memref<8xi32> to memref<?xi32>
    %cast_3 = memref.cast %alloc_2 : memref<8xi32> to memref<?xi32>
    call @fillResource1DInt(%cast, %c0_i32) : (memref<?xi32>, i32) -> ()
    call @fillResource1DInt(%cast_3, %c0_i32) : (memref<?xi32>, i32) -> ()
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    %cst = arith.constant dense<[0, 1, -1, -1, 65535, 65535, -65535, 7]> : vector<8xi32>
    %cst_4 = arith.constant dense<[0, 1, 2, -1, 16, -1337, -65535, -7]> : vector<8xi32>
    vector.store %cst, %alloc[%c0] : memref<8xi32>, vector<8xi32>
    vector.store %cst_4, %alloc_0[%c0] : memref<8xi32>, vector<8xi32>
    gpu.launch_func  @kernels::@kernel_add blocks in (%c8, %c1, %c1) threads in (%c1, %c1, %c1)  args(%alloc : memref<8xi32>, %alloc_0 : memref<8xi32>, %alloc_1 : memref<8xi32>, %alloc_2 : memref<8xi32>)
    %cast_5 = memref.cast %cast : memref<?xi32> to memref<*xi32>
    %cast_6 = memref.cast %cast_3 : memref<?xi32> to memref<*xi32>
    call @printMemrefI32(%cast_5) : (memref<*xi32>) -> ()
    call @printMemrefI32(%cast_6) : (memref<*xi32>) -> ()
    return
  }
  func.func private @fillResource1DInt(memref<?xi32>, i32)
  func.func private @printMemrefI32(memref<*xi32>)
}

