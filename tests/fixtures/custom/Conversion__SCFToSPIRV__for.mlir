module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} {
  func.func @loop_kernel(%arg0: memref<10xf32, #spirv.storage_class<StorageBuffer>>, %arg1: memref<10xf32, #spirv.storage_class<StorageBuffer>>) {
    %c4 = arith.constant 4 : index
    %c42 = arith.constant 42 : index
    %c2 = arith.constant 2 : index
    scf.for %arg2 = %c4 to %c42 step %c2 {
      %0 = memref.load %arg0[%arg2] : memref<10xf32, #spirv.storage_class<StorageBuffer>>
      memref.store %0, %arg1[%arg2] : memref<10xf32, #spirv.storage_class<StorageBuffer>>
    }
    return
  }
  func.func @unsigned_loop(%arg0: memref<10xf32, #spirv.storage_class<StorageBuffer>>, %arg1: memref<10xf32, #spirv.storage_class<StorageBuffer>>) {
    %c4 = arith.constant 4 : index
    %c42 = arith.constant 42 : index
    %c2 = arith.constant 2 : index
    scf.for unsigned %arg2 = %c4 to %c42 step %c2 {
      %0 = memref.load %arg0[%arg2] : memref<10xf32, #spirv.storage_class<StorageBuffer>>
      memref.store %0, %arg1[%arg2] : memref<10xf32, #spirv.storage_class<StorageBuffer>>
    }
    return
  }
  func.func @loop_yield(%arg0: memref<10xf32, #spirv.storage_class<StorageBuffer>>, %arg1: memref<10xf32, #spirv.storage_class<StorageBuffer>>) {
    %c4 = arith.constant 4 : index
    %c42 = arith.constant 42 : index
    %c2 = arith.constant 2 : index
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    %0:2 = scf.for %arg2 = %c4 to %c42 step %c2 iter_args(%arg3 = %cst, %arg4 = %cst_0) -> (f32, f32) {
      %1 = arith.addf %arg3, %arg3 : f32
      scf.yield %1, %1 : f32, f32
    }
    memref.store %0#0, %arg1[%c4] : memref<10xf32, #spirv.storage_class<StorageBuffer>>
    memref.store %0#1, %arg1[%c42] : memref<10xf32, #spirv.storage_class<StorageBuffer>>
    return
  }
}

