"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi32, strided<[?, ?], offset: ?>>) -> (memref<i32, #amdgpu.address_space<fat_raw_buffer>>, index, index, index, index, index), sym_name = "resolve_metadata_no_offset_reset"}> ({
  ^bb0(%arg0: memref<?x?xi32, strided<[?, ?], offset: ?>>):
    %0 = "amdgpu.fat_raw_buffer_cast"(%arg0) <{boundsCheck = true, operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<?x?xi32, strided<[?, ?], offset: ?>>) -> memref<?x?xi32, strided<[?, ?], offset: ?>, #amdgpu.address_space<fat_raw_buffer>>
    %1:6 = "memref.extract_strided_metadata"(%0) : (memref<?x?xi32, strided<[?, ?], offset: ?>, #amdgpu.address_space<fat_raw_buffer>>) -> (memref<i32, #amdgpu.address_space<fat_raw_buffer>>, index, index, index, index, index)
    "func.return"(%1#0, %1#1, %1#2, %1#3, %1#4, %1#5) : (memref<i32, #amdgpu.address_space<fat_raw_buffer>>, index, index, index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi32, strided<[?, ?], offset: ?>>) -> (memref<i32, #amdgpu.address_space<fat_raw_buffer>>, index, index, index, index, index), sym_name = "resolve_metadata_offset_reset"}> ({
  ^bb0(%arg0: memref<?x?xi32, strided<[?, ?], offset: ?>>):
    %0 = "amdgpu.fat_raw_buffer_cast"(%arg0) <{boundsCheck = true, operandSegmentSizes = array<i32: 1, 0, 0>, resetOffset}> : (memref<?x?xi32, strided<[?, ?], offset: ?>>) -> memref<?x?xi32, strided<[?, ?]>, #amdgpu.address_space<fat_raw_buffer>>
    %1:6 = "memref.extract_strided_metadata"(%0) : (memref<?x?xi32, strided<[?, ?]>, #amdgpu.address_space<fat_raw_buffer>>) -> (memref<i32, #amdgpu.address_space<fat_raw_buffer>>, index, index, index, index, index)
    "func.return"(%1#0, %1#1, %1#2, %1#3, %1#4, %1#5) : (memref<i32, #amdgpu.address_space<fat_raw_buffer>>, index, index, index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi32, strided<[?, ?], offset: ?>>) -> (memref<?x?xi32, strided<[?, ?]>, #amdgpu.address_space<fat_raw_buffer>>, index, index, index, index, index), sym_name = "resolve_metadata_no_base_ptr"}> ({
  ^bb0(%arg0: memref<?x?xi32, strided<[?, ?], offset: ?>>):
    %0 = "amdgpu.fat_raw_buffer_cast"(%arg0) <{boundsCheck = true, operandSegmentSizes = array<i32: 1, 0, 0>, resetOffset}> : (memref<?x?xi32, strided<[?, ?], offset: ?>>) -> memref<?x?xi32, strided<[?, ?]>, #amdgpu.address_space<fat_raw_buffer>>
    %1:6 = "memref.extract_strided_metadata"(%0) : (memref<?x?xi32, strided<[?, ?]>, #amdgpu.address_space<fat_raw_buffer>>) -> (memref<i32, #amdgpu.address_space<fat_raw_buffer>>, index, index, index, index, index)
    "func.return"(%0, %1#1, %1#2, %1#3, %1#4, %1#5) : (memref<?x?xi32, strided<[?, ?]>, #amdgpu.address_space<fat_raw_buffer>>, index, index, index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

