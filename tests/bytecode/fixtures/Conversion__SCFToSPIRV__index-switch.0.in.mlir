"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xf32, #spirv.storage_class<StorageBuffer>>, index) -> (), sym_name = "switch_no_result"}> ({
  ^bb0(%arg3: memref<10xf32, #spirv.storage_class<StorageBuffer>> loc("<stdin>":3:8), %arg4: index loc("<stdin>":3:68)):
    %6 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":4:10)
    %7 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:10)
    "scf.index_switch"(%arg4) <{cases = array<i64: 2>}> ({
      "scf.yield"() : () -> () loc("<stdin>":7:7)
    }, {
      "memref.store"(%6, %arg3, %7) : (f32, memref<10xf32, #spirv.storage_class<StorageBuffer>>, index) -> () loc("<stdin>":9:7)
      "scf.yield"() : () -> () loc("<stdin>":10:7)
    }) : (index) -> () loc("<stdin>":6:5)
    "func.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (index) -> i32, sym_name = "switch_yield"}> ({
  ^bb0(%arg2: index loc("<stdin>":15:8)):
    %2 = "scf.index_switch"(%arg2) <{cases = array<i64: 2, 5>}> ({
      %5 = "arith.constant"() <{value = 30 : i32}> : () -> i32 loc("<stdin>":17:12)
      "scf.yield"(%5) : (i32) -> () loc("<stdin>":18:7)
    }, {
      %4 = "arith.constant"() <{value = 10 : i32}> : () -> i32 loc("<stdin>":20:12)
      "scf.yield"(%4) : (i32) -> () loc("<stdin>":21:7)
    }, {
      %3 = "arith.constant"() <{value = 20 : i32}> : () -> i32 loc("<stdin>":23:12)
      "scf.yield"(%3) : (i32) -> () loc("<stdin>":24:7)
    }) : (index) -> i32 loc("<stdin>":16:10)
    "func.return"(%2) : (i32) -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":14:3)
  "func.func"() <{function_type = (memref<10xf32, #spirv.storage_class<StorageBuffer>>, index) -> (), sym_name = "switch_selection_control"}> ({
  ^bb0(%arg0: memref<10xf32, #spirv.storage_class<StorageBuffer>> loc("<stdin>":29:8), %arg1: index loc("<stdin>":29:68)):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":30:10)
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":31:10)
    "scf.index_switch"(%arg1) <{cases = array<i64: 2>}> ({
      "scf.yield"() : () -> () loc("<stdin>":33:7)
    }, {
      "memref.store"(%0, %arg0, %1) : (f32, memref<10xf32, #spirv.storage_class<StorageBuffer>>, index) -> () loc("<stdin>":35:7)
      "scf.yield"() : () -> () loc("<stdin>":36:7)
    }) {spirv.selection_control = #spirv.selection_control<Flatten>} : (index) -> () loc("<stdin>":32:5)
    "func.return"() : () -> () loc("<stdin>":38:5)
  }) : () -> () loc("<stdin>":28:3)
}) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} : () -> () loc("<stdin>":1:1)
