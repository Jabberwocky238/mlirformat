module @add attributes {gpu.container_module} {
  memref.global "private" constant @__constant_3x3xi64_0 : memref<3x3xi64> = dense<[[1, 4098, 3], [16777220, 5, 4294967302], [7, 1099511627784, 9]]>
  memref.global "private" constant @__constant_3x3xi64 : memref<3x3xi64> = dense<[[1, 2, 3], [4, 5, 4102], [16777223, 4294967304, 1099511627785]]>
  func.func @main() {
    %0 = memref.get_global @__constant_3x3xi64 : memref<3x3xi64>
    %1 = memref.get_global @__constant_3x3xi64_0 : memref<3x3xi64>
    %2 = call @test(%0, %1) : (memref<3x3xi64>, memref<3x3xi64>) -> memref<3x3xi64>
    %cast = memref.cast %2 : memref<3x3xi64> to memref<*xi64>
    call @printMemrefI64(%cast) : (memref<*xi64>) -> ()
    return
  }
  func.func private @printMemrefI64(memref<*xi64>)
  func.func @test(%arg0: memref<3x3xi64>, %arg1: memref<3x3xi64>) -> memref<3x3xi64> {
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    %memref = gpu.alloc  host_shared () : memref<3x3xi64>
    memref.copy %arg1, %memref : memref<3x3xi64> to memref<3x3xi64>
    %memref_0 = gpu.alloc  host_shared () : memref<3x3xi64>
    memref.copy %arg0, %memref_0 : memref<3x3xi64> to memref<3x3xi64>
    %memref_1 = gpu.alloc  host_shared () : memref<3x3xi64>
    %0 = gpu.wait async
    %1 = gpu.launch_func async [%0] @test_kernel::@test_kernel blocks in (%c3, %c3, %c1) threads in (%c1, %c1, %c1)  args(%memref_0 : memref<3x3xi64>, %memref : memref<3x3xi64>, %memref_1 : memref<3x3xi64>)
    gpu.wait [%1]
    %alloc = memref.alloc() : memref<3x3xi64>
    memref.copy %memref_1, %alloc : memref<3x3xi64> to memref<3x3xi64>
    %2 = gpu.wait async
    %3 = gpu.dealloc async [%2] %memref_1 : memref<3x3xi64>
    %4 = gpu.dealloc async [%3] %memref_0 : memref<3x3xi64>
    %5 = gpu.dealloc async [%4] %memref : memref<3x3xi64>
    gpu.wait [%5]
    return %alloc : memref<3x3xi64>
  }
  gpu.module @test_kernel attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Addresses, Int64, Kernel], []>, api=OpenCL, #spirv.resource_limits<>>} {
    gpu.func @test_kernel(%arg0: memref<3x3xi64>, %arg1: memref<3x3xi64>, %arg2: memref<3x3xi64>) kernel attributes {gpu.known_block_size = array<i32: 1, 1, 1>, gpu.known_grid_size = array<i32: 3, 3, 1>, spirv.entry_point_abi = #spirv.entry_point_abi<>} {
      %block_id_x = gpu.block_id x
      %block_id_y = gpu.block_id y
      %0 = memref.load %arg0[%block_id_x, %block_id_y] : memref<3x3xi64>
      %1 = memref.load %arg1[%block_id_x, %block_id_y] : memref<3x3xi64>
      %2 = arith.addi %0, %1 : i64
      memref.store %2, %arg2[%block_id_x, %block_id_y] : memref<3x3xi64>
      gpu.return
    }
  }
}

