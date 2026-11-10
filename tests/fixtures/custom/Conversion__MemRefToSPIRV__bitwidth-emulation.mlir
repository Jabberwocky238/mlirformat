module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader, Int64], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} {
  func.func @load_i1(%arg0: memref<i1, #spirv.storage_class<StorageBuffer>>) -> i1 {
    %0 = memref.load %arg0[] : memref<i1, #spirv.storage_class<StorageBuffer>>
    return %0 : i1
  }
  func.func @load_i8(%arg0: memref<i8, #spirv.storage_class<StorageBuffer>>) -> i8 {
    %0 = memref.load %arg0[] : memref<i8, #spirv.storage_class<StorageBuffer>>
    return %0 : i8
  }
  func.func @load_i16(%arg0: memref<10xi16, #spirv.storage_class<StorageBuffer>>, %arg1: index) -> i16 {
    %0 = memref.load %arg0[%arg1] : memref<10xi16, #spirv.storage_class<StorageBuffer>>
    return %0 : i16
  }
  func.func @load_i64(%arg0: memref<10xi64, #spirv.storage_class<StorageBuffer>>, %arg1: index) -> i64 {
    %0 = memref.load %arg0[%arg1] : memref<10xi64, #spirv.storage_class<StorageBuffer>>
    return %0 : i64
  }
  func.func @load_f32(%arg0: memref<f32, #spirv.storage_class<StorageBuffer>>) {
    %0 = memref.load %arg0[] : memref<f32, #spirv.storage_class<StorageBuffer>>
    return
  }
  func.func @store_i1(%arg0: memref<i1, #spirv.storage_class<StorageBuffer>>, %arg1: i1) {
    memref.store %arg1, %arg0[] : memref<i1, #spirv.storage_class<StorageBuffer>>
    return
  }
  func.func @store_i8(%arg0: memref<i8, #spirv.storage_class<StorageBuffer>>, %arg1: i8) {
    memref.store %arg1, %arg0[] : memref<i8, #spirv.storage_class<StorageBuffer>>
    return
  }
  func.func @store_i16(%arg0: memref<10xi16, #spirv.storage_class<StorageBuffer>>, %arg1: index, %arg2: i16) {
    memref.store %arg2, %arg0[%arg1] : memref<10xi16, #spirv.storage_class<StorageBuffer>>
    return
  }
  func.func @store_i64(%arg0: memref<10xi64, #spirv.storage_class<StorageBuffer>>, %arg1: index, %arg2: i64) {
    memref.store %arg2, %arg0[%arg1] : memref<10xi64, #spirv.storage_class<StorageBuffer>>
    return
  }
  func.func @store_f32(%arg0: memref<f32, #spirv.storage_class<StorageBuffer>>, %arg1: f32) {
    memref.store %arg1, %arg0[] : memref<f32, #spirv.storage_class<StorageBuffer>>
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader, Int64], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} {
  func.func @load_i4(%arg0: memref<?xi4, #spirv.storage_class<StorageBuffer>>, %arg1: index) -> i4 {
    %0 = memref.load %arg0[%arg1] : memref<?xi4, #spirv.storage_class<StorageBuffer>>
    return %0 : i4
  }
  func.func @store_i4(%arg0: memref<?xi4, #spirv.storage_class<StorageBuffer>>, %arg1: i4, %arg2: index) {
    memref.store %arg1, %arg0[%arg2] : memref<?xi4, #spirv.storage_class<StorageBuffer>>
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader, Int64, Int8], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} {
  func.func @load_i8(%arg0: memref<i8, #spirv.storage_class<StorageBuffer>>) -> i8 {
    %0 = memref.load %arg0[] : memref<i8, #spirv.storage_class<StorageBuffer>>
    return %0 : i8
  }
  func.func @store_i8(%arg0: memref<i8, #spirv.storage_class<StorageBuffer>>, %arg1: i8) {
    memref.store %arg1, %arg0[] : memref<i8, #spirv.storage_class<StorageBuffer>>
    return
  }
}

