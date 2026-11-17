"builtin.module"() ({
  "func.func"() <{function_type = (memref<128x72xf32, #gpu.address_space<global>>) -> (), sym_name = "global_load_to_rocdl_f32"}> ({
  ^bb0(%arg10: memref<128x72xf32, #gpu.address_space<global>> loc("<stdin>":3:8)):
    %27 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:11)
    %28 = "arith.constant"() <{value = 12 : index}> : () -> index loc("<stdin>":5:11)
    %29 = "arith.constant"() <{value = 32 : index}> : () -> index loc("<stdin>":6:11)
    %30 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x64xf32, #gpu.address_space<workgroup>> loc("<stdin>":7:11)
    "amdgpu.gather_to_lds"(%arg10, %28, %27, %30, %29, %27) <{operandSegmentSizes = array<i32: 1, 2, 1, 2>, transferType = f32}> : (memref<128x72xf32, #gpu.address_space<global>>, index, index, memref<64x64xf32, #gpu.address_space<workgroup>>, index, index) -> () loc("<stdin>":8:5)
    "func.return"() : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<128x72xf32>) -> (), sym_name = "global_load_to_rocdl_wg_mem"}> ({
  ^bb0(%arg9: memref<128x72xf32> loc("<stdin>":12:8)):
    %23 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":13:11)
    %24 = "arith.constant"() <{value = 12 : index}> : () -> index loc("<stdin>":14:11)
    %25 = "arith.constant"() <{value = 32 : index}> : () -> index loc("<stdin>":15:11)
    %26 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x64xf32, #gpu.address_space<workgroup>> loc("<stdin>":16:11)
    "amdgpu.gather_to_lds"(%arg9, %24, %23, %26, %25, %23) <{operandSegmentSizes = array<i32: 1, 2, 1, 2>, transferType = f32}> : (memref<128x72xf32>, index, index, memref<64x64xf32, #gpu.address_space<workgroup>>, index, index) -> () loc("<stdin>":17:5)
    "func.return"() : () -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":11:3)
  "func.func"() <{function_type = (memref<f32>) -> (), sym_name = "global_load_to_rocdl_0d"}> ({
  ^bb0(%arg8: memref<f32> loc("<stdin>":21:8)):
    %22 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f32, #gpu.address_space<workgroup>> loc("<stdin>":22:11)
    "amdgpu.gather_to_lds"(%arg8, %22) <{operandSegmentSizes = array<i32: 1, 0, 1, 0>, transferType = f32}> : (memref<f32>, memref<f32, #gpu.address_space<workgroup>>) -> () loc("<stdin>":23:5)
    "func.return"() : () -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":20:3)
  "func.func"() <{function_type = (memref<128x72xi8, #gpu.address_space<global>>) -> (), sym_name = "global_load_to_rocdl_i8"}> ({
  ^bb0(%arg7: memref<128x72xi8, #gpu.address_space<global>> loc("<stdin>":27:8)):
    %18 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":28:11)
    %19 = "arith.constant"() <{value = 12 : index}> : () -> index loc("<stdin>":29:11)
    %20 = "arith.constant"() <{value = 32 : index}> : () -> index loc("<stdin>":30:11)
    %21 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x64xi8, #gpu.address_space<workgroup>> loc("<stdin>":31:11)
    "amdgpu.gather_to_lds"(%arg7, %19, %18, %21, %20, %18) <{operandSegmentSizes = array<i32: 1, 2, 1, 2>, transferType = i8}> : (memref<128x72xi8, #gpu.address_space<global>>, index, index, memref<64x64xi8, #gpu.address_space<workgroup>>, index, index) -> () loc("<stdin>":32:5)
    "func.return"() : () -> () loc("<stdin>":33:5)
  }) : () -> () loc("<stdin>":26:3)
  "func.func"() <{function_type = (memref<128x72xi16, #gpu.address_space<global>>) -> (), sym_name = "global_load_to_rocdl_vec"}> ({
  ^bb0(%arg6: memref<128x72xi16, #gpu.address_space<global>> loc("<stdin>":36:8)):
    %14 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":37:11)
    %15 = "arith.constant"() <{value = 12 : index}> : () -> index loc("<stdin>":38:11)
    %16 = "arith.constant"() <{value = 32 : index}> : () -> index loc("<stdin>":39:11)
    %17 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x128xi16, #gpu.address_space<workgroup>> loc("<stdin>":40:11)
    "amdgpu.gather_to_lds"(%arg6, %15, %14, %17, %16, %14) <{operandSegmentSizes = array<i32: 1, 2, 1, 2>, transferType = vector<2xi16>}> : (memref<128x72xi16, #gpu.address_space<global>>, index, index, memref<64x128xi16, #gpu.address_space<workgroup>>, index, index) -> () loc("<stdin>":41:5)
    "func.return"() : () -> () loc("<stdin>":42:5)
  }) : () -> () loc("<stdin>":35:3)
  "func.func"() <{function_type = (memref<512xi32, #gpu.address_space<global>>, index, index) -> (), sym_name = "global_load_to_rocdl_dynamic_indices"}> ({
  ^bb0(%arg3: memref<512xi32, #gpu.address_space<global>> loc("<stdin>":45:8), %arg4: index loc("<stdin>":45:60), %arg5: index loc("<stdin>":45:74)):
    %12 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x64xi32, #gpu.address_space<workgroup>> loc("<stdin>":46:11)
    %13 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":47:11)
    "amdgpu.gather_to_lds"(%arg3, %arg4, %12, %arg5, %13) <{operandSegmentSizes = array<i32: 1, 1, 1, 2>, transferType = i32}> : (memref<512xi32, #gpu.address_space<global>>, index, memref<4x64xi32, #gpu.address_space<workgroup>>, index, index) -> () loc("<stdin>":48:5)
    "func.return"() : () -> () loc("<stdin>":49:5)
  }) : () -> () loc("<stdin>":44:3)
  "func.func"() <{function_type = (memref<128x72xf32, #amdgpu.address_space<fat_raw_buffer>>) -> (), sym_name = "fat_buffer_load_to_rocdl_f32"}> ({
  ^bb0(%arg2: memref<128x72xf32, #amdgpu.address_space<fat_raw_buffer>> loc("<stdin>":52:8)):
    %8 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":53:10)
    %9 = "arith.constant"() <{value = 12 : index}> : () -> index loc("<stdin>":54:10)
    %10 = "arith.constant"() <{value = 32 : index}> : () -> index loc("<stdin>":55:11)
    %11 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x64xf32, #gpu.address_space<workgroup>> loc("<stdin>":56:11)
    "amdgpu.gather_to_lds"(%arg2, %9, %8, %11, %10, %8) <{operandSegmentSizes = array<i32: 1, 2, 1, 2>, transferType = f32}> : (memref<128x72xf32, #amdgpu.address_space<fat_raw_buffer>>, index, index, memref<64x64xf32, #gpu.address_space<workgroup>>, index, index) -> () loc("<stdin>":57:5)
    "func.return"() : () -> () loc("<stdin>":58:5)
  }) : () -> () loc("<stdin>":51:3)
  "func.func"() <{function_type = (memref<128x72xf32, #gpu.address_space<global>>) -> (), sym_name = "global_load_to_rocdl_async_f32"}> ({
  ^bb0(%arg1: memref<128x72xf32, #gpu.address_space<global>> loc("<stdin>":61:8)):
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":62:10)
    %5 = "arith.constant"() <{value = 12 : index}> : () -> index loc("<stdin>":63:10)
    %6 = "arith.constant"() <{value = 32 : index}> : () -> index loc("<stdin>":64:10)
    %7 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x64xf32, #gpu.address_space<workgroup>> loc("<stdin>":65:10)
    "amdgpu.gather_to_lds"(%arg1, %5, %4, %7, %6, %4) <{async, operandSegmentSizes = array<i32: 1, 2, 1, 2>, transferType = f32}> : (memref<128x72xf32, #gpu.address_space<global>>, index, index, memref<64x64xf32, #gpu.address_space<workgroup>>, index, index) -> () loc("<stdin>":66:5)
    "func.return"() : () -> () loc("<stdin>":67:5)
  }) : () -> () loc("<stdin>":60:3)
  "func.func"() <{function_type = (memref<128x72xf32, #amdgpu.address_space<fat_raw_buffer>>) -> (), sym_name = "global_load_to_rocdl_async_f32_fat_raw_buffer"}> ({
  ^bb0(%arg0: memref<128x72xf32, #amdgpu.address_space<fat_raw_buffer>> loc("<stdin>":70:8)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":71:10)
    %1 = "arith.constant"() <{value = 12 : index}> : () -> index loc("<stdin>":72:10)
    %2 = "arith.constant"() <{value = 32 : index}> : () -> index loc("<stdin>":73:10)
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x64xf32, #gpu.address_space<workgroup>> loc("<stdin>":74:10)
    "amdgpu.gather_to_lds"(%arg0, %1, %0, %3, %2, %0) <{async, operandSegmentSizes = array<i32: 1, 2, 1, 2>, transferType = f32}> : (memref<128x72xf32, #amdgpu.address_space<fat_raw_buffer>>, index, index, memref<64x64xf32, #gpu.address_space<workgroup>>, index, index) -> () loc("<stdin>":75:5)
    "func.return"() : () -> () loc("<stdin>":76:5)
  }) : () -> () loc("<stdin>":69:3)
}) : () -> () loc("<stdin>":1:1)
