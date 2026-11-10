module @relu attributes {gpu.container_module} {
  memref.global "private" constant @__constant_4x5xf32 : memref<4x5xf32> = dense<[[-1.000000e-01, -2.000000e-01, -3.000000e-01, 4.000000e-01, 5.000000e-01], [1.000000e-01, -2.000000e-01, 3.000000e-01, -4.000000e-01, 5.000000e-01], [1.000000e-01, 2.000000e-01, 3.000000e-01, -4.000000e-01, -5.000000e-01], [1.000000e-01, 2.000000e-01, 3.000000e-01, 4.000000e-01, 5.000000e-01]]>
  func.func @main() {
    %c1 = arith.constant 1 : index
    %c100 = arith.constant 100 : index
    %c0 = arith.constant 0 : index
    %0 = memref.get_global @__constant_4x5xf32 : memref<4x5xf32>
    scf.for %arg0 = %c0 to %c100 step %c1 {
      %1 = func.call @test(%0) : (memref<4x5xf32>) -> memref<4x5xf32>
      %cast = memref.cast %1 : memref<4x5xf32> to memref<*xf32>
      func.call @printMemrefF32(%cast) : (memref<*xf32>) -> ()
    }
    return
  }
  func.func private @printMemrefF32(memref<*xf32>)
  func.func @test(%arg0: memref<4x5xf32>) -> memref<4x5xf32> {
    %c5 = arith.constant 5 : index
    %c4 = arith.constant 4 : index
    %c1 = arith.constant 1 : index
    %alloc = memref.alloc() : memref<4x5xf32>
    %memref = gpu.alloc  () : memref<4x5xf32>
    gpu.memcpy  %memref, %arg0 : memref<4x5xf32>, memref<4x5xf32>
    %memref_0 = gpu.alloc  () : memref<4x5xf32>
    gpu.launch_func  @test_kernel::@test_relu blocks in (%c4, %c5, %c1) threads in (%c1, %c1, %c1)  args(%memref : memref<4x5xf32>, %memref_0 : memref<4x5xf32>)
    gpu.memcpy  %alloc, %memref_0 : memref<4x5xf32>, memref<4x5xf32>
    gpu.dealloc  %memref : memref<4x5xf32>
    gpu.dealloc  %memref_0 : memref<4x5xf32>
    return %alloc : memref<4x5xf32>
  }
  gpu.module @test_kernel attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Addresses, Int64, Int8, Kernel], []>, api=OpenCL, #spirv.resource_limits<>>} {
    gpu.func @test_relu(%arg0: memref<4x5xf32>, %arg1: memref<4x5xf32>) kernel attributes {gpu.known_block_size = array<i32: 1, 1, 1>, gpu.known_grid_size = array<i32: 4, 5, 1>, spirv.entry_point_abi = #spirv.entry_point_abi<>} {
      %cst = arith.constant 0.000000e+00 : f32
      %block_id_x = gpu.block_id x
      %block_id_y = gpu.block_id y
      %0 = memref.load %arg0[%block_id_x, %block_id_y] : memref<4x5xf32>
      %1 = arith.cmpf ogt, %0, %cst : f32
      %2 = arith.select %1, %0, %cst : f32
      memref.store %2, %arg1[%block_id_x, %block_id_y] : memref<4x5xf32>
      gpu.return
    }
  }
}

