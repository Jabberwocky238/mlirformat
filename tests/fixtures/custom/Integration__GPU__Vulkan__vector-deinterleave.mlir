module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} {
  gpu.module @kernels {
    gpu.func @kernel_vector_deinterleave(%arg0: memref<4xi32>, %arg1: memref<2xi32>, %arg2: memref<2xi32>) kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [1, 1, 1]>} {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c2 = arith.constant 2 : index
      %c3 = arith.constant 3 : index
      %cst = arith.constant dense<0> : vector<4xi32>
      %0 = memref.load %arg0[%c0] : memref<4xi32>
      %1 = memref.load %arg0[%c1] : memref<4xi32>
      %2 = memref.load %arg0[%c2] : memref<4xi32>
      %3 = memref.load %arg0[%c3] : memref<4xi32>
      %4 = vector.insert %0, %cst [0] : i32 into vector<4xi32>
      %5 = vector.insert %1, %4 [1] : i32 into vector<4xi32>
      %6 = vector.insert %2, %5 [2] : i32 into vector<4xi32>
      %7 = vector.insert %3, %6 [3] : i32 into vector<4xi32>
      %res1, %res2 = vector.deinterleave %7 : vector<4xi32> -> vector<2xi32>
      %8 = vector.extract %res1[0] : i32 from vector<2xi32>
      %9 = vector.extract %res1[1] : i32 from vector<2xi32>
      %10 = vector.extract %res2[0] : i32 from vector<2xi32>
      %11 = vector.extract %res2[1] : i32 from vector<2xi32>
      memref.store %8, %arg1[%c0] : memref<2xi32>
      memref.store %9, %arg1[%c1] : memref<2xi32>
      memref.store %10, %arg2[%c0] : memref<2xi32>
      memref.store %11, %arg2[%c1] : memref<2xi32>
      gpu.return
    }
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %alloc = memref.alloc() : memref<4xi32>
    %alloc_0 = memref.alloc() : memref<2xi32>
    %alloc_1 = memref.alloc() : memref<2xi32>
    %cst = arith.constant dense<[0, 1, 2, 3]> : vector<4xi32>
    vector.store %cst, %alloc[%c0] : memref<4xi32>, vector<4xi32>
    %c0_i32 = arith.constant 0 : i32
    %cast = memref.cast %alloc_0 : memref<2xi32> to memref<?xi32>
    %cast_2 = memref.cast %alloc_1 : memref<2xi32> to memref<?xi32>
    call @fillResource1DInt(%cast, %c0_i32) : (memref<?xi32>, i32) -> ()
    call @fillResource1DInt(%cast_2, %c0_i32) : (memref<?xi32>, i32) -> ()
    gpu.launch_func  @kernels::@kernel_vector_deinterleave blocks in (%c4, %c1, %c1) threads in (%c1, %c1, %c1)  args(%alloc : memref<4xi32>, %alloc_0 : memref<2xi32>, %alloc_1 : memref<2xi32>)
    %cast_3 = memref.cast %cast : memref<?xi32> to memref<*xi32>
    %cast_4 = memref.cast %cast_2 : memref<?xi32> to memref<*xi32>
    call @printMemrefI32(%cast_3) : (memref<*xi32>) -> ()
    call @printMemrefI32(%cast_4) : (memref<*xi32>) -> ()
    return
  }
  func.func private @fillResource1DInt(memref<?xi32>, i32)
  func.func private @printMemrefI32(memref<*xi32>)
}

