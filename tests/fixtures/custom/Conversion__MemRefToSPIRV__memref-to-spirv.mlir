module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.5, [Shader, Int8, Int16, Int64, Float16, Float64, StorageBuffer16BitAccess, StorageUniform16, StoragePushConstant16, StorageBuffer8BitAccess, UniformAndStorageBuffer8BitAccess, StoragePushConstant8, PhysicalStorageBufferAddresses], [SPV_KHR_16bit_storage, SPV_KHR_8bit_storage, SPV_KHR_storage_buffer_storage_class, SPV_KHR_physical_storage_buffer]>, #spirv.resource_limits<>>} {
  func.func @load_store_zero_rank_float(%arg0: memref<f32, #spirv.storage_class<StorageBuffer>>, %arg1: memref<f32, #spirv.storage_class<StorageBuffer>>) {
    %0 = memref.load %arg0[] : memref<f32, #spirv.storage_class<StorageBuffer>>
    memref.store %0, %arg1[] : memref<f32, #spirv.storage_class<StorageBuffer>>
    return
  }
  func.func @load_store_zero_rank_int(%arg0: memref<i32, #spirv.storage_class<StorageBuffer>>, %arg1: memref<i32, #spirv.storage_class<StorageBuffer>>) {
    %0 = memref.load %arg0[] : memref<i32, #spirv.storage_class<StorageBuffer>>
    memref.store %0, %arg1[] : memref<i32, #spirv.storage_class<StorageBuffer>>
    return
  }
  func.func @load_store_unknown_dim(%arg0: index, %arg1: memref<?xi32, #spirv.storage_class<StorageBuffer>>, %arg2: memref<?xi32, #spirv.storage_class<StorageBuffer>>) {
    %0 = memref.load %arg1[%arg0] : memref<?xi32, #spirv.storage_class<StorageBuffer>>
    memref.store %0, %arg2[%arg0] : memref<?xi32, #spirv.storage_class<StorageBuffer>>
    return
  }
  func.func @load_i1(%arg0: memref<4xi1, #spirv.storage_class<StorageBuffer>>, %arg1: index) -> i1 {
    %0 = memref.load %arg0[%arg1] : memref<4xi1, #spirv.storage_class<StorageBuffer>>
    return %0 : i1
  }
  func.func @load_aligned(%arg0: memref<4xi1, #spirv.storage_class<StorageBuffer>>, %arg1: index) -> i1 {
    %0 = memref.load %arg0[%arg1] {alignment = 32 : i64} : memref<4xi1, #spirv.storage_class<StorageBuffer>>
    return %0 : i1
  }
  func.func @load_aligned_nontemporal(%arg0: memref<4xi1, #spirv.storage_class<StorageBuffer>>, %arg1: index) -> i1 {
    %0 = memref.load %arg0[%arg1] {alignment = 32 : i64, nontemporal = true} : memref<4xi1, #spirv.storage_class<StorageBuffer>>
    return %0 : i1
  }
  func.func @load_aligned_psb(%arg0: memref<4xi1, #spirv.storage_class<PhysicalStorageBuffer>>, %arg1: index) -> i1 {
    %0 = memref.load %arg0[%arg1] {alignment = 32 : i64} : memref<4xi1, #spirv.storage_class<PhysicalStorageBuffer>>
    return %0 : i1
  }
  func.func @store_i1(%arg0: memref<4xi1, #spirv.storage_class<StorageBuffer>>, %arg1: index) {
    %true = arith.constant true
    memref.store %true, %arg0[%arg1] : memref<4xi1, #spirv.storage_class<StorageBuffer>>
    return
  }
  func.func @load_i16(%arg0: memref<i16, #spirv.storage_class<StorageBuffer>>) {
    %0 = memref.load %arg0[] : memref<i16, #spirv.storage_class<StorageBuffer>>
    return
  }
  func.func @store_i16(%arg0: memref<10xi16, #spirv.storage_class<StorageBuffer>>, %arg1: index, %arg2: i16) {
    memref.store %arg2, %arg0[%arg1] : memref<10xi16, #spirv.storage_class<StorageBuffer>>
    return
  }
  func.func @load_store_i32_physical(%arg0: memref<i32, #spirv.storage_class<PhysicalStorageBuffer>>) {
    %0 = memref.load %arg0[] : memref<i32, #spirv.storage_class<PhysicalStorageBuffer>>
    memref.store %0, %arg0[] : memref<i32, #spirv.storage_class<PhysicalStorageBuffer>>
    return
  }
  func.func @load_store_i8_physical(%arg0: memref<i8, #spirv.storage_class<PhysicalStorageBuffer>>) {
    %0 = memref.load %arg0[] : memref<i8, #spirv.storage_class<PhysicalStorageBuffer>>
    memref.store %0, %arg0[] : memref<i8, #spirv.storage_class<PhysicalStorageBuffer>>
    return
  }
  func.func @load_store_i1_physical(%arg0: memref<i1, #spirv.storage_class<PhysicalStorageBuffer>>) {
    %0 = memref.load %arg0[] : memref<i1, #spirv.storage_class<PhysicalStorageBuffer>>
    memref.store %0, %arg0[] : memref<i1, #spirv.storage_class<PhysicalStorageBuffer>>
    return
  }
  func.func @load_store_f32_physical(%arg0: memref<f32, #spirv.storage_class<PhysicalStorageBuffer>>) {
    %0 = memref.load %arg0[] : memref<f32, #spirv.storage_class<PhysicalStorageBuffer>>
    memref.store %0, %arg0[] : memref<f32, #spirv.storage_class<PhysicalStorageBuffer>>
    return
  }
  func.func @load_store_f16_physical(%arg0: memref<f16, #spirv.storage_class<PhysicalStorageBuffer>>) {
    %0 = memref.load %arg0[] : memref<f16, #spirv.storage_class<PhysicalStorageBuffer>>
    memref.store %0, %arg0[] : memref<f16, #spirv.storage_class<PhysicalStorageBuffer>>
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Kernel, Addresses, Int8, Int16, Int64, Float16, Float64], []>, #spirv.resource_limits<>>} {
  func.func @load_store_zero_rank_float(%arg0: memref<f32, #spirv.storage_class<CrossWorkgroup>>, %arg1: memref<f32, #spirv.storage_class<CrossWorkgroup>>) {
    %0 = memref.load %arg0[] : memref<f32, #spirv.storage_class<CrossWorkgroup>>
    memref.store %0, %arg1[] : memref<f32, #spirv.storage_class<CrossWorkgroup>>
    return
  }
  func.func @load_store_zero_rank_int(%arg0: memref<i32, #spirv.storage_class<CrossWorkgroup>>, %arg1: memref<i32, #spirv.storage_class<CrossWorkgroup>>) {
    %0 = memref.load %arg0[] : memref<i32, #spirv.storage_class<CrossWorkgroup>>
    memref.store %0, %arg1[] : memref<i32, #spirv.storage_class<CrossWorkgroup>>
    return
  }
  func.func @load_store_unknown_dim(%arg0: index, %arg1: memref<?xi32, #spirv.storage_class<CrossWorkgroup>>, %arg2: memref<?xi32, #spirv.storage_class<CrossWorkgroup>>) {
    %0 = memref.load %arg1[%arg0] : memref<?xi32, #spirv.storage_class<CrossWorkgroup>>
    memref.store %0, %arg2[%arg0] : memref<?xi32, #spirv.storage_class<CrossWorkgroup>>
    return
  }
  func.func @load_i1(%arg0: memref<4xi1, #spirv.storage_class<CrossWorkgroup>>, %arg1: index) -> i1 {
    %0 = memref.load %arg0[%arg1] : memref<4xi1, #spirv.storage_class<CrossWorkgroup>>
    return %0 : i1
  }
  func.func @store_i1(%arg0: memref<4xi1, #spirv.storage_class<CrossWorkgroup>>, %arg1: index) {
    %true = arith.constant true
    memref.store %true, %arg0[%arg1] : memref<4xi1, #spirv.storage_class<CrossWorkgroup>>
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Kernel, Addresses, GenericPointer], []>, #spirv.resource_limits<>>} {
  func.func @memory_space_cast(%arg0: memref<4xf32, #spirv.storage_class<CrossWorkgroup>>) -> memref<4xf32, #spirv.storage_class<Function>> {
    %memspacecast = memref.memory_space_cast %arg0 : memref<4xf32, #spirv.storage_class<CrossWorkgroup>> to memref<4xf32, #spirv.storage_class<Function>>
    return %memspacecast : memref<4xf32, #spirv.storage_class<Function>>
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader, Int8, Int16], [SPV_KHR_8bit_storage, SPV_KHR_16bit_storage, SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} {
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
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Kernel, Addresses, GenericPointer], []>, #spirv.resource_limits<>>} {
  func.func @reinterpret_cast(%arg0: memref<?xf32, #spirv.storage_class<CrossWorkgroup>>, %arg1: index) -> memref<?xf32, strided<[1], offset: ?>, #spirv.storage_class<CrossWorkgroup>> {
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%arg1], sizes: [10], strides: [1] : memref<?xf32, #spirv.storage_class<CrossWorkgroup>> to memref<?xf32, strided<[1], offset: ?>, #spirv.storage_class<CrossWorkgroup>>
    return %reinterpret_cast : memref<?xf32, strided<[1], offset: ?>, #spirv.storage_class<CrossWorkgroup>>
  }
  func.func @reinterpret_cast_0(%arg0: memref<?xf32, #spirv.storage_class<CrossWorkgroup>>) -> memref<?xf32, strided<[1], offset: ?>, #spirv.storage_class<CrossWorkgroup>> {
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [0], sizes: [10], strides: [1] : memref<?xf32, #spirv.storage_class<CrossWorkgroup>> to memref<?xf32, strided<[1], offset: ?>, #spirv.storage_class<CrossWorkgroup>>
    return %reinterpret_cast : memref<?xf32, strided<[1], offset: ?>, #spirv.storage_class<CrossWorkgroup>>
  }
  func.func @reinterpret_cast_5(%arg0: memref<?xf32, #spirv.storage_class<CrossWorkgroup>>) -> memref<?xf32, strided<[1], offset: ?>, #spirv.storage_class<CrossWorkgroup>> {
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [5], sizes: [10], strides: [1] : memref<?xf32, #spirv.storage_class<CrossWorkgroup>> to memref<?xf32, strided<[1], offset: ?>, #spirv.storage_class<CrossWorkgroup>>
    return %reinterpret_cast : memref<?xf32, strided<[1], offset: ?>, #spirv.storage_class<CrossWorkgroup>>
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Kernel, Addresses, GenericPointer], []>, #spirv.resource_limits<>>} {
  func.func @cast(%arg0: memref<4x?xf32, #spirv.storage_class<CrossWorkgroup>>) -> memref<?x4xf32, #spirv.storage_class<CrossWorkgroup>> {
    %cast = memref.cast %arg0 : memref<4x?xf32, #spirv.storage_class<CrossWorkgroup>> to memref<?x4xf32, #spirv.storage_class<CrossWorkgroup>>
    return %cast : memref<?x4xf32, #spirv.storage_class<CrossWorkgroup>>
  }
  func.func @cast_from_static(%arg0: memref<4x4xf32, #spirv.storage_class<CrossWorkgroup>>) -> memref<?x4xf32, #spirv.storage_class<CrossWorkgroup>> {
    %cast = memref.cast %arg0 : memref<4x4xf32, #spirv.storage_class<CrossWorkgroup>> to memref<?x4xf32, #spirv.storage_class<CrossWorkgroup>>
    return %cast : memref<?x4xf32, #spirv.storage_class<CrossWorkgroup>>
  }
  func.func @cast_to_static(%arg0: memref<4x?xf32, #spirv.storage_class<CrossWorkgroup>>) -> memref<4x4xf32, #spirv.storage_class<CrossWorkgroup>> {
    %cast = memref.cast %arg0 : memref<4x?xf32, #spirv.storage_class<CrossWorkgroup>> to memref<4x4xf32, #spirv.storage_class<CrossWorkgroup>>
    return %cast : memref<4x4xf32, #spirv.storage_class<CrossWorkgroup>>
  }
  func.func @cast_to_static_zero_elems(%arg0: memref<?xf32, #spirv.storage_class<CrossWorkgroup>>) -> memref<0xf32, #spirv.storage_class<CrossWorkgroup>> {
    %cast = memref.cast %arg0 : memref<?xf32, #spirv.storage_class<CrossWorkgroup>> to memref<0xf32, #spirv.storage_class<CrossWorkgroup>>
    return %cast : memref<0xf32, #spirv.storage_class<CrossWorkgroup>>
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.5, [Kernel, Int64, Addresses, PhysicalStorageBufferAddresses], []>, #spirv.resource_limits<>>} {
  func.func @extract_aligned_pointer_as_index_kernel(%arg0: memref<?xf32, #spirv.storage_class<CrossWorkgroup>>) -> index {
    %intptr = memref.extract_aligned_pointer_as_index %arg0 : memref<?xf32, #spirv.storage_class<CrossWorkgroup>> -> index
    return %intptr : index
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.5, [Shader, Int64, Addresses, PhysicalStorageBufferAddresses], []>, #spirv.resource_limits<>>} {
  func.func @extract_aligned_pointer_as_index_shader(%arg0: memref<?xf32, #spirv.storage_class<CrossWorkgroup>>) -> index {
    %intptr = memref.extract_aligned_pointer_as_index %arg0 : memref<?xf32, #spirv.storage_class<CrossWorkgroup>> -> index
    return %intptr : index
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader, PhysicalStorageBufferAddresses], [SPV_KHR_storage_buffer_storage_class, SPV_KHR_physical_storage_buffer]>, #spirv.resource_limits<>>} {
  func.func @load_nontemporal(%arg0: memref<f32, #spirv.storage_class<StorageBuffer>>) {
    %0 = memref.load %arg0[] {nontemporal = true} : memref<f32, #spirv.storage_class<StorageBuffer>>
    memref.store %0, %arg0[] {nontemporal = true} : memref<f32, #spirv.storage_class<StorageBuffer>>
    return
  }
  func.func @load_nontemporal_aligned(%arg0: memref<f32, #spirv.storage_class<PhysicalStorageBuffer>>) {
    %0 = memref.load %arg0[] {nontemporal = true} : memref<f32, #spirv.storage_class<PhysicalStorageBuffer>>
    memref.store %0, %arg0[] {nontemporal = true} : memref<f32, #spirv.storage_class<PhysicalStorageBuffer>>
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1, d0)>
#map2 = affine_map<(d0, d1) -> (d0, d1 mod 2)>
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader, PhysicalStorageBufferAddresses, Image1D, StorageImageExtendedFormats, Float16, StorageBuffer16BitAccess, StorageUniform16, Int16], [SPV_KHR_storage_buffer_storage_class, SPV_KHR_physical_storage_buffer, SPV_KHR_16bit_storage]>, #spirv.resource_limits<>>} {
  func.func @load_from_image_1D(%arg0: memref<1xf32, #spirv.storage_class<Image>>, %arg1: memref<1xf32, #spirv.storage_class<StorageBuffer>>) {
    %c0 = arith.constant 0 : index
    %0 = memref.load %arg0[%c0] : memref<1xf32, #spirv.storage_class<Image>>
    memref.store %0, %arg1[%c0] : memref<1xf32, #spirv.storage_class<StorageBuffer>>
    return
  }
  func.func @load_from_image_2D(%arg0: memref<2x4xf32, #spirv.storage_class<Image>>, %arg1: memref<2x4xf32, #spirv.storage_class<StorageBuffer>>) {
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    %0 = memref.load %arg0[%c1, %c3] : memref<2x4xf32, #spirv.storage_class<Image>>
    memref.store %0, %arg1[%c1, %c3] : memref<2x4xf32, #spirv.storage_class<StorageBuffer>>
    return
  }
  func.func @load_from_col_major_image_2D(%arg0: memref<2x4xf32, #map, #spirv.storage_class<Image>>, %arg1: memref<2x4xf32, #spirv.storage_class<StorageBuffer>>) {
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    %0 = memref.load %arg0[%c3, %c1] : memref<2x4xf32, #map, #spirv.storage_class<Image>>
    memref.store %0, %arg1[%c1, %c3] : memref<2x4xf32, #spirv.storage_class<StorageBuffer>>
    return
  }
  func.func @load_from_image_3D(%arg0: memref<2x3x4xf32, #spirv.storage_class<Image>>, %arg1: memref<2x3x4xf32, #spirv.storage_class<StorageBuffer>>) {
    %c3 = arith.constant 3 : index
    %c2 = arith.constant 2 : index
    %c1 = arith.constant 1 : index
    %0 = memref.load %arg0[%c1, %c2, %c3] : memref<2x3x4xf32, #spirv.storage_class<Image>>
    memref.store %0, %arg1[%c1, %c2, %c3] : memref<2x3x4xf32, #spirv.storage_class<StorageBuffer>>
    return
  }
  func.func @load_from_custom_layout_image_3D(%arg0: memref<2x3x4xf32, #map1, #spirv.storage_class<Image>>, %arg1: memref<2x3x4xf32, #spirv.storage_class<StorageBuffer>>) {
    %c3 = arith.constant 3 : index
    %c2 = arith.constant 2 : index
    %c1 = arith.constant 1 : index
    %0 = memref.load %arg0[%c3, %c2, %c1] : memref<2x3x4xf32, #map1, #spirv.storage_class<Image>>
    memref.store %0, %arg1[%c1, %c2, %c3] : memref<2x3x4xf32, #spirv.storage_class<StorageBuffer>>
    return
  }
  func.func @load_from_image_2D_f16(%arg0: memref<2x3xf16, #spirv.storage_class<Image>>, %arg1: memref<2x3xf16, #spirv.storage_class<StorageBuffer>>) {
    %c2 = arith.constant 2 : index
    %c1 = arith.constant 1 : index
    %0 = memref.load %arg0[%c1, %c2] : memref<2x3xf16, #spirv.storage_class<Image>>
    memref.store %0, %arg1[%c1, %c2] : memref<2x3xf16, #spirv.storage_class<StorageBuffer>>
    return
  }
  func.func @load_from_image_2D_i32(%arg0: memref<2x3xi32, #spirv.storage_class<Image>>, %arg1: memref<2x3xi32, #spirv.storage_class<StorageBuffer>>) {
    %c2 = arith.constant 2 : index
    %c1 = arith.constant 1 : index
    %0 = memref.load %arg0[%c1, %c2] : memref<2x3xi32, #spirv.storage_class<Image>>
    memref.store %0, %arg1[%c1, %c2] : memref<2x3xi32, #spirv.storage_class<StorageBuffer>>
    return
  }
  func.func @load_from_image_2D_ui32(%arg0: memref<2x3xui32, #spirv.storage_class<Image>>, %arg1: memref<2x3xui32, #spirv.storage_class<StorageBuffer>>) {
    %c2 = arith.constant 2 : index
    %c1 = arith.constant 1 : index
    %0 = memref.load %arg0[%c1, %c2] : memref<2x3xui32, #spirv.storage_class<Image>>
    memref.store %0, %arg1[%c1, %c2] : memref<2x3xui32, #spirv.storage_class<StorageBuffer>>
    return
  }
  func.func @load_from_image_2D_i16(%arg0: memref<2x3xi16, #spirv.storage_class<Image>>, %arg1: memref<2x3xi16, #spirv.storage_class<StorageBuffer>>) {
    %c2 = arith.constant 2 : index
    %c1 = arith.constant 1 : index
    %0 = memref.load %arg0[%c1, %c2] : memref<2x3xi16, #spirv.storage_class<Image>>
    memref.store %0, %arg1[%c1, %c2] : memref<2x3xi16, #spirv.storage_class<StorageBuffer>>
    return
  }
  func.func @load_from_image_2D_ui16(%arg0: memref<2x3xui16, #spirv.storage_class<Image>>, %arg1: memref<2x3xui16, #spirv.storage_class<StorageBuffer>>) {
    %c2 = arith.constant 2 : index
    %c1 = arith.constant 1 : index
    %0 = memref.load %arg0[%c1, %c2] : memref<2x3xui16, #spirv.storage_class<Image>>
    memref.store %0, %arg1[%c1, %c2] : memref<2x3xui16, #spirv.storage_class<StorageBuffer>>
    return
  }
  func.func @load_from_image_2D_rank0(%arg0: memref<f32, #spirv.storage_class<Image>>, %arg1: memref<f32, #spirv.storage_class<StorageBuffer>>) {
    %c0 = arith.constant 0 : index
    %0 = memref.load %arg0[] : memref<f32, #spirv.storage_class<Image>>
    memref.store %0, %arg1[] : memref<f32, #spirv.storage_class<StorageBuffer>>
    return
  }
  func.func @load_from_image_2D_rank4(%arg0: memref<1x1x1x1xf32, #spirv.storage_class<Image>>, %arg1: memref<1x1x1x1xf32, #spirv.storage_class<StorageBuffer>>) {
    %c0 = arith.constant 0 : index
    %0 = memref.load %arg0[%c0, %c0, %c0, %c0] : memref<1x1x1x1xf32, #spirv.storage_class<Image>>
    memref.store %0, %arg1[%c0, %c0, %c0, %c0] : memref<1x1x1x1xf32, #spirv.storage_class<StorageBuffer>>
    return
  }
  func.func @load_from_image_2D_vector(%arg0: memref<1xvector<1xf32>, #spirv.storage_class<Image>>, %arg1: memref<1xvector<1xf32>, #spirv.storage_class<StorageBuffer>>) {
    %c0 = arith.constant 0 : index
    %0 = memref.load %arg0[%c0] : memref<1xvector<1xf32>, #spirv.storage_class<Image>>
    memref.store %0, %arg1[%c0] : memref<1xvector<1xf32>, #spirv.storage_class<StorageBuffer>>
    return
  }
  func.func @load_non_perm_layout(%arg0: memref<2x4xf32, #map2, #spirv.storage_class<Image>>, %arg1: memref<2x4xf32, #spirv.storage_class<StorageBuffer>>) {
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    %0 = memref.load %arg0[%c1, %c3] : memref<2x4xf32, #map2, #spirv.storage_class<Image>>
    memref.store %0, %arg1[%c1, %c3] : memref<2x4xf32, #spirv.storage_class<StorageBuffer>>
    return
  }
}

