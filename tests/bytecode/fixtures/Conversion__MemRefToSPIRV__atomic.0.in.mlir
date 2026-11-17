"builtin.module"() ({
  "func.func"() <{function_type = (i32, memref<2x3x4xi32, #spirv.storage_class<StorageBuffer>>, index, index, index) -> i32, sym_name = "atomic_addi_storage_buffer"}> ({
  ^bb0(%arg30: i32 loc("<stdin>":3:8), %arg31: memref<2x3x4xi32, #spirv.storage_class<StorageBuffer>> loc("<stdin>":3:21), %arg32: index loc("<stdin>":3:85), %arg33: index loc("<stdin>":3:100), %arg34: index loc("<stdin>":3:115)):
    %6 = "memref.atomic_rmw"(%arg30, %arg31, %arg32, %arg33, %arg34) <{kind = 1 : i64}> : (i32, memref<2x3x4xi32, #spirv.storage_class<StorageBuffer>>, index, index, index) -> i32 loc("<stdin>":4:10)
    "func.return"(%6) : (i32) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (i32, memref<2x3x4xi32, #spirv.storage_class<Workgroup>>, index, index, index) -> i32, sym_name = "atomic_maxs_workgroup"}> ({
  ^bb0(%arg25: i32 loc("<stdin>":8:8), %arg26: memref<2x3x4xi32, #spirv.storage_class<Workgroup>> loc("<stdin>":8:21), %arg27: index loc("<stdin>":8:81), %arg28: index loc("<stdin>":8:96), %arg29: index loc("<stdin>":8:111)):
    %5 = "memref.atomic_rmw"(%arg25, %arg26, %arg27, %arg28, %arg29) <{kind = 6 : i64}> : (i32, memref<2x3x4xi32, #spirv.storage_class<Workgroup>>, index, index, index) -> i32 loc("<stdin>":9:10)
    "func.return"(%5) : (i32) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (i32, memref<2x3x4xi32, #spirv.storage_class<StorageBuffer>>, index, index, index) -> i32, sym_name = "atomic_maxu_storage_buffer"}> ({
  ^bb0(%arg20: i32 loc("<stdin>":13:8), %arg21: memref<2x3x4xi32, #spirv.storage_class<StorageBuffer>> loc("<stdin>":13:21), %arg22: index loc("<stdin>":13:85), %arg23: index loc("<stdin>":13:100), %arg24: index loc("<stdin>":13:115)):
    %4 = "memref.atomic_rmw"(%arg20, %arg21, %arg22, %arg23, %arg24) <{kind = 7 : i64}> : (i32, memref<2x3x4xi32, #spirv.storage_class<StorageBuffer>>, index, index, index) -> i32 loc("<stdin>":14:10)
    "func.return"(%4) : (i32) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (i32, memref<2x3x4xi32, #spirv.storage_class<Workgroup>>, index, index, index) -> i32, sym_name = "atomic_mins_workgroup"}> ({
  ^bb0(%arg15: i32 loc("<stdin>":18:8), %arg16: memref<2x3x4xi32, #spirv.storage_class<Workgroup>> loc("<stdin>":18:21), %arg17: index loc("<stdin>":18:81), %arg18: index loc("<stdin>":18:96), %arg19: index loc("<stdin>":18:111)):
    %3 = "memref.atomic_rmw"(%arg15, %arg16, %arg17, %arg18, %arg19) <{kind = 10 : i64}> : (i32, memref<2x3x4xi32, #spirv.storage_class<Workgroup>>, index, index, index) -> i32 loc("<stdin>":19:10)
    "func.return"(%3) : (i32) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (i32, memref<2x3x4xi32, #spirv.storage_class<StorageBuffer>>, index, index, index) -> i32, sym_name = "atomic_minu_storage_buffer"}> ({
  ^bb0(%arg10: i32 loc("<stdin>":23:8), %arg11: memref<2x3x4xi32, #spirv.storage_class<StorageBuffer>> loc("<stdin>":23:21), %arg12: index loc("<stdin>":23:85), %arg13: index loc("<stdin>":23:100), %arg14: index loc("<stdin>":23:115)):
    %2 = "memref.atomic_rmw"(%arg10, %arg11, %arg12, %arg13, %arg14) <{kind = 11 : i64}> : (i32, memref<2x3x4xi32, #spirv.storage_class<StorageBuffer>>, index, index, index) -> i32 loc("<stdin>":24:10)
    "func.return"(%2) : (i32) -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":22:3)
  "func.func"() <{function_type = (i32, memref<2x3x4xi32, #spirv.storage_class<Workgroup>>, index, index, index) -> i32, sym_name = "atomic_ori_workgroup"}> ({
  ^bb0(%arg5: i32 loc("<stdin>":28:8), %arg6: memref<2x3x4xi32, #spirv.storage_class<Workgroup>> loc("<stdin>":28:20), %arg7: index loc("<stdin>":28:79), %arg8: index loc("<stdin>":28:93), %arg9: index loc("<stdin>":28:107)):
    %1 = "memref.atomic_rmw"(%arg5, %arg6, %arg7, %arg8, %arg9) <{kind = 14 : i64}> : (i32, memref<2x3x4xi32, #spirv.storage_class<Workgroup>>, index, index, index) -> i32 loc("<stdin>":29:10)
    "func.return"(%1) : (i32) -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":27:3)
  "func.func"() <{function_type = (i32, memref<2x3x4xi32, #spirv.storage_class<StorageBuffer>>, index, index, index) -> i32, sym_name = "atomic_andi_storage_buffer"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":33:8), %arg1: memref<2x3x4xi32, #spirv.storage_class<StorageBuffer>> loc("<stdin>":33:20), %arg2: index loc("<stdin>":33:83), %arg3: index loc("<stdin>":33:97), %arg4: index loc("<stdin>":33:111)):
    %0 = "memref.atomic_rmw"(%arg0, %arg1, %arg2, %arg3, %arg4) <{kind = 2 : i64}> : (i32, memref<2x3x4xi32, #spirv.storage_class<StorageBuffer>>, index, index, index) -> i32 loc("<stdin>":34:10)
    "func.return"(%0) : (i32) -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":32:3)
}) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.3, [Shader], []>, #spirv.resource_limits<>>} : () -> () loc("<stdin>":1:1)
