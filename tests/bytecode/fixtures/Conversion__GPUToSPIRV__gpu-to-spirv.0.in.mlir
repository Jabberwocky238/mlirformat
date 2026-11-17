"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernels"}> ({
    "gpu.func"() <{function_type = (f32, memref<12xf32, #spirv.storage_class<StorageBuffer>>) -> (), kernel}> ({
    ^bb0(%arg0: f32 loc("<stdin>":4:10), %arg1: memref<12xf32, #spirv.storage_class<StorageBuffer>> loc("<stdin>":4:22)):
      "gpu.return"() : () -> () loc("<stdin>":5:7)
    }) {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [32, 4, 1]>, sym_name = "basic_module_structure"} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "op"() : () -> f32 loc("<stdin>":9:10)
    %1 = "op"() : () -> memref<12xf32, #spirv.storage_class<StorageBuffer>> loc("<stdin>":10:10)
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":11:10)
    "gpu.launch_func"(%2, %2, %2, %2, %2, %2, %0, %1) <{kernel = @kernels::@basic_module_structure, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 2, 0>}> : (index, index, index, index, index, index, f32, memref<12xf32, #spirv.storage_class<StorageBuffer>>) -> () loc("<stdin>":12:5)
    "func.return"() : () -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":8:3)
}) {gpu.container_module} : () -> () loc("<stdin>":1:1)
