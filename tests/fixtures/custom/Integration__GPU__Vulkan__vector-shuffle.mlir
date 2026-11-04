module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} {
  gpu.module @kernels {
    gpu.func @kernel_vector_shuffle(%arg0: memref<2xi32>, %arg1: memref<2xi32>, %arg2: memref<4xi32>) kernel attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [1, 1, 1]>} {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c2 = arith.constant 2 : index
      %c3 = arith.constant 3 : index
      %c4 = arith.constant 4 : index
      %cst = arith.constant dense<0> : vector<2xi32>
      %cst_0 = arith.constant dense<0> : vector<2xi32>
      %0 = memref.load %arg0[%c0] : memref<2xi32>
      %1 = memref.load %arg0[%c1] : memref<2xi32>
      %2 = memref.load %arg1[%c0] : memref<2xi32>
      %3 = memref.load %arg1[%c1] : memref<2xi32>
      %4 = vector.insert %0, %cst [%c0] : i32 into vector<2xi32>
      %5 = vector.insert %1, %4 [%c1] : i32 into vector<2xi32>
      %6 = vector.insert %2, %cst_0 [%c0] : i32 into vector<2xi32>
      %7 = vector.insert %3, %6 [%c1] : i32 into vector<2xi32>
      %8 = vector.shuffle %5, %7 [2, 1, 3, 3] : vector<2xi32>, vector<2xi32>
      %9 = vector.extract %8[%c0] : i32 from vector<4xi32>
      %10 = vector.extract %8[%c1] : i32 from vector<4xi32>
      %11 = vector.extract %8[%c2] : i32 from vector<4xi32>
      %12 = vector.extract %8[%c3] : i32 from vector<4xi32>
      memref.store %9, %arg2[%c0] : memref<4xi32>
      memref.store %10, %arg2[%c1] : memref<4xi32>
      memref.store %11, %arg2[%c2] : memref<4xi32>
      memref.store %12, %arg2[%c3] : memref<4xi32>
      gpu.return
    }
  }
  func.func @main() {
    %alloc = memref.alloc() : memref<2xi32>
    %alloc_0 = memref.alloc() : memref<2xi32>
    %alloc_1 = memref.alloc() : memref<4xi32>
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant dense<[0, 1]> : vector<2xi32>
    %cst_2 = arith.constant dense<[2, 3]> : vector<2xi32>
    vector.store %cst, %alloc[%c0] : memref<2xi32>, vector<2xi32>
    vector.store %cst_2, %alloc_0[%c0] : memref<2xi32>, vector<2xi32>
    %c0_i32 = arith.constant 0 : i32
    %cast = memref.cast %alloc_1 : memref<4xi32> to memref<?xi32>
    call @fillResource1DInt(%cast, %c0_i32) : (memref<?xi32>, i32) -> ()
    gpu.launch_func  @kernels::@kernel_vector_shuffle blocks in (%c4, %c1, %c1) threads in (%c1, %c1, %c1)  args(%alloc : memref<2xi32>, %alloc_0 : memref<2xi32>, %alloc_1 : memref<4xi32>)
    %cast_3 = memref.cast %cast : memref<?xi32> to memref<*xi32>
    call @printMemrefI32(%cast_3) : (memref<*xi32>) -> ()
    return
  }
  func.func private @fillResource1DInt(memref<?xi32>, i32)
  func.func private @printMemrefI32(memref<*xi32>)
}

