module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} {
  func.func @alloc_dealloc_workgroup_mem_shader_f32(%arg0: index, %arg1: index) {
    %alloc = memref.alloc() : memref<4x5xf32, #spirv.storage_class<Workgroup>>
    %0 = memref.load %alloc[%arg0, %arg1] : memref<4x5xf32, #spirv.storage_class<Workgroup>>
    memref.store %0, %alloc[%arg0, %arg1] : memref<4x5xf32, #spirv.storage_class<Workgroup>>
    memref.dealloc %alloc : memref<4x5xf32, #spirv.storage_class<Workgroup>>
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} {
  func.func @alloc_dealloc_workgroup_mem_shader_i16(%arg0: index, %arg1: index) {
    %alloc = memref.alloc() : memref<4x5xi16, #spirv.storage_class<Workgroup>>
    %0 = memref.load %alloc[%arg0, %arg1] : memref<4x5xi16, #spirv.storage_class<Workgroup>>
    memref.store %0, %alloc[%arg0, %arg1] : memref<4x5xi16, #spirv.storage_class<Workgroup>>
    memref.dealloc %alloc : memref<4x5xi16, #spirv.storage_class<Workgroup>>
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} {
  func.func @two_allocs() {
    %alloc = memref.alloc() : memref<4x5xf32, #spirv.storage_class<Workgroup>>
    %alloc_0 = memref.alloc() : memref<2x3xi32, #spirv.storage_class<Workgroup>>
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} {
  func.func @two_allocs_vector() {
    %alloc = memref.alloc() : memref<4xvector<4xf32>, #spirv.storage_class<Workgroup>>
    %alloc_0 = memref.alloc() : memref<2xvector<2xi32>, #spirv.storage_class<Workgroup>>
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} {
  func.func @alloc_dynamic_size(%arg0: index) -> f32 {
    %alloc = memref.alloc(%arg0) : memref<4x?xf32, #spirv.storage_class<Workgroup>>
    %0 = memref.load %alloc[%arg0, %arg0] : memref<4x?xf32, #spirv.storage_class<Workgroup>>
    return %0 : f32
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} {
  func.func @alloc_unsupported_memory_space(%arg0: index) -> f32 {
    %alloc = memref.alloc() : memref<4x5xf32, #spirv.storage_class<StorageBuffer>>
    %0 = memref.load %alloc[%arg0, %arg0] : memref<4x5xf32, #spirv.storage_class<StorageBuffer>>
    return %0 : f32
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} {
  func.func @dealloc_dynamic_size(%arg0: memref<4x?xf32, #spirv.storage_class<Workgroup>>) {
    memref.dealloc %arg0 : memref<4x?xf32, #spirv.storage_class<Workgroup>>
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} {
  func.func @dealloc_unsupported_memory_space(%arg0: memref<4x5xf32, #spirv.storage_class<StorageBuffer>>) {
    memref.dealloc %arg0 : memref<4x5xf32, #spirv.storage_class<StorageBuffer>>
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Kernel], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} {
  func.func @alloc_dealloc_workgroup_mem_kernel(%arg0: index, %arg1: index) {
    %alloc = memref.alloc() : memref<4x5xf32, #spirv.storage_class<Workgroup>>
    %0 = memref.load %alloc[%arg0, %arg1] : memref<4x5xf32, #spirv.storage_class<Workgroup>>
    memref.store %0, %alloc[%arg0, %arg1] : memref<4x5xf32, #spirv.storage_class<Workgroup>>
    memref.dealloc %alloc : memref<4x5xf32, #spirv.storage_class<Workgroup>>
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} {
  func.func @zero_size() {
    %alloc = memref.alloc() : memref<0xf32, #spirv.storage_class<Workgroup>>
    %alloc_0 = memref.alloc() : memref<0xi1, #spirv.storage_class<Workgroup>>
    %alloc_1 = memref.alloc() : memref<0xi4, #spirv.storage_class<Workgroup>>
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} {
  func.func @alloc_dealloc_workgroup_mem_complex_f32(%arg0: index, %arg1: index) {
    %alloc = memref.alloc() : memref<4x5xcomplex<f32>, #spirv.storage_class<Workgroup>>
    %0 = memref.load %alloc[%arg0, %arg1] : memref<4x5xcomplex<f32>, #spirv.storage_class<Workgroup>>
    memref.store %0, %alloc[%arg0, %arg1] : memref<4x5xcomplex<f32>, #spirv.storage_class<Workgroup>>
    memref.dealloc %alloc : memref<4x5xcomplex<f32>, #spirv.storage_class<Workgroup>>
    return
  }
}

