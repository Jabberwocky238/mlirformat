module @add attributes {gpu.container_module} {
  memref.global "private" constant @__constant_2x2x2xf32_0 : memref<2x2x2xf32> = dense<[[[1.100000e+00, 2.200000e+00], [3.300000e+00, 4.400000e+00]], [[5.500000e+00, 6.600000e+00], [7.6999998, 8.800000e+00]]]>
  memref.global "private" constant @__constant_2x2x2xf32 : memref<2x2x2xf32> = dense<[[[1.200000e+00, 2.300000e+00], [4.500000e+00, 5.800000e+00]], [[7.1999998, 8.300000e+00], [1.050000e+01, 1.180000e+01]]]>
  func.func @main() {
    %0 = memref.get_global @__constant_2x2x2xf32 : memref<2x2x2xf32>
    %1 = memref.get_global @__constant_2x2x2xf32_0 : memref<2x2x2xf32>
    %2 = call @test(%0, %1) : (memref<2x2x2xf32>, memref<2x2x2xf32>) -> memref<2x2x2xf32>
    %cast = memref.cast %2 : memref<2x2x2xf32> to memref<*xf32>
    call @printMemrefF32(%cast) : (memref<*xf32>) -> ()
    return
  }
  func.func private @printMemrefF32(memref<*xf32>)
  func.func @test(%arg0: memref<2x2x2xf32>, %arg1: memref<2x2x2xf32>) -> memref<2x2x2xf32> {
    %c2 = arith.constant 2 : index
    %c1 = arith.constant 1 : index
    %memref = gpu.alloc  host_shared () : memref<2x2x2xf32>
    memref.copy %arg1, %memref : memref<2x2x2xf32> to memref<2x2x2xf32>
    %memref_0 = gpu.alloc  host_shared () : memref<2x2x2xf32>
    memref.copy %arg0, %memref_0 : memref<2x2x2xf32> to memref<2x2x2xf32>
    %memref_1 = gpu.alloc  host_shared () : memref<2x2x2xf32>
    %0 = gpu.wait async
    %1 = gpu.launch_func async [%0] @test_kernel::@test_kernel blocks in (%c2, %c2, %c2) threads in (%c1, %c1, %c1)  args(%memref_0 : memref<2x2x2xf32>, %memref : memref<2x2x2xf32>, %memref_1 : memref<2x2x2xf32>)
    gpu.wait [%1]
    %alloc = memref.alloc() : memref<2x2x2xf32>
    memref.copy %memref_1, %alloc : memref<2x2x2xf32> to memref<2x2x2xf32>
    %2 = gpu.wait async
    %3 = gpu.dealloc async [%2] %memref_1 : memref<2x2x2xf32>
    %4 = gpu.dealloc async [%3] %memref_0 : memref<2x2x2xf32>
    %5 = gpu.dealloc async [%4] %memref : memref<2x2x2xf32>
    gpu.wait [%5]
    return %alloc : memref<2x2x2xf32>
  }
  gpu.module @test_kernel attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Addresses, Int64, Kernel], []>, api=OpenCL, #spirv.resource_limits<>>} {
    gpu.func @test_kernel(%arg0: memref<2x2x2xf32>, %arg1: memref<2x2x2xf32>, %arg2: memref<2x2x2xf32>) kernel attributes {gpu.known_block_size = array<i32: 1, 1, 1>, gpu.known_grid_size = array<i32: 2, 2, 2>, spirv.entry_point_abi = #spirv.entry_point_abi<>} {
      %block_id_x = gpu.block_id  x
      %block_id_y = gpu.block_id  y
      %block_id_z = gpu.block_id  z
      %0 = memref.load %arg0[%block_id_x, %block_id_y, %block_id_z] : memref<2x2x2xf32>
      %1 = memref.load %arg1[%block_id_x, %block_id_y, %block_id_z] : memref<2x2x2xf32>
      %2 = arith.addf %0, %1 : f32
      memref.store %2, %arg2[%block_id_x, %block_id_y, %block_id_z] : memref<2x2x2xf32>
      gpu.return
    }
  }
}

