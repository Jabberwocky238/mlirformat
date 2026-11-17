"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xf32, #spirv.storage_class<StorageBuffer>>, i1) -> (), sym_name = "kernel_simple_selection"}> ({
  ^bb0(%arg16: memref<10xf32, #spirv.storage_class<StorageBuffer>> loc("<stdin>":3:8), %arg17: i1 loc("<stdin>":3:69)):
    %21 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":4:11)
    %22 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:11)
    "scf.if"(%arg17) ({
      "memref.store"(%21, %arg16, %22) : (f32, memref<10xf32, #spirv.storage_class<StorageBuffer>>, index) -> () loc("<stdin>":7:7)
      "scf.yield"() : () -> () loc("<stdin>":8:7)
    }, {
    }) : (i1) -> () loc("<stdin>":6:5)
    "func.return"() : () -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<10xf32, #spirv.storage_class<StorageBuffer>>, memref<10xf32, #spirv.storage_class<StorageBuffer>>, i1, i1) -> (), sym_name = "kernel_nested_selection"}> ({
  ^bb0(%arg12: memref<10xf32, #spirv.storage_class<StorageBuffer>> loc("<stdin>":14:8), %arg13: memref<10xf32, #spirv.storage_class<StorageBuffer>> loc("<stdin>":14:69), %arg14: i1 loc("<stdin>":14:130), %arg15: i1 loc("<stdin>":14:142)):
    %15 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":15:11)
    %16 = "arith.constant"() <{value = 9 : index}> : () -> index loc("<stdin>":16:11)
    "scf.if"(%arg14) ({
      "scf.if"(%arg15) ({
        %20 = "memref.load"(%arg12, %15) : (memref<10xf32, #spirv.storage_class<StorageBuffer>>, index) -> f32 loc("<stdin>":19:15)
        "memref.store"(%20, %arg13, %15) : (f32, memref<10xf32, #spirv.storage_class<StorageBuffer>>, index) -> () loc("<stdin>":20:9)
        "scf.yield"() : () -> () loc("<stdin>":21:9)
      }, {
        %19 = "memref.load"(%arg13, %15) : (memref<10xf32, #spirv.storage_class<StorageBuffer>>, index) -> f32 loc("<stdin>":23:15)
        "memref.store"(%19, %arg12, %15) : (f32, memref<10xf32, #spirv.storage_class<StorageBuffer>>, index) -> () loc("<stdin>":24:9)
        "scf.yield"() : () -> () loc("<stdin>":25:9)
      }) : (i1) -> () loc("<stdin>":18:7)
      "scf.yield"() : () -> () loc("<stdin>":27:7)
    }, {
      "scf.if"(%arg15) ({
        %18 = "memref.load"(%arg12, %16) : (memref<10xf32, #spirv.storage_class<StorageBuffer>>, index) -> f32 loc("<stdin>":30:15)
        "memref.store"(%18, %arg13, %16) : (f32, memref<10xf32, #spirv.storage_class<StorageBuffer>>, index) -> () loc("<stdin>":31:9)
        "scf.yield"() : () -> () loc("<stdin>":32:9)
      }, {
        %17 = "memref.load"(%arg13, %16) : (memref<10xf32, #spirv.storage_class<StorageBuffer>>, index) -> f32 loc("<stdin>":34:15)
        "memref.store"(%17, %arg12, %16) : (f32, memref<10xf32, #spirv.storage_class<StorageBuffer>>, index) -> () loc("<stdin>":35:9)
        "scf.yield"() : () -> () loc("<stdin>":36:9)
      }) : (i1) -> () loc("<stdin>":29:7)
      "scf.yield"() : () -> () loc("<stdin>":38:7)
    }) : (i1) -> () loc("<stdin>":17:5)
    "func.return"() : () -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":13:3)
  "func.func"() <{function_type = (memref<10xf32, #spirv.storage_class<StorageBuffer>>, i1) -> (), sym_name = "simple_if_yield"}> ({
  ^bb0(%arg10: memref<10xf32, #spirv.storage_class<StorageBuffer>> loc("<stdin>":43:8), %arg11: i1 loc("<stdin>":43:69)):
    %8:2 = "scf.if"(%arg11) ({
      %13 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":45:13)
      %14 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":46:13)
      "scf.yield"(%13, %14) : (f32, f32) -> () loc("<stdin>":47:7)
    }, {
      %11 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32 loc("<stdin>":49:13)
      %12 = "arith.constant"() <{value = 3.000000e+00 : f32}> : () -> f32 loc("<stdin>":50:13)
      "scf.yield"(%12, %11) : (f32, f32) -> () loc("<stdin>":51:7)
    }) : (i1) -> (f32, f32) loc("<stdin>":44:12)
    %9 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":53:10)
    %10 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":54:11)
    "memref.store"(%8#0, %arg10, %9) : (f32, memref<10xf32, #spirv.storage_class<StorageBuffer>>, index) -> () loc("<stdin>":55:5)
    "memref.store"(%8#1, %arg10, %10) : (f32, memref<10xf32, #spirv.storage_class<StorageBuffer>>, index) -> () loc("<stdin>":56:5)
    "func.return"() : () -> () loc("<stdin>":57:5)
  }) : () -> () loc("<stdin>":42:3)
  "func.func"() <{function_type = (memref<10xf32, #spirv.storage_class<StorageBuffer>>, memref<10xf32, #spirv.storage_class<StorageBuffer>>, i1) -> (), sym_name = "simple_if_yield_type_change"}> ({
  ^bb0(%arg7: memref<10xf32, #spirv.storage_class<StorageBuffer>> loc("<stdin>":60:8), %arg8: memref<10xf32, #spirv.storage_class<StorageBuffer>> loc("<stdin>":60:68), %arg9: i1 loc("<stdin>":60:128)):
    %5 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":61:10)
    %6 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":62:10)
    %7 = "scf.if"(%arg9) ({
      "scf.yield"(%arg7) : (memref<10xf32, #spirv.storage_class<StorageBuffer>>) -> () loc("<stdin>":64:7)
    }, {
      "scf.yield"(%arg8) : (memref<10xf32, #spirv.storage_class<StorageBuffer>>) -> () loc("<stdin>":66:7)
    }) : (i1) -> memref<10xf32, #spirv.storage_class<StorageBuffer>> loc("<stdin>":63:10)
    "memref.store"(%6, %7, %5) : (f32, memref<10xf32, #spirv.storage_class<StorageBuffer>>, index) -> () loc("<stdin>":68:5)
    "func.return"() : () -> () loc("<stdin>":69:5)
  }) : () -> () loc("<stdin>":59:3)
  "func.func"() <{function_type = (memref<8xi32>, memref<8xi32>, i1) -> (), sym_name = "unsupported_yield_type"}> ({
  ^bb0(%arg4: memref<8xi32> loc("<stdin>":72:8), %arg5: memref<8xi32> loc("<stdin>":72:30), %arg6: i1 loc("<stdin>":72:52)):
    %4 = "scf.if"(%arg6) ({
      "scf.yield"(%arg4) : (memref<8xi32>) -> () loc("<stdin>":74:7)
    }, {
      "scf.yield"(%arg5) : (memref<8xi32>) -> () loc("<stdin>":76:7)
    }) : (i1) -> memref<8xi32> loc("<stdin>":73:10)
    "func.return"() : () -> () loc("<stdin>":78:5)
  }) : () -> () loc("<stdin>":71:3)
  "func.func"() <{function_type = (memref<10xf32, #spirv.storage_class<StorageBuffer>>, i1) -> (), sym_name = "selection_flatten"}> ({
  ^bb0(%arg2: memref<10xf32, #spirv.storage_class<StorageBuffer>> loc("<stdin>":81:8), %arg3: i1 loc("<stdin>":81:68)):
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":82:10)
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":83:10)
    "scf.if"(%arg3) ({
      "memref.store"(%2, %arg2, %3) : (f32, memref<10xf32, #spirv.storage_class<StorageBuffer>>, index) -> () loc("<stdin>":85:7)
      "scf.yield"() : () -> () loc("<stdin>":86:7)
    }, {
    }) {spirv.selection_control = #spirv.selection_control<Flatten>} : (i1) -> () loc("<stdin>":84:5)
    "func.return"() : () -> () loc("<stdin>":89:5)
  }) : () -> () loc("<stdin>":80:3)
  "func.func"() <{function_type = (memref<10xf32, #spirv.storage_class<StorageBuffer>>, i1) -> (), sym_name = "selection_dont_flatten"}> ({
  ^bb0(%arg0: memref<10xf32, #spirv.storage_class<StorageBuffer>> loc("<stdin>":92:8), %arg1: i1 loc("<stdin>":92:68)):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":93:10)
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":94:10)
    "scf.if"(%arg1) ({
      "memref.store"(%0, %arg0, %1) : (f32, memref<10xf32, #spirv.storage_class<StorageBuffer>>, index) -> () loc("<stdin>":96:7)
      "scf.yield"() : () -> () loc("<stdin>":97:7)
    }, {
    }) {spirv.selection_control = #spirv.selection_control<DontFlatten>} : (i1) -> () loc("<stdin>":95:5)
    "func.return"() : () -> () loc("<stdin>":100:5)
  }) : () -> () loc("<stdin>":91:3)
}) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} : () -> () loc("<stdin>":1:1)
