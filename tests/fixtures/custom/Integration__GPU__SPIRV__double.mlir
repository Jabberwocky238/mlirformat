module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_variable_pointers]>, #spirv.resource_limits<max_compute_workgroup_size = [128, 128, 64]>>} {
  gpu.module @kernels {
    gpu.func @double(%arg0: memref<6xi32>, %arg1: memref<6xi32>) kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [1, 1, 1]>} {
      %c2_i32 = arith.constant 2 : i32
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c2 = arith.constant 2 : index
      %c3 = arith.constant 3 : index
      %c4 = arith.constant 4 : index
      %c5 = arith.constant 5 : index
      %0 = memref.load %arg0[%c0] : memref<6xi32>
      %1 = memref.load %arg0[%c1] : memref<6xi32>
      %2 = memref.load %arg0[%c2] : memref<6xi32>
      %3 = memref.load %arg0[%c3] : memref<6xi32>
      %4 = memref.load %arg0[%c4] : memref<6xi32>
      %5 = memref.load %arg0[%c5] : memref<6xi32>
      %6 = arith.muli %0, %c2_i32 : i32
      %7 = arith.muli %1, %c2_i32 : i32
      %8 = arith.muli %2, %c2_i32 : i32
      %9 = arith.muli %3, %c2_i32 : i32
      %10 = arith.muli %4, %c2_i32 : i32
      %11 = arith.muli %5, %c2_i32 : i32
      memref.store %6, %arg1[%c0] : memref<6xi32>
      memref.store %7, %arg1[%c1] : memref<6xi32>
      memref.store %8, %arg1[%c2] : memref<6xi32>
      memref.store %9, %arg1[%c3] : memref<6xi32>
      memref.store %10, %arg1[%c4] : memref<6xi32>
      memref.store %11, %arg1[%c5] : memref<6xi32>
      gpu.return
    }
  }
  func.func @main() {
    %alloc = memref.alloc() : memref<6xi32>
    %alloc_0 = memref.alloc() : memref<6xi32>
    %c4_i32 = arith.constant 4 : i32
    %c0_i32 = arith.constant 0 : i32
    %cast = memref.cast %alloc : memref<6xi32> to memref<?xi32>
    %cast_1 = memref.cast %alloc_0 : memref<6xi32> to memref<?xi32>
    call @fillI32Buffer(%cast, %c4_i32) : (memref<?xi32>, i32) -> ()
    call @fillI32Buffer(%cast_1, %c0_i32) : (memref<?xi32>, i32) -> ()
    %c1 = arith.constant 1 : index
    gpu.launch_func  @kernels::@double blocks in (%c1, %c1, %c1) threads in (%c1, %c1, %c1)  args(%alloc : memref<6xi32>, %alloc_0 : memref<6xi32>)
    %cast_2 = memref.cast %alloc_0 : memref<6xi32> to memref<*xi32>
    call @printMemrefI32(%cast_2) : (memref<*xi32>) -> ()
    return
  }
  func.func private @fillI32Buffer(memref<?xi32>, i32)
  func.func private @printMemrefI32(memref<*xi32>)
}

