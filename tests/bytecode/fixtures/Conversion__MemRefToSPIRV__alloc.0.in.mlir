"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "alloc_dealloc_workgroup_mem_shader_f32"}> ({
  ^bb0(%arg0: index loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:22)):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x5xf32, #spirv.storage_class<Workgroup>> loc("<stdin>":4:10)
    %1 = "memref.load"(%0, %arg0, %arg1) : (memref<4x5xf32, #spirv.storage_class<Workgroup>>, index, index) -> f32 loc("<stdin>":5:10)
    "memref.store"(%1, %0, %arg0, %arg1) : (f32, memref<4x5xf32, #spirv.storage_class<Workgroup>>, index, index) -> () loc("<stdin>":6:5)
    "memref.dealloc"(%0) : (memref<4x5xf32, #spirv.storage_class<Workgroup>>) -> () loc("<stdin>":7:5)
    "func.return"() : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
}) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} : () -> () loc("<stdin>":1:1)
