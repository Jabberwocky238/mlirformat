module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.3, [Shader], []>, #spirv.resource_limits<>>} {
  func.func @atomic_addi_storage_buffer(%arg0: i32, %arg1: memref<2x3x4xi32, #spirv.storage_class<StorageBuffer>>, %arg2: index, %arg3: index, %arg4: index) -> i32 {
    %0 = memref.atomic_rmw addi %arg0, %arg1[%arg2, %arg3, %arg4] : (i32, memref<2x3x4xi32, #spirv.storage_class<StorageBuffer>>) -> i32
    return %0 : i32
  }
  func.func @atomic_maxs_workgroup(%arg0: i32, %arg1: memref<2x3x4xi32, #spirv.storage_class<Workgroup>>, %arg2: index, %arg3: index, %arg4: index) -> i32 {
    %0 = memref.atomic_rmw maxs %arg0, %arg1[%arg2, %arg3, %arg4] : (i32, memref<2x3x4xi32, #spirv.storage_class<Workgroup>>) -> i32
    return %0 : i32
  }
  func.func @atomic_maxu_storage_buffer(%arg0: i32, %arg1: memref<2x3x4xi32, #spirv.storage_class<StorageBuffer>>, %arg2: index, %arg3: index, %arg4: index) -> i32 {
    %0 = memref.atomic_rmw maxu %arg0, %arg1[%arg2, %arg3, %arg4] : (i32, memref<2x3x4xi32, #spirv.storage_class<StorageBuffer>>) -> i32
    return %0 : i32
  }
  func.func @atomic_mins_workgroup(%arg0: i32, %arg1: memref<2x3x4xi32, #spirv.storage_class<Workgroup>>, %arg2: index, %arg3: index, %arg4: index) -> i32 {
    %0 = memref.atomic_rmw mins %arg0, %arg1[%arg2, %arg3, %arg4] : (i32, memref<2x3x4xi32, #spirv.storage_class<Workgroup>>) -> i32
    return %0 : i32
  }
  func.func @atomic_minu_storage_buffer(%arg0: i32, %arg1: memref<2x3x4xi32, #spirv.storage_class<StorageBuffer>>, %arg2: index, %arg3: index, %arg4: index) -> i32 {
    %0 = memref.atomic_rmw minu %arg0, %arg1[%arg2, %arg3, %arg4] : (i32, memref<2x3x4xi32, #spirv.storage_class<StorageBuffer>>) -> i32
    return %0 : i32
  }
  func.func @atomic_ori_workgroup(%arg0: i32, %arg1: memref<2x3x4xi32, #spirv.storage_class<Workgroup>>, %arg2: index, %arg3: index, %arg4: index) -> i32 {
    %0 = memref.atomic_rmw ori %arg0, %arg1[%arg2, %arg3, %arg4] : (i32, memref<2x3x4xi32, #spirv.storage_class<Workgroup>>) -> i32
    return %0 : i32
  }
  func.func @atomic_andi_storage_buffer(%arg0: i32, %arg1: memref<2x3x4xi32, #spirv.storage_class<StorageBuffer>>, %arg2: index, %arg3: index, %arg4: index) -> i32 {
    %0 = memref.atomic_rmw andi %arg0, %arg1[%arg2, %arg3, %arg4] : (i32, memref<2x3x4xi32, #spirv.storage_class<StorageBuffer>>) -> i32
    return %0 : i32
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.3, [Shader], []>, #spirv.resource_limits<>>} {
  func.func @atomic_ori_i8_storage_buffer(%arg0: i8, %arg1: memref<16xi8, #spirv.storage_class<StorageBuffer>>, %arg2: index) -> i8 {
    %0 = memref.atomic_rmw ori %arg0, %arg1[%arg2] : (i8, memref<16xi8, #spirv.storage_class<StorageBuffer>>) -> i8
    return %0 : i8
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.3, [Shader], []>, #spirv.resource_limits<>>} {
  func.func @atomic_andi_i8_storage_buffer(%arg0: i8, %arg1: memref<16xi8, #spirv.storage_class<StorageBuffer>>, %arg2: index) -> i8 {
    %0 = memref.atomic_rmw andi %arg0, %arg1[%arg2] : (i8, memref<16xi8, #spirv.storage_class<StorageBuffer>>) -> i8
    return %0 : i8
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.3, [Shader, AtomicFloat32AddEXT], [SPV_EXT_shader_atomic_float_add]>, #spirv.resource_limits<>>} {
  func.func @atomic_addf_storage_buffer(%arg0: f32, %arg1: memref<2x3x4xf32, #spirv.storage_class<StorageBuffer>>, %arg2: index, %arg3: index, %arg4: index) -> f32 {
    %0 = memref.atomic_rmw addf %arg0, %arg1[%arg2, %arg3, %arg4] : (f32, memref<2x3x4xf32, #spirv.storage_class<StorageBuffer>>) -> f32
    return %0 : f32
  }
}

