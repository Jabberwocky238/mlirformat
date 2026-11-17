"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32, #spirv.storage_class<StorageBuffer>>, memref<f32, #spirv.storage_class<StorageBuffer>>) -> (), sym_name = "load_store_zero_rank_float"}> ({
  ^bb0(%arg30: memref<f32, #spirv.storage_class<StorageBuffer>> loc("<stdin>":3:8), %arg31: memref<f32, #spirv.storage_class<StorageBuffer>> loc("<stdin>":3:66)):
    %16 = "memref.load"(%arg30) : (memref<f32, #spirv.storage_class<StorageBuffer>>) -> f32 loc("<stdin>":4:11)
    "memref.store"(%16, %arg31) : (f32, memref<f32, #spirv.storage_class<StorageBuffer>>) -> () loc("<stdin>":5:5)
    "func.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<i32, #spirv.storage_class<StorageBuffer>>, memref<i32, #spirv.storage_class<StorageBuffer>>) -> (), sym_name = "load_store_zero_rank_int"}> ({
  ^bb0(%arg28: memref<i32, #spirv.storage_class<StorageBuffer>> loc("<stdin>":9:8), %arg29: memref<i32, #spirv.storage_class<StorageBuffer>> loc("<stdin>":9:66)):
    %15 = "memref.load"(%arg28) : (memref<i32, #spirv.storage_class<StorageBuffer>>) -> i32 loc("<stdin>":10:11)
    "memref.store"(%15, %arg29) : (i32, memref<i32, #spirv.storage_class<StorageBuffer>>) -> () loc("<stdin>":11:5)
    "func.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = (index, memref<?xi32, #spirv.storage_class<StorageBuffer>>, memref<?xi32, #spirv.storage_class<StorageBuffer>>) -> (), sym_name = "load_store_unknown_dim"}> ({
  ^bb0(%arg25: index loc("<stdin>":15:8), %arg26: memref<?xi32, #spirv.storage_class<StorageBuffer>> loc("<stdin>":15:23), %arg27: memref<?xi32, #spirv.storage_class<StorageBuffer>> loc("<stdin>":15:83)):
    %14 = "memref.load"(%arg26, %arg25) : (memref<?xi32, #spirv.storage_class<StorageBuffer>>, index) -> i32 loc("<stdin>":16:11)
    "memref.store"(%14, %arg27, %arg25) : (i32, memref<?xi32, #spirv.storage_class<StorageBuffer>>, index) -> () loc("<stdin>":17:5)
    "func.return"() : () -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":14:3)
  "func.func"() <{function_type = (memref<4xi1, #spirv.storage_class<StorageBuffer>>, index) -> i1, sym_name = "load_i1"}> ({
  ^bb0(%arg23: memref<4xi1, #spirv.storage_class<StorageBuffer>> loc("<stdin>":21:8), %arg24: index loc("<stdin>":21:67)):
    %13 = "memref.load"(%arg23, %arg24) : (memref<4xi1, #spirv.storage_class<StorageBuffer>>, index) -> i1 loc("<stdin>":22:11)
    "func.return"(%13) : (i1) -> () loc("<stdin>":23:5)
  }) : () -> () loc("<stdin>":20:3)
  "func.func"() <{function_type = (memref<4xi1, #spirv.storage_class<StorageBuffer>>, index) -> i1, sym_name = "load_aligned"}> ({
  ^bb0(%arg21: memref<4xi1, #spirv.storage_class<StorageBuffer>> loc("<stdin>":26:8), %arg22: index loc("<stdin>":26:67)):
    %12 = "memref.load"(%arg21, %arg22) <{alignment = 32 : i64}> : (memref<4xi1, #spirv.storage_class<StorageBuffer>>, index) -> i1 loc("<stdin>":27:11)
    "func.return"(%12) : (i1) -> () loc("<stdin>":28:5)
  }) : () -> () loc("<stdin>":25:3)
  "func.func"() <{function_type = (memref<4xi1, #spirv.storage_class<StorageBuffer>>, index) -> i1, sym_name = "load_aligned_nontemporal"}> ({
  ^bb0(%arg19: memref<4xi1, #spirv.storage_class<StorageBuffer>> loc("<stdin>":31:8), %arg20: index loc("<stdin>":31:67)):
    %11 = "memref.load"(%arg19, %arg20) <{alignment = 32 : i64, nontemporal = true}> : (memref<4xi1, #spirv.storage_class<StorageBuffer>>, index) -> i1 loc("<stdin>":32:11)
    "func.return"(%11) : (i1) -> () loc("<stdin>":33:5)
  }) : () -> () loc("<stdin>":30:3)
  "func.func"() <{function_type = (memref<4xi1, #spirv.storage_class<PhysicalStorageBuffer>>, index) -> i1, sym_name = "load_aligned_psb"}> ({
  ^bb0(%arg17: memref<4xi1, #spirv.storage_class<PhysicalStorageBuffer>> loc("<stdin>":36:8), %arg18: index loc("<stdin>":36:75)):
    %10 = "memref.load"(%arg17, %arg18) <{alignment = 32 : i64}> : (memref<4xi1, #spirv.storage_class<PhysicalStorageBuffer>>, index) -> i1 loc("<stdin>":37:11)
    "func.return"(%10) : (i1) -> () loc("<stdin>":38:5)
  }) : () -> () loc("<stdin>":35:3)
  "func.func"() <{function_type = (memref<4xi1, #spirv.storage_class<StorageBuffer>>, index) -> (), sym_name = "store_i1"}> ({
  ^bb0(%arg15: memref<4xi1, #spirv.storage_class<StorageBuffer>> loc("<stdin>":41:8), %arg16: index loc("<stdin>":41:67)):
    %9 = "arith.constant"() <{value = true}> : () -> i1 loc("<stdin>":42:10)
    "memref.store"(%9, %arg15, %arg16) : (i1, memref<4xi1, #spirv.storage_class<StorageBuffer>>, index) -> () loc("<stdin>":43:5)
    "func.return"() : () -> () loc("<stdin>":44:5)
  }) : () -> () loc("<stdin>":40:3)
  "func.func"() <{function_type = (memref<i16, #spirv.storage_class<StorageBuffer>>) -> (), sym_name = "load_i16"}> ({
  ^bb0(%arg14: memref<i16, #spirv.storage_class<StorageBuffer>> loc("<stdin>":47:8)):
    %8 = "memref.load"(%arg14) : (memref<i16, #spirv.storage_class<StorageBuffer>>) -> i16 loc("<stdin>":48:10)
    "func.return"() : () -> () loc("<stdin>":49:5)
  }) : () -> () loc("<stdin>":46:3)
  "func.func"() <{function_type = (memref<10xi16, #spirv.storage_class<StorageBuffer>>, index, i16) -> (), sym_name = "store_i16"}> ({
  ^bb0(%arg11: memref<10xi16, #spirv.storage_class<StorageBuffer>> loc("<stdin>":52:8), %arg12: index loc("<stdin>":52:69), %arg13: i16 loc("<stdin>":52:84)):
    "memref.store"(%arg13, %arg11, %arg12) : (i16, memref<10xi16, #spirv.storage_class<StorageBuffer>>, index) -> () loc("<stdin>":53:5)
    "func.return"() : () -> () loc("<stdin>":54:5)
  }) : () -> () loc("<stdin>":51:3)
  "func.func"() <{function_type = (memref<i32, #spirv.storage_class<PhysicalStorageBuffer>>) -> (), sym_name = "load_store_i32_physical"}> ({
  ^bb0(%arg10: memref<i32, #spirv.storage_class<PhysicalStorageBuffer>> loc("<stdin>":57:8)):
    %7 = "memref.load"(%arg10) : (memref<i32, #spirv.storage_class<PhysicalStorageBuffer>>) -> i32 loc("<stdin>":58:10)
    "memref.store"(%7, %arg10) : (i32, memref<i32, #spirv.storage_class<PhysicalStorageBuffer>>) -> () loc("<stdin>":59:5)
    "func.return"() : () -> () loc("<stdin>":60:5)
  }) : () -> () loc("<stdin>":56:3)
  "func.func"() <{function_type = (memref<i8, #spirv.storage_class<PhysicalStorageBuffer>>) -> (), sym_name = "load_store_i8_physical"}> ({
  ^bb0(%arg9: memref<i8, #spirv.storage_class<PhysicalStorageBuffer>> loc("<stdin>":63:8)):
    %6 = "memref.load"(%arg9) : (memref<i8, #spirv.storage_class<PhysicalStorageBuffer>>) -> i8 loc("<stdin>":64:10)
    "memref.store"(%6, %arg9) : (i8, memref<i8, #spirv.storage_class<PhysicalStorageBuffer>>) -> () loc("<stdin>":65:5)
    "func.return"() : () -> () loc("<stdin>":66:5)
  }) : () -> () loc("<stdin>":62:3)
  "func.func"() <{function_type = (memref<i1, #spirv.storage_class<PhysicalStorageBuffer>>) -> (), sym_name = "load_store_i1_physical"}> ({
  ^bb0(%arg8: memref<i1, #spirv.storage_class<PhysicalStorageBuffer>> loc("<stdin>":69:8)):
    %5 = "memref.load"(%arg8) : (memref<i1, #spirv.storage_class<PhysicalStorageBuffer>>) -> i1 loc("<stdin>":70:10)
    "memref.store"(%5, %arg8) : (i1, memref<i1, #spirv.storage_class<PhysicalStorageBuffer>>) -> () loc("<stdin>":71:5)
    "func.return"() : () -> () loc("<stdin>":72:5)
  }) : () -> () loc("<stdin>":68:3)
  "func.func"() <{function_type = (memref<f32, #spirv.storage_class<PhysicalStorageBuffer>>) -> (), sym_name = "load_store_f32_physical"}> ({
  ^bb0(%arg7: memref<f32, #spirv.storage_class<PhysicalStorageBuffer>> loc("<stdin>":75:8)):
    %4 = "memref.load"(%arg7) : (memref<f32, #spirv.storage_class<PhysicalStorageBuffer>>) -> f32 loc("<stdin>":76:10)
    "memref.store"(%4, %arg7) : (f32, memref<f32, #spirv.storage_class<PhysicalStorageBuffer>>) -> () loc("<stdin>":77:5)
    "func.return"() : () -> () loc("<stdin>":78:5)
  }) : () -> () loc("<stdin>":74:3)
  "func.func"() <{function_type = (memref<f16, #spirv.storage_class<PhysicalStorageBuffer>>) -> (), sym_name = "load_store_f16_physical"}> ({
  ^bb0(%arg6: memref<f16, #spirv.storage_class<PhysicalStorageBuffer>> loc("<stdin>":81:8)):
    %3 = "memref.load"(%arg6) : (memref<f16, #spirv.storage_class<PhysicalStorageBuffer>>) -> f16 loc("<stdin>":82:10)
    "memref.store"(%3, %arg6) : (f16, memref<f16, #spirv.storage_class<PhysicalStorageBuffer>>) -> () loc("<stdin>":83:5)
    "func.return"() : () -> () loc("<stdin>":84:5)
  }) : () -> () loc("<stdin>":80:3)
  "func.func"() <{function_type = (memref<5xvector<4xf16>, #spirv.storage_class<PhysicalStorageBuffer>>, index) -> (), sym_name = "load_store_vec4f16_physical"}> ({
  ^bb0(%arg4: memref<5xvector<4xf16>, #spirv.storage_class<PhysicalStorageBuffer>> loc("<stdin>":87:8), %arg5: index loc("<stdin>":87:85)):
    %2 = "memref.load"(%arg4, %arg5) : (memref<5xvector<4xf16>, #spirv.storage_class<PhysicalStorageBuffer>>, index) -> vector<4xf16> loc("<stdin>":88:10)
    "memref.store"(%2, %arg4, %arg5) : (vector<4xf16>, memref<5xvector<4xf16>, #spirv.storage_class<PhysicalStorageBuffer>>, index) -> () loc("<stdin>":89:5)
    "func.return"() : () -> () loc("<stdin>":90:5)
  }) : () -> () loc("<stdin>":86:3)
  "func.func"() <{function_type = (memref<8xvector<4xf32>, #spirv.storage_class<PhysicalStorageBuffer>>, index) -> (), sym_name = "load_store_vec4f32_physical"}> ({
  ^bb0(%arg2: memref<8xvector<4xf32>, #spirv.storage_class<PhysicalStorageBuffer>> loc("<stdin>":93:8), %arg3: index loc("<stdin>":93:85)):
    %1 = "memref.load"(%arg2, %arg3) : (memref<8xvector<4xf32>, #spirv.storage_class<PhysicalStorageBuffer>>, index) -> vector<4xf32> loc("<stdin>":94:10)
    "memref.store"(%1, %arg2, %arg3) : (vector<4xf32>, memref<8xvector<4xf32>, #spirv.storage_class<PhysicalStorageBuffer>>, index) -> () loc("<stdin>":95:5)
    "func.return"() : () -> () loc("<stdin>":96:5)
  }) : () -> () loc("<stdin>":92:3)
  "func.func"() <{function_type = (memref<?xvector<4xf32>, #spirv.storage_class<PhysicalStorageBuffer>>, index) -> (), sym_name = "load_store_vec4f32_dynamic_physical"}> ({
  ^bb0(%arg0: memref<?xvector<4xf32>, #spirv.storage_class<PhysicalStorageBuffer>> loc("<stdin>":99:8), %arg1: index loc("<stdin>":99:85)):
    %0 = "memref.load"(%arg0, %arg1) : (memref<?xvector<4xf32>, #spirv.storage_class<PhysicalStorageBuffer>>, index) -> vector<4xf32> loc("<stdin>":100:10)
    "memref.store"(%0, %arg0, %arg1) : (vector<4xf32>, memref<?xvector<4xf32>, #spirv.storage_class<PhysicalStorageBuffer>>, index) -> () loc("<stdin>":101:5)
    "func.return"() : () -> () loc("<stdin>":102:5)
  }) : () -> () loc("<stdin>":98:3)
}) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.5, [Shader, Int8, Int16, Int64, Float16, Float64, StorageBuffer16BitAccess, StorageUniform16, StoragePushConstant16, StorageBuffer8BitAccess, UniformAndStorageBuffer8BitAccess, StoragePushConstant8, PhysicalStorageBufferAddresses], [SPV_KHR_16bit_storage, SPV_KHR_8bit_storage, SPV_KHR_storage_buffer_storage_class, SPV_KHR_physical_storage_buffer]>, #spirv.resource_limits<>>} : () -> () loc("<stdin>":1:1)
