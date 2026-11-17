"builtin.module"() ({
  "func.func"() <{function_type = (memref<i1, #spirv.storage_class<StorageBuffer>>) -> i1, sym_name = "load_i1"}> ({
  ^bb0(%arg18: memref<i1, #spirv.storage_class<StorageBuffer>> loc("<stdin>":3:8)):
    %4 = "memref.load"(%arg18) : (memref<i1, #spirv.storage_class<StorageBuffer>>) -> i1 loc("<stdin>":4:10)
    "func.return"(%4) : (i1) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<i8, #spirv.storage_class<StorageBuffer>>) -> i8, sym_name = "load_i8"}> ({
  ^bb0(%arg17: memref<i8, #spirv.storage_class<StorageBuffer>> loc("<stdin>":8:8)):
    %3 = "memref.load"(%arg17) : (memref<i8, #spirv.storage_class<StorageBuffer>>) -> i8 loc("<stdin>":9:10)
    "func.return"(%3) : (i8) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (memref<10xi16, #spirv.storage_class<StorageBuffer>>, index) -> i16, sym_name = "load_i16"}> ({
  ^bb0(%arg15: memref<10xi16, #spirv.storage_class<StorageBuffer>> loc("<stdin>":13:8), %arg16: index loc("<stdin>":13:69)):
    %2 = "memref.load"(%arg15, %arg16) : (memref<10xi16, #spirv.storage_class<StorageBuffer>>, index) -> i16 loc("<stdin>":14:10)
    "func.return"(%2) : (i16) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (memref<10xi64, #spirv.storage_class<StorageBuffer>>, index) -> i64, sym_name = "load_i64"}> ({
  ^bb0(%arg13: memref<10xi64, #spirv.storage_class<StorageBuffer>> loc("<stdin>":18:8), %arg14: index loc("<stdin>":18:69)):
    %1 = "memref.load"(%arg13, %arg14) : (memref<10xi64, #spirv.storage_class<StorageBuffer>>, index) -> i64 loc("<stdin>":19:10)
    "func.return"(%1) : (i64) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (memref<f32, #spirv.storage_class<StorageBuffer>>) -> (), sym_name = "load_f32"}> ({
  ^bb0(%arg12: memref<f32, #spirv.storage_class<StorageBuffer>> loc("<stdin>":23:8)):
    %0 = "memref.load"(%arg12) : (memref<f32, #spirv.storage_class<StorageBuffer>>) -> f32 loc("<stdin>":24:10)
    "func.return"() : () -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":22:3)
  "func.func"() <{function_type = (memref<i1, #spirv.storage_class<StorageBuffer>>, i1) -> (), sym_name = "store_i1"}> ({
  ^bb0(%arg10: memref<i1, #spirv.storage_class<StorageBuffer>> loc("<stdin>":28:8), %arg11: i1 loc("<stdin>":28:65)):
    "memref.store"(%arg11, %arg10) : (i1, memref<i1, #spirv.storage_class<StorageBuffer>>) -> () loc("<stdin>":29:5)
    "func.return"() : () -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":27:3)
  "func.func"() <{function_type = (memref<i8, #spirv.storage_class<StorageBuffer>>, i8) -> (), sym_name = "store_i8"}> ({
  ^bb0(%arg8: memref<i8, #spirv.storage_class<StorageBuffer>> loc("<stdin>":33:8), %arg9: i8 loc("<stdin>":33:64)):
    "memref.store"(%arg9, %arg8) : (i8, memref<i8, #spirv.storage_class<StorageBuffer>>) -> () loc("<stdin>":34:5)
    "func.return"() : () -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":32:3)
  "func.func"() <{function_type = (memref<10xi16, #spirv.storage_class<StorageBuffer>>, index, i16) -> (), sym_name = "store_i16"}> ({
  ^bb0(%arg5: memref<10xi16, #spirv.storage_class<StorageBuffer>> loc("<stdin>":38:8), %arg6: index loc("<stdin>":38:68), %arg7: i16 loc("<stdin>":38:82)):
    "memref.store"(%arg7, %arg5, %arg6) : (i16, memref<10xi16, #spirv.storage_class<StorageBuffer>>, index) -> () loc("<stdin>":39:5)
    "func.return"() : () -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":37:3)
  "func.func"() <{function_type = (memref<10xi64, #spirv.storage_class<StorageBuffer>>, index, i64) -> (), sym_name = "store_i64"}> ({
  ^bb0(%arg2: memref<10xi64, #spirv.storage_class<StorageBuffer>> loc("<stdin>":43:8), %arg3: index loc("<stdin>":43:68), %arg4: i64 loc("<stdin>":43:82)):
    "memref.store"(%arg4, %arg2, %arg3) : (i64, memref<10xi64, #spirv.storage_class<StorageBuffer>>, index) -> () loc("<stdin>":44:5)
    "func.return"() : () -> () loc("<stdin>":45:5)
  }) : () -> () loc("<stdin>":42:3)
  "func.func"() <{function_type = (memref<f32, #spirv.storage_class<StorageBuffer>>, f32) -> (), sym_name = "store_f32"}> ({
  ^bb0(%arg0: memref<f32, #spirv.storage_class<StorageBuffer>> loc("<stdin>":48:8), %arg1: f32 loc("<stdin>":48:65)):
    "memref.store"(%arg1, %arg0) : (f32, memref<f32, #spirv.storage_class<StorageBuffer>>) -> () loc("<stdin>":49:5)
    "func.return"() : () -> () loc("<stdin>":50:5)
  }) : () -> () loc("<stdin>":47:3)
}) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader, Int64], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} : () -> () loc("<stdin>":1:1)
