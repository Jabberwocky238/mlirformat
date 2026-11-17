"builtin.module"() ({
  "func.func"() <{function_type = (memref<2x3xf32>) -> (index, index), sym_name = "fat_raw_buffer_cast_static_dim"}> ({
  ^bb0(%arg0: memref<2x3xf32> loc("<stdin>":3:8)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":5:10)
    %2 = "amdgpu.fat_raw_buffer_cast"(%arg0) <{boundsCheck = true, operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<2x3xf32>) -> memref<2x3xf32, #amdgpu.address_space<fat_raw_buffer>> loc("<stdin>":6:10)
    %3 = "memref.dim"(%2, %0) : (memref<2x3xf32, #amdgpu.address_space<fat_raw_buffer>>, index) -> index loc("<stdin>":7:10)
    %4 = "memref.dim"(%2, %1) : (memref<2x3xf32, #amdgpu.address_space<fat_raw_buffer>>, index) -> index loc("<stdin>":8:10)
    "func.return"(%3, %4) : (index, index) -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
