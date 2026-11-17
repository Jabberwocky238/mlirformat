"builtin.module"() ({
  "func.func"() <{function_type = (memref<128x72xf32, #amdgpu.address_space<fat_raw_buffer>>) -> (), sym_name = "fat_buffer_load_to_rocdl_f96"}> ({
  ^bb0(%arg0: memref<128x72xf32, #amdgpu.address_space<fat_raw_buffer>> loc("<stdin>":3:8)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 12 : index}> : () -> index loc("<stdin>":5:10)
    %2 = "arith.constant"() <{value = 32 : index}> : () -> index loc("<stdin>":6:10)
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x64xf32, #gpu.address_space<workgroup>> loc("<stdin>":7:10)
    "amdgpu.gather_to_lds"(%arg0, %1, %0, %3, %2, %0) <{operandSegmentSizes = array<i32: 1, 2, 1, 2>, transferType = vector<16xf6E3M2FN>}> : (memref<128x72xf32, #amdgpu.address_space<fat_raw_buffer>>, index, index, memref<64x64xf32, #gpu.address_space<workgroup>>, index, index) -> () loc("<stdin>":8:5)
    "func.return"() : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
