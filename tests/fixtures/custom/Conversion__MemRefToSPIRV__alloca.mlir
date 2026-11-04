module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.3, [Shader], []>, #spirv.resource_limits<>>} {
  func.func @alloc_function_variable(%arg0: index, %arg1: index) {
    %alloca = memref.alloca() : memref<4x5xf32, #spirv.storage_class<Function>>
    %0 = memref.load %alloca[%arg0, %arg1] : memref<4x5xf32, #spirv.storage_class<Function>>
    memref.store %0, %alloca[%arg0, %arg1] : memref<4x5xf32, #spirv.storage_class<Function>>
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.3, [Shader], []>, #spirv.resource_limits<>>} {
  func.func @two_allocs() {
    %alloca = memref.alloca() : memref<4x5xf32, #spirv.storage_class<Function>>
    %alloca_0 = memref.alloca() : memref<2x3xi32, #spirv.storage_class<Function>>
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.3, [Shader], []>, #spirv.resource_limits<>>} {
  func.func @two_allocs_vector() {
    %alloca = memref.alloca() : memref<4xvector<4xf32>, #spirv.storage_class<Function>>
    %alloca_0 = memref.alloca() : memref<2xvector<2xi32>, #spirv.storage_class<Function>>
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.3, [Shader], []>, #spirv.resource_limits<>>} {
  func.func @alloc_dynamic_size(%arg0: index) -> f32 {
    %alloca = memref.alloca(%arg0) : memref<4x?xf32, #spirv.storage_class<Function>>
    %0 = memref.load %alloca[%arg0, %arg0] : memref<4x?xf32, #spirv.storage_class<Function>>
    return %0 : f32
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.3, [Shader], []>, #spirv.resource_limits<>>} {
  func.func @alloc_unsupported_memory_space(%arg0: index) -> f32 {
    %alloca = memref.alloca() : memref<4x5xf32>
    %0 = memref.load %alloca[%arg0, %arg0] : memref<4x5xf32>
    return %0 : f32
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.3, [Shader], []>, #spirv.resource_limits<>>} {
  func.func @zero_size() {
    %alloca = memref.alloca() : memref<0xf32, #spirv.storage_class<Function>>
    return
  }
}

