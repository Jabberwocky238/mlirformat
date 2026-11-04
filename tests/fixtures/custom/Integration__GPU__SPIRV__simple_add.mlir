module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class, SPV_KHR_8bit_storage]>, #spirv.resource_limits<max_compute_workgroup_size = [128, 128, 64]>>} {
  gpu.module @kernels {
    gpu.func @sum(%arg0: memref<3xf32>, %arg1: memref<3x3xf32>, %arg2: memref<3x3x3xf32>) kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [1, 1, 1]>} {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c2 = arith.constant 2 : index
      %0 = memref.load %arg0[%c0] : memref<3xf32>
      %1 = memref.load %arg1[%c0, %c0] : memref<3x3xf32>
      %2 = arith.addf %0, %1 : f32
      memref.store %2, %arg2[%c0, %c0, %c0] : memref<3x3x3xf32>
      memref.store %2, %arg2[%c0, %c1, %c0] : memref<3x3x3xf32>
      memref.store %2, %arg2[%c0, %c2, %c0] : memref<3x3x3xf32>
      memref.store %2, %arg2[%c1, %c0, %c1] : memref<3x3x3xf32>
      memref.store %2, %arg2[%c1, %c1, %c1] : memref<3x3x3xf32>
      memref.store %2, %arg2[%c1, %c2, %c1] : memref<3x3x3xf32>
      memref.store %2, %arg2[%c2, %c0, %c2] : memref<3x3x3xf32>
      memref.store %2, %arg2[%c2, %c1, %c2] : memref<3x3x3xf32>
      memref.store %2, %arg2[%c2, %c2, %c2] : memref<3x3x3xf32>
      gpu.return
    }
  }
  func.func @main() {
    %alloc = memref.alloc() : memref<3xf32>
    %alloc_0 = memref.alloc() : memref<3x3xf32>
    %alloc_1 = memref.alloc() : memref<3x3x3xf32>
    %cst = arith.constant 0.000000e+00 : f32
    %cst_2 = arith.constant 3.400000e+00 : f32
    %cst_3 = arith.constant 4.300000e+00 : f32
    %cast = memref.cast %alloc : memref<3xf32> to memref<?xf32>
    %cast_4 = memref.cast %alloc_0 : memref<3x3xf32> to memref<?x?xf32>
    %cast_5 = memref.cast %alloc_1 : memref<3x3x3xf32> to memref<?x?x?xf32>
    call @fillF32Buffer1D(%cast, %cst_2) : (memref<?xf32>, f32) -> ()
    call @fillF32Buffer2D(%cast_4, %cst_3) : (memref<?x?xf32>, f32) -> ()
    call @fillF32Buffer3D(%cast_5, %cst) : (memref<?x?x?xf32>, f32) -> ()
    %c1 = arith.constant 1 : index
    gpu.launch_func  @kernels::@sum blocks in (%c1, %c1, %c1) threads in (%c1, %c1, %c1)  args(%alloc : memref<3xf32>, %alloc_0 : memref<3x3xf32>, %alloc_1 : memref<3x3x3xf32>)
    %cast_6 = memref.cast %alloc_1 : memref<3x3x3xf32> to memref<*xf32>
    call @printMemrefF32(%cast_6) : (memref<*xf32>) -> ()
    return
  }
  func.func private @fillF32Buffer1D(memref<?xf32>, f32)
  func.func private @fillF32Buffer2D(memref<?x?xf32>, f32)
  func.func private @fillF32Buffer3D(memref<?x?x?xf32>, f32)
  func.func private @printMemrefF32(memref<*xf32>)
}

