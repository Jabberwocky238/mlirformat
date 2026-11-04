"builtin.module"() ({
  "func.func"() <{function_type = (memref<2x3xf32>) -> (index, index), sym_name = "fat_raw_buffer_cast_static_dim"}> ({
  ^bb0(%arg0: memref<2x3xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "amdgpu.fat_raw_buffer_cast"(%arg0) <{boundsCheck = true, operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<2x3xf32>) -> memref<2x3xf32, #amdgpu.address_space<fat_raw_buffer>>
    %3 = "memref.dim"(%2, %0) : (memref<2x3xf32, #amdgpu.address_space<fat_raw_buffer>>, index) -> index
    %4 = "memref.dim"(%2, %1) : (memref<2x3xf32, #amdgpu.address_space<fat_raw_buffer>>, index) -> index
    "func.return"(%3, %4) : (index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x?xf32>) -> (index, index), sym_name = "fat_raw_buffer_cast_dynamic_dim"}> ({
  ^bb0(%arg0: memref<4x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "amdgpu.fat_raw_buffer_cast"(%arg0) <{boundsCheck = true, operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<4x?xf32>) -> memref<4x?xf32, #amdgpu.address_space<fat_raw_buffer>>
    %3 = "memref.dim"(%2, %0) : (memref<4x?xf32, #amdgpu.address_space<fat_raw_buffer>>, index) -> index
    %4 = "memref.dim"(%2, %1) : (memref<4x?xf32, #amdgpu.address_space<fat_raw_buffer>>, index) -> index
    "func.return"(%3, %4) : (index, index) -> ()
  }) : () -> ()
}) : () -> ()

