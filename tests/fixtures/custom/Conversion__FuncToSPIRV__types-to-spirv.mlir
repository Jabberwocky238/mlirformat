module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [], []>, #spirv.resource_limits<>>} {
  func.func @integer8(%arg0: i8, %arg1: si8, %arg2: ui8) {
    return
  }
  func.func @integer16(%arg0: i16, %arg1: si16, %arg2: ui16) {
    return
  }
  func.func @integer64(%arg0: i64, %arg1: si64, %arg2: ui64) {
    return
  }
  func.func @integer128(%arg0: i128) {
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Int8, Int16, Int64], []>, #spirv.resource_limits<>>} {
  func.func @integer8(%arg0: i8, %arg1: si8, %arg2: ui8) {
    return
  }
  func.func @integer16(%arg0: i16, %arg1: si16, %arg2: ui16) {
    return
  }
  func.func @integer64(%arg0: i64, %arg1: si64, %arg2: ui64) {
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [], []>, #spirv.resource_limits<>>} {
  func.func @integer2(%arg0: i8) {
    return
  }
  func.func @integer4(%arg0: i4) {
    return
  }
  func.func @v3i4(%arg0: vector<3xi4>) {
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [], []>, #spirv.resource_limits<>>} {
  func.func @integer3(%arg0: i3) {
    return
  }
  func.func @integer4(%arg0: i13) {
    return
  }
  func.func @integer128(%arg0: i128) {
    return
  }
  func.func @integer42(%arg0: i42) {
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [], []>, #spirv.resource_limits<>>} {
  func.func @index_type(%arg0: index) {
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [], []>, #spirv.resource_limits<>>} {
  func.func @float16(%arg0: f16) {
    return
  }
  func.func @float64(%arg0: f64) {
    return
  }
  func.func @bfloat16(%arg0: bf16) {
    return
  }
  func.func @float80(%arg0: f80) {
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Float16, Float64], []>, #spirv.resource_limits<>>} {
  func.func @float16(%arg0: f16) {
    return
  }
  func.func @float64(%arg0: f64) {
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Float64, StorageUniform16, StorageBuffer16BitAccess], [SPV_KHR_16bit_storage, SPV_KHR_8bit_storage]>, #spirv.resource_limits<>>} {
  func.func @complex_types(%arg0: complex<f32>, %arg1: complex<f64>) {
    return
  }
  func.func @memref_complex_types_with_cap(%arg0: memref<4xcomplex<f16>, #spirv.storage_class<StorageBuffer>>, %arg1: memref<2x8xcomplex<f16>, #spirv.storage_class<Uniform>>) {
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [], []>, #spirv.resource_limits<>>} {
  func.func @memref_complex_types_no_cap(%arg0: memref<4xcomplex<f16>, #spirv.storage_class<StorageBuffer>>, %arg1: memref<2x8xcomplex<f16>, #spirv.storage_class<Uniform>>) {
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [], []>, #spirv.resource_limits<>>} {
  func.func @int_vector(%arg0: vector<2xi8>, %arg1: vector<3xsi16>) {
    return
  }
  func.func @float_vector(%arg0: vector<2xf16>) {
    return
  }
  func.func @one_element_vector(%arg0: vector<1xi8>) {
    return
  }
  func.func @index_vector(%arg0: vector<4xindex>) {
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Int8, Int16, Int64, Float16, Float64], []>, #spirv.resource_limits<>>} {
  func.func @int_vector(%arg0: vector<2xi8>, %arg1: vector<3xsi16>, %arg2: vector<4xui64>) {
    return
  }
  func.func @float_vector(%arg0: vector<2xf16>, %arg1: vector<3xf64>) {
    return
  }
  func.func @one_element_vector(%arg0: vector<1xi32>) {
    return
  }
  func.func @zerod_vector(%arg0: vector<f32>) {
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [], []>, #spirv.resource_limits<>>} {
  func.func @large_vector(%arg0: vector<1024xi32>) {
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} {
  func.func @memref_mem_space(%arg0: memref<4xf32, #spirv.storage_class<StorageBuffer>>, %arg1: memref<4xf32, #spirv.storage_class<Uniform>>, %arg2: memref<4xf32, #spirv.storage_class<Workgroup>>, %arg3: memref<4xf32, #spirv.storage_class<PushConstant>>, %arg4: memref<4xf32, #spirv.storage_class<Private>>, %arg5: memref<4xf32, #spirv.storage_class<Function>>) {
    return
  }
  func.func @memref_1bit_type(%arg0: memref<4x8xi1, #spirv.storage_class<StorageBuffer>>, %arg1: memref<4x8xi1, #spirv.storage_class<Function>>) {
    return
  }
  func.func @memref_index_type(%arg0: memref<4xindex, #spirv.storage_class<StorageBuffer>>, %arg1: memref<4xindex, #spirv.storage_class<Function>>) {
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} {
  func.func @numeric_memref_mem_space1(%arg0: memref<4xf32>) {
    return
  }
  func.func @numeric_memref_mem_space2(%arg0: memref<4xf32, 3>) {
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [], []>, #spirv.resource_limits<>>} {
  func.func @memref_1bit_type(%arg0: memref<5xi1, #spirv.storage_class<StorageBuffer>>) {
    return
  }
  func.func @memref_2bit_type(%arg0: memref<33xi2, #spirv.storage_class<StorageBuffer>>) {
    return
  }
  func.func @memref_4bit_type(%arg0: memref<16xi4, #spirv.storage_class<StorageBuffer>>) {
    return
  }
  func.func @memref_8bit_StorageBuffer(%arg0: memref<16xi8, #spirv.storage_class<StorageBuffer>>) {
    return
  }
  func.func @memref_8bit_Uniform(%arg0: memref<16xsi8, #spirv.storage_class<Uniform>>) {
    return
  }
  func.func @memref_8bit_PushConstant(%arg0: memref<16xui8, #spirv.storage_class<PushConstant>>) {
    return
  }
  func.func @memref_16bit_StorageBuffer(%arg0: memref<16xi16, #spirv.storage_class<StorageBuffer>>) {
    return
  }
  func.func @memref_16bit_Uniform(%arg0: memref<16xsi16, #spirv.storage_class<Uniform>>) {
    return
  }
  func.func @memref_16bit_PushConstant(%arg0: memref<16xui16, #spirv.storage_class<PushConstant>>) {
    return
  }
  func.func @memref_16bit_Input(%arg0: memref<16xf16, #spirv.storage_class<Input>>) {
    return
  }
  func.func @memref_16bit_Output(%arg0: memref<16xf16, #spirv.storage_class<Output>>) {
    return
  }
  func.func @memref_64bit_StorageBuffer(%arg0: memref<16xi64, #spirv.storage_class<StorageBuffer>>) {
    return
  }
  func.func @memref_64bit_Uniform(%arg0: memref<16xsi64, #spirv.storage_class<Uniform>>) {
    return
  }
  func.func @memref_64bit_PushConstant(%arg0: memref<16xui64, #spirv.storage_class<PushConstant>>) {
    return
  }
  func.func @memref_64bit_Input(%arg0: memref<16xf64, #spirv.storage_class<Input>>) {
    return
  }
  func.func @memref_64bit_Output(%arg0: memref<16xf64, #spirv.storage_class<Output>>) {
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [StoragePushConstant8, StoragePushConstant16, Int64, Float64], [SPV_KHR_8bit_storage, SPV_KHR_16bit_storage]>, #spirv.resource_limits<>>} {
  func.func @memref_8bit_PushConstant(%arg0: memref<16xi8, #spirv.storage_class<PushConstant>>) {
    return
  }
  func.func @memref_16bit_PushConstant(%arg0: memref<16xi16, #spirv.storage_class<PushConstant>>, %arg1: memref<16xf16, #spirv.storage_class<PushConstant>>) {
    return
  }
  func.func @memref_64bit_PushConstant(%arg0: memref<16xi64, #spirv.storage_class<PushConstant>>, %arg1: memref<16xf64, #spirv.storage_class<PushConstant>>) {
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [StorageBuffer8BitAccess, StorageBuffer16BitAccess, Int64, Float64], [SPV_KHR_8bit_storage, SPV_KHR_16bit_storage]>, #spirv.resource_limits<>>} {
  func.func @memref_8bit_StorageBuffer(%arg0: memref<16xi8, #spirv.storage_class<StorageBuffer>>) {
    return
  }
  func.func @memref_16bit_StorageBuffer(%arg0: memref<16xi16, #spirv.storage_class<StorageBuffer>>, %arg1: memref<16xf16, #spirv.storage_class<StorageBuffer>>) {
    return
  }
  func.func @memref_64bit_StorageBuffer(%arg0: memref<16xi64, #spirv.storage_class<StorageBuffer>>, %arg1: memref<16xf64, #spirv.storage_class<StorageBuffer>>) {
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [UniformAndStorageBuffer8BitAccess, StorageUniform16, Int64, Float64], [SPV_KHR_8bit_storage, SPV_KHR_16bit_storage]>, #spirv.resource_limits<>>} {
  func.func @memref_8bit_Uniform(%arg0: memref<16xi8, #spirv.storage_class<Uniform>>) {
    return
  }
  func.func @memref_16bit_Uniform(%arg0: memref<16xi16, #spirv.storage_class<Uniform>>, %arg1: memref<16xf16, #spirv.storage_class<Uniform>>) {
    return
  }
  func.func @memref_64bit_Uniform(%arg0: memref<16xi64, #spirv.storage_class<Uniform>>, %arg1: memref<16xf64, #spirv.storage_class<Uniform>>) {
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [StorageInputOutput16, Int64, Float64], [SPV_KHR_16bit_storage]>, #spirv.resource_limits<>>} {
  func.func @memref_16bit_Input(%arg0: memref<16xf16, #spirv.storage_class<Input>>) {
    return
  }
  func.func @memref_16bit_Output(%arg0: memref<16xi16, #spirv.storage_class<Output>>) {
    return
  }
  func.func @memref_64bit_Input(%arg0: memref<16xi64, #spirv.storage_class<Input>>, %arg1: memref<16xf64, #spirv.storage_class<Input>>) {
    return
  }
  func.func @memref_64bit_Output(%arg0: memref<16xi64, #spirv.storage_class<Output>>, %arg1: memref<16xf64, #spirv.storage_class<Output>>) {
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [StorageBuffer16BitAccess], [SPV_KHR_16bit_storage]>, #spirv.resource_limits<>>} {
  func.func @memref_offset_strides(%arg0: memref<16x4xf32, strided<[4, 1]>, #spirv.storage_class<StorageBuffer>>, %arg1: memref<16x4xf32, strided<[4, 1], offset: 8>, #spirv.storage_class<StorageBuffer>>, %arg2: memref<16x4xf32, strided<[16, 1]>, #spirv.storage_class<StorageBuffer>>, %arg3: memref<16x4xf32, strided<[1, 16]>, #spirv.storage_class<StorageBuffer>>, %arg4: memref<16x4xf32, strided<[1, 22]>, #spirv.storage_class<StorageBuffer>>, %arg5: memref<16x4xf16, strided<[4, 1]>, #spirv.storage_class<StorageBuffer>>, %arg6: memref<16x4xf16, strided<[4, 1], offset: 8>, #spirv.storage_class<StorageBuffer>>, %arg7: memref<16x4xf16, strided<[16, 1]>, #spirv.storage_class<StorageBuffer>>, %arg8: memref<16x4xf16, strided<[1, 16]>, #spirv.storage_class<StorageBuffer>>, %arg9: memref<16x4xf16, strided<[1, 22]>, #spirv.storage_class<StorageBuffer>>) {
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [], []>, #spirv.resource_limits<>>} {
  func.func @unranked_memref(%arg0: memref<*xi32>) {
    return
  }
  func.func @memref_1bit_type(%arg0: memref<?xi1, #spirv.storage_class<StorageBuffer>>) {
    return
  }
  func.func @memref_2bit_type(%arg0: memref<?xi2, #spirv.storage_class<StorageBuffer>>) {
    return
  }
  func.func @memref_4bit_type(%arg0: memref<?xi4, #spirv.storage_class<StorageBuffer>>) {
    return
  }
  func.func @dynamic_dim_memref(%arg0: memref<8x?xi32, #spirv.storage_class<StorageBuffer>>, %arg1: memref<?x?xf32, #spirv.storage_class<StorageBuffer>>) {
    return
  }
  func.func @memref_8bit_StorageBuffer(%arg0: memref<?xi8, #spirv.storage_class<StorageBuffer>>) {
    return
  }
  func.func @memref_8bit_Uniform(%arg0: memref<?xsi8, #spirv.storage_class<Uniform>>) {
    return
  }
  func.func @memref_8bit_PushConstant(%arg0: memref<?xui8, #spirv.storage_class<PushConstant>>) {
    return
  }
  func.func @memref_16bit_StorageBuffer(%arg0: memref<?xi16, #spirv.storage_class<StorageBuffer>>) {
    return
  }
  func.func @memref_16bit_Uniform(%arg0: memref<?xsi16, #spirv.storage_class<Uniform>>) {
    return
  }
  func.func @memref_16bit_PushConstant(%arg0: memref<?xui16, #spirv.storage_class<PushConstant>>) {
    return
  }
  func.func @memref_16bit_Input(%arg0: memref<?xf16, #spirv.storage_class<Input>>) {
    return
  }
  func.func @memref_16bit_Output(%arg0: memref<?xf16, #spirv.storage_class<Output>>) {
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [], []>, #spirv.resource_limits<>>} {
  func.func @memref_vector(%arg0: memref<4xvector<2xf32>, #spirv.storage_class<StorageBuffer>>, %arg1: memref<4xvector<4xf32>, #spirv.storage_class<Uniform>>) {
    return
  }
  func.func @dynamic_dim_memref_vector(%arg0: memref<8x?xvector<4xi32>, #spirv.storage_class<StorageBuffer>>, %arg1: memref<?x?xvector<2xf32>, #spirv.storage_class<StorageBuffer>>) {
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [], []>, #spirv.resource_limits<>>} {
  func.func @memref_vector_wrong_size(%arg0: memref<4xvector<5xf32>, #spirv.storage_class<StorageBuffer>>) {
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Int8, Int16, Int64, Float16, Float64], []>, #spirv.resource_limits<>>} {
  func.func @int_tensor_types(%arg0: tensor<8x4xi64>, %arg1: tensor<8x4xi32>, %arg2: tensor<8x4xi16>, %arg3: tensor<8x4xi8>) {
    return
  }
  func.func @float_tensor_types(%arg0: tensor<8x4xf64>, %arg1: tensor<8x4xf32>, %arg2: tensor<8x4xf16>) {
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [], []>, #spirv.resource_limits<>>} {
  func.func @int_tensor_types(%arg0: tensor<8x4xi32>, %arg1: tensor<8x4xi16>, %arg2: tensor<8x4xi8>) {
    return
  }
  func.func @float_tensor_types(%arg0: tensor<8x4xf32>, %arg1: tensor<8x4xf16>) {
    return
  }
  func.func @index_tensor_type(%arg0: tensor<4x5xindex>) {
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [], []>, #spirv.resource_limits<>>} {
  func.func @unranked_tensor(%arg0: tensor<*xi32>) {
    return
  }
  func.func @dynamic_dim_tensor(%arg0: tensor<8x?xi32>) {
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Int8], []>, #spirv.resource_limits<>>} {
  func.func @float8_to_integer8(%arg0: f8E5M2, %arg1: f8E4M3, %arg2: f8E4M3FN, %arg3: f8E5M2FNUZ, %arg4: f8E4M3FNUZ, %arg5: f8E4M3B11FNUZ, %arg6: f8E3M4, %arg7: f8E8M0FNU, %arg8: vector<4xf8E4M3B11FNUZ>, %arg9: memref<8xf8E4M3, #spirv.storage_class<StorageBuffer>>, %arg10: tensor<4xf8E5M2>) {
    return
  }
}

