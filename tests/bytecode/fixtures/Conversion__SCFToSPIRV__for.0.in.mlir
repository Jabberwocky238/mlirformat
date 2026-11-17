"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xf32, #spirv.storage_class<StorageBuffer>>, memref<10xf32, #spirv.storage_class<StorageBuffer>>) -> (), sym_name = "loop_kernel"}> ({
  ^bb0(%arg14: memref<10xf32, #spirv.storage_class<StorageBuffer>> loc("<stdin>":3:8), %arg15: memref<10xf32, #spirv.storage_class<StorageBuffer>> loc("<stdin>":3:69)):
    %19 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":4:11)
    %20 = "arith.constant"() <{value = 42 : index}> : () -> index loc("<stdin>":5:11)
    %21 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":6:11)
    "scf.for"(%19, %20, %21) ({
    ^bb0(%arg16: index loc("<stdin>":8:10)):
      %22 = "memref.load"(%arg14, %arg16) : (memref<10xf32, #spirv.storage_class<StorageBuffer>>, index) -> f32 loc("<stdin>":9:13)
      "memref.store"(%22, %arg15, %arg16) : (f32, memref<10xf32, #spirv.storage_class<StorageBuffer>>, index) -> () loc("<stdin>":10:7)
      "scf.yield"() : () -> () loc("<stdin>":11:7)
    }) : (index, index, index) -> () loc("<stdin>":7:5)
    "func.return"() : () -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<10xf32, #spirv.storage_class<StorageBuffer>>, memref<10xf32, #spirv.storage_class<StorageBuffer>>) -> (), sym_name = "unsigned_loop"}> ({
  ^bb0(%arg11: memref<10xf32, #spirv.storage_class<StorageBuffer>> loc("<stdin>":16:8), %arg12: memref<10xf32, #spirv.storage_class<StorageBuffer>> loc("<stdin>":16:69)):
    %15 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":17:11)
    %16 = "arith.constant"() <{value = 42 : index}> : () -> index loc("<stdin>":18:11)
    %17 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":19:11)
    "scf.for"(%15, %16, %17) <{unsignedCmp}> ({
    ^bb0(%arg13: index loc("<stdin>":21:10)):
      %18 = "memref.load"(%arg11, %arg13) : (memref<10xf32, #spirv.storage_class<StorageBuffer>>, index) -> f32 loc("<stdin>":22:13)
      "memref.store"(%18, %arg12, %arg13) : (f32, memref<10xf32, #spirv.storage_class<StorageBuffer>>, index) -> () loc("<stdin>":23:7)
      "scf.yield"() : () -> () loc("<stdin>":24:7)
    }) : (index, index, index) -> () loc("<stdin>":20:5)
    "func.return"() : () -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":15:3)
  "func.func"() <{function_type = (memref<10xf32, #spirv.storage_class<StorageBuffer>>, memref<10xf32, #spirv.storage_class<StorageBuffer>>) -> (), sym_name = "loop_yield"}> ({
  ^bb0(%arg6: memref<10xf32, #spirv.storage_class<StorageBuffer>> loc("<stdin>":29:8), %arg7: memref<10xf32, #spirv.storage_class<StorageBuffer>> loc("<stdin>":29:68)):
    %8 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":30:10)
    %9 = "arith.constant"() <{value = 42 : index}> : () -> index loc("<stdin>":31:10)
    %10 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":32:11)
    %11 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":33:11)
    %12 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":34:11)
    %13:2 = "scf.for"(%8, %9, %10, %11, %12) ({
    ^bb0(%arg8: index loc("<stdin>":36:10), %arg9: f32 loc("<stdin>":36:24), %arg10: f32 loc("<stdin>":36:36)):
      %14 = "arith.addf"(%arg9, %arg9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":37:13)
      "scf.yield"(%14, %14) : (f32, f32) -> () loc("<stdin>":38:7)
    }) : (index, index, index, f32, f32) -> (f32, f32) loc("<stdin>":35:13)
    "memref.store"(%13#0, %arg7, %8) : (f32, memref<10xf32, #spirv.storage_class<StorageBuffer>>, index) -> () loc("<stdin>":40:5)
    "memref.store"(%13#1, %arg7, %9) : (f32, memref<10xf32, #spirv.storage_class<StorageBuffer>>, index) -> () loc("<stdin>":41:5)
    "func.return"() : () -> () loc("<stdin>":42:5)
  }) : () -> () loc("<stdin>":28:3)
  "func.func"() <{function_type = (memref<10xf32, #spirv.storage_class<StorageBuffer>>, memref<10xf32, #spirv.storage_class<StorageBuffer>>) -> (), sym_name = "loop_unroll"}> ({
  ^bb0(%arg3: memref<10xf32, #spirv.storage_class<StorageBuffer>> loc("<stdin>":45:8), %arg4: memref<10xf32, #spirv.storage_class<StorageBuffer>> loc("<stdin>":45:68)):
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":46:10)
    %5 = "arith.constant"() <{value = 10 : index}> : () -> index loc("<stdin>":47:10)
    %6 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":48:10)
    "scf.for"(%4, %5, %6) ({
    ^bb0(%arg5: index loc("<stdin>":50:10)):
      %7 = "memref.load"(%arg3, %arg5) : (memref<10xf32, #spirv.storage_class<StorageBuffer>>, index) -> f32 loc("<stdin>":51:12)
      "memref.store"(%7, %arg4, %arg5) : (f32, memref<10xf32, #spirv.storage_class<StorageBuffer>>, index) -> () loc("<stdin>":52:7)
      "scf.yield"() : () -> () loc("<stdin>":53:7)
    }) {spirv.loop_control = #spirv.loop_control<Unroll>} : (index, index, index) -> () loc("<stdin>":49:5)
    "func.return"() : () -> () loc("<stdin>":55:5)
  }) : () -> () loc("<stdin>":44:3)
  "func.func"() <{function_type = (memref<10xf32, #spirv.storage_class<StorageBuffer>>, memref<10xf32, #spirv.storage_class<StorageBuffer>>) -> (), sym_name = "loop_dont_unroll"}> ({
  ^bb0(%arg0: memref<10xf32, #spirv.storage_class<StorageBuffer>> loc("<stdin>":58:8), %arg1: memref<10xf32, #spirv.storage_class<StorageBuffer>> loc("<stdin>":58:68)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":59:10)
    %1 = "arith.constant"() <{value = 10 : index}> : () -> index loc("<stdin>":60:10)
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":61:10)
    "scf.for"(%0, %1, %2) ({
    ^bb0(%arg2: index loc("<stdin>":63:10)):
      %3 = "memref.load"(%arg0, %arg2) : (memref<10xf32, #spirv.storage_class<StorageBuffer>>, index) -> f32 loc("<stdin>":64:12)
      "memref.store"(%3, %arg1, %arg2) : (f32, memref<10xf32, #spirv.storage_class<StorageBuffer>>, index) -> () loc("<stdin>":65:7)
      "scf.yield"() : () -> () loc("<stdin>":66:7)
    }) {spirv.loop_control = #spirv.loop_control<DontUnroll>} : (index, index, index) -> () loc("<stdin>":62:5)
    "func.return"() : () -> () loc("<stdin>":68:5)
  }) : () -> () loc("<stdin>":57:3)
}) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} : () -> () loc("<stdin>":1:1)
