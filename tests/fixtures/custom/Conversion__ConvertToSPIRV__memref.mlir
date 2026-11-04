module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} {
  func.func @load_store_float_rank_zero(%arg0: memref<f32>, %arg1: memref<f32>) {
    %0 = memref.load %arg0[] : memref<f32>
    memref.store %0, %arg1[] : memref<f32>
    return
  }
  func.func @load_store_int_rank_one(%arg0: memref<4xi32>, %arg1: memref<4xi32>, %arg2: index) {
    %0 = memref.load %arg0[%arg2] : memref<4xi32>
    memref.store %0, %arg1[%arg2] : memref<4xi32>
    return
  }
  func.func @load_store_larger_memref(%arg0: memref<8xi32>, %arg1: memref<8xi32>, %arg2: index) {
    %0 = memref.load %arg0[%arg2] : memref<8xi32>
    memref.store %0, %arg1[%arg2] : memref<8xi32>
    return
  }
  func.func @load_store_vector(%arg0: memref<vector<4xi32>>, %arg1: memref<vector<4xi32>>) {
    %0 = memref.load %arg0[] : memref<vector<4xi32>>
    memref.store %0, %arg1[] : memref<vector<4xi32>>
    return
  }
}

