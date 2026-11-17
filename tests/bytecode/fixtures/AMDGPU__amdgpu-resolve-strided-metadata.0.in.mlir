"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi32, strided<[?, ?], offset: ?>>) -> (memref<i32, #amdgpu.address_space<fat_raw_buffer>>, index, index, index, index, index), sym_name = "resolve_metadata_no_offset_reset"}> ({
  ^bb0(%arg0: memref<?x?xi32, strided<[?, ?], offset: ?>> loc("<stdin>":3:8)):
    %0 = "amdgpu.fat_raw_buffer_cast"(%arg0) <{boundsCheck = true, operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<?x?xi32, strided<[?, ?], offset: ?>>) -> memref<?x?xi32, strided<[?, ?], offset: ?>, #amdgpu.address_space<fat_raw_buffer>> loc("<stdin>":4:10)
    %1:6 = "memref.extract_strided_metadata"(%0) : (memref<?x?xi32, strided<[?, ?], offset: ?>, #amdgpu.address_space<fat_raw_buffer>>) -> (memref<i32, #amdgpu.address_space<fat_raw_buffer>>, index, index, index, index, index) loc("<stdin>":5:12)
    "func.return"(%1#0, %1#1, %1#2, %1#3, %1#4, %1#5) : (memref<i32, #amdgpu.address_space<fat_raw_buffer>>, index, index, index, index, index) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
