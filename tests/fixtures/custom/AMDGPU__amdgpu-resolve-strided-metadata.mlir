module {
  func.func @resolve_metadata_no_offset_reset(%arg0: memref<?x?xi32, strided<[?, ?], offset: ?>>) -> (memref<i32, #amdgpu.address_space<fat_raw_buffer>>, index, index, index, index, index) {
    %0 = amdgpu.fat_raw_buffer_cast %arg0 : memref<?x?xi32, strided<[?, ?], offset: ?>> to memref<?x?xi32, strided<[?, ?], offset: ?>, #amdgpu.address_space<fat_raw_buffer>>
    %base_buffer, %offset, %sizes:2, %strides:2 = memref.extract_strided_metadata %0 : memref<?x?xi32, strided<[?, ?], offset: ?>, #amdgpu.address_space<fat_raw_buffer>> -> memref<i32, #amdgpu.address_space<fat_raw_buffer>>, index, index, index, index, index
    return %base_buffer, %offset, %sizes#0, %sizes#1, %strides#0, %strides#1 : memref<i32, #amdgpu.address_space<fat_raw_buffer>>, index, index, index, index, index
  }
}

// -----
module {
  func.func @resolve_metadata_offset_reset(%arg0: memref<?x?xi32, strided<[?, ?], offset: ?>>) -> (memref<i32, #amdgpu.address_space<fat_raw_buffer>>, index, index, index, index, index) {
    %0 = amdgpu.fat_raw_buffer_cast %arg0 resetOffset : memref<?x?xi32, strided<[?, ?], offset: ?>> to memref<?x?xi32, strided<[?, ?]>, #amdgpu.address_space<fat_raw_buffer>>
    %base_buffer, %offset, %sizes:2, %strides:2 = memref.extract_strided_metadata %0 : memref<?x?xi32, strided<[?, ?]>, #amdgpu.address_space<fat_raw_buffer>> -> memref<i32, #amdgpu.address_space<fat_raw_buffer>>, index, index, index, index, index
    return %base_buffer, %offset, %sizes#0, %sizes#1, %strides#0, %strides#1 : memref<i32, #amdgpu.address_space<fat_raw_buffer>>, index, index, index, index, index
  }
}

// -----
module {
  func.func @resolve_metadata_no_base_ptr(%arg0: memref<?x?xi32, strided<[?, ?], offset: ?>>) -> (memref<?x?xi32, strided<[?, ?]>, #amdgpu.address_space<fat_raw_buffer>>, index, index, index, index, index) {
    %0 = amdgpu.fat_raw_buffer_cast %arg0 resetOffset : memref<?x?xi32, strided<[?, ?], offset: ?>> to memref<?x?xi32, strided<[?, ?]>, #amdgpu.address_space<fat_raw_buffer>>
    %base_buffer, %offset, %sizes:2, %strides:2 = memref.extract_strided_metadata %0 : memref<?x?xi32, strided<[?, ?]>, #amdgpu.address_space<fat_raw_buffer>> -> memref<i32, #amdgpu.address_space<fat_raw_buffer>>, index, index, index, index, index
    return %0, %offset, %sizes#0, %sizes#1, %strides#0, %strides#1 : memref<?x?xi32, strided<[?, ?]>, #amdgpu.address_space<fat_raw_buffer>>, index, index, index, index, index
  }
}

